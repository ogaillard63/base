<?php
// no html, only sql + php
namespace AppModels;
use PDO;

class ContactModel extends Model {

	public function __construct(){
		parent::__construct();
	}	

	public function find($id) {
		$data =  $this->_db->select("SELECT * FROM contacts WHERE id = :id", array(':id' => $id));
		return $data[0];
	}
	public function all() {
		return $this->_db->select("SELECT * FROM contacts ORDER BY id");
	}
	
	public function insert($data){
		$this->_db->insert("contacts", $data);
	}

	public function update($data, $where){
		$this->_db->update("contacts", $data, $where);
	}

	public function delete($id){
		$this->_db->delete("contacts", array('id' => $id));
	}
	
	public function search($query){
		return $this->_db->select("SELECT * FROM contacts 	WHERE firstname LIKE :query 
		OR lastname LIKE :query OR email LIKE :query", array(':query' => '%'.$query.'%'));
	}
}
