<?php

session_start();

require 'vendor/autoload.php';
require('app/core/Config.php');

use AppModels\ContactModel;
use AppControllers\ContactsController;

// Register Smarty as the view class
// Also pass a callback function to configure Smarty on load
Flight::register('view', 'Smarty', array(), function($smarty){
    $smarty->template_dir = './tpl/';
    $smarty->compile_dir = './tpl_cache/';
    $smarty->config_dir = './config/';
    $smarty->cache_dir = './cache/';
    $smarty->debugging = false;
});

Flight::map('render', function($template, $arr = null){
    if (!null == $arr) Flight::view()->assign($arr);
    Flight::view()->assign("content", $template);
    Flight::view()->assign("base_dir" , "/base");
    Flight::view()->display("main.tpl");
});

// Notification
if (!empty($_SESSION['alert'])) {
     Flight::view()->assign('alert', $_SESSION['alert']);
     $_SESSION['alert'] = array();  
}

// Routes

 $ctrl = new ContactsController();
// Contacts
Flight::route('/contacts', function() use($ctrl) {
   Flight::render('contacts/list.tpl', $ctrl->showAll());
});
Flight::route('/contacts/add', function() use($ctrl) {
   Flight::render('contacts/edit.tpl', $ctrl->addContact());
});
Flight::route('/contacts/edit/@id', function($id) use($ctrl) {
   Flight::render('contacts/edit.tpl', $ctrl->editContact($id));
});
Flight::route('POST /contacts/save', function() use($ctrl) {
    $id = Flight::request()->data->id;
    $ctrl->saveContact($id);
    Flight::redirect('/contacts');
});
Flight::route('/contacts/delete/@id', function($id) use($ctrl) {
    $ctrl->deleteContact($id);
    Flight::redirect('/contacts');
});
Flight::route('/contacts/search', function() {
   Flight::render('contacts/search.tpl');
});
Flight::route('POST /contacts/results', function() use($ctrl) {
   $query = Flight::request()->data->query;
   Flight::render('contacts/search.tpl', $ctrl->searchContacts($query));
});

// Routes
Flight::route('/login', function(){
   Flight::view()->assign("base_dir" , "/base");
   Flight::view()->display('login.tpl');
});

Flight::route('/', function(){
   Flight::render('homepage.tpl');
});

// No route match the URL 
Flight::map('notFound', function(){
    Flight::render('404.tpl');
});
Flight::start();
?>