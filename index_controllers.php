<?php

$routersContainer->addRouter(new Fabiom\UglyDuckling\Common\Router\ResourceRouter($setup->getBasePath()));
$routersContainer->addRouter(new Fabiom\UglyDuckling\Common\Router\AdminRouter($setup->getBasePath()));
$routersContainer->addRouter(new Fabiom\UDDemo\Controllers\CustomRouter($setup->getBasePath()));
$routersContainer->setDefaultController(new Fabiom\UDDemo\Controllers\Login);
