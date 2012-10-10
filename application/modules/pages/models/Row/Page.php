<?php
require_once ('Zend/Db/Table/Row/Abstract.php');
    /**
     * @author Joey Smith
     * @version 0.9.1
     * @package Pages
     */
class Pages_Model_Row_Page extends Zend_Db_Table_Row_Abstract
{
    /**
     * The data for each column in the row (column_name => value).
     * The keys must match the physical names of columns in the
     * table for which this row is defined.
     *
     * @var array
     */
    protected $_data = array();

    /**
     * This is set to a copy of $_data when the data is fetched from
     * a database, specified as a new tuple in the constructor, or
     * when dirty data is posted to the database with save().
     *
     * @var array
     */
    protected $_cleanData = array();

    /**
     * Tracks columns where data has been updated. Allows more specific insert and
     * update operations.
     *
     * @var array
     */
    protected $_modifiedFields = array();

    /**
     * Zend_Db_Table_Abstract parent class or instance.
     *
     * @var Zend_Db_Table_Abstract
     */
    //protected $_table;

    /**
     * Connected is true if we have a reference to a live
     * Zend_Db_Table_Abstract object.
     * This is false after the Rowset has been deserialized.
     *
     * @var boolean
     */
    protected $_connected = true;

    /**
     * A row is marked read only if it contains columns that are not physically represented within
     * the database schema (e.g. evaluated columns/Zend_Db_Expr columns). This can also be passed
     * as a run-time config options as a means of protecting row data.
     *
     * @var boolean
     */
    protected $_readOnly = false;

    /**
     * Name of the class of the Zend_Db_Table_Abstract object.
     *
     * @var string
     */
    protected $_tableClass = 'Pages_Model_Pages';

    /**
     * Primary row key(s).
     *
     * @var array
     */
    protected $_primary = 'pageId';
    private $comments = null;
	private $user = null;
	//protected $keyWords;
	protected $settings;


	/**
	 * @return Model_Row_User
	 */
	public function getUser()
	{
		if (!$this->user) {
			$this->user = $this->findParentRow('User_Model_Users');
		}

		return $this->user;
	}
	/**
	 * @return Model_Rowset_Tags
	 */
	public function getTags()
	{
		if (!$this->comments) {
			$this->comments = $this->findManyToManyRowset(
				'Pages_Model_Comments',	// match table
				'Pages_Model_Lookup');	// join table
		}

		return $this->comments;
	}
	/**
	 * Allows pre-insert logic to be applied to row.
	 * Subclasses may override this method.
	 *
	 * @return void
	 */
	protected function _insert()
	{
	}

	/**
	 * Allows post-insert logic to be applied to row.
	 * Subclasses may override this method.
	 *
	 * @return void
	 */
	protected function _postInsert()
	{
		$lookup = new Pages_Model_PageLookup();
		$row = $lookup->fetchNew();
		$row->setFromArray($this->_data);
		$row->userId = Zend_Auth::getInstance()->getIdentity()->userId;
		$table = $this->getTableClass();
		if(isset($table->parentId))
		{
		    $row->parentId = $table->parentId;
		}
		$row->save();
	}

	/**
	 * Allows pre-update logic to be applied to row.
	 * Subclasses may override this method.
	 *
	 * @return void
	 */
	protected function _update()
	{
	}

	/**
	 * Allows post-update logic to be applied to row.
	 * Subclasses may override this method.
	 *
	 * @return void
	 */
	protected function _postUpdate()
	{
	}

	/**
	 * Allows pre-delete logic to be applied to row.
	 * Subclasses may override this method.
	 *
	 * @return void
	 */
	protected function _delete()
	{
	}

	/**
	 * Allows post-delete logic to be applied to row.
	 * Subclasses may override this method.
	 *
	 * @return void
	 */
	protected function _postDelete()
	{
	}
}
?>