<?php
    include_once 'database.php';
    session_start();

    if(isset($_GET['cerrar_sesion'])){
        session_unset();
        session_destroy();

    }

    if(isset($_SESSION['rol'])){
        switch($_SESSION['rol']){
            case 1:
                header('location: admin.php');
            break;
            case 2:
                header('location: almacen.php');
            break;
            case 3:
                header('location: almacen.php');
            break;
            case 4:
                header('location: admin.php');
            break;
            case 5:
                header('location: admin.php');
            break;
            default:
        }
    }

    if(isset($_POST['username']) && isset($_POST['password'])){
        $username = $_POST ['username'];
        $password = $_POST ['password'];

        $db = new Database();
        $query = $db->connect()->prepare('SELECT * FROM usuario WHERE alias = :username AND password = :password');
        $query->execute(['username'=>$username, 'password'=>$password]);

        $row = $query->fetch(PDO::FETCH_NUM);
        
        if($row == true){
            // Validar el rol
            $rol = $row[3];
            $_SESSION['rol'] = $rol;
            switch($_SESSION['rol']){
                case 1:
                    header('location: admin.php');
                break;
                case 2:
                    header('location: almacen.php');
                break;
                case 3:
                    header('location: almacen.php');
                break;
                case 4:
                    header('location: admin.php');
                break;
                case 5:
                    header('location: admin.php');
                break;
                default:
            }
        }else{
            // No existe el usuario
            
            echo "El usuario o contraseña son incorrectos";
        }

    }
?>
<!DOCTYPE html>
<html>
    
<head>
    <title>Web Stock</title>
    <link rel="icon" href="/web-stock/img/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <link rel="stylesheet" href="/web-stock/css/login.css">
</head>


<body>
<!-- Image and text -->
<div class="container-fluid">
<nav class="navbar navbar-light bg-light">
  <a class="navbar-brand" href="/web-stock/index.php">
    <img src="/web-stock/img/logo-gyg.png" alt="Logo" height="30px" width="30" class="d-inline-block align-top" alt="">
    Inicio
  </a>
</nav>
</div>

<div class="container h-100">
		<div class="d-flex justify-content-center h-100">
			<div class="user_card">
				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="/web-stock/img/logo-gyg.png" class="brand_logo" alt="Logo" height="150px" width="150px">
					</div>
				</div>
				<div class="d-flex justify-content-center form_container">
					<form action="#" method="POST">
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="username" class="form-control input_user" value="" placeholder="Nombre de usuario">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="password" class="form-control input_pass" value="" placeholder="Contraseña">
						</div>
						<div class="form-group">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="customControlInline">
								<label class="custom-control-label" for="customControlInline">Recordarme</label>
							</div>
						</div>
							<div class="d-flex justify-content-center mt-3 login_container">
				 	<input type="submit" name="button" class="btn login_btn"></button>
				   </div>
					</form>
				</div>
		
				
			</div>
		</div>
	</div>
</body>
</html>

