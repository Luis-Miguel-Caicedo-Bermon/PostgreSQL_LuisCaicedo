--1. Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;
--2. Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre,precio from producto;
--3. Lista todas las columnas de la tabla producto.
select * from producto;
--4. Lista el nombre de los productos, el precio en euros y el precio en dólares
--estadounidenses (USD).
select nombre, precio*0.91 , precio from producto;
--5. Lista el nombre de los productos, el precio en euros y el precio en dólares
--estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre
--de producto, euros, dólares.
select nombre as nombre_de_producto, precio*0.91 as euros , precio as dolares from producto;
--6. Lista los nombres y los precios de todos los productos de la tabla producto,
--convirtiendo los nombres a mayúscula.
select upper(nombre), precio from producto;
--7. Lista los nombres y los precios de todos los productos de la tabla producto,
--convirtiendo los nombres a minúscula.
select lower(nombre), precio from producto;
--8. Lista el nombre de todos los fabricantes en una columna, y en otra columna
--obtenga en mayúsculas los dos primeros caracteres del nombre del
--fabricante.
select nombre, upper(left(nombre,2)) from fabricante;
--9. Lista los nombres y los precios de todos los productos de la tabla producto,
--redondeando el valor del precio.
select nombre, floor(precio) from producto;
--10. Lista los nombres y los precios de todos los productos de la tabla producto,
--truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre, round(precio) from producto;
--11. Lista el identificador de los fabricantes que tienen productos en la
--tabla producto.
select codigo from fabricante where codigo in (select codigo_fabricante from producto);
--12. Lista el identificador de los fabricantes que tienen productos en la
--tabla producto, eliminando los identificadores que aparecen repetidos.
select distinct codigo_fabricante from producto where codigo_fabricante in (select codigo from fabricante);
--13. Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by 1 asc;
--14. Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre from fabricante order by 1 desc;
--15. Lista los nombres de los productos ordenados en primer lugar por el
--nombre de forma ascendente y en segundo lugar por el precio de forma
--descendente.
select nombre , precio from producto order by 1 asc,2 desc;
--16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;
--17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante.
--La cuarta fila también se debe incluir en la respuesta.
select * from fabricante offset 3 limit 2;
--18. Lista el nombre y el precio del producto más barato. (Utilice solamente las
--cláusulas ORDER BY y LIMIT)
select nombre , precio from producto order by precio asc limit 1;
--19. Lista el nombre y el precio del producto más caro. (Utilice solamente las
--cláusulas ORDER BY y LIMIT)
select nombre , precio from producto order by precio desc limit 1;
--20. Lista el nombre de todos los productos del fabricante cuyo identificador de
--fabricante es igual a 2.
select nombre from producto where codigo_fabricante = 2;
--21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
select nombre from producto where precio<=120;
--22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
select nombre from producto where precio>=400;
--23. Lista el nombre de los productos que no tienen un precio mayor o igual a
--400€.
select nombre from producto where precio<400;
--24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar
--el operador BETWEEN.
select nombre from producto where precio>=80 and precio<=300;
--25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando
--el operador BETWEEN.
select nombre from producto where precio between 60 and 200;
--26. Lista todos los productos que tengan un precio mayor que 200€ y que el
--identificador de fabricante sea igual a 6.
select * from producto where precio>200 and codigo_fabricante = 6;
--27. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5.
--Sin utilizar el operador IN.
select * from producto where codigo_fabricante = 1 or codigo_fabricante = 3 or codigo_fabricante = 5;
--28. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5.
--Utilizando el operador IN.
select * from producto where codigo_fabricante in(1,3,5);
--29. Lista el nombre y el precio de los productos en céntimos (Habrá que
--multiplicar por 100 el valor del precio). Cree un alias para la columna que
--contiene el precio que se llame céntimos.
select nombre , precio*100 from producto;
--30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre from fabricante where left(nombre,1) = 'S';
--31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre from fabricante where right(nombre,1) = 'e';
--32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre from fabricante where nombre ~'w';
--33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre from fabricante where length(nombre) = 4;
--34. Devuelve una lista con el nombre de todos los productos que contienen la
--cadena Portátil en el nombre.
select nombre from producto where nombre ~'Portátil';
--35. Devuelve una lista con el nombre de todos los productos que contienen la
--cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select nombre from producto where nombre ~'Monitor' and precio<215;
--36. Lista el nombre y el precio de todos los productos que tengan un precio
--mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en
--orden descendente) y en segundo lugar por el nombre (en orden
--ascendente).
select nombre , precio from producto where precio>=180 order by 2 desc , 1 asc;




--1. Devuelve una lista con el nombre del producto, precio y nombre de
--fabricante de todos los productos de la base de datos.
select p.nombre as nombre_producto , precio , f.nombre as nombre_fabricante from producto p inner join fabricante f on p.codigo_fabricante = f.codigo;
--2. Devuelve una lista con el nombre del producto, precio y nombre de
--fabricante de todos los productos de la base de datos. Ordene el resultado
--por el nombre del fabricante, por orden alfabético.
select p.nombre as nombre_producto , precio , f.nombre as nombre_fabricante from producto p inner join fabricante f on p.codigo_fabricante = f.codigo order by 3 asc;
--3. Devuelve una lista con el identificador del producto, nombre del producto,
--identificador del fabricante y nombre del fabricante, de todos los productos
--de la base de datos.
select p.codigo as codigo_producto , p.nombre as nombre_producto , f.codigo as codigo_fabricante , f.nombre as nombre_fabricante
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo;
--4. Devuelve el nombre del producto, su precio y el nombre de su fabricante,
--del producto más barato.
select p.nombre as nombre_producto , p.precio as precio_producto , f.nombre as nombre_fabricante
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
order by p.precio asc limit 1;
--5. Devuelve el nombre del producto, su precio y el nombre de su fabricante,
--del producto más caro.
select p.nombre as nombre_producto , p.precio as precio_producto , f.nombre as nombre_fabricante
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
order by p.precio desc limit 1;
--6. Devuelve una lista de todos los productos del fabricante Lenovo.
select p.nombre from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'Lenovo';
--7. Devuelve una lista de todos los productos del fabricante Crucial que tengan
--un precio mayor que 200€.
select p.nombre from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'Crucial' and p.precio>200;
--8. Devuelve un listado con todos los productos de los
--fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
select p.nombre from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'Asus' or f.nombre = 'Hewlett-Packard' or f.nombre = 'Seagate';
--9. Devuelve un listado con todos los productos de los
--fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
select p.nombre from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre in ('Asus','Hewlett-Packard','Seagate');
--10. Devuelve un listado con el nombre y el precio de todos los productos de los
--fabricantes cuyo nombre termine por la vocal e.
select p.nombre , p.precio from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where right(f.nombre,1) = 'e';
--11. Devuelve un listado con el nombre y el precio de todos los productos cuyo
--nombre de fabricante contenga el carácter w en su nombre.
select p.nombre , p.precio from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre ~ 'w';
--12. Devuelve un listado con el nombre de producto, precio y nombre de
--fabricante, de todos los productos que tengan un precio mayor o igual a
--180€. Ordene el resultado en primer lugar por el precio (en orden
--descendente) y en segundo lugar por el nombre (en orden ascendente)
select p.nombre , p.precio , f.nombre from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where p.precio>=180
order by 2 desc , 1 asc;
--13. Devuelve un listado con el identificador y el nombre de fabricante,
--solamente de aquellos fabricantes que tienen productos asociados en la
--base de datos.
select codigo , nombre from fabricante where codigo in (select codigo_fabricante from producto);