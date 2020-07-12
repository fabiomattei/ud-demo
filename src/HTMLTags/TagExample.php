<?php

namespace Fabiom\UDDemo\HTMLTags;

use Fabiom\UglyDuckling\Common\Tags\BaseHTMLTag;

class TagExample extends BaseHTMLTag {

    const BLOCK_TYPE = 'tagexample';

    function getHTML(): string {
        return '<string>Example</strong>';
    }

}
