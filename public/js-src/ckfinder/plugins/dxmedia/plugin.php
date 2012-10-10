<?php
//if (!defined('IN_CKFINDER')) exit;
require_once($_SERVER['DOCUMENT_ROOT'] . '/js-src/ckfinder/core/connector/php/constants.php');
require_once ($_SERVER['DOCUMENT_ROOT'] . '/js-src/ckfinder/core/connector/php/php5/CommandHandler/XmlCommandHandlerBase.php');

class DxInit {
    public $appPath;
    public $modulePath;
    public $registry;
    public $acl;
    public function __construct() {

        $this->appPath = dirname($_SERVER['DOCUMENT_ROOT']);
        $this->modulePath = dirname($_SERVER['DOCUMENT_ROOT']) . '/application/modules';

        require_once('Zend/Config/Ini.php');
        require_once('Zend/Registry.php');
        require_once('Zend/Db/Table/Abstract.php');
        require_once('Zend/Db/Table/Row/Abstract.php');
        require_once('Zend/Db/Table/Rowset/Abstract.php');
        require_once('Zend/Db/Table.php');
        require_once('Zend/Auth.php');
        require_once('Zend/Debug.php');
        /** @see Zend_Controller_Request_Abstract */
        require_once('Zend/Controller/Request/Abstract.php');
        /** @see Zend_Uri */
        require_once('Zend/Uri.php');
        require_once('Zend/Controller/Request/Http.php');
        $this->registry = Zend_Registry::getInstance();
        $this->request = new Zend_Controller_Request_Http();
        /**
         * @see Zend_Session
         */
        require_once 'Zend/Session.php';
        /**
         * @see Zend_Session_Abstract
         */
        require_once 'Zend/Session/Abstract.php';
        require_once('Zend/Session/Namespace.php');

        require_once('Zend/Acl.php');
        require_once($this->modulePath . '/user/acl/Role/Guest.php');
        require_once($this->modulePath . '/user/acl/Role/User.php');
        require_once($this->modulePath . '/user/acl/Role/Mod.php');
        require_once($this->modulePath . '/user/acl/Role/Admin.php');
        require_once($this->modulePath . '/pages/acl/Assert/PageAccess.php');
        require_once($this->modulePath . '/user/acl/Acl.php');

        $this->acl = new User_Acl_Acl();

        $iniBasePath = dirname($_SERVER['DOCUMENT_ROOT']);
        $zConfig = new Zend_Config_Ini($iniBasePath . '/application/configs/application.ini', 'development');
        $db = Zend_Db::factory($zConfig->resources->db);
        //Zend_Debug::dump($uploadedFile ); //<- runs
        Zend_Db_Table_Abstract::setDefaultAdapter($db);

        return $this;
    }
    public function setupModel($moduleName) {

    }
}

class DxDeleteFile extends CKFinder_Connector_CommandHandler_XmlCommandHandlerBase {

