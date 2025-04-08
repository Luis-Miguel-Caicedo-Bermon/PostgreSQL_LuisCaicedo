create table fabricante(
	codigo serial primary key,
	nombre varchar(100) not null
);

create table producto(
	codigo serial primary key,
	nombre varchar(100)  not null,
	precio numeric  not null,
	codigo_fabricante integer not null,
	constraint fk_fabricante foreign key (codigo_fabricante) references fabricante(codigo)
);