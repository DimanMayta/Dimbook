/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100425
 Source Host           : 127.0.0.1:3306
 Source Schema         : bd_dimbook

 Target Server Type    : MySQL
 Target Server Version : 100425
 File Encoding         : 65001

 Date: 10/06/2024 17:32:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for amigos
-- ----------------------------
DROP TABLE IF EXISTS `amigos`;
CREATE TABLE `amigos`  (
  `ID_amigo` int(11) NOT NULL AUTO_INCREMENT,
  `ID_usuario1` int(11) NULL DEFAULT NULL,
  `ID_usuario2` int(11) NULL DEFAULT NULL,
  `estado` enum('pendiente','aceptado','rechazado') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fecha_solicitud` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_amigo`) USING BTREE,
  INDEX `ID_usuario1`(`ID_usuario1`) USING BTREE,
  INDEX `ID_usuario2`(`ID_usuario2`) USING BTREE,
  CONSTRAINT `amigos_ibfk_1` FOREIGN KEY (`ID_usuario1`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `amigos_ibfk_2` FOREIGN KEY (`ID_usuario2`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of amigos
-- ----------------------------

-- ----------------------------
-- Table structure for archivos
-- ----------------------------
DROP TABLE IF EXISTS `archivos`;
CREATE TABLE `archivos`  (
  `ID_archivo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_archivo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ruta_archivo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_entidad_relacionada` int(11) NULL DEFAULT NULL,
  `tipo_entidad_relacionada` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_archivo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of archivos
-- ----------------------------
INSERT INTO `archivos` VALUES (1, 'Archivo1', '/uploads/asd.pdf', 1, '1');
INSERT INTO `archivos` VALUES (2, 'Archivo2', '/uploads/asd.pdf', 2, '2');
INSERT INTO `archivos` VALUES (3, 'Archivo3', '/uploads/asd.pdf', 3, '3');
INSERT INTO `archivos` VALUES (4, 'Archivo4', '/uploads/perfil.pdf', 4, '4');

-- ----------------------------
-- Table structure for asignaciones
-- ----------------------------
DROP TABLE IF EXISTS `asignaciones`;
CREATE TABLE `asignaciones`  (
  `ID_asignacion` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fecha_vencimiento` date NULL DEFAULT NULL,
  `ID_curso` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_asignacion`) USING BTREE,
  INDEX `ID_curso`(`ID_curso`) USING BTREE,
  CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`ID_curso`) REFERENCES `cursos` (`ID_curso`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of asignaciones
-- ----------------------------

-- ----------------------------
-- Table structure for comentarios
-- ----------------------------
DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios`  (
  `ID_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `ID_publicacion` int(11) NULL DEFAULT NULL,
  `ID_usuario` int(11) NULL DEFAULT NULL,
  `contenido` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fecha_comentario` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_comentario`) USING BTREE,
  INDEX `ID_publicacion`(`ID_publicacion`) USING BTREE,
  INDEX `ID_usuario`(`ID_usuario`) USING BTREE,
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`ID_publicacion`) REFERENCES `publicaciones` (`ID_publicacion`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comentarios
-- ----------------------------

-- ----------------------------
-- Table structure for cursos
-- ----------------------------
DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos`  (
  `ID_curso` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `codigo_curso` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_profesor` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_curso`) USING BTREE,
  UNIQUE INDEX `codigo_curso`(`codigo_curso`) USING BTREE,
  INDEX `ID_profesor`(`ID_profesor`) USING BTREE,
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`ID_profesor`) REFERENCES `profesores` (`ID_profesor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cursos
-- ----------------------------
INSERT INTO `cursos` VALUES (1, 'Matematicas', 'Matematica', 'MAT-11', 11);
INSERT INTO `cursos` VALUES (7, 'Lenguaje', 'ParaleloB', 'LEN-11', 12);

-- ----------------------------
-- Table structure for entregas
-- ----------------------------
DROP TABLE IF EXISTS `entregas`;
CREATE TABLE `entregas`  (
  `ID_entrega` int(11) NOT NULL AUTO_INCREMENT,
  `ID_estudiante` int(11) NULL DEFAULT NULL,
  `ID_asignacion` int(11) NULL DEFAULT NULL,
  `fecha_entrega` datetime(0) NULL DEFAULT NULL,
  `archivo_adjunto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_entrega`) USING BTREE,
  INDEX `ID_estudiante`(`ID_estudiante`) USING BTREE,
  INDEX `ID_asignacion`(`ID_asignacion`) USING BTREE,
  CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`ID_estudiante`) REFERENCES `estudiantes` (`ID_estudiante`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `entregas_ibfk_2` FOREIGN KEY (`ID_asignacion`) REFERENCES `asignaciones` (`ID_asignacion`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of entregas
-- ----------------------------

-- ----------------------------
-- Table structure for estudiantes
-- ----------------------------
DROP TABLE IF EXISTS `estudiantes`;
CREATE TABLE `estudiantes`  (
  `ID_estudiante` int(11) NOT NULL AUTO_INCREMENT,
  `ID_usuario` int(11) NULL DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `apellido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codigo_curso` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `correo_electronico` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contraseña` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto_perfil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_estudiante`) USING BTREE,
  UNIQUE INDEX `ID_usuario`(`ID_usuario`) USING BTREE,
  INDEX `codigo_curso`(`codigo_curso`) USING BTREE,
  CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `estudiantes_ibfk_2` FOREIGN KEY (`codigo_curso`) REFERENCES `cursos` (`codigo_curso`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of estudiantes
-- ----------------------------
INSERT INTO `estudiantes` VALUES (1, 37, 'Diman', 'Mayta', 'MAT-11', 'diman@gmail.com', 'Dimancito', '12345', 'uploads\\home-img.png');
INSERT INTO `estudiantes` VALUES (2, 51, 'Mario', 'Aguilar', 'LEN-11', 'mario@gmail.com', 'mario', '123456', 'uploads\\home-img.png');

-- ----------------------------
-- Table structure for mensajes
-- ----------------------------
DROP TABLE IF EXISTS `mensajes`;
CREATE TABLE `mensajes`  (
  `ID_mensaje` int(11) NOT NULL AUTO_INCREMENT,
  `ID_remitente` int(11) NULL DEFAULT NULL,
  `ID_destinatario` int(11) NULL DEFAULT NULL,
  `contenido` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fecha_envio` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_mensaje`) USING BTREE,
  INDEX `ID_remitente`(`ID_remitente`) USING BTREE,
  INDEX `ID_destinatario`(`ID_destinatario`) USING BTREE,
  CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`ID_remitente`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`ID_destinatario`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mensajes
-- ----------------------------

-- ----------------------------
-- Table structure for padres
-- ----------------------------
DROP TABLE IF EXISTS `padres`;
CREATE TABLE `padres`  (
  `ID_padre` int(11) NOT NULL AUTO_INCREMENT,
  `ID_usuario` int(11) NULL DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `apellido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `correo_electronico` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contraseña` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codigo_curso` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nombre_de_estudiante` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto_perfil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_padre`) USING BTREE,
  UNIQUE INDEX `ID_usuario`(`ID_usuario`) USING BTREE,
  INDEX `codigo_curso`(`codigo_curso`) USING BTREE,
  CONSTRAINT `padres_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `padres_ibfk_2` FOREIGN KEY (`codigo_curso`) REFERENCES `cursos` (`codigo_curso`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of padres
-- ----------------------------
INSERT INTO `padres` VALUES (1, 43, 'Franz', 'Mamani', 'juan@gmail.com', NULL, NULL, 'MAT-11', 'Diman Mayta', 'uploads\\LOGO.png');
INSERT INTO `padres` VALUES (2, 44, 'Sebastian', 'Mamani', 'seba@gmail.com', 'Sebastian', '12345', 'MAT-11', 'Maria', 'uploads\\LOGO.png');
INSERT INTO `padres` VALUES (3, 52, 'Adrian', 'Mendez', 'juan@gmail.com', 'Adrian', '123456', 'MAT-11', 'Diman Mayta', 'uploads\\LOGO.png');

-- ----------------------------
-- Table structure for profesores
-- ----------------------------
DROP TABLE IF EXISTS `profesores`;
CREATE TABLE `profesores`  (
  `ID_profesor` int(11) NOT NULL AUTO_INCREMENT,
  `ID_usuario` int(11) NULL DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `apellido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `correo_electronico` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contraseña` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto_perfil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `materias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ubicacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_profesor`) USING BTREE,
  UNIQUE INDEX `ID_usuario`(`ID_usuario`) USING BTREE,
  CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profesores
-- ----------------------------
INSERT INTO `profesores` VALUES (4, NULL, 'Juan', 'mamani', 'mamani@gmail.com', 'juan', '12345', 'fotoperfil', 'ciencis', 'norte');
INSERT INTO `profesores` VALUES (7, 31, 'Maribel', 'Choque', 'admin@gmail.com', 'canaza', '12345', 'uploads\\LOGO.png', NULL, NULL);
INSERT INTO `profesores` VALUES (8, 32, 'German', 'Mayta', 'ger@gmail.com', 'german', '12345', 'uploads\\home-img.png', NULL, NULL);
INSERT INTO `profesores` VALUES (9, 33, 'Hernan', 'Mendez', 'rodri@gmail.com', 'hernan', '12345', 'uploads\\LOGO.png', NULL, NULL);
INSERT INTO `profesores` VALUES (10, 34, 'Marcelo', 'Mayta', 'diman@gmail.com', 'marcelo', '12345', 'uploads\\LOGO.png', 'Historia,Literatura', NULL);
INSERT INTO `profesores` VALUES (11, 35, 'Diman', 'Mayta', 'diman@gmail.com', 'Antonieta', '12345', 'uploads\\LOGO.png', 'Historia,Literatura', 'Maria de los angeles');
INSERT INTO `profesores` VALUES (12, 36, 'Marisol Andrea', 'Mamani', 'diman@gmail.com', 'Marisol', '1234', 'uploads\\LOGO.png', 'Ciencias,Historia', 'Ciudad El Alto');
INSERT INTO `profesores` VALUES (13, 45, 'Carmen', 'Mayta', 'carmen@gmail.com', 'Carmen', '12345', 'uploads\\home-img.png', 'MatemÃ¡ticas,Ciencias', 'Juan Galo Lavalle');
INSERT INTO `profesores` VALUES (14, 46, 'Arnolrd', 'Mayta', 'diman@gmail.com', 'Arnolrd', '1234', 'uploads\\LOGO.png', 'Ciencias,Historia', 'Rio seco');
INSERT INTO `profesores` VALUES (15, 47, 'Freddy', 'Mayta', 'diman@gmail.com', 'Freddy', '12345', 'uploads\\LOGO.png', 'MatemÃ¡ticas,Ciencias', 'Rusia');
INSERT INTO `profesores` VALUES (16, 48, 'Pepito', 'Mayta', 'diman@gmail.com', 'Pepito', '12345', 'uploads\\LOGO.png', 'Ciencias,MÃºsica', 'Los Andes');
INSERT INTO `profesores` VALUES (17, 50, 'Brandon', 'Quispe', 'brandon@gmail.com', 'Brandon', '12345', 'uploads\\LOGO.png', 'MatemÃ¡ticas,Ciencias', 'Republica de rusia');

-- ----------------------------
-- Table structure for publicaciones
-- ----------------------------
DROP TABLE IF EXISTS `publicaciones`;
CREATE TABLE `publicaciones`  (
  `ID_publicacion` int(11) NOT NULL AUTO_INCREMENT,
  `ID_usuario` int(11) NULL DEFAULT NULL,
  `contenido` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fecha_publicacion` datetime(0) NULL DEFAULT NULL,
  `archivo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_publicacion`) USING BTREE,
  INDEX `ID_usuario`(`ID_usuario`) USING BTREE,
  CONSTRAINT `publicaciones_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of publicaciones
-- ----------------------------
INSERT INTO `publicaciones` VALUES (1, 12, 'Hola como estan', '2024-06-24 16:21:08', '/uploads/LOGO.png');

-- ----------------------------
-- Table structure for reacciones
-- ----------------------------
DROP TABLE IF EXISTS `reacciones`;
CREATE TABLE `reacciones`  (
  `ID_reaccion` int(11) NOT NULL AUTO_INCREMENT,
  `ID_publicacion` int(11) NULL DEFAULT NULL,
  `ID_usuario` int(11) NULL DEFAULT NULL,
  `tipo_reaccion` enum('me gusta','me encanta','me divierte','me asombra','me entristece','me enoja') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_reaccion`) USING BTREE,
  INDEX `ID_publicacion`(`ID_publicacion`) USING BTREE,
  INDEX `ID_usuario`(`ID_usuario`) USING BTREE,
  CONSTRAINT `reacciones_ibfk_1` FOREIGN KEY (`ID_publicacion`) REFERENCES `publicaciones` (`ID_publicacion`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reacciones_ibfk_2` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reacciones
-- ----------------------------

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `ID_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contraseña` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipo_usuario` enum('profesor','estudiante','padre') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_usuario`) USING BTREE,
  UNIQUE INDEX `usuario`(`usuario`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (1, 'Andres', '12344', 'profesor');
INSERT INTO `usuarios` VALUES (9, 'mamani', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (11, 'Maria', '1234', 'profesor');
INSERT INTO `usuarios` VALUES (12, 'Jose', '1234', 'profesor');
INSERT INTO `usuarios` VALUES (14, 'marcos', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (15, 'gilberto', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (16, 'adriana', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (17, 'mayta', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (18, 'Rodrigo', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (20, 'Victor', '123456', 'profesor');
INSERT INTO `usuarios` VALUES (21, 'Perez', '12344', 'profesor');
INSERT INTO `usuarios` VALUES (22, 'Dilma', '123455', 'profesor');
INSERT INTO `usuarios` VALUES (23, 'laura', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (24, 'mendez', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (25, 'fernando', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (26, 'Sobrio', '1233445', 'profesor');
INSERT INTO `usuarios` VALUES (28, 'torrez', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (29, 'Alex', '123456', 'profesor');
INSERT INTO `usuarios` VALUES (30, 'Maribel', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (31, 'canaza', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (32, 'german', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (33, 'hernan', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (34, 'marcelo', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (35, 'Antonieta', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (36, 'Marisol', '1234', 'profesor');
INSERT INTO `usuarios` VALUES (37, 'Dimancito', '12345', 'estudiante');
INSERT INTO `usuarios` VALUES (43, 'Franz', '12345', 'padre');
INSERT INTO `usuarios` VALUES (44, 'Sebastian', '12345', 'padre');
INSERT INTO `usuarios` VALUES (45, 'Carmen', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (46, 'Arnolrd', '1234', 'profesor');
INSERT INTO `usuarios` VALUES (47, 'Freddy', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (48, 'Pepito', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (50, 'Brandon', '12345', 'profesor');
INSERT INTO `usuarios` VALUES (51, 'mario', '123456', 'estudiante');
INSERT INTO `usuarios` VALUES (52, 'Adrian', '123456', 'padre');

SET FOREIGN_KEY_CHECKS = 1;
