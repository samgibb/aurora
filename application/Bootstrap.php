<?php
/**
 * @author Joey Smith
 * @version 0.1
 */
class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    /**
     * Init a global MySQL connection for all calls to the DB
     */
    protected $db;
    protected $sessionConfig;
    protected $appSettings;

    protected function _initPluginCache () {

        $config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/application.ini', 'production');
        $classFileIncCache = APPLICATION_PATH . '/data/pluginLoaderCache.php';
        if (file_exists($classFileIncCache)) {
            include_once $classFileIncCache;
        }
        if ($config->params->enablePluginLoaderCache) {
            Zend_Loader_PluginLoader::setIncludeFileCache($classFileIncCache);
        }
    }
    protected function _initMysql() {
        $this->bootstrap('db');
        if ('production' !== $this->getEnvironment()) {
            $profiler = new Zend_Db_Profiler_Firebug('Aurora Queries');
            $profiler->setEnabled(true);
            $this->getPluginResource('db')->getDbAdapter()->setProfiler($profiler);
        }
    }
    /**
     * Configure the default modules autoloading, here we first create
     * a new module autoloader specifiying the base path and namespace
     * for our default module. This will automatically add the default
     * resource types for us. We also add two custom resources for Services
     * and Model Resources.
     */
	protected function _initDefaultModuleAutoloader() {
            //$this->_logger->info('Bootstrap ' . __METHOD__);
        	$this->_resourceLoader = new Zend_Application_Module_Autoloader(array(
        			'basePath'  => APPLICATION_PATH . '/modules/admin',
        			'namespace' => 'Admin_',
        	)
        	);
        	$this->_resourceLoader->addResourceTypes(array(
        			'settings' => array(
        					'path' => 'settings/',
        					'namespace' => 'Settings'
        			),
        			'acl' => array(
        					'path' => 'acl/',
        					'namespace' => 'Acl'
        			),
        			'controllerplugins' => array(
        					'path' => 'controllers/plugins',
        					'namespace' => 'Controller_Plugin')
        	));
        	return $this->_resourceLoader;
    }
    protected function _initApplicationSettings()
    {
    	/* Usage **
    	 $test = array('blah' => 'blah');
    	$settings = new Admin_Settings_Settings($test);
    	$blah = 'blah';
    	$settings->__set('test', $blah);
    	*/
    	$settings = Admin_Settings_Settings::getInstance();
    	$this->appSettings = $settings;
    	Zend_Registry::set('appSettings', $settings);
    	return $settings;
    }

    /**
     * Setup the logging
     */
    protected function _initLogging() {
        // table column mapping array
        $columnMapping = array(
        //'userId' => 'userId',
        //'userName' => 'userName',
        //'fileId'  => 'fileId',
        'timeStamp' => 'timeStamp',
        'priorityName' =>'priorityName',
        'priority' => 'priority',
        'message' => 'message');

        $this->bootstrap('frontController');
        $logger = new Dxcore_Log();
      
        $writer = $this->appSettings->enableLogging ? new Zend_Log_Writer_Db(Zend_Db_Table_Abstract::getDefaultAdapter(), 'log', $columnMapping) : new Zend_Log_Writer_Firebug();
        
        $logger->addWriter($writer);

        if ('production' == $this->getEnvironment()) {
            $filter = new Zend_Log_Filter_Priority(Zend_Log::CRIT);
            $logger->addFilter($filter);
        }

        $this->_logger = $logger;
        Zend_Registry::set('log', $logger);
    }
    protected function _initSession() {
        //if('production' == $this->getEnvironment()) {
	        //$this->_logger->info('Bootstrap ' . __METHOD__);
	        $this->sessionConfig = array(
	        'name'           => 'session',
	        'primary'        => 'id',
	        'modifiedColumn' => 'modified',
	        'dataColumn'     => 'data',
	        'lifetimeColumn' => 'lifetime'
	        );
// 	        Zend_Session::setOptions(array(
// 	        							//'cookie_secure' => true //only if using SSL
// 	        							'use_only_cookies' => true,
// 	        							'gc_maxlifetime' => ( isset($this->appSettings->sessionLength) ) ? (int) $this->appSettings->sessionLength : 15 * 60, // use setting or fall back to 15 minutes
// 	        							'cookie_httponly' => true
// 	        							)
// 	        						);

	        //Zend_Session::setSaveHandler(new Zend_Session_SaveHandler_DbTable($this->sessionConfig));
	        Zend_Session::start();
       // }
        //Zend_Session::regenerateId();
    }
    protected function _initDxcoreView() {
        //$this->_logger->info('Bootstrap ' . __METHOD__);
        $this->bootstrap('view');
        $view = $this->getResource('view'); //get the view object
        if(! (bool) $this->appSettings->enableFbOpenGraph) {
        	$view->doctype('XHTML1_TRANSITIONAL');
        }
        elseif($this->appSettings->enableFbOpenGraph) {
        	$view->doctype('XHTML1_RDFA');
        }
        $view->addHelperPath("Dxcore/View/Helper", "Dxcore_View_Helper");
        $view->addHelperPath('Zend/Dojo/View/Helper/', 'Zend_Dojo_View_Helper');
        $view->addHelperPath('ZendX/JQuery/View/Helper/', 'ZendX_JQuery_View_Helper');
        $view->addHelperPath(APPLICATION_PATH . '/modules/pages/views/helpers', 'Pages_View_Helper');
        //$view->addHelperPath(APPLICATION_PATH . '/modules/default/views/helpers', 'Default_View_Helper');

        $view->dojo()
        //->setCdnBase(Zend_Dojo::CDN_BASE_GOOGLE)
        ->setLocalPath('/js-src/dojo/dojo.js')
        ->addStyleSheetModule('dijit.themes.nihilo')
        ->disable();

        $jquery = $view->jQuery();
        $jquery->useCdn();
        $jquery->setVersion('1.8.1');
        $jquery->useUiCdn();
        $jquery->setUiVersion('1.8');
        $jquery->disable();
        $jquery->uiDisable();

        ZendX_JQuery_View_Helper_JQuery::enableNoConflictMode();

        $viewRenderer = new Zend_Controller_Action_Helper_ViewRenderer();
        $viewRenderer->setView($view);

        Zend_Controller_Action_HelperBroker::addHelper($viewRenderer);

    }
    // Init the Navigation helper - Requires Dxcore library
    protected function _initNavigation() {
        //$this->_logger->info('Bootstrap ' . __METHOD__);
    	/**
    	 * This will be changing soon to use a module based navigation
    	 */
		// Read navigation XML and initialize container
        $navconfig = new Zend_Config_Xml(APPLICATION_PATH . '/configs/navigation.xml', 'nav');
        $container = new Zend_Navigation($navconfig);
        // Register navigation container
        $registry = Zend_Registry::getInstance();
        $registry->set('Zend_Navigation', $container);
        // Add action helper
        Zend_Controller_Action_HelperBroker::addHelper(new Dxcore_Controller_Action_Helper_Navigation());
    }
    protected function _initAdminNavigation() {
    	//$this->_logger->info('Bootstrap ' . __METHOD__);
    	/**
    	* This will be changing soon to use a module based navigation
    	*/
    	// Read navigation XML and initialize container
    	$adminnavconfig = new Zend_Config_Xml(APPLICATION_PATH . '/configs/navigation.xml', 'adminnav');
    	$admincontainer = new Zend_Navigation($adminnavconfig);
    	// Register navigation container
    	$registry = Zend_Registry::getInstance();
    	$registry->set('Admin_Navigation', $admincontainer);
    	// Add action helper
    	Zend_Controller_Action_HelperBroker::addHelper(new Dxcore_Controller_Action_Helper_AdminNavigation());
    }
