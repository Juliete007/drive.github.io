create table fabricante(
	nif_fab int primary key,
	nom_fab varchar(30) not null
);

create table articles(
	cod_art int primary key,
	nom_art varchar(30) not null,
	precio int not null,
	fabricante_id int REFERENCES fabricantes(nif_fab)
);

--1. Obtindre totes les dades dels productes de la tenda
select * from articles;
--2. Obtindre els noms dels productes de la tenda.
select nom_art from articles;
--3. Obtindre els noms i preu dels productes de la tenda.
select nom_art,precio from articles;
--4. Obtindre els noms dels articles sense repeticions.
select distinct nom_art from articles;
--5. Obtindre totes les dades del article amb Codi de Article igual a 5.
select * from articles where cod_art = '5';
--6. Obtindre totes les dades del articles amb nom del producte igual a ‘’Teclado” 
select * from articles where nom_art = 'Teclado';
--7. Obtindre totes les dades de ‘Memoria RAM’ i ‘Memorias USB’.
select * from articles where nom_art = 'Memoria RAM' or nom_art = 'Memoria USB';
--8. Obtindre totes les dades dels articles que comencen amb ‘M’
select * from articles where nom_art like 'M%';
--9. Obtindre el nom dels producte on el preu siga 150 €
select nom_art from articles where precio > 150;
--10. Obtindre el nom dels producte y el preu de aquells que siguen major a 200 €
select nom_art,precio from articles where precio > 200;
--11. Obtindre totes les dades dels articles on el preu este entre 100 € i 350 €
select * from articles where precio between 100	and 350;
--12. Obtindre el preu Promedi de tots els productes.
select avg(precio) from articles;
--13. Obtener el precio medio de los artículos con Nif de fabricante igual a 3.
select avg(precio) from articles where fabricante_id = '3';
--14. Obtindre el nom i preu dels articles ordenats per nom.
select nom_art,precio from articles order by nom_art;
--15. Obtindre totes les dades dels producte ordenats descendentemente por preu.
select * from articles order by precio desc;
--16. Obtindre el nom i preu dels articles amb preu major a 250€ i ordenats descendentment por preu i ascendentment por nom
select nom_art,precio from articles where precio > 250 order by precio desc, nom_art ;