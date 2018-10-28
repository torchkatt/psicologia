<?php
require_once 'model/cliente.php';

class clienteController{
    
    private $model;
    
    public function __CONSTRUCT(){
        $this->model = new cliente();
    }
    
    public function Index(){
       
           }
        public function Entrada(){
       
    }
    public function Inicio(){
      
    }
    public function Admin(){
                extract($_REQUEST);
                $cliente = new cliente();

                 if(isset($correo)){
            $cliente = $this->model->login($correo);}

            if($cliente->correo == $correo && $cliente->clave == MD5($clave)){
                switch ($cliente->roles_id_rol){
                case "0":
                     session_start();
                     $_SESSION["autenticado"]= true;
                     $_SESSION["autenticado1"]= false;
                     $_SESSION["autenticado2"]= false;
                     $_SESSION["autenticado3"]= false;
                     $_SESSION["autenticado4"]= false;
                     
                     break;
                case "2":
                     session_start();
                     $_SESSION["autenticado"]= false;
                     $_SESSION["autenticado1"]= true;
                     $_SESSION["autenticado2"]= false;
                     $_SESSION["autenticado3"]= false;
                     $_SESSION["autenticado4"]= false;
                     header("Location: index2.php?usu=$usuario");
                     break;
                case "3":
                     session_start();
                     $_SESSION["autenticado"]= false;
                     $_SESSION["autenticado1"]= false;
                     $_SESSION["autenticado2"]= true;
                     $_SESSION["autenticado3"]= false;
                     $_SESSION["autenticado4"]= false;
                     header("Location: index3.php?usu=$usuario");
                     break;
                case "4":
                     session_start();
                     $_SESSION["autenticado"]= false;
                     $_SESSION["autenticado1"]= false;
                     $_SESSION["autenticado2"]= false;
                     $_SESSION["autenticado3"]= true;
                     $_SESSION["autenticado4"]= false;
                     header("Location: index3.php?usu=$usuario");
                     break; 
                case "5":
                     session_start();
                     $_SESSION["autenticado"]= false;
                     $_SESSION["autenticado1"]= false;
                     $_SESSION["autenticado2"]= false;
                     $_SESSION["autenticado3"]= false;
                     $_SESSION["autenticado4"]= true;
                     header("Location: index3.php?usu=$usuario");
                     break;       
                default:
                
                     break; }
            }
            else{
                
                
            }
            }   
    public function Crud(){
        $cliente = new cliente();
        
        if(isset($_REQUEST['id_usuario'])){
            $cliente = $this->model->Obtener($_REQUEST['id_usuario']);
        }

        
        
    }
        public function Crud1(){
        $cliente = new cliente();  
        
        
    }
        public function Crud2(){
        $cliente = new cliente();  
        
        
    }
    
    public function Guardar(){
        $cliente = new cliente();
        extract($_REQUEST);
        $cliente->id_usuario = $id_usuario;
        $cliente->nombres = $nombres;
        $cliente->apellidos = $apellidos;
        $cliente->tipos_identificaciones_id_tipo = $tipos_identificaciones_id_tipo;
        $cliente->identificacion = $identificacion;
        $cliente->sexo=$sexo;
        $cliente->correo = $correo;  
        $cliente->telefono = $telefono;  
        $cliente->direccion = $direccion;  
        $cliente->fecha_nacimiento = $fecha_nacimiento;
        $cliente->clave=$clave;
        $cliente->eps = $eps;  
        $cliente->solicitud = $solicitud;
        $cliente->estado = $estado; 
        $cliente->roles_id_rol = $roles_id_rol; 
        $cliente->id_usuario > 0 
            ? $this->model->Actualizar($cliente)
            : $this->model->Registrar($cliente);
        
       
    }
     public function Guardar1(){//funcion para el autoregistro
        $cliente = new cliente();
        extract($_REQUEST);
        $cliente->id_usuario = $id_usuario;
        $cliente->nombres = $nombres;
        $cliente->apellidos = $apellidos;
        $cliente->tipos_identificaciones_id_tipo = $tipos_identificaciones_id_tipo;
        $cliente->identificacion = $identificacion;
        $cliente->sexo=$sexo;
        $cliente->correo = $correo;  
        $cliente->telefono = $telefono;  
        $cliente->direccion = $direccion;  
        $cliente->fecha_nacimiento = $fecha_nacimiento;
        $cliente->clave=$clave;
        $cliente->eps = $eps;  
        $cliente->solicitud = $solicitud;
        $cliente->roles_id_rol = $roles_id_rol;
        $cliente->estado = $estado; 

        $cliente->id_usuario > 0 
            ? $this->model->Actualizar($cliente)
            : $this->model->Registrar1($cliente);
        
    }
       
    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['id_usuario']);
        
    }

}