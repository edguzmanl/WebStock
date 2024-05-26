<?php
    session_start();

    if(!isset($_SESSION['rol'])){
        header('location: index.php');
    }else{
        if($_SESSION['rol'] != 2){
            header('location: index.php');
        }
    }
?>

<!DOCTYPE html>
<html>
    
<head>
    <title>WS-Almacen</title>
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
  <a class="navbar-brand" href="#">
    <img src="/web-stock/img/logo-gyg.png" alt="Logo" height="30px" width="30" class="d-inline-block align-top" alt="">
    Vendedor - Almacen
  </a>
  <ul class="navbar-nav ml-auto">
                
                <li>
                  <a class="btn btn-light btn-outline-light btn-default btn-circle bg-light text-dark collapsed"  style="margin-left: 5px" href="/web-stock/cerrar_sesion.php" >Cerrar Sesión  <i class="fas fa-user"></i></a>
                </li>
              </ul>
</nav>

</body>
</html>
