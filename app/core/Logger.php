<?php
namespace AppCore;

class Logger {

  public static function alert($msg, $type = 'success') {
       $_SESSION['alert'] = array ('msg' => $msg, 'type' => $type);
   }

  public static function message($msg) {
  			die($e);
   }
}
