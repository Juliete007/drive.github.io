--1. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro. 
select nom_fab, max(precio)
from fabricante inner join articles on fabricante.nif_fab=articles.fabricante_id
group by fabricante.nif_fab;

--2. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante. 
select *
from articles a
where precio>=(select avg(precio) from articles
			  where a.fabricante_id=fabricante_id)


--3. Lista el nombre del producto más caro del fabricante Lenovo.
select nom_art
from articles
where precio = (select max(precio) from articles
			   where fabricante_id= (select nif_fab from fabricante
									where nom_fab = 'Seagate'))
									
--Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo
select f.nom_fab, count(a.cod_art) as "Num_art"
from fabricante f inner join articles a
on a.fabricante_id=f.nif_fab
group by f.nom_fab
having count(*)=(select count(*) from articles
		where fabricante_id = (select nif_fab from fabricante
									where nom_fab = 'Seagate'))