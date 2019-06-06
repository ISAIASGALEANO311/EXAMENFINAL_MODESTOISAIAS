-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.13-log - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5293
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para sisven
CREATE DATABASE IF NOT EXISTS `sisven` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sisven`;

-- Volcando estructura para tabla sisven.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla sisven.categorias: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `estado`) VALUES
	(1, 'ferreteria', 'del hogar', 1);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Volcando estructura para tabla sisven.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `num_documento` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla sisven.clientes: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id`, `nombre`, `num_documento`, `telefono`, `direccion`, `estado`) VALUES
	(1, 'lulu', '7698', '5487683', 'fghfgkytgk,', 0),
	(2, 'juan', '6587568', '87697609', 'Compañia Aldama Cañada _ Bº San Antonio ', 1),
	(3, 'pedro', '7654321', '0975432567', 'jugua poti', 1),
	(4, 'luis', '5437898', '0291564783', 'barrio yvera', 1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla sisven.detalles
CREATE TABLE IF NOT EXISTS `detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) DEFAULT NULL,
  `venta_id` int(11) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `importe` varchar(45) DEFAULT NULL,
  `estado` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_detalle_idx` (`venta_id`),
  KEY `FK_detalles_productos` (`producto_id`),
  CONSTRAINT `FK_detalles_productos` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_detalle` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla sisven.detalles: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `detalles` DISABLE KEYS */;
INSERT INTO `detalles` (`id`, `producto_id`, `venta_id`, `precio`, `cantidad`, `importe`, `estado`) VALUES
	(6, 2, 12, '55000', '1', '55000', NULL),
	(7, 1, 12, '4000', '1', '4000', NULL),
	(8, 1, 13, '4000', '1', '4000', NULL),
	(9, 2, 13, '55000', '1', '55000', NULL);
/*!40000 ALTER TABLE `detalles` ENABLE KEYS */;

-- Volcando estructura para tabla sisven.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `codigo` int(5) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_categoria_producto_idx` (`categoria_id`),
  CONSTRAINT `fk_categoria_producto` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla sisven.productos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `nombre`, `codigo`, `descripcion`, `precio`, `stock`, `categoria_id`, `estado`) VALUES
	(1, 'javon', 1, 'lavado', '4000', 43, 1, 1),
	(2, 'piston', 12, 'motor', '55000', 7, 1, 1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla sisven.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla sisven.roles: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `nombre`, `descripcion`) VALUES
	(1, 'superadmin', 'comtrol total'),
	(2, 'admin', 'control parcial');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla sisven.tipo_comprobante
CREATE TABLE IF NOT EXISTS `tipo_comprobante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `igv` int(11) DEFAULT NULL,
  `serie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla sisven.tipo_comprobante: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_comprobante` DISABLE KEYS */;
INSERT INTO `tipo_comprobante` (`id`, `nombre`, `cantidad`, `igv`, `serie`) VALUES
	(1, 'factura', 4, 65, 1),
	(2, 'ticket', 5, 2, 2);
/*!40000 ALTER TABLE `tipo_comprobante` ENABLE KEYS */;

-- Volcando estructura para tabla sisven.tipo_documento
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `cantidad` int(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla sisven.tipo_documento: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
INSERT INTO `tipo_documento` (`id`, `nombre`, `cantidad`) VALUES
	(1, 'boleta', 56),
	(2, 'fsactura', 65);
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;

-- Volcando estructura para tabla sisven.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_rol_usuarios_idx` (`rol_id`),
  CONSTRAINT `fk_rol_usuarios` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla sisven.usuarios: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `celular`, `email`, `username`, `password`, `rol_id`, `estado`) VALUES
	(1, 'juan', 'peres', '09867845', 'hlkhlakv', 'user', '12dea96fec20593566ab75692c9949596833adc9', 1, 1),
	(2, 'Macro', 'School', '0985467876', 'depurete@gmail.com', 'chio', 'chio', 1, 1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla sisven.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `subtotal` varchar(45) DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `igv` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `tipo_comprobante_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `num_documento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `num_documento_UNIQUE` (`num_documento`),
  KEY `fk_usuario_venta_idx` (`usuario_id`),
  KEY `fk_cliente_venta_idx` (`cliente_id`),
  KEY `fk_tipo_documento_venta_idx` (`tipo_comprobante_id`),
  CONSTRAINT `FK_ventas_tipo_comprobante` FOREIGN KEY (`tipo_comprobante_id`) REFERENCES `tipo_comprobante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_venta` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_venta` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla sisven.ventas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` (`id`, `fecha`, `subtotal`, `serie`, `igv`, `descuento`, `total`, `tipo_comprobante_id`, `cliente_id`, `usuario_id`, `num_documento`) VALUES
	(12, '2019-03-07', '59000.00', '1', '38350.00', '0.00', '97350.00', 1, 4, 1, '000003'),
	(13, '2019-03-01', '59000.00', '1', '38350.00', '0.00', '97350.00', 1, 3, 1, '000004');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
