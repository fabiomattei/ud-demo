<?php

session_start();

require __DIR__ . '/../vendor/autoload.php';

$severWrapper = new Fabiom\UglyDuckling\Common\Wrappers\ServerWrapper;
$sessionWrapper = new Fabiom\UglyDuckling\Common\Wrappers\SessionWrapper;
$linkBuilder = new Fabiom\UglyDuckling\Common\Json\JsonTemplates\LinkBuilder;
$htmlTagsFactory = new Fabiom\UDDemo\HTMLTags\CustomHTMLTagsFactory;
$htmlTemplateLoader = new Fabiom\UglyDuckling\Common\Utils\HtmlTemplateLoader;
$htmlTemplateLoader->setPath('../vendor/fabiomattei/uglyduckling/src/Templates/HTML/');

$messagesBlock = new Fabiom\UglyDuckling\Common\Blocks\BaseHTMLMessages();
$messagesBlock->setHtmlTemplateLoader( $htmlTemplateLoader );

$setup = new Fabiom\UglyDuckling\Common\Setup\Setup();
$setup->setAppNameForPageTitle("Demo app");
$setup->setPrivateTemplateFileName('application');
$setup->setPrivateTemplateWithSidebarFileName('applicationwithsidebar');
$setup->setPublicTemplateFileName('public');
$setup->setEmptyTemplateFileName('empty');
$setup->setBasePath('http://localhost:18080/');
$setup->setPathToApp('/uglyduckling/');
$setup->setJsonPath('Json/index.json');
$setup->setHTMLTemplatePath('../vendor/fabiomattei/uglyduckling/src/Templates/');
$setup->setSessionSetupPath('Json/session.json');

$dbconnection = new Fabiom\UglyDuckling\Common\Database\DBConnection( 
	'mysql:host=mariadb:3306;dbname=',
	'firststep',
	'user',
	'userp'
);
$dbconnection->setLogger(new Fabiom\UglyDuckling\Common\Loggers\EchoLogger());

$request = new Fabiom\UglyDuckling\Common\Request\Request();
$request->setServerRequestURI( $severWrapper->getRequestURI() );

$defaultController = new Fabiom\UDDemo\Controllers\Login;

$routersContainer = new Fabiom\UglyDuckling\Common\Router\RoutersContainer( $setup->getBasePath() );
$routersContainer->addRouter( new Fabiom\UglyDuckling\Common\Router\ResourceRouter( $setup->getBasePath() ) );
$routersContainer->addRouter( new Fabiom\UglyDuckling\Common\Router\AdminRouter( $setup->getBasePath() ) );
$routersContainer->addRouter( new Fabiom\UDDemo\Controllers\CustomRouter( $setup->getBasePath() ) );
$routersContainer->setDefaultController($defaultController);

$controller = $routersContainer->getController( $request->getAction() );

$jsonloader = new Fabiom\UglyDuckling\Common\Json\JsonLoader();
$jsonloader->setIndexPath($setup->getJsonPath());

$jsonTemplateFactoriesContainer = new Fabiom\UglyDuckling\Common\Json\JsonTemplates\JsonTemplateFactoriesContainer;
$jsonTemplateFactoriesContainer->addJsonTemplateFactory( new Fabiom\UglyDuckling\Common\Json\JsonTemplates\JsonDefaultTemplateFactory($jsonTemplateFactoriesContainer) );
$jsonTemplateFactoriesContainer->addJsonTemplateFactory( new Fabiom\UDDemo\JsonTemplates\CustomJsonTemplateFactory($jsonTemplateFactoriesContainer) );

$pageStatus = new Fabiom\UglyDuckling\Common\Status\PageStatus;
$pageStatus->setRequest($request);
$pageStatus->setServerWrapper($severWrapper);
$pageStatus->setSessionWrapper($sessionWrapper);
$pageStatus->setGetParameters( $_GET );
$pageStatus->setPostParameters( $_POST );
$pageStatus->setFilesParameters( $_FILES );
$pageStatus->setDbconnection( $dbconnection );

$applicationBuilder = new Fabiom\UglyDuckling\Common\Status\ApplicationBuilder;
$applicationBuilder->setRouterContainer($routersContainer);
$applicationBuilder->setSetup($setup);
$applicationBuilder->setSecurityChecker(new Fabiom\UglyDuckling\Common\SecurityCheckers\PrivateSecurityChecker());
$applicationBuilder->setDbconnection($dbconnection);
$applicationBuilder->setRedirector(new Fabiom\UglyDuckling\Common\Redirectors\URLRedirector());
$applicationBuilder->setJsonloader($jsonloader);
$applicationBuilder->setLogger(new Fabiom\UglyDuckling\Common\Loggers\EchoLogger());
$applicationBuilder->setMessages($messagesBlock);
$applicationBuilder->setHtmlTemplateLoader($htmlTemplateLoader);
$applicationBuilder->setHtmlTagsFactory($htmlTagsFactory);
$applicationBuilder->setJsonTemplateFactoriesContainer($jsonTemplateFactoriesContainer);
$applicationBuilder->setLinkBuilder($linkBuilder);

if ( $sessionWrapper->isUserLoggedIn() ) {
	// settings for logged in user
	$controller->makeAllPresets(
		$applicationBuilder,
        $pageStatus
	);
} else {
	// settings for user that has not logged in the system
	// new Fabiom\UglyDuckling\Common\SecurityCheckers\PublicSecurityChecker(),
    $applicationBuilder->setSecurityChecker(new Fabiom\UglyDuckling\Common\SecurityCheckers\PublicSecurityChecker);

	$controller->makeAllPresets(
        $applicationBuilder,
        $pageStatus
	);
}

$controller->setGetParameters( $_GET );
$controller->setPostParameters( $_POST );

$sessionWrapper->setRequestedURL( $severWrapper->getRequestURI() );
$controller->showPage();

$sessionWrapper->endOfRound();

// echo 'Controller: ' . get_class( $controller );
echo $controller->getInfo();
