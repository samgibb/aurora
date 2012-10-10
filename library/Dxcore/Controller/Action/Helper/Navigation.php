<?php
/**
 *
 * @author Joey Smith
 * @version
 */
require_once 'Zend/Loader/PluginLoader.php';
require_once 'Zend/Controller/Action/Helper/Abstract.php';

/**
 * {1} Action Helper
 *
 * @uses actionHelper {0}
 */
class Dxcore_Controller_Action_Helper_Navigation extends Zend_Controller_Action_Helper_Abstract
{
	protected $_container;
	// constructor, set navigation container
	public function __construct(Zend_Navigation $container = null)
	{
		if (null !== $container)
		{
			$this->_container = $container;
		}

	}
	// check current request and set active page
	public function preDispatch()
	{
		$this->getContainer ()->findBy ( 'uri', $this->getRequest ()->getRequestUri () )->active = true;
	}
	// retrieve navigation container
	public function getContainer()
	{
		if (null === $this->_container)
		{
			$this->_container = Zend_Registry::get ( 'Zend_Navigation' );

			$this->_container->addPages(self::getModulePages());

			//$this->_container->addPages(self::getUserPages());

            //Zend_Debug::dump($this->_container, 'navigationActionHelper', true);
		}
		if (null === $this->_container)
		{
			throw new RuntimeException ( 'Navigation container unavailable' );
		}
		return $this->_container;
	}
	public function getUserPages() {

		$pages = array();
		$pages[] = Zend_Navigation_Page::factory(array(
				'label' => 'Account Summary',
				'uri'   => '/user/account/summary/' . $this->user->userId,
				'resource' => 'user',
				'privilege' => 'user.account-editown',
				'order' => 5
			)
		);
		return $pages;

	}
	public function getModulePages()
	{
    	$pages = new Pages_Model_Pages();
   		$result = $pages->fetchMainMenu(array('visibility' => 'public'));
    	$pages = array();
    	$i = 2;
    	$priv = 'pages.view'; // default for public pages

    	foreach ($result as $page) :

    	if($page->pageName == 'home')
    	{
    	    //continue;
    	    $home = $this->_container->findOneBy('uri', '/');
    	    $home->order = ($page->pageOrder !== null) ? $page->pageOrder : $i;
    	    $home->resource = 'pages';
    	    $home->privilege = "pages.$page->role.view";
    	}
    	if($page->pageName !== 'home') {
        	$pages[] = Zend_Navigation_Page::factory(array(
                                                        'label' => ucfirst($page->pageName),
                                                        'uri'   => '/' . $page->pageName,
        												'resource' => new Pages_Service_Page($page->pageName),
        												'privilege' => "pages.$page->role.view",
                                                        'order' => ($page->pageOrder !== null) ? $page->pageOrder : $i,
                                                      )
                                                );
    	}
    	++$i;
    	endforeach;

    	return $pages;
	}

}