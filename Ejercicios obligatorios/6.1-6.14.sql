--6.1 Consulta pobles:
select * from poble;
--6.2 Consulta codi postal, el nom i l'adreça, de venedors:
select cod_pob, nom, adreca from venedor;
--6.3 Consulta el codi d'article, la descripció, preu i preu incrementat en un 5%, de tots els articles:
select cod_a, descrip, preu, preu*1.05 from article;
--6.4 Consulta la informació dels clients amb el següent format (ha d'anar tot en una columna): Damborenea Corbato, Alicia. CALLE MADRID, 83 (12425)
select concat(initcap(nom),'. ', adreca,' ','(',cp,')') from client;
--6.5 Consulta el num_f, data i cod_ven de les factures amb les següents capçaleres respectivament: Número Factura, data i Codi Venedor
select num_f AS "Número Factura", data, cod_ven AS "Codi Venedor" from factura;
--6.6 Donar àlias als camps que ho necessiten de la taula ARTICLE
select cod_a AS "Codi Article", descrip AS "descipció", preu, stock, stock_min AS "Stock mínim", cod_cat AS "Codi Categoria" from article;
--6.7 Traure els clients de la ciutat amb codi 12309
select * from client where cod_pob='12309';
--6.8  Traure totes les factures del mes de març de 2015
select * from factura where data between '2015-03-01' and '2015-03-31';
--6.9 Traure tots els articles de la categoria BjcOlimpia amb un stock entre 2 i 7 unitats
select * from article where cod_cat='BjcOlimpia' and stock between 2 and 7;
--6.10 Traure tots els clients que no tenen introduït el codi postal
select * from client where cp is null;
--6.11 Traure tots els articles amb el stock introduït però que no tenen introduït el stock mínim
select * from article where stock_min is null and stock>0;
--6.12 Traure tots els clients, el primer cognom dels quals és VILLALONGA
select * from client where nom like 'VILLALONGA%';
--6.13.a Modificar l'anterior per a traure tots els que són VILLALONGA de primer o de segon cognom
select * from client where nom like '%VILLALONGA%';
--6.13.b Modificar l'anterior per a traure tots els que no són VILLALONGA ni de primer ni de segon cognom
select * from client where nom not like '%VILLALONGA%';
--6.14 Traure els articles "Pulsador" (la descripció conté aquesta paraula), el preu dels quals oscila entre 2 i 4 € i dels quals tenim un stock estrictament major que el stock mínim
select * from article where descrip like '%Pulsador%' and preu between 2 and 4 and stock>stock_min;