    function buildXml() {

    }
    function onBeforeExecuteCommand( &$command )
    {
        $init = new DxInit();
        if ( $command == 'DeleteFile' )
        {
        	require_once('Zend/Filter/BaseName.php');
        	$filter = new Zend_Filter_BaseName();

	        if (!$this->_currentFolder->checkAcl(CKFINDER_CONNECTOR_ACL_FILE_DELETE)) {
	            $this->_errorHandler->throwError(CKFINDER_CONNECTOR_ERROR_UNAUTHORIZED);
	        }
	        if (!isset($_GET["FileName"])) {
	            $this->_errorHandler->throwError(CKFINDER_CONNECTOR_ERROR_INVALID_NAME);
	        }
    		$fileName = CKFinder_Connector_Utils_FileSystem::convertToFilesystemEncoding($_GET["FileName"]);

            if (isset($fileName) && !empty($fileName)) {
                $module = $this->_currentFolder->getResourceTypeName();

                $albumName = $filter->filter($this->_currentFolder->getClientPath());
                if (($count = strlen($albumName)) === 0) {
                	$albumName = $module;
                }
                switch ($module) {
                	case "Pages":
                	    require_once($init->modulePath . '/pages/models/Rowset/Files.php');
                	    require_once($init->modulePath . '/pages/models/PageLookup.php');
                	    require_once($init->modulePath . '/pages/models/Files.php');
                	    require_once($init->modulePath . '/pages/models/Row/File.php');

                	    $model = new Pages_Model_Files();
                	    $row = $model->fetchByFileName($fileName);
                	    if($row instanceof Pages_Model_Row_File) {
                	        $row->delete();
                	    }
                	    break;

                	case "Media":
                	    require_once($init->modulePath . '/media/models/Row/File.php');
                		require_once($init->modulePath . '/media/models/Files.php');
                		$model = new Media_Model_Files();
                		$row = $model->fetchForCKFinderDeleteFile($fileName, $albumName);
                		if($row instanceof Zend_Db_Table_Row_Abstract) {
                			$row->delete();
                		}
                		break;
                		
                	case "Slider":
                			require_once($init->modulePath . '/media/models/Row/File.php');
                			require_once($init->modulePath . '/media/models/Files.php');
                			$model = new Media_Model_Files();
                			$row = $model->fetchForCKFinderDeleteFile($fileName, $albumName);
                			if($row instanceof Zend_Db_Table_Row_Abstract) {
                				$row->delete();
                			}
                			break;
                	default:
                	    $model = null;
                	    $row = null;
                }
            }

        }
        return true ;
    }
}

class DxRenameSave extends CKFinder_Connector_CommandHandler_XmlCommandHandlerBase {

    function buildXml() {

    }
    function onBeforeExecuteCommand( &$command )
    {
        $init = new DxInit();
        if ( $command == 'RenameFile' )
        {

            if (!isset($_GET["fileName"])) {
                $this->_errorHandler->throwError(CKFINDER_CONNECTOR_ERROR_INVALID_NAME);
            }
            if (!isset($_GET["newFileName"])) {
                $this->_errorHandler->throwError(CKFINDER_CONNECTOR_ERROR_INVALID_NAME);
            }
            $_config =& CKFinder_Connector_Core_Factory::getInstance("Core_Config");
            $fileName = CKFinder_Connector_Utils_FileSystem::convertToFilesystemEncoding($_GET["fileName"]);
            $newFileName = CKFinder_Connector_Utils_FileSystem::convertToFilesystemEncoding($_GET["newFileName"]);

            if (isset($_GET["newFileName"]) && isset($_GET["fileName"])) {
	            $module = $this->_currentFolder->getResourceTypeName();

	            switch ($module) {
	            	case "Pages":
	            	    	require_once($init->modulePath . '/pages/models/Files.php');
	            	    	require_once($init->modulePath . '/pages/models/Row/File.php');
	            	    	$model = new Pages_Model_Files();
	            	    	$row = $model->fetchByFileName($fileName);
	            	    	$row->fileName = $newFileName;
	            	    	$row->save();
	            	    	break;
	            	case "Media":
	            	    	require_once($init->modulePath . '/media/models/Row/File.php');
	            	    	require_once($init->modulePath . '/media/models/Files.php');
	            	    	$model = new Media_Model_Files();
	            	    	$row = $model->fetchByFileName($fileName);
	            	    	$row->fileName = $newFileName;
	            	    	$row->save();
	            	    	break;
	            	case "Slider":
	            	    		require_once($init->modulePath . '/media/models/Row/File.php');
	            	    		require_once($init->modulePath . '/media/models/Files.php');
	            	    		$model = new Media_Model_Files();
	            	    		$row = $model->fetchByFileName($fileName);
	            	    		$row->fileName = $newFileName;
	            	    		$row->save();
	            	    		break;
	            	default:
	            	    $model = null;
	            	    $row = null;
	            }
            }

        }
        return true ;
    }
}

class DxUploadSave {

