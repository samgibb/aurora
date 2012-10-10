<?php
require_once ('Zend/Application/Module/Bootstrap.php');
class Admin_Bootstrap extends Zend_Application_Module_Bootstrap
{

    /**
     * Initialize module resources
     *
     * @return mixed registry items
     */
//     protected function _initAdminModuleAutoloader() {
//         //$this->_logger->info('Bootstrap ' . __METHOD__);

//         $this->_resourceLoader = new Zend_Application_Module_Autoloader(array(
//         																	 'basePath'  => APPLICATION_PATH . '/modules/admin',
//         																	 'namespace' => 'Admin_',
//         																	 )
//         																);
//         $this->_resourceLoader->addResourceTypes(array(
//         'settings' => array(
//         			'path' => 'settings/',
//         			'namespace' => 'Settings'
//         ),
//         'acl' => array(
//         			'path' => 'acl/',
//                     'namespace' => 'Acl'
//         ),
//         'controllerplugins' => array(
//         			'path' => 'controllers/plugins',
//                     'namespace' => 'Controller_Plugin')
//         ));
//         return $this->_resourceLoader;
//     }

	/**
	 * Test to show returned values will go into container
	 * then they can be accessed by this resource method's name
	 * without the '_init' prefix that is (moduledata)
	 */
    protected function _initAdminData()
    {
    	$data = array(1,2,3,4,5,6,7,8,9,0);
    	return $data;
    }


	/**
     * Init config settings and resoure for this module
     *
     */

    protected function _initAdminConfig()
    {
    	// load ini file
    	$iniOptions = new Zend_Config_Ini(dirname(__FILE__) . '/configs/admin.ini');

    	// Set this bootstrap options
    	$this->setOptions($iniOptions->toArray());

    	// example: use resource plugin 'Settings' (path in module.ini)
    	// this will instantiate Moduleconfig_Plugin_Resource_Settings
    	// and set its options into the registry by returning the options
    	$this->bootstrap('settings');
    }
//     protected function _initAcl() {
//         //$this->_logger->info('Bootstrap ' . __METHOD__);
//         //This sets the bootstraps the Acl Plugin
//         $acl = new User_Controller_Plugin_Acl();
//         $front = Zend_Controller_Front::getInstance();
//         $front->registerPlugin(new User_Controller_Plugin_Acl($acl));
//     }
    protected function _initAdminNav()
    {
        $userNavConfig = new Zend_Config_Xml(APPLICATION_PATH . '/modules/admin/configs/navigation.xml', 'adminnav');
        $container = Zend_Registry::get ( 'Zend_Navigation' );
        $container->addPages($userNavConfig);
    }
    protected function _initAdminAdminNav()
    {
    	$adminNavConfig = new Zend_Config_Xml(APPLICATION_PATH . '/modules/admin/configs/navigation.xml', 'adminadminnav');
    	$container = Zend_Registry::get ( 'Admin_Navigation' );
    	$container->addPages($adminNavConfig);
    }
//     protected function _initReCaptcha()
//     {
//         $this->options = $this->getOptions();
//         //Zend_Debug::dump($this->options, 'boostrap');
//         Zend_Registry::set('user.recaptcha', $this->options['recaptcha']);
//     }

}
?>