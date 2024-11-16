-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2024 a las 05:19:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reserrestaurante`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cliente` (IN `id` INT, IN `nombre` VARCHAR(50), IN `email` VARCHAR(100), IN `telefono` VARCHAR(50))   BEGIN
    UPDATE clientes 
    SET nombre = nombre, email = email, telefono = telefono 
    WHERE id_cliente = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_mesa` (IN `id` INT, IN `capacidad` INT, IN `ubicacion` VARCHAR(30))   BEGIN
    UPDATE mesas 
    SET capacidad = capacidad, ubicacion = ubicacion 
    WHERE id_mesa = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_platillo` (IN `id` INT, IN `nombre_platillo` VARCHAR(50), IN `precio` DECIMAL(10,2), IN `categoria` VARCHAR(100))   BEGIN
    UPDATE platillos 
    SET nombre_platillo = nombre_platillo, precio = precio, categoria = categoria 
    WHERE id_platillo = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_reservacion` (IN `id` INT, IN `id_mesa` INT, IN `id_cliente` INT, IN `fecha` DATE, IN `hora` TIME, IN `cantidad_personas` INT)   BEGIN
    UPDATE reservaciones 
    SET id_mesa = id_mesa, id_cliente = id_cliente, fecha = fecha, hora = hora, cantidad_personas = cantidad_personas 
    WHERE id_reservacion = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cambiar_estado_tabla` (IN `tabla` VARCHAR(50), IN `nuevo_estado` TINYINT(1))   BEGIN
    SET @sql = CONCAT('UPDATE ', tabla, ' SET estado = ', nuevo_estado);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_cliente` (IN `id` INT)   BEGIN
    UPDATE clientes 
    SET estado = 0 
    WHERE id_cliente = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_mesa` (IN `id` INT)   BEGIN
    UPDATE mesas 
    SET estado = 0 
    WHERE id_mesa = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_platillo` (IN `id` INT)   BEGIN
    UPDATE platillos 
    SET estado = 0 
    WHERE id_platillo = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_reservacion` (IN `id` INT)   BEGIN
    UPDATE reservaciones 
    SET estado = 0 
    WHERE id_reservacion = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_cliente` (IN `nombre` VARCHAR(50), IN `email` VARCHAR(100), IN `telefono` VARCHAR(50))   BEGIN
    INSERT INTO clientes (nombre, email, telefono, estado) 
    VALUES (nombre, email, telefono, 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_mesa` (IN `capacidad` INT, IN `ubicacion` VARCHAR(30))   BEGIN
    INSERT INTO mesas (capacidad, ubicacion, estado) 
    VALUES (capacidad, ubicacion, 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_platillo` (IN `nombre_platillo` VARCHAR(50), IN `precio` DECIMAL(10,2), IN `categoria` VARCHAR(100))   BEGIN
    INSERT INTO platillos (nombre_platillo, precio, categoria, estado) 
    VALUES (nombre_platillo, precio, categoria, 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_reservacion` (IN `id_mesa` INT, IN `id_cliente` INT, IN `fecha` DATE, IN `hora` TIME, IN `cantidad_personas` INT)   BEGIN
    INSERT INTO reservaciones (id_mesa, id_cliente, fecha, hora, cantidad_personas, estado) 
    VALUES (id_mesa, id_cliente, fecha, hora, cantidad_personas, 1);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `email`, `telefono`, `estado`) VALUES
