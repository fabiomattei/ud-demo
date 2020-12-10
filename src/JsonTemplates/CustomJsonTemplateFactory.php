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
        parent::__construct( $applicationBuilder, $pageStatus );
        $this->jsonTemplateExample = new JsonTemplateExample( $applicationBuilder, $pageStatus );
    }
    
    public function isResourceSupported( $resource ) {
        return in_array($resource->metadata->type, array(
            JsonTemplateExample::blocktype
        ));
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
            return $this->jsonTemplateExample->createHTMLBlock();
        }

    }

}