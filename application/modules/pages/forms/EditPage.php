<?php
class Pages_Form_EditPage extends Pages_Form_CreatePage
{
    public function init() {
        parent::init();
        $pageId = new Zend_Form_Element_Hidden('pageId');
        $this->addElement($pageId);
    }
}