	function onAfterFileUpload($currentFolder, $uploadedFile, $sFilePath)
    {
        global $config;
        $mediaSettings = $config['Plugin_Dxmedia'];
        $result = $this->saveToDb($uploadedFile, $currentFolder);
        return $result;
    }
    function saveToDb ($uploadedFile, $currentFolder = null, $sFilePath = null)
    {
        $init = new DxInit();
        $auth = Zend_Auth::getInstance();

        if($auth->hasIdentity()) {
            $userId = $auth->getIdentity()->userId;
        } 
        require_once('Zend/Filter/BaseName.php');
        $filter = new Zend_Filter_BaseName();
        $module = $currentFolder->getResourceTypeName();
        $i = 0;
        switch ($module) {
        	case "Pages":
        	    	require_once($init->modulePath . '/pages/models/Files.php');
        	    	require_once($init->modulePath . '/pages/models/Row/File.php');
        	    	$model = new Pages_Model_Files();
        	    	$row = $model->fetchNew();
        	    	$ns = new Zend_Session_Namespace(strtolower($module));
        	    	if(!isset($ns->pageId)) {
        	    	    return false;
        	    	}
        	    	foreach($uploadedFile as $fileName) {
        	    		$row->fileName = $fileName;
        	    		$row->pageId = $ns->pageId;
        	    		$row->userId = $userId;
        	    		if($i === 0) {
        	    			$row->isMainImage = 1;
        	    		}
        	    		$save = $row->save();
        	    		if(!$save) {
        	    			return false;
        	    		}
        	    		$i++;
        	    		continue;
        	    	}
        	    break;
        	case "Media":
        			//$ns = new Zend_Session_Namespace(strtolower($module));
        			$albumName = $filter->filter($currentFolder->getClientPath());
        			if (($count = strlen($albumName)) === 0) {
        				$albumName = $module;
        			}
        	    	require_once($init->modulePath . '/media/models/Row/File.php');
        	    	require_once($init->modulePath . '/media/models/Files.php');
        	    	require_once($init->modulePath . '/media/models/Albums.php');
        	    	$album = new Media_Model_Albums();
        	    	$albumId = $album->fetchIdByAlbumName($albumName);
        	    	$model = new Media_Model_Files();
        	    	$row = $model->fetchNew();
        	    	$filename = $uploadedFile['name'];

        	    	foreach($uploadedFile as $k => $v) {
        	    	    $row->fileName = $filename;
        	    	    $row->albumId =  $albumId;
        	    	    $row->description = '';
        	    	    $save = $row->save();
        	    	    if(!$save) {
        	    	        return false;
        	    	    }
        	    	    $i++;
        	    	    continue;
        	    	}
        	    break;
        	case "Slider":
	        		$albumName = $filter->filter($currentFolder->getClientPath());
	        		if (($count = strlen($albumName)) === 0) {
	        			$albumName = $module;
	        		}
	        		require_once($init->modulePath . '/media/models/Row/File.php');
	        		require_once($init->modulePath . '/media/models/Files.php');
	        		require_once($init->modulePath . '/media/models/Albums.php');
	        		$album = new Media_Model_Albums();
	        		$albumId = $album->fetchIdByAlbumName($albumName);
	        		$model = new Media_Model_Files();
	        		$row = $model->fetchNew();
	        		$filename = $uploadedFile['name'];
	        		
	        		foreach($uploadedFile as $k => $v) {
	        			$row->fileName = $filename;
	        			$row->albumId =  $albumId;
	        			$row->description = '';
	        			$save = $row->save();
	        			if(!$save) {
	        				return false;
	        			}
	        			$i++;
	        			continue;
	        		}
        	default:
        	    $model = null;
        	    $row = null;
        	    $album = null;
        }
		return true;
    }
}
class DxCreateAlbum extends CKFinder_Connector_CommandHandler_XmlCommandHandlerBase {
    function buildXml() {

    }
    function onBeforeExecuteCommand( &$command )
    {
        $init = new DxInit();
        if ( $command == 'CreateFolder' )
        {
        	$isChild = false;
        	require_once($init->modulePath . '/media/models/Albums.php');
        	$album = new Media_Model_Albums();
        	$row = $album->fetchNew();
        	$row->userId = Zend_Auth::getInstance()->getIdentity()->userId;
        	// is this the Media album? if so we do not have a parent
        	if($_GET['currentFolder'] === '/' && $_GET['type'] == 'Media') {

        		$parentAlbum = $_GET['type'];
        		$parentId = $album->fetchIdByAlbumName($parentAlbum);
        		$row->albumName = $_GET['NewFolderName'];
        		$row->parentId = $parentId;
        	}
        	elseif(!empty($_GET['currentFolder'])) {
        	    $isChild = true;
        	    $parentAlbum = substr($_GET['currentFolder'], 1, -1);
        	    $parentId = $album->fetchIdByAlbumName($parentAlbum);
        	    $row->albumName = $_GET['NewFolderName'];
        	    $row->parentId = $parentId;
        	}
        	        
                $result = (bool) $row->save();
                return $result;
        }
        
        return true;
    }
}
class DxRenameAlbum extends CKFinder_Connector_CommandHandler_XmlCommandHandlerBase {
    function buildXml() {

    }
    function onBeforeExecuteCommand( &$command )
    {
        $init = new DxInit();
        if ( $command == 'RenameFolder' )
        {

            if(isset($_GET['NewFolderName']) && isset($_GET['currentFolder'])) {
                $oldAlbum = substr($_GET['currentFolder'], 1, -1);
                //Zend_Debug::dump($oldAlbum);
                require_once($init->modulePath . '/media/models/Albums.php');
                $album = new Media_Model_Albums();
                $row = $album->fetchForCkFinderRename($oldAlbum);
				$row->albumName = $_GET['NewFolderName'];
                $row->userId = Zend_Auth::getInstance()->getIdentity()->userId;
                $result = (bool) $row->save();
                return true;
            }
        }
        return true;
    }
}
class DxDeleteAlbum extends CKFinder_Connector_CommandHandler_XmlCommandHandlerBase
{
	function buildXml() {

	}
	function onBeforeExecuteCommand( &$command )
	{
		$init = new DxInit();
		if ( $command == 'DeleteFolder' )
		{
			require_once('Zend/Filter/BaseName.php');
				$filter = new Zend_Filter_BaseName();
				$albumName = $filter->filter($this->_currentFolder->getServerPath());
				require_once($init->modulePath . '/media/models/Albums.php');
				require_once($init->modulePath . '/media/models/Files.php');
				$album = new Media_Model_Albums();
				$row = $album->fetchForCkFinderDelete($albumName);
				if($row instanceof Zend_Db_Table_Row_Abstract) {
					if($init->acl->isAllowed('admin', 'media.albums', 'admin.media.delete') || $row->userId === Zend_Auth::getInstance()->getIdentity()->userId) {

						$fileModel = new Media_Model_Files();
						$files = $fileModel->fetchFilesForCkFinderDeleteAlbum($row->albumId, $albumName = null);
						if(count($files) >= 1 && $files instanceof Zend_Db_Table_Rowset_Abstract) {
							foreach($files as $file) {
								$file->delete();
								continue;
							}
						}
						$result = $row->delete();
						return true;
					} else {
						return false;
					}
				} else {
					return false;
				}
		}
		return true;
	}
}

$dxUploadSave = new DxUploadSave();
$dxRenameSave = new DxRenameSave();
$dxDeleteFile = new DxDeleteFile();
$DxCreateAlbum = new DxCreateAlbum();
$DxRenameAlbum = new DxRenameAlbum();
$DxDeleteAlbum = new DxDeleteAlbum();
//$dxUploadSave->saveToDb(array('something.png', 'movies.png', 'dev.png', 'test.png'));
$config['Hooks']['AfterFileUpload'][] = array($dxUploadSave, 'onAfterFileUpload');
$config['Hooks']['BeforeExecuteCommand'][] = array($dxRenameSave, 'onBeforeExecuteCommand');
$config['Hooks']['BeforeExecuteCommand'][] = array($dxDeleteFile, 'onBeforeExecuteCommand');
$config['Hooks']['BeforeExecuteCommand'][] = array($DxCreateAlbum, 'onBeforeExecuteCommand');
$config['Hooks']['BeforeExecuteCommand'][] = array($DxRenameAlbum, 'onBeforeExecuteCommand');
$config['Hooks']['BeforeExecuteCommand'][] = array($DxDeleteAlbum, 'onBeforeExecuteCommand');
