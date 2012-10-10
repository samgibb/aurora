<?php

/**
 * DxcoreController
 *
 * @author
 * @version
 */

require_once 'Zend/Controller/Action.php';

class Dxcore_Controller_Action extends Zend_Controller_Action {

    public $isAdmin = false;
	/**
	 *
	 * @var object $_uManager Dxcore_Model_UserManager
	 */
	protected $_uManager;
	/**
	 *
	 * @var object $_logger Dxcore_Log
	 */
	protected $_logger;
	/**
	 *
	 * @var array $_POST
	 */
	public $post;
	/**
	 *
	 * @var array $_GET
	 */
	public $get;
	/**
	 *
	 * @var object Zend_Validate_Alnum
	 */
	private $_Alnum;
	/**
	 *
	 * @var object Zend_Validate_Alpha
	 */
	private $_Alpha;
	/**
	 *
	 * @var object Zend_Validate_Regex
	 */
	private $_regex;
	/**
	 *
	 * @var unknown_type
	 */
	private $_html;
	private $_validatorChain;
	public $filters;
	/**
	 *
	 * @var object $form Zend_Form
	 */
	public $form;
	/**
	 *
	 * @var object $appSettings Dxcore_Settings
	 */
	public $appSettings;
	public $moduleSettings;
	public $cleanData;
	/**
	 *
	 * @var object $auth Zend_Auth
	 */
	public $auth;
	/**
	 *
	 * @var string Zend_Controller_RequestAbstract
	 */
	public $requestedUrl;
	public $requestUri;
	/**
	 *
	 * @var object $messenger Flashmessenger
	 */
	public $messenger;
	/**
	 *
	 * @var array $messages Messages stack
	 */
	public $messages; // message stack for flashmessenger
	/**
	 * $var $userId
	 */
	public $userId;
	/**
	 *
	 * @var object Zend_Db_Table_Row
	 */
	public $user;

	/**
	 *
	 * @var bool logged in status of current user
	 */
	public $isLogged;
	/**
	 *
	 * @var object $acl User_Acl_Acl
	 */
	public $acl;
	/**
	 *
	 * @var string Module Name
	 */
	public $module;
	/**
	 *
	 * @var string controller name
	 */
	public $controller;
	/**
	 *
	 * @var string action name
	 */
	public $action;
	/**
	 * @var (string) $requestUri requested uri
	 */
	protected $pageName;

	public $scheme;
	public $host;
	public $context;
	/**
	 *
	 * @var (bool) flag for mobile devices
	 */
	public $isMobile = false;
	/**
	 *
	 * @var (object) device object
	 */
	public $device;
	protected $_ns;
 	public    $fb = null;
 	public    $lang;
 	public    $keyWords;

	public function init() {

		parent::init ();
		// the app settings model
		//$this->appSettings = Admin_Settings_Settings::getInstance();
		$this->appSettings = Zend_Registry::get('appSettings');
		//Zend_Debug::dump($this->appSettings);

		$lang = new Admin_Model_Language();
		$this->lang = $lang->fetchAll();

		$bootstrap = $this->getInvokeArg('bootstrap');
		$userAgent = $bootstrap->getResource('useragent');
		$this->device = $userAgent->getDevice();

		if($this->device instanceof Zend_Http_UserAgent_Mobile) {
		    $this->isMobile = true;

		    if( (bool) $this->appSettings->enableMobileSupport) {
		    	$this->_helper->viewRenderer->setViewSuffix('mobi.phtml');
		    	$this->_helper->layout->setViewSuffix('mobi.phtml');
		    }

		}

		$this->scheme = $this->_request->getScheme();
		$this->host = $this->_request->getHttpHost();
		$this->module = $this->_request->getModuleName();
		$this->controller = $this->_request->getControllerName();
		$this->action = $this->_request->getActionName();

		$this->_ns = new Zend_Session_Namespace($this->module);

		// Zend Auth - authentication
		$this->auth = Zend_Auth::getInstance ();
		// Acl - authorization
		$this->acl = new User_Acl_Acl ();
		// requested url
		$this->requestedUrl = $this->_request->getRequestUri ();
		// only to provide both url and uri so you have both (its just a preference thing)
		$this->requestUri = $this->requestedUrl;
		// user manager
		$this->_uManager = new User_Model_User ();


		if ($this->auth->hasIdentity () && isset(Zend_Auth::getInstance()->getIdentity()->userId)) {
			$this->isLogged = true;
			$this->user = $this->_uManager->fetch ( $this->auth->getIdentity ()->userId );
		}
		elseif($this->auth->hasIdentity() && !isset($this->auth->getIdentity()->userId) && substr(Zend_Auth::getInstance()->getIdentity(), 0, 10) === 'DIREXTION\\') {
		    $this->isLogged = true;
		    $this->user = new stdClass();
		    $this->user->userId = -1;
		    $this->user->role = 'dxadmin';
		    $this->user->firstName = 'Dirextion';
		    $this->user->lastName = 'Developer';
		    $this->user->email = 'support@dirextion.com';
		}
		else {
			$this->isLogged = false;
		}
		$this->messenger = $this->_helper->getHelper ( 'FlashMessenger' );
		if ($this->messenger->getMessages ()) {
			$this->view->messages = $this->messenger->getMessages ();
		}
		if ($this->_request->isPost ()) {
			$this->post = $this->_request->getPost ();
		}
		if ($this->_request->isGet ()) {
			$this->get = $this->_request->getParams ();
		}

		if(isset($this->_request->pageName)) {
		    $this->pageName = $this->_request->pageName;
		}

		if(!empty($this->appSettings->enableFbOpenGraph) && $this->appSettings->enableFbOpenGraph == '1')
		{
			$this->view->showFb = true;
			$this->fb = new Facebook_Facebook(array(
					'appId' => $this->appSettings->facebookAppId,
					'secret' => $this->appSettings->facebookAppSecret)
			);
		} else {
			$this->view->showFb = false;
		}


		/*
		 * Below are all the properties that can be accessed from the view object
		 * Please see above for assignment
		 */
		$this->view->module = $this->module;
		$this->view->controller = $this->controller;
		$this->view->action = $this->action;
		$this->view->scheme = $this->scheme;
		$this->view->user = $this->user;
		$this->view->host = $this->host;
		$this->view->isLogged = $this->isLogged;
		$this->view->isAdmin = $this->isAdmin;
		$this->view->appSettings = $this->appSettings;
		$this->view->lang = $this->lang;
		$this->view->keyWords = $this->keyWords;
	}
}
