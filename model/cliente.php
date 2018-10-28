<?php
class cliente
{
	private $pdo;
    public $id_usuario;
    public $nombres;
    public $apellidos;
    public $tipos_identificaciones_id_tipo;
    public $identificacion;
    public $sexo;
    public $correo;
    public $telefono; 
    public $direccion;
    public $fecha_nacimiento;
    public $clave;
    public $eps; 
    public $solicitud;
    public $estado;
    public $roles_id_rol;
    public $create_time;
    public $count;



	public function __CONSTRUCT()
	{
		try
		{
			$this->pdo = Database::StartUp();     
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Listar()
	{
		try
		{
			$result = array();

			$stm = $this->pdo->prepare("SELECT * FROM usuarios WHERE estado  = 1 ");
			$stm->execute();

			return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Obtener($id_usuario)
	{
		try 
		{
			$stm = $this->pdo->prepare("SELECT * FROM usuarios WHERE id_usuario = ?");
			$stm->execute(array($id_usuario));
			return $stm->fetch(PDO::FETCH_OBJ);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Eliminar($id_usuario)
	{
		try 
		{
			$stm = $this->pdo
			            ->prepare("UPDATE usuarios SET estado = 0 WHERE id_usuario = ?");			          

			$stm->execute(array($id_usuario));
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Actualizar(cliente $data)
	{
		try 
		{
			$sql = "UPDATE usuarios SET 
						nombres          = ?, 
						apellidos        = ?,
						tipos_identificaciones_id_tipo  = ?,
						identificacion    = ?,
						sexo           = ?,
                        correo        = ?,
                        telefono        = ?,
						direccion        = ?,
						fecha_nacimiento       = ?,
						clave 		= MD5(?),
						eps         = ?,
						solicitud        = ?,
						estado        = ?			
				    WHERE id_usuario = ?";

			$this->pdo->prepare($sql)
			     ->execute(
				    array(
				    	$data->nombres,
                        $data->apellidos,
                        $data->tipos_identificaciones_id_tipo,
                        $data->identificacion,
                        $data->sexo,
                        $data->correo,
                        $data->telefono, 
                        $data->direccion,
                        $data->fecha_nacimiento,
                        $data->clave,
                        $data->eps, 
                        $data->solicitud,
                        $data->estado,
                        $data->id_usuario
					)
				);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Registrar(cliente $data)
	{
		try 
		{
		$sql = "INSERT INTO usuarios (nombres,apellidos,tipos_identificaciones_id_tipo,identificacion,sexo,correo,telefono,direccion,fecha_nacimiento,clave,eps,solicitud,estado,roles_id_rol) 
		        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, MD5(?), ?, ?, ?, ?)";

		$this->pdo->prepare($sql)
		     ->execute(
				array(
				    	$data->nombres,
                        $data->apellidos,
                        $data->tipos_identificaciones_id_tipo,
                        $data->identificacion,
                        $data->sexo,
                        $data->correo,
                        $data->telefono, 
                        $data->direccion,
                        $data->fecha_nacimiento,
                        $data->clave,
                        $data->eps, 
                        $data->solicitud,
                        $data->estado,
                        $data->roles_id_rol
                   
                )
			);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}
	public function Registrar1(cliente $data)
	{
		try 
		{
		$sql = "INSERT INTO usuarios (nombres,apellidos,tipos_identificaciones_id_tipo,identificacion,sexo,correo,telefono,direccion,fecha_nacimiento,clave,eps,solicitud,estado,roles_id_rol) 
		        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, MD5(?), ?, ?, ?, ?)";

		$this->pdo->prepare($sql)
		     ->execute(
				array(
				    	$data->nombres,
                        $data->apellidos,
                        $data->tipos_identificaciones_id_tipo,
                        $data->identificacion,
                        $data->sexo,
                        $data->correo,
                        $data->telefono, 
                        $data->direccion,
                        $data->fecha_nacimiento,
                        $data->clave,
                        $data->eps, 
                        $data->solicitud,
                        $data->estado,
                        $data->roles_id_rol
                   
                )
			);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}
	public function login($correo){
		
		try 
		{
			$stm = $this->pdo->prepare("SELECT * FROM usuarios WHERE correo = ? ");
			$stm->execute(array($correo));
			return $stm->fetch(PDO::FETCH_OBJ);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}


	


	
}
?>