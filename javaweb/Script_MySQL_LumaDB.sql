CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE productos ( 
    id_producto INT AUTO_INCREMENT PRIMARY KEY, 
    referencia VARCHAR(50) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL  -- Hasta 99999999.99
);

CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO roles (nombre_rol) VALUES 
('Administrador'),
('Vendedor'),
('Comprador'),
('Inventario'),
('Soporte');

CREATE TABLE comprador (				/*  Solo su perfil y productos  */
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    tipo_documento ENUM('CC', 'TI', 'CE', 'NIT', 'Otro') NOT NULL,
    numero_documento VARCHAR(20) NOT NULL UNIQUE,
    fecha_nacimiento DATE NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE comprador
ADD id_rol INT NOT NULL DEFAULT 3,  
ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);


CREATE TABLE acciones_admin (                 /*	Acceso total	*/
    id_accion INT AUTO_INCREMENT PRIMARY KEY, 
    id_admin INT,
    descripcion TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_admin) REFERENCES comprador(id)
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_comprador INT NOT NULL,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('Pendiente', 'Pagado', 'Enviado', 'Entregado', 'Cancelado') DEFAULT 'Pendiente',
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_comprador) REFERENCES comprador(id)
);

CREATE TABLE productos_pedido (
    id_producto_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE ventas (					/*	Acceso a ventas y productos	*/
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_vendedor INT NOT NULL,
    id_pedido INT NOT NULL,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_vendedor) REFERENCES comprador(id),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

CREATE TABLE inventario (				/*  Gestión de productos  */
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    cantidad_disponible INT NOT NULL,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE tickets_soporte (			/*  Acceso a datos de contacto de compradores, pero no a compras ni finanzas  */
    id_ticket INT AUTO_INCREMENT PRIMARY KEY,
    id_comprador INT NOT NULL,
    asunto VARCHAR(100) NOT NULL,
    mensaje TEXT NOT NULL,
    estado ENUM('Abierto', 'En proceso', 'Cerrado') DEFAULT 'Abierto',
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_comprador) REFERENCES comprador(id)
);

CREATE TABLE respuestas_soporte (
    id_respuesta INT AUTO_INCREMENT PRIMARY KEY,
    id_ticket INT NOT NULL,
    id_soporte INT NOT NULL,
    mensaje TEXT NOT NULL,
    fecha_respuesta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_ticket) REFERENCES tickets_soporte(id_ticket),
    FOREIGN KEY (id_soporte) REFERENCES compradores(id)
);

