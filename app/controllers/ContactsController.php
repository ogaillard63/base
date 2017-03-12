<?php
// php, no sql, no html
namespace AppControllers;

use AppModels\ContactModel;
use AppCore\Logger;

class ContactsController extends Controller {
    
    private $_contactModel;
    private $_data = array();

    public function __construct(){
        parent::__construct();

        $this->_contactModel = new ContactModel();
    }

    private function set($key, $value) {
        $this->_data[$key] = $value;    
    }

    public function showAll() {
        $this->set('title', 'Liste des contacts');
        $this->set('contacts', $this->_contactModel->all());
        return $this->_data;
    }

    public function editContact($id) {
        $this->set('title', 'Modifier un contact');
        $this->set('contact', $this->_contactModel->find($id));
        return $this->_data;
    }

    public function addContact() {
        $this->set('title', 'Ajouter un contact');
        $this->set('contact', (object) array('id' => -1));
        return $this->_data;
    }

    public function searchContacts($query) {
        $this->set('title', 'Rechercher des contacts');
        $this->set('query', $query);
        $this->set('contacts', $this->_contactModel->search($query));
        return $this->_data;
    }

    public function saveContact($id) {
        
        $this->set('firstname', $_POST["firstname"]);
        $this->set('lastname', $_POST["lastname"]);
        $this->set('email', $_POST["email"]);
       // var_dump($this->_data);
        if ($id > -1) $this->_contactModel->update($this->_data, array('id' => $id));
        else $this->_contactModel->insert($this->_data);
        // send notification
        Logger::alert("Contact saved !");
        return true;
    }

        public function deleteContact($id) {
         Logger::alert("Contact deleted !");
       return $this->_contactModel->delete($id);
    }
}


?>