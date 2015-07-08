-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2015 at 03:50 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nockup_inventario`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjunto`
--

CREATE TABLE IF NOT EXISTS `adjunto` (
  `id_adjunto` int(11) NOT NULL AUTO_INCREMENT,
  `adjunto` text,
  `tipo` text,
  `comentario` text,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_adjunto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `adjunto`
--

INSERT INTO `adjunto` (`id_adjunto`, `adjunto`, `tipo`, `comentario`, `fecha`) VALUES
(1, '[{"name":"front","value":"polo_black_front.png","type":"front"},{"name":"back","value":"polo_black_back.png","type":"back"}]', NULL, 'nada', '2015-07-06 18:50:26'),
(2, '[{"name":"front","value":"polo_black_front.png","type":"front"},{"name":"back","value":"polo_black_back.png","type":"back"}]', NULL, 'todo', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `articulos`
--

CREATE TABLE IF NOT EXISTS `articulos` (
  `id_articulos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `descripcion` text,
  `status_shop` int(11) DEFAULT '0',
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_articulos`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `articulos`
--

INSERT INTO `articulos` (`id_articulos`, `nombre`, `descripcion`, `status_shop`, `fecha`) VALUES
(3, 'camiseta', 'premiun tee', 1, '2015-07-06');

-- --------------------------------------------------------

--
-- Table structure for table `art_adicionales`
--

CREATE TABLE IF NOT EXISTS `art_adicionales` (
  `id_adicionales` int(11) NOT NULL AUTO_INCREMENT,
  `id_articulo` int(11) DEFAULT '0',
  `nombre` varchar(255) DEFAULT '0',
  `costo` double DEFAULT '0',
  PRIMARY KEY (`id_adicionales`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `art_adicionales`
--

INSERT INTO `art_adicionales` (`id_adicionales`, `id_articulo`, `nombre`, `costo`) VALUES
(5, 3, 'sublimado', 10),
(6, 3, 'mariguanado', 2.5);

-- --------------------------------------------------------

--
-- Table structure for table `art_prod`
--

CREATE TABLE IF NOT EXISTS `art_prod` (
  `id_art_prod` int(11) NOT NULL AUTO_INCREMENT,
  `id_articulo` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cant_prod` int(11) DEFAULT NULL,
  `total_prod` double DEFAULT NULL,
  PRIMARY KEY (`id_art_prod`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `art_prod`
--

INSERT INTO `art_prod` (`id_art_prod`, `id_articulo`, `id_producto`, `cant_prod`, `total_prod`) VALUES
(4, 3, 3, 10, 20),
(5, 3, 4, 2, 1),
(6, 3, 5, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `art_variaciones`
--

CREATE TABLE IF NOT EXISTS `art_variaciones` (
  `id_variacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_articulo` int(11) NOT NULL DEFAULT '0',
  `id_adjunto` int(11) DEFAULT '0',
  `id_color` int(11) DEFAULT '0',
  `descripcion` text,
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `tallas` varchar(255) DEFAULT '0',
  `fecha` date DEFAULT '0000-00-00',
  `recargo` double DEFAULT NULL,
  `costo_total` double DEFAULT '0',
  PRIMARY KEY (`id_variacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `art_variaciones`
--

INSERT INTO `art_variaciones` (`id_variacion`, `id_articulo`, `id_adjunto`, `id_color`, `descripcion`, `cantidad`, `tallas`, `fecha`, `recargo`, `costo_total`) VALUES
(1, 3, 1, 1, 'tipo polo', 10, 'xs-L-M', '0000-00-00', NULL, 0),
(2, 3, 2, 1, 'desmangada', 5, 'S-M-L', '0000-00-00', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE IF NOT EXISTS `color` (
  `id_color` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `referencia` text,
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id_color`, `nombre`, `referencia`) VALUES
(1, 'amarillo', '#CCFF66');

-- --------------------------------------------------------

--
-- Table structure for table `compras`
--

CREATE TABLE IF NOT EXISTS `compras` (
  `id_compras` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) NOT NULL DEFAULT '0',
  `precio_total` double DEFAULT '0',
  `ref_factura` varchar(255) DEFAULT NULL,
  `PO` tinytext,
  `id_adjunto` int(11) DEFAULT '0',
  `id_user` int(11) DEFAULT '0',
  `date` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_compras`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='La tabla de las compras para tshirt' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `compras`
--

INSERT INTO `compras` (`id_compras`, `id_proveedor`, `precio_total`, `ref_factura`, `PO`, `id_adjunto`, `id_user`, `date`) VALUES
(1, 1, 20, '3345566', '01', 0, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `contacto`
--

CREATE TABLE IF NOT EXISTS `contacto` (
  `id_contacto` int(11) NOT NULL AUTO_INCREMENT,
  `tel1` text NOT NULL,
  `tel2` text NOT NULL,
  `fax` text NOT NULL,
  `correo` text NOT NULL,
  `nombre` text NOT NULL,
  PRIMARY KEY (`id_contacto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `costo_articulo`
--

CREATE TABLE IF NOT EXISTS `costo_articulo` (
  `id_costo_articulo` int(11) NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT '0',
  `porcentaje` double DEFAULT '0',
  PRIMARY KEY (`id_costo_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `direccion`
--

CREATE TABLE IF NOT EXISTS `direccion` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `dir1` text NOT NULL,
  `dir2` text NOT NULL,
  `ciudad` text NOT NULL,
  `depto` text NOT NULL,
  `local` text NOT NULL,
  PRIMARY KEY (`id_direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `user` text NOT NULL,
  `password` text NOT NULL,
  `status` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `last_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_unidad` int(11) DEFAULT '0',
  `id_color` varchar(255) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `sku` varchar(255) NOT NULL,
  `margen` text,
  `precio` double DEFAULT NULL,
  `precio_est_unidad` double DEFAULT '0',
  `cantidad` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id_producto`, `id_unidad`, `id_color`, `id_compra`, `nombre`, `descripcion`, `sku`, `margen`, `precio`, `precio_est_unidad`, `cantidad`, `date`) VALUES
(3, 1, '1', 1, 'tela', 'tela gris', '0', '10', 20, 0, 10, '0000-00-00 00:00:00'),
(4, 1, '1', 1, 'botones', 'botones negros', '0', '5', NULL, 0.1, NULL, '0000-00-00 00:00:00'),
(5, 1, '1', 1, 'hilo', 'blanco', '0', '2', 1, 0.1, NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `id_direccion` int(11) NOT NULL,
  `id_contacto` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `nivel` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `unidad`
--

CREATE TABLE IF NOT EXISTS `unidad` (
  `id_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL DEFAULT '0',
  `nombres` text NOT NULL,
  `apellidos` text NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
--

CREATE TABLE IF NOT EXISTS `ventas` (
  `id_ventas` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_direccion` int(11) DEFAULT '0',
  `id_contacto` int(11) DEFAULT '0',
  `total_pago` double DEFAULT '0',
  `anticipo` double DEFAULT '0',
  `estado` int(11) DEFAULT '0',
  `referencia_factura` text,
  `fecha_entrega` datetime DEFAULT '0000-00-00 00:00:00',
  `total_articulo` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id_ventas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ventas_articulos`
--

CREATE TABLE IF NOT EXISTS `ventas_articulos` (
  `id_venta_articulos` int(11) NOT NULL AUTO_INCREMENT,
  `id_ventas` int(11) NOT NULL DEFAULT '0',
  `id_articulo` int(11) NOT NULL DEFAULT '0',
  `cantidad_articulo` int(11) NOT NULL DEFAULT '0',
  `id_color` int(11) NOT NULL DEFAULT '0',
  `id_costo_articulo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_venta_articulos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
