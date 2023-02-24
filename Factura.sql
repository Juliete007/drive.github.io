--6.51 Traure el nom dels clients amb el número de factura i la data (individuals, sense agrupar res) que té cada client. 
--Trau el resultat ordenat per client, i dins d'aquest per data de la factura

select c.nom,f.num_f,f.data
from client c
inner join factura f on c.cod_cli=f.cod_cli
order by c.nom, f.data;

--6.52 Traure el nom del soci, amb el codi i la descripció de cada article que ha demanat. Ordena per nom del soci i codi de l'article.

select c.nom,a.cod_a,a.descrip
from client c
inner join factura f on c.cod_cli=f.cod_cli
inner join linia_fac l on f.num_f=l.num_f
inner join article a on l.cod_a=a.cod_A
order by c.nom,a.cod_a;

--6.53 Modificar l'anterior per a que no es repetesquen els resultats.

select distinct c.nom,a.cod_a,a.descrip
from client c
inner join factura f on c.cod_cli=f.cod_cli
inner join linia_fac l on f.num_f=l.num_f
inner join article a on l.cod_a=a.cod_A
order by c.nom,a.cod_a;

--6.54 Traure el nom dels clients amb la quantitat de factures que tenen, ordenades per aquest número de major a menor

select c.nom,count(num_f)
from client c inner join factura using(cod_cli)
group by c.nom
order by count(num_f) desc;

--6.55-56 Traure el número de factura, data, codi de client, total de la factura (amb l'àlies "total factura") 
--i total de la factura aplicant el descompte de la factura (amb l'àlies "Total factura amb el descompte"). Ordena per número de factura.

select num_f,data,cod_cli,round(quant*preu,2) as "Total factura",round((quant*preu)-(quant*preu)*l.dte/100,2) as "Total factura amb el descompte"
from factura inner join linia_fac l using(num_f)
order by num_f;

--6.57 Traure el codi i nom d'aquells venedors que supervisen algú (consten com a cap). Traure també el número de supervisats de cadascun d'aquestos supervisors.

select v.cod_ven,v.nom,count(j.cod_cap)
from venedor v inner join venedor j using(cod_cap)
group by 1
order by 1;

--6.58 Traure el codi i descripció dels articles juntament amb el número de vegades que s'ha venut, el total d'unitats venudes i la mitjana d'unitats 
--venudes per factura. Ordenar pel número total d'unitats venudes de forma descendent, i dins d'aquesta per codi d'article de forma ascendent.

select a.cod_a, a.descrip, SUM(l.quant) as total_vendidas, COUNT(f.num_f) as num_ventas, round(AVG(l.quant),2) as media_ventas
from article a inner join linia_fac l using(cod_a)
inner join factura f using(num_f)
group by 1
order by 4 desc,cod_a;

--6.59 Traure el codi i la descripció de les categories, amb la quantitat d'articles venuts de cada categoria, d'aquelles categories de les quals se n'han venut més de 100 unitats. 
--Ordenar per aquest número de forma descendent.
select cod_cat,descripcio,sum(l.quant)
from categoria inner join article a using(cod_cat)
inner join linia_fac l using(cod_a)
group by 1
having sum(l.quant)>100
order by 3 desc;

--6.60 Traure el codi i el nom dels clients que no tenen cap factura.
select cod_cli, nom
from client
where cod_cli not in (select distinct cod_cli from factura);

--6.61 Traure el codi, descripció i total d'unitats venudes de tots els articles, fins i tot d'aquells que no s'ha venut res.

select a.cod_a,a.descrip,coalesce(sum(l.quant),0)
from article a left join linia_fac l using(cod_a)
group by 1,2
order by 1;

--6.62 Traure el nom de tots els pobles i el número de clients en cas que en tinguen. Ordena per número de clients de forma descendent.

select p.cod_pob,p.nom,count(c.cod_pob)
from poble p left join client c using(cod_pob)
group by 1
order by 3 desc;

--6.63 Traure el codi i la descripció de les categories, amb el número d'articles de cada categoria i el número total d'unitats venudes de cada categoria, 
--d'aquelles categories de les quals tenim més de 15 articles, i ordenat per número d'articles de forma descendent. Aquesta sentència ja és prou complicada. Concretament haureu de tenir en compte que:
	--Voldrem traure el número d'articles de cada categoria, però potser alguns articles no s'han venut, i per tant no apareixeran en la taula LINIA_FAC.
	--I també tenim el problema que, com ens fa falta la taula LINIA_FAC, un article venut en més d'una factura apareixerà més d'una vegada. 
	--Si comptem de forma normal, el comptaríem més d'una vegada cada article. Per tant voldrem comptar els diferents articles de cada categoria.
select c.cod_cat,c.descripcio,count(l.quant),sum(l.quant)
from categoria c inner join article a using(cod_cat)
inner join linia_fac l using (cod_a)
group by 1
having (count(l.quant))>15
order by 3 desc;

--6.64 Traure el número màxim de factures fetes a un client
SELECT COUNT(*) AS num_facturas
FROM factura
GROUP BY cod_cli
ORDER BY num_facturas DESC
LIMIT 1;

--6.65 Traure el l'import que suposa la factura més cara i l'import que suposa la més barata (sense considerar ni descomptes ni IVA)

select max(preu),min(preu)
from linia_fac;

--6.66 Traure el número de factures més alt que s'ha venut per venedor en cada trimestre (no traurem qui és el venedor, que seria encara més complicat). 
--Per a poder agrupar per trimestre, ens farà falta la funció TO_CHAR(data,'Q'), que trau el número de trimestre. El pas previ és calcular el número de 
--factures de cada venedor i en cada trimestre. Després, amb la informació anterior, voldrem calcular el màxim de cada trimestre.

select to_char(data,'Q'),count()
from factura
group by data, num_f
ORDER BY num_f DESC

--6.67 Traure els articles més cars que la mitjana. Tragueu-los ordenats per la categoria, i després per codi d'article.

select * from article
where preu>(select avg(preu) from article)
order by cod_cat,cod_a;

--6.68 Modificar l'anterior per a traure els articles més cars que la mitjana de la seua categoria. Tragueu-los ordenats per la categoria

select * from article a
where a.preu>(select avg(b.preu) from article b
		   where a.cod_cat=b.cod_cat)
order by cod_cat;

--6.69 Traure els pobles on tenim clients però no tenim venedors. Ha de ser per mig de subconsultes (en plural). Ordeneu per codi del poble.

select p.cod_pob,p.nom,p.cod_pro
from poble p
where p.cod_pob in (select c.cod_pob from client c)
and p.cod_pob not in (select v.cod_pob from venedor v);

--6.70 Traure el nom de tots els clients i venedors implicats en alguna venda del primer trimestre de 2015. Intentar traure en una segona columna el text Venedor per als venedors, 
--i Client per als clients. Ordenat pel nom.

select nom as nombre,'Client' as tipo
from client
where cod_cli in(select cod_cli from factura where data between '2015-01-01' and '2015-03-31')

union

SELECT nom as nombre, 'Vendedor' as tipo
FROM venedor
WHERE cod_ven IN (
  SELECT cod_ven
  FROM factura
  WHERE data BETWEEN '2015-01-01' AND '2015-03-31'
);


