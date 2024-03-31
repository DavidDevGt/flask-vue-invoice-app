CREATE DATABASE IF NOT EXISTS sistema_facturacion;
USE sistema_facturacion;

CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255),
    active BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    rol_id INT,
    active BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE permisos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    module_id INT,
    escritura BOOLEAN DEFAULT FALSE,
    lectura BOOLEAN DEFAULT FALSE,
    active BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nit VARCHAR(45) NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(45),
    email VARCHAR(255),
    es_nit BOOLEAN DEFAULT TRUE,
    active BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    forma_de_pago INT DEFAULT 0,
    total DECIMAL(20,2),
    status INT DEFAULT 1,
    observaciones TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pedido_d (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    articulo_id INT NOT NULL,
    cantidad INT,
    precio_unitario DECIMAL(20,2),
    total DECIMAL(20,2),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE facturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dte VARCHAR(255) DEFAULT NULL,
    pedido_id INT NOT NULL,
    cliente_id INT NOT NULL,
    fecha_factura DATE NOT NULL,
    forma_de_pago INT DEFAULT 0,
    total DECIMAL(20,2),
    serie VARCHAR(45),
    numero_factura INT,
    status INT DEFAULT 1,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE factura_d (
    id INT AUTO_INCREMENT PRIMARY KEY,
    factura_id INT NOT NULL,
    articulo_id INT NOT NULL,
    cantidad INT,
    precio_unitario DECIMAL(20,2),
    total DECIMAL(20,2),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE articulos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    active BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE tipos_precio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL, -- Ejemplo: 'Publico', 'Mayorista', 'Super Mayorista'
    descripcion TEXT,
    active BOOLEAN DEFAULT TRUE
);

CREATE TABLE precios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    articulo_id INT NOT NULL,
    tipo_precio_id INT NOT NULL,
    precio DECIMAL(20,2) NOT NULL,
    costo DECIMAL(20,2),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (articulo_id) REFERENCES articulos(id),
    FOREIGN KEY (tipo_precio_id) REFERENCES tipos_precio(id)
);

CREATE TABLE modulos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    link VARCHAR(100),
    orden INT DEFAULT 0,
    padre INT NOT NULL,
    tipo INT NOT NULL,
    active INT DEFAULT 1
);

CREATE TABLE ingresos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT NOT NULL,
    observaciones TEXT,
    active INT DEFAULT 1
);

CREATE TABLE ingresos_d (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ingreso_id INT NOT NULL,
    articulo_id INT NOT NULL,
    cantidad DECIMAL(10,2),
    costo DECIMAL(20,2)
);

CREATE TABLE egresos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT NOT NULL,
    observaciones TEXT,
    active INT DEFAULT 1
);

CREATE TABLE egresos_d (
    id INT AUTO_INCREMENT PRIMARY KEY,
    egreso_id INT NOT NULL,
    articulo_id INT NOT NULL,
    cantidad DECIMAL(10,2),
    costo DECIMAL(20,2)
);

CREATE TABLE movimientos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    articulo_id INT NOT NULL,
    stock INT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE movimientos_d (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    documento_id INT NOT NULL, -- Aqui tiene que ir egreso_id o ingreso_id
    articulo_id INT NOT NULL,
    cantidad INT NOT NULL,
    tipo VARCHAR(45) NOT NULL, -- Ejemplos: 'EGRESO', 'INGRESO', 'AJUSTE INVENTARIO'
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    active INT DEFAULT 1
);

CREATE TABLE subcategorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    active INT DEFAULT 1
);

DELIMITER $$

CREATE PROCEDURE LoginUsuario(IN _email VARCHAR(255), IN _password VARCHAR(255))
BEGIN
    SELECT id, nombre, email, rol_id
    FROM usuarios
    WHERE email = _email AND password = _password AND active = TRUE;
END$$

DELIMITER ;


DELIMITER $$
CREATE PROCEDURE CrearRol(IN _nombre VARCHAR(255), IN _descripcion VARCHAR(255))
BEGIN
    INSERT INTO roles(nombre, descripcion) VALUES (_nombre, _descripcion);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE ActualizarRol(IN _id INT, IN _nombre VARCHAR(255), IN _descripcion VARCHAR(255), IN _active BOOLEAN)
BEGIN
    UPDATE roles SET nombre = _nombre, descripcion = _descripcion, active = _active WHERE id = _id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE EliminarRol(IN _id INT)
BEGIN
    UPDATE roles SET active = FALSE WHERE id = _id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE AsignarPermisoRol(IN _rol_id INT, IN _module_id INT, IN _escritura BOOLEAN, IN _lectura BOOLEAN)
BEGIN
    INSERT INTO permisos(rol_id, module_id, escritura, lectura) VALUES (_rol_id, _module_id, _escritura, _lectura);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE ActualizarPermisoRol(IN _id INT, IN _rol_id INT, IN _module_id INT, IN _escritura BOOLEAN, IN _lectura BOOLEAN, IN _active BOOLEAN)
BEGIN
    UPDATE permisos SET rol_id = _rol_id, module_id = _module_id, escritura = _escritura, lectura = _lectura, active = _active WHERE id = _id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE EliminarPermisoRol(IN _id INT)
BEGIN
    UPDATE permisos SET active = FALSE WHERE id = _id;
END$$
DELIMITER ; 