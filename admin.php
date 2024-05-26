<?php
   include_once 'database.php';
   session_start();

    if(!isset($_SESSION['rol'])){
        header('location: index.php');
    }else{
        if($_SESSION['rol'] != 1){
            header('location: index.php');
        }
    }

    $db = new Database();
    $query = $db->connect()->prepare('SELECT producto.id_producto, categoria_producto.nombre as nom_cat, producto.nombre, producto.cantidad FROM producto INNER JOIN categoria_producto ON producto.categoria = categoria_producto.id_categoria');
    $query->execute();
    $productos = $query->fetchAll(PDO::FETCH_ASSOC);
?>
<?php
    $db1 = new Database();
    $query1 = $db1->connect()->prepare('SELECT categoria_producto.nombre as label, producto.cantidad as y FROM producto INNER JOIN categoria_producto ON producto.categoria = categoria_producto.id_categoria');
    $query1->execute();
    $productos1 = $query1->fetchAll(PDO::FETCH_ASSOC);
?>




<!DOCTYPE html>
<html>
    
<head>
    <title>WS-Administrador</title>
    <link rel="icon" href="/web-stock/img/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <link rel="stylesheet" href="/web-stock/css/login.css">

    <script>
        window.onload = function() {
 
 var chart = new CanvasJS.Chart("chartContainer", {
     animationEnabled: true,
     title:{
         text: "Tablero de Control de Inventario"
     },
     axisY: {
         title: "Cantidades y Categorías en Inventario",
         includeZero: true,
         prefix: "",
         suffix:  "und"
     },
     data: [{
         type: "bar",
         yValueFormatString: "#,##0und",
         indexLabel: "{y}",
         indexLabelPlacement: "inside",
         indexLabelFontWeight: "bolder",
         indexLabelFontColor: "white",
         dataPoints: <?php echo json_encode($productos1, JSON_NUMERIC_CHECK); ?>
     }]
 });
 chart.render();
        
        }
    </script>

</head>


<body>
<!-- Image and text -->
<div class="container-fluid">
<nav class="navbar navbar-light bg-light">
  <a class="navbar-brand" href="#">
    <img src="/web-stock/img/logo-gyg.png" alt="Logo" height="30px" width="30" class="d-inline-block align-top" alt="">
    Administrador
  </a>
  <ul class="navbar-nav ml-auto">
                
                <li>
                  <a class="btn btn-light btn-outline-light btn-default btn-circle bg-light text-dark collapsed"  style="margin-left: 5px" href="/web-stock/cerrar_sesion.php" >Cerrar Sesión  <i class="fas fa-user"></i></a>
                </li>
              </ul>
</nav>
<p></p>
<div class="container">
  <div class="row">
    <div class="col-6 col-sm-3"><strong>Inventario</strong></div>
    <div class="col-6 col-sm-3"><strong>Entradas</strong></div>
    <div class="col-6 col-sm-3"><strong>Salidas</strong></div>
    <div class="col-6 col-sm-3"><strong>Total Productos</strong></div>
  </div>
</div>
</div>
<p></p>
<table class="table" id="TablaReporte">
  <thead class="thead-dark table-striped" >
    <tr>
      <th scope="col">#</th>
      <th scope="col">Categoria</th>
      <th scope="col">Nombre</th>
      <th scope="col">Cantidad</th>
    </tr>
  </thead>
  <tbody>
    <?php
        foreach($productos as $producto){
    ?>

    <tr>
        <td><?php echo $producto['id_producto']?></td>  
        <td><?php echo $producto['nom_cat']?></td>
        <td><?php echo $producto['nombre']?></td>
        <td><?php echo $producto['cantidad']?></td>
    </tr>
    <?php
        }
    ?>

    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
    <script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>

  </tbody>
</table>

<script>
  $('#TablaReporte').DataTable();
</script>

</body>
</html>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.min.js" integrity="sha512-L0Shl7nXXzIlBSUUPpxrokqq4ojqgZFQczTYlGjzONGTDAcLremjwaWv5A+EDLnxhQzY5xUZPWLOLqYRkY0Cbw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

