CREATE TABLE tbl_fabricas (
    id_fabrica VARCHAR(1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(100),
    latitud DECIMAL(10, 6),
    longitud DECIMAL(10, 6)
);

CREATE TABLE tbl_clasificacion_ppm (
	id_clasificacion INT PRIMARY KEY NOT NULL,
	limite_inferior DECIMAL(10,2) NOT NULL,
	limite_superior DECIMAL(10,2) NOT NULL,
	nombre_clasificacion VARCHAR(100) NOT NULL,
	impacto_salud TEXT
);

CREATE TABLE tbl_linea_produccion(
	id_linea VARCHAR(2) PRIMARY KEY NOT NULL,
	id_fabrica VARCHAR(1) NOT NULL,
	descripcion VARCHAR(100) NOT NULL,
	constraint fk_id_fabrica foreign key (id_fabrica) references tbl_fabricas(id_fabrica)
);

CREATE TABLE tbl_turnos(
	id_turno INT PRIMARY KEY,
	hora_inicio TIME NOT NULL,
	hora_fin TIME NOT NULL
);

CREATE TABLE tbl_empleados(
	id_empleado INT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	cedula VARCHAR(20) NOT NULL,
	cargo VARCHAR(50)
);


CREATE TABLE tbl_empleado_turno(
	id_empleado INT NOT NULL,
	id_turno INT NOT NULL,
	fecha DATE NOT NULL,
	es_supervisor BOOL,
	PRIMARY KEY (id_empleado, id_turno, fecha),
	constraint fk_id_empleado_tbl_empleado foreign key(id_empleado) references tbl_empleados(id_empleado),
	constraint fk_id_turno_tbl_turno foreign key(id_turno) references tbl_turnos(id_turno)
);

CREATE TABLE tbl_productos(
	id_producto INT PRIMARY KEY,
	nombre_producto VARCHAR(100) NOT NULL,
	tipo_quimico VARCHAR(50) NOT NULL	
);

CREATE TABLE tbl_tipos_filtros(
	id_filtro INT PRIMARY KEY,
	nombre_filtro VARCHAR(100) NOT NULL,
	costo_usd DECIMAL(10,2) NOT NULL,
	vida_util_dias INT NOT NULL
);

CREATE TABLE tbl_lecturas(
	id_lectura INT PRIMARY KEY,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	id_sensor VARCHAR(10) NOT NULL,
	id_linea_produccion VARCHAR(2) NOT NULL,
	id_fabrica VARCHAR(1) NOT NULL,
	latitud DECIMAL(10,6) NOT NULL,
	longitud DECIMAL(10,6) NOT NULL,
	ppm DECIMAL(10,2) NOT NULL,
	fecha_hora TIMESTAMP,
	estado_alarma VARCHAR(50) NOT NULL,
	constraint fk_id_linea_tbl_linea foreign key (id_linea_produccion) references tbl_linea_produccion(id_linea),
	constraint fk_id_fabrica_tbl_fabrica foreign key (id_fabrica) references tbl_fabricas(id_fabrica)
);

