<?php
/**
 * PagesController
 *
 * @author Joey Smith
 * @version 0.9
 */
require_once 'Zend/Controller/Action.php';
class Pages_PagesController extends Dxcore_Controller_Action
{
    public $categories;
    public $files;
    public $page;
    public $isHome = false;
    
    public function init() {
    	
        parent::init();

        $this->page = new Pages_Service_Page($this->_request->pageName);
        if(!$this->page->found)
        {
        	throw new Zend_Controller_Action_Exception(sprintf('Page "%s" was not found, please check the url and try again.', $this->_request->pageName), 404);
        }
        if('home' == $this->page->getPageName())
        {
        	$this->isHome = true;
        }
        $this->view->isHome = $this->isHome;
        $this->view->headTitle(ucwords($this->page->getPageName()));
    }
    /**
     * The default action - show the page if the user has access to it, if its not found then of course we get a 404
     */
    public function indexAction ()
    {
    	$page = new Pages_Model_Pages();
    	$row = $page->fetchForEditByName($this->_request->pageName);

    	if($this->_request->isXmlHttpRequest()) {
        	$this->getHelper('viewRenderer')->setNoRender(true);
        	$this->_helper->layout->disableLayout();
        	
	        if(isset($this->_request->pageName)) {
	            $page = new Pages_Model_Pages();
	            $child = $page->fetchByName($this->_request->pageName);
	            $this->_response->setBody('<h2>' .  $child->pageName . '</h2>' . $child->pageText);
	        }

	    }

        if($this->page->getIsAllowed())
        {
        	if($this->acl->isAllowed( new User_Acl_Role_User(), $this->page->getResourceId(), 'admin.pages.edit.any'))
        	{
        		$this->view->allowEdit = true;
        	}
        	//Zend_Debug::dump($this->page);
        	$this->view->page = array();
        	$this->view->page['pageText'] = $this->page->getPageText();
        	$this->view->page['pageName'] = $this->page->getPageName();
        	$this->view->page['pageOwner'] = $this->page->getPageOwner();
        	$this->view->page['role'] = $this->page->getRole();
        	$this->view->page['pageId'] = $this->page->getPageId();
        	$this->view->page['createdDate'] = $this->page->getCreatedDate();
        	$this->view->page['modifiedDate'] = $this->page->getModifiedDate();
        	$this->view->page['publishDate'] = $this->page->getPublishDate();
        	$this->view->page['pageType'] = $this->page->getPageType();
        	$this->view->page['subPages'] = $this->page->getSubPages();
        	$this->view->page['hasSubPages'] = $this->page->getHasSubPages();
        	$this->view->page['parentPage'] = $this->page->getParentPage();
        	$this->view->keyWords = $this->page->getKeyWords();
        	$this->view->page['showSlider'] = (bool) $this->page->showSlider;
        	//Zend_Debug::dump();
        	if (Zend_Controller_Action_HelperBroker::hasHelper($this->page->getPageType())) {
        		$this->view->widget = $this->page->getPageType();
        	}

        } else {
        	//TODO: Create routes and test this redirect to error page
        	//$this->messenger->addMessage('Access Denied');
        	throw new Zend_Controller_Action_Exception('Access Denied', 550);
        }

    }

}