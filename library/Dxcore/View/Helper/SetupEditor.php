<?php
/**
 *
 * @author Laptop
 * @version 
 */
require_once 'Zend/View/Interface.php';
/**
 * SetupEditor helper
 *
 * @uses viewHelper Zend_View_Helper
 */
class Dxcore_View_Helper_SetupEditor
{
    /**
     * @var Zend_View_Interface 
     */
    public $view;
    /**
     * 
     */
    function setupEditor ($textareaId = 'content', $options = null, $withFinder = true, $resourceType)
    {

        $this->view->headScript()->appendFile('/js-src/ckeditor/ckeditor.js');
        
        //This will need config values to use Finder
        if($withFinder === true )
        {
            $this->view->headScript()->appendFile('/js-src/ckfinder/ckfinder.js');
        }
        $finderPath = '/js-src/ckfinder/';
        return "<script type=\"text/javascript\"> 
        			var editor = CKEDITOR.replace( '" . $textareaId . "' ); 
        			CKFinder.setupCKEditor( editor, '" . $finderPath . "', '" . $resourceType . "');
        		</script>";
    }
    /**
     * Sets the view field 
     * @param $view Zend_View_Interface
     */
    public function setView (Zend_View_Interface $view)
    {
        $this->view = $view;
    }
}
