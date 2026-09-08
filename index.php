<?php
session_start();
include_once 'connection.php';


$select = "SELECT * FROM vehiculos";
$sql_select = $conn->prepare($select);
$sql_select->execute();

$resultadoSelect = $sql_select->fetchAll();

// for (let i = 0; i < array.lenght; i++)
// for ($i = 0; $i < count($array); $i++)

// var_dump($resultadoSelect);
$actualizarVehiculo = [];

if ($_GET) {
    // echo "GET ACTIVADO";
    $id = $_GET['id'];
    // echo $id;


    foreach ($resultadoSelect as $vehiculo) {
        if ($vehiculo['id_vehiculo'] == $id) {
            $actualizarVehiculo['id'] = $id;
            $actualizarVehiculo['marca'] = $vehiculo['marca'];
            $actualizarVehiculo['modelo'] = $vehiculo['modelo'];
            $actualizarVehiculo['tipo'] = $vehiculo['tipo'];
            $actualizarVehiculo['numero_puertas'] = $vehiculo['numero_puertas'];
            $actualizarVehiculo['automatico'] = $vehiculo['automatico'];
            $actualizarVehiculo['plazas'] = $vehiculo['plazas'];
            $actualizarVehiculo['precio_dia'] = $vehiculo['precio_dia'];
            $actualizarVehiculo['stock'] = $vehiculo['stock'];
            break;
        }
    }

    //  var_dump($actualizarVehiculo);

}

?>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>FACILCAR</title>
   <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="css/style.css" />
  <link rel="stylesheet" href="css/panell_lateral.css" />
  <script src="js/panell_lateral.js" defer></script>
 
</head>

    <body>

        <header>
            <h1>FACILCAR</h1>
        </header>

        <div class="layout">

            <!-- Barra lateral -->
            <aside class="barra">

                <button class="boton-panel"
                    data-panel="formulario"
                    data-tooltip="Abrir formulario"
                    data-tooltip-abrir="Abrir formulario"
                    data-tooltip-cerrar="Cerrar formulario">
                    <span class="icono flecha"></span>

                </button>

                <button class="boton-panel"
                    data-panel="nuevo"
                    data-tooltip="Nuevo registro"
                    data-tooltip-abrir="Nuevo registro"
                    data-tooltip-cerrar="Cerrar panel"
                    >

                    <span class="icono mas">+</span>

                </button>

            </aside>

            <!-- Contenedor de paneles -->
            <section class="paneles">

                <div class="panel-lateral <?= isset($_GET['id']) ? 'activo' : '' ?>" id="formulario">

                    <div class="contenido">

                       <?php if (!$_GET) : ?>
     <h2>Formulario para la incorporación de vehículos</h2>
    <form
      action="insertVehiculos.php"
      method="POST"
      class="formInsertVehiculos">
      <div>
        <label for="marca">Marca : </label>
        <input type="text" id="marca" name="marca"/>
      </div>
      <div>
        <label for="modelo">Modelo : </label>
        <input type="text" id="modelo" name="modelo" />
      </div>
      <div class="tipos">
        <div>
          <input type="radio" name="tipo" id="turismo" value="Turismo" checked />
          <label for="turismo"> Turismo</label>
        </div>
        <div>
          <input type="radio" name="tipo" id="moto" value="Moto" />
          <label for="moto"> Moto</label>
        </div>
        <div>
          <input type="radio" name="tipo" id="furgoneta" value="Furgoneta" />
          <label for="furgoneta"> Furgoneta</label>
        </div>
        <div>
          <input type="checkbox" name="automatico" id="automatico"><label for="automatico"> Automático</label>
        </div>
      </div>

      <div class="grid2">
        <label for="puertas">Puertas : </label><input type="number" name="puertas" id="puertas" min="0" max="7">        
      </div>
      <div class="grid2">
        <label for="plazas">Plazas : </label><input type="number" name="plazas" id="plazas" min="2" max="10">
      </div>
      <div class="grid2">
        <label for="precio">Precio : </label><input type="number" name="precio" id="precio" min="0" step="0.01">
      </div>
      <div class="grid2">
        <label for="stock">Stock : </label><input type="number" name="stock" id="stock" min="1">
      </div>


      <div class="botones">
        <button type="submit">Enviar Datos</button>
        <button type="reset" >Borrar Datos</button>
      </div>
      <div>
        <a href="index.php">Cancelar</a>
      </div>
    </form>
    <?php endif ?>


   <?php if ($_GET) : ?> 
     <h2>Formulario para la modificación de vehículos</h2>
    <form
      action="updateVehiculo.php"
      method="POST"
      class="formInsertVehiculos">
      <input type="hidden" id="id" name="id" value="<?= $actualizarVehiculo['id'] ?>"/>
      <div>
        <label for="marca">Marca : </label>
        <input type="text" id="marca" name="marca" value="<?= $actualizarVehiculo['marca'] ?>"/>
      </div>
      <div>
        <label for="modelo">Modelo : </label>
        <input type="text" id="modelo" name="modelo" value="<?= $actualizarVehiculo['modelo'] ?>"/>
      </div>
      <div class="tipos">
        <div>
          <input type="radio" name="tipo" id="turismo" value="Turismo" <?php if ($actualizarVehiculo['tipo'] == "Turismo") {
              echo "checked";
          } ?> />
          <label for="turismo"> Turismo</label>
        </div>
        <div>
          <input type="radio" name="tipo" id="moto" value="Moto" <?php if ($actualizarVehiculo['tipo'] == "Moto") {
              echo "checked";
          } ?>/>
          <label for="moto"> Moto</label>
        </div>
        <div>
          <input type="radio" name="tipo" id="furgoneta" value="Furgoneta" <?php if ($actualizarVehiculo['tipo'] == "Furgoneta") {
              echo "checked";
          } ?> />
          <label for="furgoneta"> Furgoneta</label>
        </div>
        <div>
         <input type="checkbox" name="automatico" id="automatico" <?php if ($actualizarVehiculo['automatico'] == "1") {
             echo "checked";
         } ?>> <label for="automatico">  Automático</label>
        </div>
      </div>

