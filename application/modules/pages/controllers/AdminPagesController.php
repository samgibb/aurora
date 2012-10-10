<?php
/**
 * Pages_AdminPagesController
 *
 * @author
 * @version
 */
require_once 'Zend/Controller/Action.php';
class Pages_AdminPagesController extends Dxcore_Controller_AdminAction
{
    public $page;
    protected $_pService;
    public $pageName;


    public function init()
    {
        parent::init();
        $this->pageName = $this->_request->getParam('pageName', null);

        $this->page = new Pages_Service_Page($this->pageName);
    }
    /**
     * The default action - show the home page
     */
    public function indexAction ()
    {

    }
    public function createAction()
    {
        $form = new Pages_Form_CreatePage();
        $page = new Pages_Model_Pages();
        $row = $page->fetchNew();
        $pageCount = $page->fetchTotalPageCount();
        

        if($this->_request->isPost())
        {
            if($form->isValid($this->_request->getPost())) {
                $this->post = $form->getValues();
                $row->setFromArray($this->post);

                $dParts = explode('-', $this->post['createdDate']);
                $date = new Zend_Date(array('month' => $dParts[1], 'day' => $dParts[2], 'year' => $dParts[0]));
                $row->createdDate = $date->getTimestamp();
                $row->pageOrder = ++$pageCount;
                if(isset($this->post['parent']) && $this->post['parent'] !== '') {
                	$result = $page->fetchIdByName($this->post['parent']);
                	$page->init($result->pageId);
                	$row->parentId = $result->pageId;
                } else {
                    //$row->parentId = 0;
                }
                $id = $row->save();
                $ns = new Zend_Session_Namespace($this->module);
                $ns->pageId = $id;
                if($id > 0) {
                    $this->messenger->addMessage('The page was successfully created and you will be redirected in 5 seconds.');
                    $this->view->pageName = $this->post['pageName'];
                    $this->_redirect('/admin/success');
                } else {
                    throw new Zend_Application_Exception('There was an unexpected exception while trying to complete your request!');
                }
            }
        }
        $this->view->form = $form;
    }
    public function editAction()
    {
        $form = new Pages_Form_EditPage();
        $model = new Pages_Model_Pages();
        $page = $model->fetchForEditByName($this->pageName);
        $pageList = $model->getPagesForOrder();
        $this->view->orderList = $pageList->toArray();
        $ns = new Zend_Session_Namespace($this->module);
        $ns->pageId = $page->pageId;
        $this->view->pageName = $this->pageName;
        
        if($this->_request->isXmlHttpRequest()) {
        	
        	if(isset($_POST['order'])) {
        	$i = 1;
	        	foreach($_POST['order'] as $order) {
	        		$orderParts = explode('_', $order);
	        		$pageToOrderId = $orderParts[1];
	        		$row = $model->fetchById($pageToOrderId);
	        		$row->pageOrder = $i;
	        		$row->save();
	        		$i++;
	        		continue;
	        	}
        	}
        	
        	$pageList = $model->getPagesForOrder();
        	$this->view->orderList = $pageList->toArray();
        	$this->getHelper('viewRenderer')->setNoRender(true);
        	$this->_helper->layout->disableLayout();
        	if(isset($this->_request->pageName)) {
        		$page = new Pages_Model_Pages();
        		$child = $page->fetchByName($this->_request->pageName);
        		$this->_response->setBody(var_dump($_POST));
        	}
        }

        if($this->_request->isPost()) {
            if($form->isValid($this->_request->getPost()))
            {
                $this->post = $form->getValues();
                $page->setFromArray($this->post);
                $parentId = $model->fetchIdByName($this->post['parent']);
                $page->parentId = $parentId->pageId;
                $save = (bool) $page->save();
                if($save) {
                    $this->messenger->addMessage('Your page was successfully edited and you will be redirected in 5 seconds');
                    $this->view->pageName = $this->post['pageName'];
                    $this->_redirect('/admin/success');
                } else {
                    throw new Zend_Application_Exception('An unexpected error occured while trying to complete your request!');
                }
            }
        } else {
            $data['pageId'] = $page->pageId;
            $data['parentId']  = $page->parentId;
            $data['role'] = $page->role;
            $data['pageName'] = $page->pageName;
            $data['visibility'] = $page->visibility;
            
            $timestamp = (int) $page->createdDate;
            $date = new Zend_Date($timestamp, Zend_Date::TIMESTAMP);
            $today = $date->toString('MM/dd/yyyy');
            $data['createDated'] = $today;
            $data['pageOrder'] = $page->pageOrder;
            $data['pageType'] = $page->pageType;
            $data['pageText'] = $page->pageText;
            $data['showSlider'] = $page->showSlider;
            $form->populate($data);
        }
        $this->view->form = $form;
    }
    public function deleteAction() {
        if(isset($this->pageName) && $this->pageName !== 'home') {
        	$model = new Pages_Model_Pages();
        	$page = $model->fetchForEditByName($this->pageName);
        	$delete = (int) $page->delete();
        	if($delete === 1) {
        	    $this->messenger->addMessage("$this->pageName was deleted successfully! You will be redirected in 5 seconds");
        	    $this->view->pageName = '';
        	    $this->_redirect('/admin/pages/success');
        	}
        }
    }
    public function successAction() {} // <- void method, here only for loading the view
}
