<?php

namespace Fabiom\UDDemo\HTMLTags;

use Fabiom\UglyDuckling\Common\Status\ApplicationBuilder;
use Fabiom\UglyDuckling\Common\Status\PageStatus;
use Fabiom\UglyDuckling\Common\Tags\BaseHTMLTag;
use Fabiom\UglyDuckling\Common\Tags\DefaultTags\HTMLLinkTag;
use Fabiom\UglyDuckling\Common\Tags\HTMLTagsFactory;

class CustomHTMLTagsFactory extends HTMLTagsFactory {

    protected /* TagExample */ $tagExample;

    /**
     * HTMLTagsFactory constructor.
     * @param $htmlButtonTag
     */
    public function __construct() {
        parent::__construct();
        $this->tagExample = new TagExample;
    }

    /**
     * @param $jsonStructure
     * @param PageStatus $pageStatus
     * @param ApplicationBuilder $applicationBuilder
     * @return BaseHTMLTag
     */
    public function getHTMLTag( $jsonStructure, PageStatus $pageStatus, ApplicationBuilder $applicationBuilder ): string {
        if ( isset($jsonStructure->type) ) {
            if ($jsonStructure->type === TagExample::BLOCK_TYPE) {
                $this->tagExample->setResources($jsonStructure, $pageStatus, $applicationBuilder);
                return $this->tagExample->getHTML();
            }
        }
        return 'undefined custom tag';
    }

}