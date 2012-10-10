<?php
/**
 *
 * @author Jsmith
 * @version 
 */
require_once 'Zend/View/Interface.php';
/**
 * SideBar helper
 *
 * @uses viewHelper Zend_Controller_Action_Helper
 */
class Dxcore_Controller_Action_Helper_SideBar extends Zend_Controller_Action_Helper_Abstract
{
    /**
     * @var Zend_View_Interface 
     */
    public $view;
    /**
     * 
     */
    public $profileName;
    public $admin_greet;
    
    public function preDispatch ()
    {
        
        
    }
    public function sideBar ()
    {
        // TODO Auto-generated User_Controller_Action_Helper_SideBar::sideBar() helper 
        $profile    = $this->getRequest()->getParams();
        $controller = $this->getRequest()->getParam('controller');
        $action     = $this->getRequest()->getParam('action');
        
        $user = Zend_Auth::getInstance();
        $userIdent = $user->getIdentity();
        
        if(!$user->hasIdentity()) {
            $this->publicName = 'Guest';
            $this->userProfileLink = null;
        } else {
        //Zend_Debug::dump($userIdent, 'sidebar', true);
        $this->publicName = $userIdent->firstname . '&nbsp;' . $userIdent->lastname;

        
        /*setup a link value for profile index so we can get there from the sidebar
         * the below is only used in the /user/index view
         */
        $this->userProfileLink = '<a href="/user/profile/' . $userIdent->userId . '">Profile</a>';
        }

    }
    /**
     * Sets the view field 
     * @param $view Zend_View_Interface
     */
    public function setView (Zend_View_Interface $view)
    {
        $this->view = $view; 
    }
    
}
