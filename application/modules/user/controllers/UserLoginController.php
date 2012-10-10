<?php
class User_UserLoginController extends Dxcore_Controller_Action {

    //public $user;
    public $userData;
    public $userName;
    public $role;


    public function init()
    {
    	parent::init();
    }//////////////////////////////////////////////////////////
    public function indexAction()
    {// login action
        if ($this->isLogged)
        {
            $this->_redirect('/user/account/summary'); // Already authenticated? Navigate away
        }

        $form = new User_Form_Login;
        $this->view->form = $form;
         /*check for valid input
           authenticate using adapter
           persist user record to session
           redirect to original request URL if present*/
        if ($this->_request->isPost())
        {
            if ($form->isValid($this->_request->getPost()))
            {
                $values = $form->getValues();

                $authAdapter = $this->getAuthAdapter();

                # get the username and password from the form
                $username = $values['username'];
                $password = $values['password'];

                # pass to the adapter the submitted username and password
                $authAdapter->setIdentity($username)
                        ->setCredential($password);

                $result = $this->auth->authenticate($authAdapter);

                if ($result->isValid())
                {
                	Zend_Session::regenerateId();

                    # all info about this user from the login table
                    # ommit only the password, we don't need that
                   // $userInfo = $authAdapter->getResultRowObject(null, 'password');

                    # the default storage is a session with namespace Zend_Auth
                    $authStorage = $this->auth->getStorage();
                    $userInfo = $authAdapter->getResultRowObject(array('userId', 'userName', 'role'));
                    $authStorage->write($userInfo);

                    //$session = new Zend_Session_Namespace('dxcore.auth');

                    //print them a nice little message saying thank you
                    $this->_helper->getHelper('FlashMessenger')->addMessage('You were sucessfully logged in as&nbsp;' . $userInfo->userName);


                    //$this->user->init(null, $userInfo->userId);
                    //Zend_Debug::dump($this->user);
                    //$this->role = $this->user->getRole();

                    //Zend_Debug::dump($this->user->userName, true);
                    if( isset($userInfo->role) )
                    {
                       // $url = null;
                        //$this->_redirect('/admin/');
                        switch($userInfo->role){
                        	case "dxadmin" :
                        		$this->_redirect('/admin/index');
                        		break;
                        	case "admin" :
                        	    $this->_redirect('/admin/index');
                        	    break;
                        	case "mod" :
                        	    $this->_redirect('/');
                        	    break;
                        	case "user" :
                        	    $this->_redirect('/');
                        	    break;
                        }
                    }
                }
                else {
                    $this->messenger->addMessage('You could not be logged in. Please try again.');
                }
            }
        }
    }////////////////////////////////////////////////////////////////////
    public function logoutAction()
    {
        Zend_Auth::getInstance()->clearIdentity();
        Zend_Session::destroy();
        $this->_redirect('/');
    }///////////////////////////////////////////////////////////////////
    public function devloginAction() {

        //$authStorage = $this->auth->getStorage();
        //$userInfo = $authAdapter->getResultRowObject(array('userId', 'userName', 'role'));
        //$authStorage->write($userInfo);

        $form = new User_Form_Login();

        if($this->_request->isPost()) {
            if($form->isValid($this->_request->getPost())) {
                $data = $form->getValues();

//                 $options[] = array('host' => 'webserver.loc',
// 			                //'username' => $data['username'],
// 			                //'password' => $data['password'],
// 			                'accountDomainName' => 'webserver.loc',
// 			                'accountDomainNameShort' => 'WEBSERVER',
// 			                'accountCanonicalForm' => '3',
// 			                'baseDn' => 'DC=webserver,DC=loc',
// 			                'bindRequiresDn' => true,
// 			                'useSsl' => false,);

                $options[] = array('host' => 'server.dirextion.net',
                //'username' => $data['username'],
                //'password' => $data['password'],
                'accountDomainName' => 'dirextion.net',
                'accountDomainNameShort' => 'DIREXTION',
                'accountCanonicalForm' => '3',
                'baseDn' => 'DC=server,DC=dirextion,DC=net',
                'bindRequiresDn' => true,
                'useSsl' => false,);


                $adapter = new Zend_Auth_Adapter_Ldap($options, $data['username'], $data['password']);
                $result = $this->auth->authenticate($adapter);
                //Zend_Debug::dump($this->auth->authenticate($adapter));
                //exit();
                //Zend_Debug::dump($adapter->authenticate());
                //$result = $adapter->authenticate();
                if($result->isValid()) {
                    $this->_redirect('/admin/settings');
                    Zend_Debug::dump($result);
                } else {
                    Zend_Debug::dump($result);
                    die('you were NOT logged in via ldap');
                }
            }
        }

        $this->view->form = $form;
    }
    public function getLdapAuthAdapter()
    {

    }
    protected function getAuthAdapter()
    {
        $dbAdapter = Zend_Db_Table::getDefaultAdapter();
        $authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter, 'user', 'userName', 'passWord', 'sha1(?) AND uStatus != "disabled"');
        return $authAdapter;
    }///////////////////////////////////////////////////////////////////
    public function successAction()
    {
        if ($this->_helper->getHelper('FlashMessenger')->getMessages())
        {
            $this->view->messages = $this->_helper
                            ->getHelper('FlashMessenger')
                            ->getMessages();
        }
        else {
            $this->_redirect('/user/login/success');
        }
    }////////////////////////////////////////////////////////////////////
}
?>