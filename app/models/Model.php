<?php
// no html, only sql + php
namespace AppModels;
use AppCore;

class Model {

	protected $_db;

	public function __construct() {
			$this->_db = new AppCore\Database();
		}

}