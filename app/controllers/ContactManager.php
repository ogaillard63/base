<?php
namespace App;

/**
* @project		base
* @author		Olivier Gaillard
* @version		1.0 du 12/03/2017
* @desc			Gestion des contacts
*/

use PDO;

class ContactManager {
	protected $bdd;

	public function __construct(PDO $bdd) {
		$this->bdd = $bdd;
	}

	/**
	* Retourne l'objet contact correspondant à l'Id
	* @param $id
	*/
	public function getContact($id) {
		$q = $this->bdd->prepare("SELECT * FROM contacts WHERE id = :id");
		$q->bindValue(':id', $id, PDO::PARAM_INT);
		$q->execute();
		return new Contact($q->fetch(PDO::FETCH_ASSOC));
	}

	/**
	* Retourne la liste des contacts
	*/
	public function getContacts($offset = null, $count = null) {
		$contacts = array();
		if (isset($offset) && isset($count)) {
			$q = $this->bdd->prepare('SELECT * FROM contacts ORDER BY id DESC LIMIT :offset, :count');
			$q->bindValue(':offset', $offset, PDO::PARAM_INT);
			$q->bindValue(':count', $count, PDO::PARAM_INT);
		}
		else {
			$q = $this->bdd->prepare('SELECT * FROM contacts ORDER BY id');
		}

		$q->execute();
		while ($data = $q->fetch(PDO::FETCH_ASSOC)) {
			$contacts[] = new Contact($data);
		}
		return $contacts;
	}

	/**
	 * Retourne la liste des contacts par page
	 */
	 public function getContactsByPage($page_num, $count) {
		return $this->getContacts(($page_num-1)*$count, $count);
	 }
	/**
	* Recherche les contacts
	*/
	public function searchContacts($query) {
		$contacts = array();
		$q = $this->bdd->prepare('SELECT * FROM contacts 
			WHERE firstname LIKE :query OR lastname LIKE :query OR email LIKE :query');
		$q->bindValue(':query', '%'.$query.'%', PDO::PARAM_STR);
		$q->execute();
		while ($data = $q->fetch(PDO::FETCH_ASSOC)) {
			$contacts[] = new Contact($data);
		}
		return $contacts;
	}

	/**
	 * Retourne le nombre max de contacts
	 */
	public function getMaxContacts() {
		$q = $this->bdd->prepare('SELECT count(1) FROM contacts');
		$q->execute();
		return intval($q->fetch(PDO::FETCH_COLUMN));
	}

	/**
	* Efface l'objet contact de la bdd
	* @param Contact $contact
	*/
	public function deleteContact(Contact $contact) {
		try {	
			$q = $this->bdd->prepare("DELETE FROM contacts WHERE id = :id");
			$q->bindValue(':id', $contact->getId(), PDO::PARAM_INT);
			return $q->execute();
			}
		catch( PDOException $Exception ) {
			return false;
		}
	}

	/**
	* Enregistre l'objet contact en bdd
	* @param Contact $contact
	*/
	public function saveContact(Contact $contact) {
		if ($contact->getId() == -1) {
			$q = $this->bdd->prepare('INSERT INTO contacts SET firstname = :firstname, lastname = :lastname, email = :email');
		} else {
			$q = $this->bdd->prepare('UPDATE contacts SET firstname = :firstname, lastname = :lastname, email = :email WHERE id = :id');
			$q->bindValue(':id', $contact->getId(), PDO::PARAM_INT);
		}
		$q->bindValue(':firstname', $contact->getFirstname(), PDO::PARAM_STR);
		$q->bindValue(':lastname', $contact->getLastname(), PDO::PARAM_STR);
		$q->bindValue(':email', $contact->getEmail(), PDO::PARAM_STR);


		$q->execute();
		if ($contact->getId() == -1) $contact->setId($this->bdd->lastInsertId());
	}

	/**
	 * Retourne une liste des contacts formatés pour peupler un menu déroulant
	 */
	public function getContactsForSelect() {
		$contacts = array();
		$q = $this->bdd->prepare('SELECT id, name FROM contacts ORDER BY id');
		$q->execute();
		while ($row = $q->fetch(PDO::FETCH_ASSOC)) {
			$contacts[$row["id"]] =  $row["name"];
		}
		return $contacts;
	}
}
?>