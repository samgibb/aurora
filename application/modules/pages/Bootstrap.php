<?php
require_once ('Zend/Application/Module/Bootstrap.php');
class Pages_Bootstrap extends Zend_Application_Module_Bootstrap
{

    /**
     * Initialize module resources
     *
     * @return mixed registry items
     */
	protected function _initResourceLoader()
    {
    	$this->_resourceLoader = new Zend_Application_Module_Autoloader(array(
    			'basePath'  => APPLICATION_PATH . '/modules/pages',
    			'namespace' => 'Pages_',
    	)
    	);
    	$this->_resourceLoader->addResourceTypes(array(
    			// DO NOT REMOVE
    			'acl' => array(
    					'path' => 'acl/',
    					'namespace' => 'Acl'
    			),
//     			'helpers' => array('path' => 'controllers/helpers',
//     					'namespace' => 'Controller_Action_Helper')
    	)
    	);
    	return $this->_resourceLoader;
    }

	/**
	 * Test to show returned values will go into container
	 * then they can be accessed by this resource method's name
	 * without the '_init' prefix that is (moduledata)
	 */
    protected function _initPagesData()
    {
    	$data = array(1,2,3,4,5,6,7,8,9,0);
    	return $data;
    }

	/**
     * Init config settings and resoure for this module
     *
     */
    protected function _initPagesConfig()
    {
    	// load ini file
    	$iniOptions = new Zend_Config_Ini(dirname(__FILE__) . '/configs/pages.ini');

    	// Set this bootstrap options
    	$this->setOptions($iniOptions->toArray());

    	// example: use resource plugin 'Settings' (path in module.ini)
    	// this will instantiate Moduleconfig_Plugin_Resource_Settings
    	// and set its options into the registry by returning the options
    	$this->bootstrap('settings');
    }
//     protected function _initPagesNav()
//     {
//         $mediaNavConfig = new Zend_Config_Xml(APPLICATION_PATH . '/modules/pages/configs/navigation.xml', 'medianav');
//         $container = Zend_Registry::get ( 'Zend_Navigation' );
//         $container->addPages($mediaNavConfig);
//     }
    protected function _initAdminPagesNav()
    {
        $adminPagesNavConfig = new Zend_Config_Xml(APPLICATION_PATH . '/modules/pages/configs/navigation.xml', 'adminpagesnav');
        $adminContainer = Zend_Registry::get ( 'Admin_Navigation' );
        $adminContainer->addPages($adminPagesNavConfig);
    }
    protected function _initHomeActionHelper() {
        Zend_Controller_Action_HelperBroker::addHelper(new Dxcore_Controller_Action_Helper_Home());
    }
    protected function _initContactActionHelper() {
        Zend_Controller_Action_HelperBroker::addHelper(new Dxcore_Controller_Action_Helper_Contact());
    }
    protected function _initMediaActionHelper() {
        Zend_Controller_Action_HelperBroker::addHelper(new Dxcore_Controller_Action_Helper_Media());
    }
    protected function _initReCaptcha()
    {
        $this->options = $this->getOptions();
        //Zend_Debug::dump($this->options, 'boostrap');
        Zend_Registry::set('config.recaptcha', $this->options['recaptcha']);
    }
}
?>