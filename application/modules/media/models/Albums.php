<?php

/**
 * Albums
 *
 * @author jsmith
 * @version
 */

require_once 'Zend/Db/Table/Abstract.php';
class Media_Model_Albums extends Zend_Db_Table_Abstract {
	/**
	 * The default table name
	 */
	protected $_name = 'mediaAlbums';
	protected $_primary = 'albumId';
	protected $_sequence = true;

	public function fetchIdByAlbumName($albumName) {
		$query = $this->select()->from($this->_name, array('albumId', 'albumName'))->where('albumName = ?', $albumName);
		$result = $this->fetchRow($query);
		if(isset($result->albumId))
			return $result->albumId;
	}
	public function fetchForCkFinderRename($albumName)
	{
	    $query = $this->select()->from($this->_name, array('albumId', 'albumName', 'userId'))->where('albumName = ?', $albumName);
	    return $this->fetchRow($query);
	}
	public function fetchById($id) {
	    $query = $this->select()->from($this->_name, array('albumId', 'parentId', 'albumName', 'userId', 'role', 'passWord', 'albumDesc'))->where('albumId = ?', $id);
	    return $this->fetchRow($query);
	}
	public function fetchParentByChildName($childName) {
	    $query = $this->select()->from($this->_name, array('albumId', 'parentId', 'albumName'))->where('albumName = ?', $childName);
	    $row = $this->fetchRow($query);
	    return $this->fetchById($row->parentId);
	}
	public function fetchForCkFinderDelete($albumName)
	{
		$query = $this->select()->from($this->_name, array('albumId', 'albumName', 'userId'))->where('albumName = ?', $albumName);
		return $this->fetchRow($query);
	}
	public function fetchAlbumByName($albumName)
	{
		$query = $this->select()->where('albumName = ?', $albumName);
		return $this->fetchRow($query);
	}
	public function fetchPage($perPage = 6, $page)
	{
		$query = $this->select()->where('albumName != ?', 'Pages');
		$paginator = new Zend_Paginator(new Zend_Paginator_Adapter_DbTableSelect($query));
		$paginator->setItemCountPerPage($perPage);
		$paginator->setCurrentPageNumber($page);
		return $paginator;
	}
}