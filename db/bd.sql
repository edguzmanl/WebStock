-- ---------------------------------------------------------------
-- phpMyAdmin SQL Dump
-- Apache 2.4.54
-- MariaDB 10.4.27
-- PHP 8.2.0 (VS16 X86 64bit thread safe) + PEAR
-- phpMyAdmin 5.2.0
-- OpenSSL 1.1.1p
-- ADOdb 518a
-- Mercury Mail Transport System v4.63 (not included in the portable version)
-- FileZilla FTP Server 0.9.41 (not included in the portable version)
-- Webalizer 2.23-04 (not included in the portable version)
-- Strawberry Perl 5.32.1.1 Portable
-- Tomcat 8.5.79
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 1, 2023 at 04:10 PM
-- ------------------------------------------------------------------

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdwstock`

-- --------------------------------------------------------
-- Estructura de tabla para usuarios `Usuario`
-- --------------------------------------------------------

CREATE TABLE `Usuario` (
    `id_usuario` INT(11) NOT NULL , 
    `alias` VARCHAR(50) NOT NULL , 
    `password` VARCHAR(255) NOT NULL , 
    `rol_usuario` INT(11) NOT NULL,
	`nombre` VARCHAR(100),
	`apellido` VARCHAR(100),
	`estado` SMALLINT
    ) ENGINE = InnoDB DEFAULT CHARSET=latin1 COMMENT = 'Tabla usuarios';

--
-- Dumping data for table `Usuario`
--
INSERT INTO `Usuario` (`id_usuario`,`alias`,`password`,`rol_usuario`,`nombre`,`apellido`,`estado`) VALUES 
('101', 'admin','1234','1','Eduardo','Guzman','1'), 
('102', 'gerencia','5678','5','Alirio','Gomez','1'), 
('103', 'ventas','4321','3','Gustavo','Gomez','1'), 
('104', 'contabilidad','8765','4','Rafael','Jimenez','1'), 
('105', 'usuario','9999','2','Usuario','Mostrador','1');



-- --------------------------------------------------------
-- Estructura de tabla para Roles `Rol`
-- --------------------------------------------------------

CREATE TABLE `Rol` (
    `id_rol` INT(5) NOT NULL , 
    `descripcion` VARCHAR(100) NOT NULL 
    ) ENGINE = InnoDB COMMENT = 'Tabla de Roles de usuario';


--
-- Dumping data for table `Rol`
--

INSERT INTO `Rol` (`id_rol`, `descripcion`) VALUES 
('1', 'Administrador'), 
('2', 'Almacen'), 
('3', 'Vendedor'), 
('4', 'Contabilidad'), 
('5', 'Gerencia');

-- --------------------------------------------------------
-- Estructura de tabla para Almacen `Almacen`
-- --------------------------------------------------------

CREATE TABLE `Almacen` (
    `id_almacen` INT(11) NOT NULL , 
	`nit` INT(11) NOT NULL , 
    `nombre` VARCHAR(200) NOT NULL , 
    `direccion` VARCHAR(200), 
	`telefono` VARCHAR(100) NOT NULL , 
	`correo` VARCHAR(100), 
	`contacto` VARCHAR(200) 
    ) ENGINE = InnoDB COMMENT = 'Tabla de datos de Almacenes';

--
-- Dumping data for table `Almacen`
--
INSERT INTO `Almacen` (`id_almacen`,`nit`,`nombre`,`direccion`,`telefono`,`correo`,`contacto`) VALUES 
('1', '999999-3','Almacén Gomez y Gomez Bodega Principal','Av Pedro de heredia, 90A, #241, Cartagena de Indias, Bolívar','3206077120',' ','Alirio Gómez'), 
('2', '999998-3','Almacén Gomez y Gomez Pontezuela','Pontezuela sector el Vivero, Corregimiento de Pontezuela, Bolívar','3206077120',' ','Alirio Gómez'), 
('3', '999997-3','Almacén Gomez y Gomez La castellana','Calle 31, 90A, #241, Cartagena de Indias, Bolívar','3206077120',' ','Alirio Gómez');

-- --------------------------------------------------------
-- Estructura de tabla para Proveedor `Proveedor`
-- --------------------------------------------------------

CREATE TABLE `Proveedor` (
    `id_proveedor` INT(11) NOT NULL , 
	`nit` INT(11) NOT NULL , 
    `nombre` VARCHAR(200) NOT NULL , 
    `descripcion` VARCHAR(200),
	`actividad` VARCHAR(200),
	`direccion` VARCHAR(200), 
	`telefono` VARCHAR(100) NOT NULL , 
	`correo` VARCHAR(100), 
	`contacto` VARCHAR(200),
	`fecha_registro` DATE,
	`estado` INT
    ) ENGINE = InnoDB COMMENT = 'Tabla de datos de Almacenes';

--
-- Dumping data for table `Almacen`
--
INSERT INTO `Proveedor` (`id_proveedor`,`nit`,`nombre`,`descripcion`,`actividad`,`direccion`,`telefono`,`correo`,`contacto`,`fecha_registro`,`estado`) VALUES 
('101',	'8888888','Espumados del Litoral','Espumas y colchones',	'Comercio al por mayor', ' ', '57 601 742 4502',	'servicioalcliente@grupoespumados.com',	' ', '1999/01/15',	1),
('102',	'1888888','Muebles Sampuesanos',	'Muebles y artículos del hogar', 'Comercio al por mayor', ' ', 'Wsp 3013015207','https://es-la.facebook.com/Mueblesbendicion/',	' ', '2005/03/25',	1),
('103',	'2888888','Carpintería la Troncal',	'Muebles y artículos del hogar','Comercio al por mayor', ' ', '321 8074555',	' ', ' ', '2008/06/15',	1),
('104',	'3888888','DAMBIENTES',	'Muebles y artículos del hogar','Comercio al por mayor', ' ', '57 1 7027503, 311 8099655',' ',	'www.dambientes.com',	'2018/06/15',	1),
('105',	'4888888','KIKI DISEÑO Y DECORACIÓN - MUEBLES PARA NIÑOS',	'Muebles y artículos del hogar', 'Comercio al por mayor', ' ', '57 1 6202625,  320 3477943',	'www.mi-kiki.com',	' ', '2020/03/15',	1),
('106',	'5888888','Muebles Mafe - Sampues',	'Muebles y artículos del hogar', 'Comercio al por mayor', ' ', '603 3015645555',	 'https://muebles-mafe-sampues.principalwebsite.com/',	' ', '2016/03/15',	1),
('107',	'6888888','MUEBLERIA LUGEY - SAMPUES',	'Muebles y artículos del hogar', 'Comercio al por mayor', ' ', '603 324 132556',	'https://www.facebook.com/lugeyisabel.hernandezestrada',' ', 	'2017/06/15',	1),
('108',	'7888888','Promoespuma',	'Muebles y artículos del hogar', 'Comercio al por mayor', ' ', '(1) 750 35 85 - 372 44 51',	'promoespuma.tyr@gmail.com',	' ', '2018/05/25',	1),
('109',	'9888888','Los Pinos',	'Muebles y artículos del hogar', 'Comercio al por mayor', ' ', '602 317 3008934',	'gestorsocialmedia@lospinos-sa.com',	' ', '2019/08/15',	1),
('110',	'1288888','Muebles Omar Artesanías en Sampués',	'Muebles y artículos del hogar', 'Comercio al por mayor',' ',  '(604) 3144172472',	'https://es-la.facebook.com/mueblesomarsampues/',' ', 	'2022/01/15',	1),
('111',	'1388888','Tiendas Calypso',	'Muebles y artículos del hogar', 'Comercio al por mayor', ' ', '(601)2473740',	'https://www.tiendascalypso.com/',	' ', '2002/04/01',	1),
('112',	'1488888','Muebles Yakar',	'Muebles y artículos del hogar', 'Comercio al por mayor', ' ','(601)2151565',	'https://www.yakar.com.co/',' ', 	'2014/11/12',	1),
('113',	'1588888','Los Robles',	'Muebles y artículos del hogar', 'Comercio al por mayor', ' ', '(601)7037528',	'https://www.losrobles.com.co',	' ', '2019/01/11',	1),
('114',	'1688888','Muebles & Acabados',	'Muebles y artículos del hogar', 'Comercio al por mayor',' ', '(601)3452709',	'https://www.muebles&acabados.com.co',' ', 	'2020/01/08',	1);


-- --------------------------------------------------------
-- Estructura de tabla para Producto `Producto`
-- --------------------------------------------------------

CREATE TABLE `Producto` (
    `id_producto` INT(11) NOT NULL , 
	`codigo` VARCHAR(100) NOT NULL , 
	`categoria` INT(11) NOT NULL , 
	`proveedor` INT,
    `nombre` VARCHAR(200) NOT NULL , 
    `descripcion` VARCHAR(200),
	`valor_unit` NUMERIC, 
	`unidad` VARCHAR(100) NOT NULL , 
	`cantidad` NUMERIC, 
	`cant_min` NUMERIC, 
	`impuesto` NUMERIC, 
	`descuento` NUMERIC, 
	`estado` INT,
	`detalle` VARCHAR(200),
	`fecha_stock` DATE, 
	`ultima_mod` DATE
    ) ENGINE = InnoDB COMMENT = 'Tabla de datos de Productos';

--
-- Dumping data for table `Producto`
--
INSERT INTO `Producto` (`id_producto`,`codigo`,`categoria`,`proveedor`,`nombre`,`descripcion`,`valor_unit`,`unidad`,`cantidad`, `cant_min`, `impuesto`,	`descuento`,`estado`,`detalle`,`fecha_stock`,`ultima_mod`) VALUES 
('1','999','101','104','Juego de Sala Angelus esquinero',	'tela microfibra	café',	 '2155000','unidad',  	5,	1, '0,19',0,1,' ',	'2015/01/15',	'2015/01/15'),
('2','999','103','108','Sofá sala tres puestos','tela microfibra	rojo','1251000','unidad', 	6,	1, '0,19' ,0, 1,' ',	'2020/08/30',	'2020/08/30'),
('3','888','201','102','Juego de comedor teka 6 puestos','teka natural	natural', '968000', 'unidad',4,	1,'0,19',0,1,' ',	'2018/01/15',	'2018/01/15'),
('4','777','201','102','Juego de comedor teka 4 puestos','teka natural	natural', '645000','unidad',4,	1, '0,19', 0,1,' ','2018/01/15','2018/01/15'),
('5','666','202','102','Mesa de comedor 6 puestos','teka natural	natural','530000','unidad',4,1, '0,19',0,1,' ','2018/01/15','2018/01/15'),
('6','555','202','102','Mesa de comedor 4 puestos','teka natural	natural','418000','unidad',4,1,'0,19',0,1,' ','2018/01/15','2018/01/15'),
('7','444','302','103','Cama doble 140','madera natural	negro','265000','unidad',10,5,'0,19',0,1,' ','2016/05/20','2016/05/20'),
('8','333','305','103','Base cama 140 + colchón 140','madera natural	negro','365000','unidad',10,5,'0,19',0,1,' ','2016/05/20','2016/05/20'),
('9','222','306','103','Base cama 120',	'madera natural	negro','285000','unidad',10,5,'0,19',0,1,' ','2016/05/20','2016/05/20'),
('10','111','307','101','Colchón 120 Barú','espuma azul	beige', '255000','unidad',30,10,'0,19',0,1,' ','2016/05/20','2016/05/20');
-- --------------------------------------------------------
-- Estructura de tabla para Producto `Inventario`
-- --------------------------------------------------------

CREATE TABLE `Inventario` (
    `id_inventario` INT(11) NOT NULL , 
	`tipo` INT NOT NULL , 
	`id_almacen` INT(11) NOT NULL , 
	`id_producto` INT(11) NOT NULL , 
	`cantidad` NUMERIC, 
	`proveedor` INT,
	`valor_unit` NUMERIC, 
	`valor_total` NUMERIC, 
	`impuesto` NUMERIC, 
	`descuento` NUMERIC, 
	`fecha_stock` DATE 
    ) ENGINE = InnoDB COMMENT = 'Tabla de datos de Inventario';

--
-- Dumping data for table `Inventario`
--
INSERT INTO `Inventario` (`id_inventario`,`tipo`,`id_almacen`,`id_producto`,`cantidad`,`proveedor`,`valor_unit`,`valor_total`,`impuesto`,`descuento`,`fecha_stock`) VALUES 
('1','1','1','1','1','104','2155000','2155000',0,0,'2013/01/18'),
('2','1','1','2','1','108','1251000','1251000',0,0,'2014/01/15'),
('3','1','1','3','1','102','968000','968000',0,0,'2015/02/15'),
('4','1','1','4','1','102','968000','968000',0,0,'2018/03/15'),
('5','1','1','5','1','102','968000','968000',0,0,'2018/01/15'),
('6','1','2','1','1','104','2155000','2155000',0,0,'2013/01/15'),
('7','1','2','2','1','108','1251000','1251000',0,0,'2014/01/18'),
('8','1','3','3','1','102','968000','968000',0,0,'2015/02/18');



-- --------------------------------------------------------
-- Estructura de tabla para Categorías de productos `Categoria_Producto`
-- --------------------------------------------------------

CREATE TABLE `Categoria_producto` (
    `id_categoria` INT(11) NOT NULL , 
    `nombre` VARCHAR(200) NOT NULL , 
    `descripcion` VARCHAR(200) NOT NULL , 
    `estado` INT NOT NULL 
    ) ENGINE = InnoDB COMMENT = 'Tabla de películas/series';

--
-- Dumping data for table `Categoria_Producto`
--

INSERT INTO `Categoria_producto` (`id_categoria`,`nombre`,`descripcion`,`estado`) VALUES 
('101',	'Sala	Juegos de Sala',' ',1),
('102',	'Sala	Salas en L',' ',1),
('103',	'Sala	Sofás',' ',1),
('104',	'Sala	Sofá camas',' ',1),
('105',	'Sala	Mecedoras',' ',1),
('201',	'Comedor	Juegos de Comedor',' ',1),
('202',	'Comedor	Mesas de Comedor',' ',1),
('203',	'Comedor	Sillas de Comedor',' ',1),
('204',	'Comedor	Aparador y Muebles Auxiliares',' ',1),
('301',	'Dormitorio	Dormitorios',' ',1),
('302', 'Dormitorio	Camas',' ',1),
('303',	'Dormitorio	Mesas de noche',' ',1),
('304',	'Dormitorio	Cómodas/ aparador',' ',1),
('305',	'Dormitorio	Base cama + colchón',' ',1),
('306',	'Dormitorio	Base cama',' ',1), 
('307',	'Dormitorio	Colchón',' ',1),
('308',	'Dormitorio	Ropa de cama',' ',1),
('401',	'Accesorios	Repisas',' ',1),
('402',	'Accesorios	Espejos',' ',1),
('403',	'Accesorios	Closet',' ',1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `alias` (`alias`);


-- Indexes for table `Rol`
--
ALTER TABLE `Rol`
  ADD PRIMARY KEY (`id_rol`);
  
--
-- Indexes for table `Almacen`
--
ALTER TABLE `Almacen`
  ADD PRIMARY KEY (`id_almacen`);


-- Indexes for table `Proveedor`
--
ALTER TABLE `Proveedor`
  ADD PRIMARY KEY (`id_proveedor`);
  
-- Indexes for table `Producto`
--
ALTER TABLE `Producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `categoria` (`categoria`);

