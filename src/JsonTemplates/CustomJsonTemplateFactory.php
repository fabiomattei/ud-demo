<?php

namespace Fabiom\UDDemo\JsonTemplates;

use Fabiom\UglyDuckling\Common\Json\JsonTemplates\JsonTemplateFactory;

class CustomJsonTemplateFactory extends JsonTemplateFactory {

    /**
     * CustomJsonTemplateFactory constructor.
     * @param $jsonTemplateFactoriesContainer
     * @param $applicationBuilder
     * @param $pageStatus
     */
     public function __construct( $applicationBuilder, $pageStatus ) {
        parent::__construct();
        $this->jsonTemplateExample = new JsonTemplateExample( $applicationBuilder, $pageStatus );
    }

    /**
     * Return an HTML Block
     *
     * The HTML block type depends from the resource->metadata->type field in the json strcture
     *
     * @param $resource json strcture
     * @param CardHTMLBlock $panelBlock
     */
    public function getHTMLBlock( $resource ): JsonTemplate {

        if ($resource->metadata->type == JsonTemplateExample::blocktype) {
            $this->jsonTemplateExample->setResource($resource);
			$this->jsonTemplateExample->setSessionWrapper($this->sessionWrapper);
            $this->jsonTemplateExample->setHtmlTemplateLoader($this->htmlTemplateLoader);
            $this->jsonTemplateExample->setJsonloader($this->jsonloader);
            $this->jsonTemplateExample->setRouter($this->router);
            $this->jsonTemplateExample->setParameters($this->parameters);
            $this->jsonTemplateExample->setDbconnection($this->dbconnection);
            return $this->jsonTemplateExample->createHTMLBlock();
        }

    }

}
