<?php
/**
 *
 * @author Joey
 * @version 
 */
require_once 'Zend/Loader/PluginLoader.php';
require_once 'Zend/Controller/Action/Helper/Abstract.php';
/**
 * PageWidget Action Helper
 *
 * @uses actionHelper Dxcore_Controller_Action_Helper
 */
class Dxcore_Controller_Action_Helper_Home extends Zend_Controller_Action_Helper_Abstract
{
    /**
     *
     * @var Zend_Loader_PluginLoader
     */
    public $pluginLoader;
    /**
     * Constructor: initialize plugin loader
     *
     * @return void
     */
    protected $view;
    
    protected $_request;
    
    protected $params; // request params
    
    protected $pages;
    
    public function __construct ()
    {
        // TODO Auto-generated Constructor
        //$this->pluginLoader = new Zend_Loader_PluginLoader();
        
    }
    public function preDispatch()
    {
        $this->controller = $this->getActionController();
        $this->renderer = $this->controller->getHelper('viewRenderer');
        
        $this->view = self::getView();
        
        $this->_request = $this->getRequest();
        // Only run this once our pageName is set
        if(isset($this->_request->pageName))
        {
            $this->pages = new Pages_Service_Page($this->_request->pageName);
            $type = $this->pages->getPageType();
            $subs = $this->pages->getSubPages();
            //Zend_Debug::dump($subs);
            if(count($subs) >= 1 && $type === 'home') {
            	$this->createPageWidget($subs);
            }
        }

        
    }
    public function getView()
    {
        if(null !== $this->view) {
            return $this->view;
        }
        $controller = $this->getActionController();
        $view = $controller->view;
        if(!$view instanceof Zend_View_Abstract) {
            return;
        }
        return $view;
    }
    public function createPageWidget($pages) 
    {
       $this->view->home = $this->view->partial('homewidget.' . $this->renderer->getViewSuffix(), array('widgetPages' => $pages));
    }
    /**
     * Strategy pattern: call helper as broker method
     */
    public function direct ()
    {
        // TODO Auto-generated 'direct' method
    }
}
