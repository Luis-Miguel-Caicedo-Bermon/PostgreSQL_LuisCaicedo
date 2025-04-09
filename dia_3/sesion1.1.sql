create type rol as enum('usuario','admin');

create table credenciales(
	username varchar(100) primary key,
	password text not null,
	user_rol rol not null
);

select * from usuarios;

ALTER TABLE usuarios RENAME COLUMN username TO user_name;
ALTER TABLE credenciales add constraints fk_username foreign key(username) references usuarios(username);

insert into credenciales(username,password,user_rol)
select user_name,'password' as password,'usuario' as rol from usuarios;

select * from credenciales;

create table integrante(
	id serial primary key,
	nombre varchar(30) not null,
	edad smallint not null check(edad>9)
);

alter table integrante add constraints check_edad check(edad>9);

insert into integrante(nombre,edad) values('rafael',11);
insert into integrante(nombre,edad) values('pedrito',8);

select * from integrante;

drop function random_string(largo int);

create function random_string(largo int)
returns text as $$
declare
 	texto text;
begin
	while largo>0 loop
		texto = concat(texto,substring('1234567890qwertyuiopASDFGHJKLÑXCVBNM',round(random() * length('1234567890qwertyuiopASDFGHJKLÑXCVBNM'))::integer,1));
		largo = largo - 1;
	end loop;
	return texto;
end;
$$ language plpgsql;

select random_string(5);

update credenciales set password = random_string(5) where password = 'password';

alter table credenciales add column password_sha bytea null;

update credenciales set password_sha = sha512(password::bytea);

select * from credenciales where sha512('Surpy'::bytea) = password_sha and username = 'machinery11';