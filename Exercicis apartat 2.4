--6.70 Traure el nom de tots els clients i venedors implicats en alguna venda del primer trimestre de 2015.

SELECT nom as nombre, 'Client' as tipo
FROM client
WHERE cod_cli IN (
  SELECT cod_cli
  FROM factura
  WHERE data BETWEEN '2015-01-01' AND '2015-03-31'
)

union

SELECT nom as nombre, 'Vendedor' as tipo
FROM venedor
WHERE cod_ven IN (
  SELECT cod_ven
  FROM factura
  WHERE data BETWEEN '2015-01-01' AND '2015-03-31'
);

--6.71a Traure per mig de sentències d'operacions de conjunts els pobles on tenim algun venedor o algun client. No volem resultats repetits, 
--i ho volem ordenat pel nom del poble.

select p.nom
from poble p inner join client c using (cod_pob)
union
select p1.nom
from venedor inner join poble p1 using (cod_pob)
order by 1;
--6.71b Modificar l'anterior per a traure els pobles on tenim al mateix temps venedors i clients

select p.nom
from poble p inner join client c using (cod_pob)
intersect
select p1.nom
from venedor inner join poble p1 using (cod_pob)
order by 1;
--6.71c Modificar l'anterior per a traure els pobles on tenim venedors però no tenim clients

select p.nom
from poble p inner join client c using (cod_pob)
intersect
select p1.nom
from venedor inner join poble p1 using (cod_pob)
order by 1;