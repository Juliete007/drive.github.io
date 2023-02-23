--Traure els noms de les comarques i la província , amb el nombre de poclacions que té cada comarca
select C.nom_c, C.provincia, count(*) as "Nº de poblaciones"
from comarques C inner join poblacions P using (nom_c)
group by 1,2;
--Traure els noms de les comarques, provincia i poblacions, amb el nombre de instituts que té cada població. 
--Els resultats han d'estar ordenats per el nom de la coarca y dins d'aquest per el nom de la població
select C.nom_c, P.nom, count(*) as "Nº de poblaciones"
from comarques C inner join poblacions P using (nom_c)
inner join instituts I using (cod_m)
group by 1,2
order by 1,2;
--Muestra el nombre de la comarca y el numero de institutos que tiene cada 
select nom_c, count(*) as "Nº de institutos"
from poblacions inner join instituts using(cod_m)
group by nom_c
order by 2 desc;