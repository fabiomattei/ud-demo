<?php

namespace Fabiom\UDDemo\JsonTemplates;

use Fabiom\UglyDuckling\Common\Json\JsonTemplates\JsonTemplate;
use Fabiom\UDDemo\HTMLBlocks\HTMLBlockExample;

class JsonTemplateExample extends JsonTemplate {

    const blocktype = 'templatebuilderexample';

    /**
     * @return \Fabiom\UglyDuckling\Common\Blocks\EmptyHTMLBlock|HTMLBlockExample
     */
    public function createHTMLBlock() {
        return new HTMLBlockExample;
    }

}
