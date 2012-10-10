<?php
/**
 * Roles
 *  
 * @author Joey
 * @version 
 */
require_once 'Zend/Db/Table/Abstract.php';
class User_Model_Roles extends Zend_Db_Table_Abstract
{
    /**
     * The default table name
     */
    protected $_name = 'roles';
    protected $_primary = 'roleId';
    protected $_sequence = true;
    
    public function fetchRoles()
    {
        $query = $this->select()
        ->from($this->_name, array('role'));
        return $this->fetchAll($query);
    }
}
