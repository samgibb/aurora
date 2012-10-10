<?php
class Pages_Form_CreatePage extends Zend_Dojo_Form
{
    //TODO: Populate the parent page name for editing page
    // May have to remove the dojo element and replace it in the child edit form 
    // so that we can populate the page name, but that will remove the datastore
    public function init() {
        
        $types = new Pages_Model_PageTypes();
        
        $date = new Zend_Date();
        $today = $date->toString('MM/dd/yyyy');

        $this->setMethod('post');

		$name = new Zend_Form_Element_Text('pageName');
		$name->setLabel('Page Name');
		$name->addFilter('StringToLower');
// 		$name->setOptions(array('autocomplete' => false,
// 								'storeId' => 'nameStore',
// 								'storeType' => 'dojo.data.ItemFileReadStore',
// 								'storeParams' => array('url' => "/pages/json/pagenamestore"),
// 								'dijitParams' => array('searchAttr' => 'name')))
// 									->setRequired(true)
// 									->addValidator('NotEmpty', true)
// 									->addFilter('HtmlEntities')
// 									->addFilter('StringToLower')
// 									->addFilter('StringTrim');
		
		$parent = new Zend_Dojo_Form_Element_ComboBox('parent');
		$parent->setLabel('Parent Page Name (Type to search)');
		$parent->setOptions(array('autocomplete' => false,
								  'storeId' => 'nameStore',
								  'storeType' => 'dojo.data.ItemFileReadStore',
									'storeParams' => array('url' => "/pages/json/pagenamestore"),
									'dijitParams' => array('searchAttr' => 'name')))
				->setRequired(false)
				->addValidator('NotEmpty', true)
				->addFilter('HtmlEntities')
				->addFilter('StringToLower')
				->addFilter('StringTrim');
		
		$slider = new Zend_Form_Element_Select('showSlider');
		$slider->setLabel('Enable Image Slider');
		$slider->setMultiOptions(array('0' => 'OFF', '1' => 'ON'));
		
		// File upload
		//$file = new Dxcore_Form_Element_ImageFile('files');
		//$file->setLabel('Upload Image(s) *You must upload atleast 1 image:')
		//The following must be set to a valid writable path
		//->setDestination( $_SERVER['DOCUMENT_ROOT'] . '/modules/pages/page-images/home' );
		
		// Ensure only 1 file
		//$file->addValidator('Count', false, array('min' => 1, 'max' => 3));
		//$file->setMultiFile(3);
		// Limit to 100K
		//$file->addValidator('Size', false, 2097152);
		// Allow only ext's in the list
		//$file->addValidator('Extension', false, 'jpg,png,gif,bmp,tiff');
		// End file upload

        $visibility = new Zend_Dojo_Form_Element_ComboBox('visibility');
        $visibility->setLabel('Page Visibility');
        $visibility->setOptions(array('value' => 'public'));
        $visibility->setMultiOptions(array('public' => 'public', 'private' => 'private'));
        
        $pageType = new Zend_Dojo_Form_Element_ComboBox('pageType');
        $pageType->setLabel('Page Type (Only select this option if this is to be a special page type!)');
        $pageType->setMultiOptions($types->fetchDropDown()->toArray()); 
        
        $role = new Zend_Dojo_Form_Element_ComboBox('role');
        $role->setLabel('Min Access Role (Type to search)');
        $role->setOptions(array('autocomplete' => false,
        						'storeId' => 'roleStore',
        						'storeType' => 'dojo.data.ItemFileReadStore',
        						'storeParams' => array('url' => "/pages/json/rolestore"),
        						'dijitParams' => array('searchAttr' => 'role')))
        								->setRequired(true)
        								->addValidator('NotEmpty', true)
        								->addFilter('StringToLower')
        								->addFilter('StringTrim');
                
        $createdDate = new Zend_Dojo_Form_Element_DateTextBox('createdDate');
        $createdDate->setLabel('Created On Date');
        $createdDate->setRequired(true)
        ->addFilter('StringTrim');
        
        $publishDate = new Zend_Dojo_Form_Element_DateTextBox('publishDate');
        $publishDate->setLabel('Publish Date');
        $publishDate->setOptions(array('value' => $today))
        ->setRequired(true)
        ->addFilter('StringTrim');
        
        $pageText = new Zend_Form_Element_Textarea('pageText');
        $pageText->setLabel('Page Content')
        ->setRequired(true);
        
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setLabel('Submit');
        
        $this->populate(array('createdDate' => $today));
        
        $this->addElement($name)
        	->addElement($parent)
        	->addElement($slider)
        	->addElement($pageType)
        	->addElement($visibility)
        	->addElement($role)
        	->addElement($createdDate)
        	->addElement($pageText)
        	->addElement($submit)
        ;
    }
}