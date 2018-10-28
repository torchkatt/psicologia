<?php
require_once 'model/database.php';

$controller = 'cliente';


if(!isset($_REQUEST['c']))
{
    ;
    $controller = ucwords($controller) . 'Controller';
    $controller = new $controller;
    $controller->Index();    
}
else
{
    
    $controller = strtolower($_REQUEST['c']);
    $accion = isset($_REQUEST['a']) ? $_REQUEST['a'] : 'Index';
    
    
    
    $controller = ucwords($controller) . 'Controller';
    $controller = new $controller;
    
   
    call_user_func( array( $controller, $accion ) );
}