<?php
/**
 *
 * @author Joey
 * @version 
 */
require_once 'Zend/Loader/PluginLoader.php';
require_once 'Zend/Controller/Action/Helper/Abstract.php';
/**
 * ContactWidget Action Helper
 *
 * @uses actionHelper Dxcore_Controller_Action_Helper
 */
class Dxcore_Controller_Action_Helper_Contact extends Zend_Controller_Action_Helper_Abstract
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
    
    public function __construct ()
    {
        // TODO Auto-generated Constructor
        //$this->pluginLoader = new Zend_Loader_PluginLoader();
        $this->settings = Admin_Settings_Settings::getInstance();
        //Zend_Debug::dump($this->settings->fetch(), 'contact widget - settings');
    }
    public function preDispatch()
    {
        if (null === ($this->controller = $this->getActionController())) {
            return;
        }
        $this->renderer = $this->controller->getHelper('viewRenderer');
        
        $this->view = self::getView();
        $this->_request = $this->getRequest();
        // Only run this once our pageName is set
        if(isset($this->_request->pageName))
        {
            $this->page = new Pages_Service_Page($this->_request->pageName);
            $type = $this->page->getPageType();
            //Zend_Debug::dump($this->page->getPageName(),11 'contact widget');
            if($type !== 'contact') {
                return;
            }
            $this->handleContact();
        }
    }
    public function handleContact() {
        
        $form = new Pages_Form_Contact();
        $form->setAction($this->_request->pageName)->setMethod('post');
        if($this->_request->isPost())
        {
            if($form->isValid($this->_request->getPost())) {
                $namespace = $form->getElementsBelongTo();
                if (!empty($namespace) && !is_array($this->_request->getPost($namespace))) {
                    $this->renderContactForm($form);
                    return;
                }
                // mail handling
                $mail = new Zend_Mail();
                $this->post = $form->getValues($this->_request->getPost());
                //$result = $this->settings->fetchVar('siteEmail');
                $toEmail = $this->settings->siteEmail;
              	$mail->setFrom($this->post['email'], $this->post['name']);
                $message = $this->post['name'] . "\n" . $this->post['email'] . "\n" . $this->post['number'] . "\n" . $this->post['Editor'];
                
                $mail->setBodyText(strip_tags($message));
                
                $mail->addTo($toEmail);
                $mail->setSubject('Contact form submission');
                
                try {
                    $send = $mail->send();
                    if($send === true) {
                        $this->view->messages = array('Your email was sent successfully!');
                    } else {
                        $this->view->messages = array('There was an unknown error while trying to process your request.');
                    }
                } catch (Exception $e) {
                    echo $e->getMessage();
                }
                
                
            } 
            elseif(!$form->isValid($this->_request->getPost())) {
                $this->renderContactForm($form);
                return;
            }
            
        } else {
            $this->renderContactForm($form);
        }        
    }
    public function renderContactForm(Zend_Form $form, $error = null) 
    {
       $this->view->contact = $this->view->partial('contactwidget.' . $this->renderer->getViewSuffix(), array('contactForm' => $form, 'error' => $error));
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
    /**
     * Strategy pattern: call helper as broker method
     */
    public function direct ()
    {
        // TODO Auto-generated 'direct' method
    }
}
