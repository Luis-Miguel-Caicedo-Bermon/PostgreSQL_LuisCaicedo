create table ejemplo(
	id serial primary key,
	nombre varchar(100) not null,
	descripcion text,
	precio numeric(10,2) not null,
	disponible boolean default false,
	fecha_creacion date not null,
	hora_creacion time not null,
	fecha_hora timestamp not null,
	fecha_zona timestamp with time zone,
	duracion interval,
	ip inet,
	mac macaddr,
	punto_geo point,
	datos_json json,
	unico uuid,
	moneda money,
	rangos int4range,
	colores varchar(20) [],
	sexo_seleccionado sexo
);

create type sexo as enum('Masculino','Femenino','Otro');


insert into ejemplo values(
	1, 'adrian', 'descripcion', 10.23, true,
	CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP+'05','1 day','192.168.1.1', '80:00:12:23:10:00',
	'(10,20)', '{"key":"value"}', '8e6d4d0f-0daf-40ee-8980-dc77be0bbd68',
	'15.23', '[10, 20)', array['rojo','verde','azul','amarillo'], 'Masculino'
);

select * from ejemplo;