<?php
class User_Form_Login extends Zend_Form {

    public function init() {

// initialize form
        $this->setMethod('post');
// create text input for name
        $username = new Zend_Form_Element_Text('username');
        $username->setLabel('Username:')
                ->setOptions(array('size' => '30'))
                ->setRequired(true)
                ->addFilter('StringTrim');
// create text input for password
        $password = new Zend_Form_Element_Password('password');
        $password->setLabel('Password:')
                ->setOptions(array('size' => '30'))
                ->setRequired(true)
                ->addFilter('HtmlEntities')
                ->addFilter('StringTrim');
// create submit button
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setLabel('Log In')
                ->setOptions(array('class' => 'submit'));
// attach elements to form
        $this->addElement($username)
                ->addElement($password)
                ->addElement($submit);
    }
    public function loadDefaultDecorators()
    {
        $this->setDecorators(array(
            'FormElements',
            'Fieldset',
            'Form'
        ));
    }

}