(1, 'Juan P?rez', 'juan.perez@example.com', '123456789', 1),
(2, 'Ana G?mez', 'ana.gomez@example.com', '987654321', 1),
(3, 'Carlos Ruiz', 'carlos.ruiz@example.com', '111222333', 1),
(4, 'Maria Torres', 'maria.torres@example.com', '444555666', 1),
(5, 'Laura Rojas', 'laura.rojas@example.com', '777888999', 1),
(6, 'Jos? Jim?nez', 'jose.jimenez@example.com', '222333444', 1),
(7, 'Luis Mart?nez', 'luis.martinez@example.com', '555666777', 1),
(8, 'Carmen L?pez', 'carmen.lopez@example.com', '888999000', 1),
(9, 'Antonio Rivera', 'antonio.rivera@example.com', '111444777', 1),
(10, 'Gloria Castro', 'gloria.castro@example.com', '333666999', 1),
(11, 'Pedro Dom?nguez', 'pedro.dominguez@example.com', '555888111', 1),
(12, 'Sara Vega', 'sara.vega@example.com', '777111333', 1),
(13, 'Ricardo Gonz?lez', 'ricardo.gonzalez@example.com', '999222555', 1),
(14, 'Diana Herrera', 'diana.herrera@example.com', '123321456', 1),
(15, 'Manuel Sosa', 'manuel.sosa@example.com', '456654789', 1),
(16, 'Claudia Ortega', 'claudia.ortega@example.com', '789987123', 1),
(17, 'Andrea Morales', 'andrea.morales@example.com', '321123456', 1),
(18, 'Victor Acosta', 'victor.acosta@example.com', '654456789', 1),
(19, 'Patricia Medina', 'patricia.medina@example.com', '987789654', 1),
(20, 'Hugo Moreno', 'hugo.moreno@example.com', '111999555', 1),
(21, 'Sandra Fuentes', 'sandra.fuentes@example.com', '222888666', 1),
(22, 'Tom?s Cordero', 'tomas.cordero@example.com', '333555444', 1),
(23, 'Irene Luna', 'irene.luna@example.com', '666444333', 1),
(24, 'Miguel Vargas', 'miguel.vargas@example.com', '444888222', 1),
(25, 'Monica Rivas', 'monica.rivas@example.com', '888555222', 1),
(26, 'Harold Barrera', 'harold.barrera@example.com', '3125908492', 1);

--
-- Disparadores `clientes`
--
DELIMITER $$
CREATE TRIGGER `audit_clientes_insert` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN
    INSERT INTO clientes_audit (id_cliente, nombre, email, teléfono, estado)
    VALUES (NEW.id_cliente, NEW.nombre, "INSERT", NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validate_email_clientes` BEFORE INSERT ON `clientes` FOR EACH ROW BEGIN
    IF NEW.email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,4}$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Formato de correo electrónico inválido';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validate_email_clientes_update` BEFORE UPDATE ON `clientes` FOR EACH ROW BEGIN
    IF NEW.email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,4}$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Formato de correo electrónico inválido';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id_mesa` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `ubicacion` varchar(30) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id_mesa`, `capacidad`, `ubicacion`, `estado`) VALUES
(1, 2, 'Esquina izquierda', 1),
(2, 4, 'Centro del sal?n', 1),
(3, 2, 'Junto a ventana', 1),
(4, 6, 'Terraza', 1),
(5, 4, 'Zona VIP', 1),
(6, 8, 'Terraza', 1),
(7, 2, 'Centro del sal?n', 1),
(8, 4, 'Esquina derecha', 1),
(9, 6, 'Zona VIP', 1),
(10, 2, 'Junto a la barra', 1),
(11, 4, 'Centro del sal?n', 1),
(12, 8, 'Esquina izquierda', 1),
(13, 2, 'Terraza', 1),
(14, 4, 'Centro del sal?n', 1),
(15, 6, 'Esquina derecha', 1),
(16, 2, 'Junto a ventana', 1),
(17, 4, 'Junto a la barra', 1),
(18, 6, 'Centro del sal?n', 1),
(19, 8, 'Zona VIP', 1),
(20, 2, 'Esquina izquierda', 1),
(21, 4, 'Junto a ventana', 1),
(22, 6, 'Centro del sal?n', 1),
(23, 2, 'Zona VIP', 1),
(24, 4, 'Esquina derecha', 1),
(25, 8, 'Junto a ventana', 1);

