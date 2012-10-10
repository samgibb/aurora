<?php
/**
 *
 * @author Joey
 * @version
 */
require_once 'Zend/Loader/PluginLoader.php';
require_once 'Zend/Controller/Action/Helper/Abstract.php';
/**
 * Media Action Helper
 *
 * @uses actionHelper Dxcore_Controller_Action_Helper
 */
class Dxcore_Controller_Action_Helper_Media extends Zend_Controller_Action_Helper_Abstract
{
    public $settings;
    /**
     *
     * @var Zend_Loader_PluginLoader
     */
    public $pluginLoader;
    /**
     * Constructor: initialize plugin loader
     *
     * @return void
     */
    protected $view;

    protected $_request;

    protected $albums;
    protected $files;
    protected $get;
    protected $albumName;
    public $page;
    protected $filter;
    protected $input;
    protected $action;
    protected $data;
    protected $albumCount;
    protected $fileCount;
    protected $template;
    public $albumPath;

    public function preDispatch()
    {
        if (null === ($this->controller = $this->getActionController())) {
            return;
        }

        $this->renderer = $this->controller->getHelper('viewRenderer');

        $this->view = self::getView();
        $this->_request = $this->getRequest();
        $this->_response = $this->getResponse();
        $this->data = new stdClass();
        $this->view->slideShow = false;

        // Only run this once our pageName is set
        if(isset($this->_request->pageName))
        {
            $this->page = new Pages_Service_Page($this->_request->pageName);
            $type = $this->page->getPageType();

            if($type !== 'media') {
                return;
            }
            $this->data->pageName = $this->page->getPageName();

            $tags = new Zend_Filter_StripTags();
            $alpha = new Zend_Validate_Alpha(array('allowwhitespace' => true));
            $digits = new Zend_Filter_Digits();

            $filterRules = array('*' => $tags, 'page' => $digits);
            $validatorRules = array('albumName' => $alpha);

            $page = $this->_request->getQuery('page', 1);
            $page = $tags->filter($page);
            $page = $digits->filter($page);
            if(empty($page) || $page === "") {
            	$page = '1';
            }
            $this->page = $page;

            $action = $this->_request->getQuery('action', 'showAlbums');
            $this->action = $tags->filter($action);

            $subAction = $this->_request->getQuery('subAction', 'showFiles');
            $this->subAction = $tags->filter($subAction);

            $albumCount = $this->_request->getQuery('albumCount', 10);
            $this->albumCount = $tags->filter($albumCount);

            $fileCount = $this->_request->getQuery('fileCount', 6);
            $this->fileCount = $tags->filter($fileCount);

            if($this->_request->isGet()) {
            	$this->input = new Zend_Filter_Input($filterRules, $validatorRules, $this->_request->getQuery());
            	if($this->input->isValid('albumName')) {
            		$this->albumName = $this->input->albumName;
            	} else {
            		$this->albumName = 'Media';
            	}

            } else {
            	$this->albumName = 'Media';
            }

            if($this->albumName === 'Media') {
            	$this->albumPath = '/modules/' . strtolower($this->albumName) . '/images';

            } else {
            	$this->albumPath = '/modules/media/images/' . $this->albumName;
            }
            $this->data->albumName = $this->albumName;
            $this->data->albumPath = $this->albumPath;
            $this->data->page = $this->page;
            $this->data->action = $this->action;
            //Zend_Debug::dump($this->albumPath);

            //Zend_Debug::dump(array('albumName' => $this->albumName, 'page' => $this->page, 'action' => $this->action, 'subAction' => $this->subAction));

            //if(!$this->_request->isXmlHttpRequest()) {
            	$this->buildWidget();
//             } else {
//             	$this->serveSlideShow();
//             }

        }
    }
    public function serveSlideShow() {
        //$this->controller->_helper->layout->disableLayout();
        $layout = $this->controller->getHelper('layout');
        $layout->disableLayout();
        //$this->controller_helper->viewRenderer->setNoRender();
        //$viewRenderer = $this->controller->getHelper('viewRenderer');
        $this->renderer->setNoRender(true);

        // set the path to your images
        //$galleryPath = APPLICATION_PATH . '\public\images';
        $galleryPath = $_SERVER['DOCUMENT_ROOT'] . $this->albumPath;
        // set the URL to your images
        $galleryURL = $this->albumPath . '/';

        // create an array with all filenames found in the directory
        $pictures = array();
        $filehandle = opendir($galleryPath);
        Zend_Debug::dump($filehandle);
        if ($filehandle !== null) {
             while (false !== ($file = readdir($filehandle))) {
                if (($file != '..') && ($file != '.') && !is_dir($file))
                    $pictures[] = $galleryURL . $file;
                }
                //close the file-handle
                closedir($filehandle);
                }

                // create a JSON response
                $this->_response = $autoComplete = $this->controller->getHelper('autoCompleteDojo')->sendAutoCompletion($pictures);
//                $this->_response = $this->_helper->autoCompleteDojo
//                 ->sendAutoCompletion($pictures);

    }
    public function buildWidget()
    {

    	switch ($this->action) {

    		case "showAlbums":
    			// show paginated album view
    			$this->data->paginator = $this->albums->fetchPage($this->albumCount, $this->page);
    			//TODO replace this with value from settings
    			$this->template = 'mediaalbumview-default.' . $this->renderer->getViewSuffix();
    			break;

    		case "showFiles":
    			// show paginated file view
    			$albumId = $this->albums->fetchIdByAlbumName($this->albumName);
    			$this->data->paginator = $this->files->fetchPage($this->fileCount, $this->page, $albumId);
    			//TODO replace this with value from settings
    			$this->template = 'mediafileview-default.' . $this->renderer->getViewSuffix();
    			break;

//     		case "slideShow":
//     			    // show paginated file view
//     			    $albumId = $this->albums->fetchIdByAlbumName($this->albumName);
//     			    $this->data->paginator = $this->files->fetchPage($this->fileCount, $this->page, $albumId);
//     			    //TODO replace this with value from settings
//     			    $this->template = 'slideshow.' . $this->renderer->getViewSuffix();
//     			    $this->view->slideShow = true;
//     			break;

    		default:
    		    // show paginated file view
    		    $albumId = $this->albums->fetchIdByAlbumName($this->albumName);
    		    //$this->data->subAlbums = $this->albums->fetchChildren($this->albumName);
    		    $this->data->paginator = $this->files->fetchPage($this->fileCount, $this->page, $albumId);
    		    //TODO replace this with value from settings
    		    $this->template = 'slideshow.' . $this->renderer->getViewSuffix();
    		    $this->view->slideShow = true;
    	}

        $this->renderWidget("$this->template", $this->data);
    }
    public function renderWidget($template, $data)
    {
		$this->view->media = $this->view->partial("$template", array('data' => $data));
    }
    public function __construct ()
    {
        $this->settings = Admin_Settings_Settings::getInstance();
        $this->settings->mediashowAlbums = 'mediaalbumview-default.phtml';
        $this->settings->mediashowFiles = 'mediafileview-default.phtml';
        $this->albums = new Media_Model_Albums();
        $this->files = new Media_Model_Files();
    }
    public function getView()
    {
        if(null !== $this->view) {
            return $this->view;
        }
        $controller = $this->getActionController();
        $view = $controller->view;
        if(!$view instanceof Zend_View_Abstract) {
            return;
        }
        return $view;
    }
    /**
     * Strategy pattern: call helper as broker method
     */
    public function direct ()
    {
        // TODO Auto-generated 'direct' method
    }
}
