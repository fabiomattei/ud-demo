<?php

namespace Fabiom\UDDemo\Controllers;

use Fabiom\UglyDuckling\Common\Controllers\Controller;
use Fabiom\UglyDuckling\Common\Router\AdminRouter;
use Fabiom\UglyDuckling\Common\Router\ResourceRouter;
use Fabiom\UglyDuckling\Common\Setup\SessionJsonSetup;
use Fabiom\UglyDuckling\Templates\Blocks\Menus\PublicMenu;
use Fabiom\UglyDuckling\Templates\Blocks\Login\LoginForm;
use Fabiom\UglyDuckling\BusinessLogic\User\Daos\UserDao;
use Fabiom\UglyDuckling\BusinessLogic\User\UseCases\UserCanLogIn;

/**
 * This class cares about the login process.
 * The get method cares about visualizing the interface, the post method cares about eventually allow 
 * the user to log in or not
 */
class Login extends Controller {
	
	const CONTROLLER_NAME = 'communitylogin';

    private /* UserDao */ $userDao;
    private /* UserCanLogIn */ $userCanLogIn;
	
    function __construct() {
		$this->userDao = new UserDao;
		$this->userCanLogIn = new UserCanLogIn;
    }
	
	public function getRequest() {
		$this->title            = $this->applicationBuilder->getSetup()->getAppNameForPageTitle() . ' :: Access page';
		$this->menucontainer    = array( new PublicMenu( $this->applicationBuilder->getSetup()->getAppNameForPageTitle(), 'login' ) );
		$this->centralcontainer = array( new LoginForm( $this->applicationBuilder->getSetup()->getAppNameForPageTitle(), "" ) );
		$this->templateFile     = 'login';
	}
	
    public /* array */ $post_validation_rules = array(
		'email'	   => 'max_len,255',
		'password' => 'max_len,255',
    );
    public /* array */ $post_filter_rules = array(
		'email'    => 'trim',
		'password' => 'trim',
    );
	
	public function postRequest() {
		$this->userDao->setDBH( $this->pageStatus->getDbconnection()->getDBH() );
        $this->userDao->setLogger( $this->applicationBuilder->getLogger() );
		$this->userCanLogIn->setUserDao( $this->userDao );
		$this->userCanLogIn->setParameters( $this->postParameters );
		$this->userCanLogIn->performAction();

		if ($this->userCanLogIn->getUserCanLogIn()) {
			$user = $this->userDao->getOneByFields( array( 'usr_email' => $this->postParameters['email'] ) );
			$this->pageStatus->getSessionWrapper()->setSessionUserId( $user->usr_id );
			$this->pageStatus->getSessionWrapper()->setSessionUsername( $user->usr_name );
			$this->pageStatus->getSessionWrapper()->setSessionGroup( $user->usr_defaultgroup );
			$this->pageStatus->getSessionWrapper()->setSessionLoggedIn( true );
			$this->pageStatus->getSessionWrapper()->setSessionIp( $this->pageStatus->getServerWrapper()->getRemoteAddress() );
			$this->pageStatus->getSessionWrapper()->setSessionUserAgent( $this->pageStatus->getServerWrapper()->getHttpUserAgent() );
			$this->pageStatus->getSessionWrapper()->setSessionLastLogin( time() );
			
			if ( $this->applicationBuilder->getSetup()->isSessionSetupPathSet() ) {
                 SessionJsonSetup::loadSessionVariables(
                     $this->applicationBuilder->getSetup()->getSessionSetupPath(),
                     $this->pageStatus->getQueryExecutor(),
                     $this->pageStatus->getSessionWrapper()
                 );
			}

            $this->applicationBuilder->getJsonloader()->loadIndex();
            $groupresource = $this->applicationBuilder->getJsonloader()->loadResource( $this->pageStatus->getSessionWrapper()->getSessionGroup() );
			
	        // redirecting to main page
			// $this->redirectToPage( $this->router->makeRelativeUrl( Router::ROUTE_OFFICE_INBOX ) );
			if ( $user->usr_defaultgroup == 'administrationgroup' ) {
				$this->redirectToPage( $this->applicationBuilder->getRouterContainer()->makeRelativeUrl( AdminRouter::ROUTE_ADMIN_DASHBOARD ) );
			} else {
				$this->redirectToPage( $this->applicationBuilder->getRouterContainer()->makeRelativeUrl( ResourceRouter::ROUTE_OFFICE_ENTITY_DASHBOARD, 'res='.$groupresource->defaultaction ) );
			}
			
		} else {
	        // redirecting to main page
			$this->redirectToPage( $this->applicationBuilder->getRouterContainer()->makeRelativeUrl( 'login' ) );
		}
	}
	
}
