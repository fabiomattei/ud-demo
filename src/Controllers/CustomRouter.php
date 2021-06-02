<?php

namespace Fabiom\UDDemo\Controllers;

use Fabiom\UglyDuckling\Common\Router\RouterBase;

class CustomRouter extends RouterBase {

    /**
     * Overwrite this function
     *
     * @param string $action
     */
    function isActionSupported( string $action ) {
        return in_array( $action, array( CustomControllerExample::CONTROLLER_NAME, Login::CONTROLLER_NAME ) );
    }

    function getController( string $action ) {
        switch ( $action ) {
            case CustomControllerExample::CONTROLLER_NAME: $controller = new CustomControllerExample; break;
			case Login::CONTROLLER_NAME: $controller = new Login; break;
            case Logout::CONTROLLER_NAME: $controller = new Logout; break;
        }
        return $controller;
    }

}
