<?php

require_once 'Zend/Loader/PluginLoader.php';
require_once 'Zend/Controller/Action/Helper/Abstract.php';

class Dxcore_Controller_Action_Helper_MenuBar extends Zend_Controller_Action_Helper_Abstract
{

    public $pluginLoader;

    public function preDispatch ()
    {
        
        
    }
    public function menuBar ()
    {

        $profile    = $this->getRequest()->getParams();
        $controller = $this->getRequest()->getParam('controller');
        $action     = $this->getRequest()->getParam('action');
        
        $user = Zend_Auth::getInstance();
        $userIdent = $user->getIdentity();
        
        if(!$user->hasIdentity()) {
            $this->publicName = 'Guest';
            $this->userProfileLink = null;
        } 
        else {

        $this->role = $userIdent->role;
        $this->publicName = $userIdent->firstname . '&nbsp;' . $userIdent->lastname;

        $this->userProfileLink = '<a href="/user/profile/' . $userIdent->userId . '">Profile</a>';
        }
        
    }

    public function setView (Zend_View_Interface $view)
    {
        $this->view = $view; 
    }

    public function direct ()
    {

    }
}