<div class="grid2">
        <label for="puertas">Puertas : </label><input type="number" name="puertas" id="puertas" min="0" max="7" value="<?= $actualizarVehiculo['numero_puertas'] ?>">        
      </div>
      <div class="grid2">
        <label for="plazas">Plazas : </label><input type="number" name="plazas" id="plazas" min="2" max="10" value="<?= $actualizarVehiculo['plazas'] ?>">
      </div>
      <div class="grid2">
        <label for="precio">Precio : </label><input type="number" name="precio" id="precio" min="0" step="0.01" value="<?= $actualizarVehiculo['precio_dia'] ?>">
      </div>
      <div class="grid2">
        <label for="stock">Stock : </label><input type="number" name="stock" id="stock" min="1" value="<?= $actualizarVehiculo['stock'] ?>">
      </div>
      <div class="botones">
        <button type="submit">Enviar Datos</button>
        <button type="reset" >Borrar Datos</button>
      </div>
        <div>
        <a href="index.php">Cancelar</a>
      </div>
    </form>

    <?php endif ?> 

                    </div>

                </div>

                <div class="panel-lateral" id="nuevo">

                    <div class="contenido">

                        <h2>Nuevo elemento</h2>

                        ...

                    </div>

                </div>

            </section>

            <!-- Contenido principal -->
            <main>

                <h2>
                    Nuestros vehículos
                </h2>

                <table>
      <thead>
        <tr>
          <th>Marca</th>
          <th>Modelo</th>
          <th>Tipo</th>
          <th>Puertas</th>
          <th>Automático</th>
          <th>Plazas</th>
          <th>Precio</th>
          <th>Stock</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($resultadoSelect as $vehiculo) : ?>
          <tr> <!-- empieza la fila --> 
                <td><?php echo $vehiculo['marca'] ?></td>
                <td><?= $vehiculo['modelo'] ?></td>
                <td><?= $vehiculo['tipo'] ?></td>
                <td><?= $vehiculo['numero_puertas'] ?></td>
                <td><?= $vehiculo['automatico'] ?></td>
                <td><?= $vehiculo['plazas'] ?></td>
                <td><?= $vehiculo['precio_dia'] ?></td>
                <td><?= $vehiculo['stock'] ?></td>
                <td> <a href="index.php?id=<?php echo $vehiculo['id_vehiculo']; ?>" class="float-right edit"> ✏️ </a></td>
                <td> <a href="delete.php?id=<?php echo $vehiculo['id_vehiculo']; ?>" class="float-right ml-3"> 🗑️ </a></td>
          </tr> <!-- acaba la fila --> 
        <?php endforeach ?>
      </tbody>
    </table>
  </main>

  <?php if (isset($_SESSION['ok'])) : ?>
    <dialog open>
      <p>Vehículo introducido correctamente en la base de datos</p>
      <form method="dialog">
        <button id="botonDialog">Aceptar</button>
      </form>
    </dialog>
    <?php session_destroy() ?>
  <?php endif ?>

  <?php if (isset($_SESSION['delete'])) : ?>
    <dialog open>
      <p>Vehículo borrado correctamente de la base de datos</p>
      <form method="dialog">
        <button id="botonDialog">Aceptar</button>
      </form>
    </dialog>
    <?php session_destroy() ?>
  <?php endif ?>

  <?php if (isset($_SESSION['update'])) : ?>
    <dialog open>
      <p>Vehículo actualizado correctamente en la base de datos</p>
      <form method="dialog">
        <button id="botonDialog">Aceptar</button>
      </form>
    </dialog>
    <?php session_destroy() ?>
  <?php endif ?>

  <?php if (isset($_SESSION['error'])) : ?>
    <dialog open>
      <p>Error en la base de datos</p>
      <form method="dialog">
        <button id="botonDialog">Aceptar</button>
      </form>
    </dialog>
    <?php session_destroy() ?>
  <?php endif ?>


            </main>

        </div>

    </body>



<!-- <body>
  <header>
    <h1>FACILCAR</h1>
  </header>

  <main>
    

    
  <script src="js/app.js"></script>
</body> -->

</html>