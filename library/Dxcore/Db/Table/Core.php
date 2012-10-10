<?php
abstract class Dxcore_Db_Table_Core extends Zend_Db_Table_Abstract implements Dxcore_Db_Table_Interface {

	public $view;
	//public $fbData = array('title', 'description', '');
	public $keywords;

	public function init() {
		$settings = Admin_Settings_Settings::getInstance();
		if(isset($settings->seoKeyWords) || !empty($settings->seoKeyWords))
		{
			$this->keywords = explode(',', $settings->seoKeyWords);
			$count = count($this->keywords);
			if($count <= 7) {

			}
		}

	}

	public function setupKeyWords(&$keyWords) {
		$this->getView();

	}
	public function getView() {
		$front = Zend_Controller_Front::getInstance();
		$bootstrap = $front->getParam('bootstrap');
		$this->view = $bootstrap->getResource('view');
	}

}