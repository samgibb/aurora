<?php

/**
 * Files
 *
 * @author jsmith
 * @version
 */
class Media_Model_Files extends Zend_Db_Table_Abstract
{

    /**
     * The default table name
     */
    protected $_name = 'mediaFiles';

    protected $_primary = 'fileId';

    protected $_sequence = true;

    public $album;
    
    // protected $_rowClass = 'Media_Model_Row_File';
    public function init ()
    {
        $this->album = new Media_Model_Albums();
    }

    public function fetchToAddDesc ($fileName, $albumName)
    {
        $albumId = $this->album->fetchIdByAlbumName($albumName);
        // Zend_Debug::dump($albumId);
        if (null == $albumId) {
            return null;
        }
        $query = $this->select()
            ->from($this->_name, 
                array(
                        'fileId',
                        'fileName',
                        'albumId',
                        'title',
                        'alt',
                        'description'
                ))
            ->where('fileName = ?', $fileName)
            ->where('albumId = ?', $albumId);
        return $this->fetchRow($query);
    }

    public function fetchByFileName ($fileName)
    {
        $query = $this->select()
            ->from($this->_name, 
                array(
                        'fileId',
                        'fileName',
                        'title',
                        'alt',
                        'description'
                ))
            ->where('fileName = ?', $fileName);
        return $this->fetchRow($query);
    }

    public function fetchForCKFinderDeleteFile ($fileName, $albumName)
    {
        if ($albumName !== null) {
            $albumId = $this->album->fetchIdByAlbumName($albumName);
        }
        $query = $this->select()
            ->from($this->_name, array(
                'fileId',
                'albumId',
                'fileName'
        ))
            ->where('albumId = ?', $albumId)
            ->where('fileName = ?', $fileName);
        return $this->fetchRow($query);
    }

    public function fetchFilesForCkFinderDeleteAlbum ($albumId = null, $albumName = null)
    {
        if ($albumId == null && $albumName !== null) {
            $albumId = $this->album->fetchIdByAlbumName($albumName);
        }
        $query = $this->select()
            ->from($this->_name, array(
                'fileId',
                'albumId',
                'fileName'
        ))
            ->where('albumId = ?', $albumId);
        return $this->fetchAll($query);
    }

    public function fetchPage ($perPage = 6, $page, $albumId)
    {
        $query = $this->select()->where('albumId = ?', $albumId);
        $paginator = new Zend_Paginator(
                new Zend_Paginator_Adapter_DbTableSelect($query));
        $paginator->setItemCountPerPage($perPage);
        $paginator->setCurrentPageNumber($page);
        return $paginator;
    }

    public function fetchAllByAlbumName ($albumName = 'Media')
    {
        if ($albumName !== null) {
            $albumId = $this->album->fetchIdByAlbumName($albumName);
        }
        $query = $this->select()
            ->from($this->_name)
            ->where('albumId = ?', $albumId);
        return $this->fetchAll($query);
    }
}