-- Indexes for table `Inventario`
--

ALTER TABLE `Inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `id_almacen` (`id_almacen`),
  ADD KEY `id_producto` (`id_producto`);

-- Indexes for table `Categoria_Producto`
--
ALTER TABLE `Categoria_Producto`
  ADD PRIMARY KEY (`id_categoria`);
  
--
-- AUTO_INCREMENT for table `Rol`
--
ALTER TABLE `Rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- AUTO_INCREMENT for table `Almacen`
--
ALTER TABLE `Almacen`
  MODIFY `id_almacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- AUTO_INCREMENT for table `Producto`
--
ALTER TABLE `Producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

-- AUTO_INCREMENT for table `Inventario`
--
ALTER TABLE `Inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


--
-- Constraints for table `Inventario`
--
ALTER TABLE `Inventario`
  ADD CONSTRAINT `id_almacen` FOREIGN KEY (`id_almacen`) REFERENCES `Almacen` (`id_almacen`),
  ADD CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `Producto` (`id_producto`),
  ADD CONSTRAINT `proveedor` FOREIGN KEY (`proveedor`) REFERENCES `Proveedor` (`id_proveedor`);

--
-- Constraints for table `Producto`
--
ALTER TABLE `Producto`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`categoria`) REFERENCES `Categoria_producto` (`id_categoria`);

--
-- Constraints for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `rol_usuario` FOREIGN KEY (`rol_usuario`) REFERENCES `Rol` (`id_rol`);