--
-- Disparadores `mesas`
--
DELIMITER $$
CREATE TRIGGER `audit_mesas_update` AFTER UPDATE ON `mesas` FOR EACH ROW BEGIN
    IF NEW.ubicacion <> OLD.ubicacion THEN
        INSERT INTO mesas (id_mesa, capacidad, ubicacion)
        VALUES (OLD.id_mesa, OLD.ubicacion, NEW.ubicacion, NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_mesas_count_insert` AFTER INSERT ON `mesas` FOR EACH ROW BEGIN
    
    IF (SELECT COUNT(*) FROM statistics) = 0 THEN
        
        INSERT INTO statistics (mesas_count) VALUES (1);
    ELSE
        
        UPDATE statistics SET mesas_count = mesas_count + 1;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platillos`
--

CREATE TABLE `platillos` (
  `id_platillo` int(11) NOT NULL,
  `nombre_platillo` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `platillos`
--

INSERT INTO `platillos` (`id_platillo`, `nombre_platillo`, `precio`, `categoria`, `estado`) VALUES
(1, 'Ensalada C?sar', 5.99, 'Ensaladas', 1),
(2, 'Pizza Margarita', 8.99, 'Pizza', 1),
(3, 'Hamburguesa Cl?sica', 7.49, 'Hamburguesas', 1),
(4, 'Sopa de Tomate', 4.99, 'Sopas', 1),
(5, 'Pasta Alfredo', 9.99, 'Pasta', 1),
(6, 'Tacos de Carne', 6.99, 'Mexicano', 1),
(7, 'Sushi Roll', 10.99, 'Japones', 1),
(8, 'Tarta de Chocolate', 3.99, 'Postres', 1),
(9, 'Filete de Res', 14.99, 'Carne', 1),
(10, 'Pollo a la Parrilla', 11.99, 'Carne', 1),
(11, 'Burrito de Pollo', 6.49, 'Mexicano', 1),
(12, 'Calzone', 8.49, 'Pizza', 1),
(13, 'Brownie', 2.99, 'Postres', 1),
(14, 'Helado de Vainilla', 2.49, 'Postres', 1),
(15, 'Sopa de Verduras', 4.49, 'Sopas', 1),
(16, 'Ensalada Griega', 5.49, 'Ensaladas', 1),
(17, 'Tortilla Espa?ola', 5.99, 'Entradas', 1),
(18, 'Pasta Bolo?esa', 9.49, 'Pasta', 1),
(19, 'Fajitas de Pollo', 7.99, 'Mexicano', 1),
(20, 'Camarones al Ajillo', 12.99, 'Mariscos', 1),
(21, 'Arroz con Pollo', 8.99, 'Platos principales', 1),
(22, 'Pizza de Pepperoni', 9.99, 'Pizza', 1),
(23, 'Lasa?a de Carne', 10.49, 'Pasta', 1),
(24, 'Tarta de Queso', 4.99, 'Postres', 1),
(25, 'S?ndwich Club', 6.49, 'Entradas', 1),
(26, 'Salchipapa', 11.00, 'Mixta', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

CREATE TABLE `reservaciones` (
  `id_reservacion` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `cantidad_personas` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservaciones`
--

INSERT INTO `reservaciones` (`id_reservacion`, `id_mesa`, `id_cliente`, `fecha`, `hora`, `cantidad_personas`, `estado`) VALUES
(1, 1, 5, '2024-11-10', '18:00:00', 2, 1),
(2, 2, 10, '2024-11-11', '19:30:00', 4, 1),
(3, 3, 15, '2024-11-12', '20:00:00', 6, 1),
(4, 4, 20, '2024-11-13', '21:00:00', 3, 1),
(5, 5, 25, '2024-11-14', '18:30:00', 5, 1),
(6, 6, 1, '2024-11-15', '19:00:00', 2, 1),
(7, 7, 6, '2024-11-16', '20:30:00', 4, 1),
(8, 8, 11, '2024-11-17', '18:00:00', 6, 1),
(9, 9, 16, '2024-11-18', '19:30:00', 3, 1),
(10, 10, 21, '2024-11-19', '20:00:00', 4, 1),
(11, 11, 2, '2024-11-20', '21:00:00', 2, 1),
(12, 12, 7, '2024-11-21', '18:30:00', 4, 1),
(13, 13, 12, '2024-11-22', '19:00:00', 5, 1),
(14, 14, 17, '2024-11-23', '20:30:00', 6, 1),
(15, 15, 22, '2024-11-24', '18:00:00', 3, 1),
(16, 16, 3, '2024-11-25', '19:30:00', 2, 1),
(17, 17, 8, '2024-11-26', '20:00:00', 4, 1),
(18, 18, 13, '2024-11-27', '21:00:00', 3, 1),
(19, 19, 18, '2024-11-28', '18:30:00', 6, 1),
(20, 20, 23, '2024-11-29', '19:00:00', 4, 1),
(21, 21, 4, '2024-11-30', '20:30:00', 2, 1),
(22, 22, 9, '2024-12-01', '18:00:00', 4, 1),
(23, 23, 14, '2024-12-02', '19:30:00', 5, 1),
(24, 24, 19, '2024-12-03', '20:00:00', 3, 1),
(25, 25, 24, '2024-12-04', '21:00:00', 4, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id_mesa`);

--
-- Indices de la tabla `platillos`
--
ALTER TABLE `platillos`
  ADD PRIMARY KEY (`id_platillo`);

--
-- Indices de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`id_reservacion`),
  ADD KEY `fk_reservaciones_clientes` (`id_cliente`),
  ADD KEY `fk_reservaciones_mesas` (`id_mesa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id_mesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `platillos`
--
ALTER TABLE `platillos`
  MODIFY `id_platillo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `id_reservacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD CONSTRAINT `fk_reservaciones_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `fk_reservaciones_mesas` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id_mesa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
