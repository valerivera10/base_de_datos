CREATE DATABASE logistica;
USE logistica;

CREATE TABLE rutas(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    descripcion BIGINT NOT NULL AUTO_INCREMENT,
    sucursal_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_rutas_sucursal_id FOREIGN KEY (sucursal_id) REFERENCES sucursales(id)
);

CREATE TABLE conductores(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE paquetes(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    numero_seguimiento VARCHAR(50) NOT NULL,
    peso DECIMAL(10, 2) NOT NULL,
    dimensiones VARCHAR(50) NOT NULL,
    contenido TEXT NOT NULL,
    valor_declarado DECIMAL(10, 2) NOT NULL,
    tipo_servicio VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE envios(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ruta_id INT NOT NULL,
    cliente_id INT NOT NULL,
    fecha_envio TIMESTAMP NOT NULL,
    destino VARCHAR(200) NOT NULL,
    sucursal_id INT NOT NULL,
    paquete_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_envios_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    CONSTRAINT fk_envios_ruta_id FOREIGN KEY (ruta_id) REFERENCES rutas(id),
    CONSTRAINT fk_envios_paquete_id FOREIGN KEY (paquete_id) REFERENCES paquetes(id),
    CONSTRAINT fk_envios_sucursal_id FOREIGN KEY (sucursal_id) REFERENCES sucursales(id)
);

CREATE TABLE seguimiento(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    paquete_id INT NOT NULL,
    ubicacion VARCHAR(50) NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    estado VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_seguimiento_paquete_id FOREIGN KEY (paquete_id) REFERENCES paquetes(id)
);

CREATE TABLE sucursales(
    id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    ciudad_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_sucursales_ciudad_id FOREIGN KEY (ciudad_id) REFERENCES ciudades(id)
);

CREATE TABLE ciudades(
    id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    pais_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_ciudades_pais_id FOREIGN KEY (pais_id) REFERENCES paises(id)
);

CREATE TABLE conductores_rutas(
    conductor_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ruta_id INT NOT NULL,
    vehiculo_id INT NOT NULL,
    sucursal_id INT NOT NULL,
    PRIMARY KEY (ruta_id),
    CONSTRAINT fk_conductores_rutas_conductor_id FOREIGN KEY (conductor_id) REFERENCES conductores(id),
    CONSTRAINT fk_conductores_rutas_sucursal_id FOREIGN KEY (sucursal_id) REFERENCES sucursales(id),
    CONSTRAINT fk_conductores_rutas_vehiculo_id FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(id),
    CONSTRAINT fk_conductores_rutas_ruta_id FOREIGN KEY (ruta_id) REFERENCES rutas(id)
);

CREATE TABLE telefonos_conductores(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    numero VARCHAR(20) NOT NULL,
    conductor_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_telefonos_conductores_conductor_id FOREIGN KEY (conductor_id) REFERENCES conductores(id)
);

CREATE TABLE paises(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE telefono_clientes(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    numero VARCHAR(20) NOT NULL,
    cliente_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_telefono_clientes_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE clientes(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE auxiliares(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE vehiculos(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL,
    marca VARCHAR(10) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    capacidad_carga DECIMAL(10, 2) NOT NULL,
    sucursal_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_vehiculos_sucursal_id FOREIGN KEY (sucursal_id) REFERENCES sucursales(id)
);

CREATE TABLE ruta_auxiliares(
    ruta_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    auxiliar_id INT NOT NULL,
    PRIMARY KEY (auxiliar_id),
    CONSTRAINT fk_ruta_auxiliares_auxiliar_id FOREIGN KEY (auxiliar_id) REFERENCES auxiliares(id),
    CONSTRAINT fk_ruta_auxiliares_ruta_id FOREIGN KEY (ruta_id) REFERENCES rutas(id)
);