//     protected function _initLicense() {
//     	//$this->_logger->info('Bootstrap ' . __METHOD__);
//     	//TODO: Recode this plugin to allow for modules
//     	$License = new Dxcore_Controller_Plugin_License();
//     	$front = Zend_Controller_Front::getInstance();
//     	$front->registerPlugin(new Dxcore_Controller_Plugin_License($License));
//     }
    // Init the pageTitle plugin - Requires the Dxcore library and ini namespace
    protected function _initPagetitle() {
        //$this->_logger->info('Bootstrap ' . __METHOD__);
		//TODO: Recode this plugin to allow for modules
        $pageTitle = new Dxcore_Controller_Plugin_Pagetitle();
        $front = Zend_Controller_Front::getInstance();
        $front->registerPlugin(new Dxcore_Controller_Plugin_Pagetitle($pageTitle));
    }
    /**
     * Setup locale
     */
    protected function _initLocale() {
        //$this->_logger->info('Bootstrap ' . __METHOD__);
    	$this->locale = new Zend_Locale('en_US');
        Zend_Registry::set('Zend_Locale', $this->locale);
    }
    protected function _initBrowsCap() {

    }
    protected function _initCurrency() {
		$currency = new Zend_Currency('en_US');
		Zend_Registry::set('Zend_Currency', $currency);
    }
    // Set today's date for an instance of Zend_Date
    protected function _initTodayDate() {
        //$this->_logger->info('Bootstrap ' . __METHOD__);
        // Date may be retrieved from the registry using the today_date key
        $today = new Zend_Date();
        //$date = $today->toString('yyyy-MM-dd');
        $registry = Zend_Registry::getInstance();
        $registry->set('date', $today);
    }
}