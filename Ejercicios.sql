--6.20 Comptar el número de pobles de cada província 
--(és suficient traure el codi de la província i el número de pobles).
SELECT cod_pro, COUNT(*)
FROM poble
GROUP BY cod_pro;
--6.21 Comptar el número de factures de cada venedor a cada client.
select cod_ven, cod_cli, count(*) 
from factura
group by cod_ven,cod_cli
order by cod_ven, cod_cli;
--6.22 Comptar el número de factures de cada trimestre. Per a poder traure el trimestre i agrupar per ell 
--(ens val el número de trimestre, que va del 1 al 4), podem utilitzar la funció TO_CHAR(data,'Q').
select TO_CHAR(data, 'Q') AS "Trimestre", count(*)
from factura
group by to_char(data,'Q');

--6.23 Calcular el total de cada factura, sense aplicar descomptes ni IVA. Només ens farà falta la taula LINIES_FAC, 
--i consistirà en agrupar per cada num_f per a calcular la suma del preu multiplicat per la quantitat.
select num_f, sum(preu*quant)
from linia_fac
group by 1;

--6.24 Calcular la mitjana de quantitats demanades d'aquells articles que s'han demanat més de dues vegades. 
--Observeu que la taula que ens fa falta és LINIA_FAC, i que la condició (en el HAVING) és sobre el número de vegades que 
--entra l'article en una linia de factura, però el resultat que s'ha de mostrar és la mitjana de la quantitat.

select cod_a, round(avg(quant),2) as "Media"
from linia_fac
group by cod_a
having count(num_l)>2
order by cod_a;
--6.25 Traure els pobles que tenen entre 3 i 7 clients. Traure només el codi del poble i aquest número

select cod_pob, count(cod_cli)
from client
group by cod_pob
having count(cod_cli) between 2 and 7;

--6.26 Traure les categories que tenen més d'un article "car" (de més de 100 €). 
--Observeu que també ens eixirà la categoria NULL, és a dir, apareixerà com una categoria aquells articles que no estan catalogats.

select cod_cat, count(cod_a)
from article
where preu>100
group by cod_cat
having count(cod_a)>=2;

--6.27 Traure tots els clients ordenats per codi de població, i dins d'aquestos per codi postal.

select *
from client
order by cod_pob, cp;