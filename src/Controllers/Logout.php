<?php

namespace Fabiom\UDDemo\Controllers;

use Fabiom\UglyDuckling\Common\Controllers\Controller;

class Logout extends Controller {

    const CONTROLLER_NAME = 'logout';

    public function getRequest() {
        $this->killSession();
    }

    public function postRequest() {
        $this->killSession();
    }

    private function killSession() {
        // session_start();
        $_SESSION['logged_in'] = false; // just to be sure
        session_unset();
        session_destroy();

        header('Location: '.getenv("BASE_PATH"));
        die();
    }

}
