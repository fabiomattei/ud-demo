<?php

session_start([
    'cookie_httponly' => true,
    'cookie_samesite' => 'Strict',
    'cookie_secure'   => !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off',
]);

header('X-Frame-Options: SAMEORIGIN');
header('X-Content-Type-Options: nosniff');
header('Referrer-Policy: strict-origin-when-cross-origin');
header("Content-Security-Policy: default-src 'self'; script-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net https://code.jquery.com https://unpkg.com; style-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net https://unpkg.com https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com https://cdn.jsdelivr.net; img-src 'self' data:; connect-src 'self';");

require __DIR__ . '/vendor/autoload.php';

$severWrapper = new Fabiom\UglyDuckling\Common\Wrappers\ServerWrapper;
$sessionWrapper = new Fabiom\UglyDuckling\Common\Wrappers\SessionWrapper;
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $sessionWrapper->createCsrfToken();
}
$htmlTagsFactory = new Fabiom\UglyDuckling\Common\Tags\HTMLTagsFactory;
$htmlTemplateLoader = new Fabiom\UglyDuckling\Common\Utils\HtmlTemplateLoader;
$htmlTemplateLoader->setPath('vendor/fabiomattei/uglyduckling/src/Templates/HTML/');

$messagesBlock = new Fabiom\UglyDuckling\Common\Blocks\BaseHTMLMessages();
$messagesBlock->setHtmlTemplateLoader($htmlTemplateLoader);

$setup = new Fabiom\UglyDuckling\Common\Setup\Setup();
$setup->setAppNameForPageTitle('Demo app');
$setup->setPrivateTemplateFileName('application');
$setup->setPrivateTemplateWithSidebarFileName('applicationwithsidebar');
$setup->setPublicTemplateFileName('public');
$setup->setEmptyTemplateFileName('empty');
$setup->setBasePath(getenv('BASE_PATH') ?: 'http://localhost:18080/');
$setup->setPathToApp('/');
$setup->setJsonPath('src/Json/index.json');
$setup->setHTMLTemplatePath('vendor/fabiomattei/uglyduckling/src/Templates/');
$setup->setSessionSetupPath('src/Json/session.json');

$dbconnection = new Fabiom\UglyDuckling\Common\Database\DBConnection(
    getenv('DB_HOST'),
    getenv('DB_NAME'),
    getenv('DB_USER'),
    getenv('DB_PASSWORD')
);
$dbconnection->setLogger(new Fabiom\UglyDuckling\Common\Loggers\EchoLogger());

$queryExecutor = new \Fabiom\UglyDuckling\Common\Database\QueryExecuter();
$queryExecutor->setDBH($dbconnection->getDBH());

$request = new Fabiom\UglyDuckling\Common\Request\Request();
$request->setServerRequestURI($severWrapper->getRequestURI());

$defaultController = new Fabiom\UDDemo\Controllers\Login;

$routersContainer = new Fabiom\UglyDuckling\Common\Router\RoutersContainer($setup->getBasePath());
$routersContainer->addRouter(new Fabiom\UglyDuckling\Common\Router\ResourceRouter($setup->getBasePath()));
$routersContainer->addRouter(new Fabiom\UglyDuckling\Common\Router\AdminRouter($setup->getBasePath()));
$routersContainer->addRouter(new Fabiom\UDDemo\Controllers\CustomRouter($setup->getBasePath()));
$routersContainer->setDefaultController($defaultController);

$controller = $routersContainer->getController($request->getAction());

$jsonloader = new Fabiom\UglyDuckling\Common\Json\JsonLoader();
$jsonloader->setIndexPath($setup->getJsonPath());

$jsonTemplateFactoriesContainer = new Fabiom\UglyDuckling\Common\Json\JsonTemplates\JsonTemplateFactoriesContainer;

$pageStatus = new Fabiom\UglyDuckling\Common\Status\PageStatus;
$pageStatus->setRequest($request);
$pageStatus->setServerWrapper($severWrapper);
$pageStatus->setSessionWrapper($sessionWrapper);
$pageStatus->setGetParameters($_GET);
$pageStatus->setPostParameters($_POST);
$pageStatus->setFilesParameters($_FILES);
$pageStatus->setDbconnection($dbconnection);
$pageStatus->setQueryExecutor($queryExecutor);

$applicationBuilder = new Fabiom\UglyDuckling\Common\Status\ApplicationBuilder;
$applicationBuilder->setRouterContainer($routersContainer);
$applicationBuilder->setSetup($setup);
$applicationBuilder->setSecurityChecker(new Fabiom\UglyDuckling\Common\SecurityCheckers\PrivateSecurityChecker());
$applicationBuilder->setRedirector(new Fabiom\UglyDuckling\Common\Redirectors\URLRedirector());
$applicationBuilder->setJsonloader($jsonloader);
$applicationBuilder->setLogger(new Fabiom\UglyDuckling\Common\Loggers\EchoLogger());
$applicationBuilder->setMessages($messagesBlock);
$applicationBuilder->setHtmlTemplateLoader($htmlTemplateLoader);
$applicationBuilder->setHtmlTagsFactory($htmlTagsFactory);
$applicationBuilder->setJsonTemplateFactoriesContainer($jsonTemplateFactoriesContainer);

$queryExecutor->setPageStatus($pageStatus);
$queryExecutor->setApplicationBuilder($applicationBuilder);

$jsonTemplateFactoriesContainer->addJsonTemplateFactory(new Fabiom\UglyDuckling\Common\Json\JsonTemplates\JsonDefaultTemplateFactory($applicationBuilder, $pageStatus));
$jsonTemplateFactoriesContainer->addJsonTemplateFactory(new Fabiom\UDDemo\JsonTemplates\CustomJsonTemplateFactory($applicationBuilder, $pageStatus));

if ($sessionWrapper->isUserLoggedIn()) {
    $controller->makeAllPresets($applicationBuilder, $pageStatus);
} else {
    $applicationBuilder->setSecurityChecker(new Fabiom\UglyDuckling\Common\SecurityCheckers\PublicSecurityChecker);
    $controller->makeAllPresets($applicationBuilder, $pageStatus);
}

$controller->setGetParameters($_GET);
$controller->setPostParameters($_POST);

$sessionWrapper->setRequestedURL($severWrapper->getRequestURI());
$controller->showPage();

$sessionWrapper->endOfRound();

echo $controller->getInfo();
