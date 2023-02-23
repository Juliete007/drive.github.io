--6.51 Traure el nom dels clients amb el número de factura i la data (individuals, sense agrupar res) que té cada client. 
--Trau el resultat ordenat per client, i dins d'aquest per data de la factura
select C.nom, F.num_f, F.data
from client C inner join factura F using (cod_cli)
order by C.nom, F.data;
--6.52 Traure el nom del soci, amb el codi i la descripció de cada article que ha demanat. Ordena per nom del soci i codi de l'article.
SELECT client.nom, linia_fac.cod_a, article.descrip
FROM client
INNER JOIN factura ON factura.cod_cli = client.cod_cli
INNER JOIN linia_fac ON linia_fac.num_f = factura.num_f
INNER JOIN article ON article.cod_a = linia_fac.cod_a
ORDER BY client.nom, linia_fac.cod_a;
--6.53 Modificar l'anterior per a que no es repetesquen els resultats.
SELECT distinct client.nom, linia_fac.cod_a, article.descrip
FROM client
INNER JOIN factura ON factura.cod_cli = client.cod_cli
INNER JOIN linia_fac ON linia_fac.num_f = factura.num_f
INNER JOIN article ON article.cod_a = linia_fac.cod_a
ORDER BY client.nom, linia_fac.cod_a;
--6.54 Traure el nom dels clients amb la quantitat de factures que tenen, ordenades per aquest número de major a menor
select C.nom, count(num_f)
from client C inner join factura using (cod_cli)
group by C.nom
order by count(num_f) desc;
--6.55-56 Traure el número de factura, data, codi de client, total de la factura (amb l'àlies "total factura") i total de la factura aplicant 
--el descompte de la factura (amb l'àlies "Total factura amb el descompte"). Ordena per número de factura.
SELECT factura.num_f, factura.data, factura.cod_cli, 
  round(SUM(linia_fac.quant * linia_fac.preu),2) AS "total factura",
  round(SUM(linia_fac.quant * linia_fac.preu) - (SUM(linia_fac.quant * linia_fac.preu) * factura.dte/100),2) AS "Total factura con el descuento"
FROM factura 
INNER JOIN linia_fac ON factura.num_f = linia_fac.num_f
GROUP BY 
  factura.num_f, 
  factura.data, 
  factura.cod_cli
ORDER BY 
  factura.num_f;
--6.57 Traure el codi i nom d'aquells venedors que supervisen algú (consten com a cap). Traure també el número de supervisats de cadascun d'aquestos supervisors.
select j.cod_ven, j.nom, count(v.cod_ven)
from venedor v inner join venedor j
on j.cod_ven = v.cod_cap
group by 1
order by 1;
--6.58 Traure el codi i descripció dels articles juntament amb el número de vegades que s'ha venut, el total d'unitats venudes i la mitjana d'unitats venudes per factura. 
--Ordenar pel número total d'unitats venudes de forma descendent, i dins d'aquesta per codi d'article de forma ascendent.
SELECT article.cod_a, article.descrip, SUM(linia_fac.quant) as total_vendidas, COUNT(factura.num_f) as num_ventas, round(AVG(linia_fac.quant),2) as media_ventas
FROM article
INNER JOIN linia_fac ON article.cod_a = linia_fac.cod_a
INNER JOIN factura ON linia_fac.num_f = factura.num_f
GROUP BY article.cod_a, article.descrip
ORDER BY total_vendidas DESC, article.cod_a ASC;
--6.59 Traure el codi i la descripció de les categories, amb la quantitat d'articles venuts de cada categoria, d'aquelles 
--categories de les quals se n'han venut més de 100 unitats. Ordenar per aquest número de forma descendent.

select categoria.cod_cat, categoria.descripcio, sum(linia_fac.quant)
from article, linia_fac, categoria
where article.cod_cat = categoria.cod_cat and article.cod_a=linia_fac.cod_a
group by categoria.cod_cat
having sum(linia_fac.quant)>100
order by 3 desc;

--6.60 Traure el codi i el nom dels clients que no tenen cap factura.
select cod_cli, nom
from client
where cod_cli not in (select distinct cod_cli from factura);