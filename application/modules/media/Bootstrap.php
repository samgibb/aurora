<?php
/**
 * @author Joey Smith
 * @version 0.9.1
 * @package Dxcore
 */
require_once ('Zend/Application/Module/Bootstrap.php');
class Media_Bootstrap extends Zend_Application_Module_Bootstrap
{

    /**
     * Initialize module resources
     *
     * @return mixed registry items
     */
    protected function _initMediaModuleAutoloader() {
        //$this->_logger->info('Bootstrap ' . __METHOD__);

        $this->_resourceLoader = new Zend_Application_Module_Autoloader(array(
        																	 'basePath'  => APPLICATION_PATH . '/modules/media',
        																	 'namespace' => 'Media_',
        																	 )
        																);
        $this->_resourceLoader->addResourceTypes(array(
        'plugins' => array(
        			'path' => 'controllers/plugins',
                    'namespace' => 'Controller_Plugin')
        )
        );
        return $this->_resourceLoader;
    }

	/**
	 * Test to show returned values will go into container
	 * then they can be accessed by this resource method's name
	 * without the '_init' prefix that is (moduledata)
	 */
    protected function _initMediaData()
    {
    	$data = array(1,2,3,4,5,6,7,8,9,0);
    	return $data;
    }

	/**
     * Init config settings and resoure for this module
     *
     */
    protected function _initMediaConfig()
    {
    	// load ini file
    	$iniOptions = new Zend_Config_Ini(dirname(__FILE__) . '/configs/media.ini');

    	// Set this bootstrap options
    	$this->setOptions($iniOptions->toArray());

    	// example: use resource plugin 'Settings' (path in module.ini)
    	// this will instantiate Moduleconfig_Plugin_Resource_Settings
    	// and set its options into the registry by returning the options
    	$this->bootstrap('settings');
    }
//     protected function _initMediaNav()
//     {
//     	$mediaNavConfig = new Zend_Config_Xml(APPLICATION_PATH . '/modules/media/configs/navigation.xml', 'media');
//     	$container = Zend_Registry::get ( 'Zend_Navigation' );
//     	$container->addPages($mediaNavConfig);
//     }
    protected function _initAdminMediaNav()
    {
    	$adminMediaNavConfig = new Zend_Config_Xml(APPLICATION_PATH . '/modules/media/configs/navigation.xml', 'admin-media');
    	$adminContainer = Zend_Registry::get ( 'Admin_Navigation' );
    	$adminContainer->addPages($adminMediaNavConfig);
    }
}