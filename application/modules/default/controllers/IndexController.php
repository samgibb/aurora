<?php
/**
 * PagesController
 *
 * @author
 * @version
 */
require_once 'Zend/Controller/Action.php';
class IndexController extends Dxcore_Controller_Action
{

	public function init() {
		parent::init();
	}
    public function indexAction ()
    {
        // TODO Auto-generated PagesController::indexAction() default action
        $settings = new Admin_Model_AppSettings();
        $page = new Pages_Model_Pages();
        
        if($this->requestUri === '/')
        {
        	$this->_forward($action = 'index', $controller = 'pages', $module = 'pages', $params = array('pageName' => 'home'));
        } else {
        	$this->_forward($action = 'index', $controller = 'pages', $module = 'pages', $params = array('pageName' => $this->_request->pageName));
        }
    }
}
