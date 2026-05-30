<?php

$jsonTemplateFactoriesContainer->addJsonTemplateFactory(
    new Fabiom\UglyDuckling\Common\Json\JsonTemplates\JsonDefaultTemplateFactory($applicationBuilder, $pageStatus)
);
$jsonTemplateFactoriesContainer->addJsonTemplateFactory(
    new Fabiom\UDDemo\JsonTemplates\CustomJsonTemplateFactory($applicationBuilder, $pageStatus)
);
