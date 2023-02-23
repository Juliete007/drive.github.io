CREATE TABLE Fabricante (
    Nif_Fabricante INT PRIMARY KEY,
    Nom_Fabricante VARCHAR(50) NOT NULL
);

CREATE TABLE Articulo (
    Codi_Articulo INT PRIMARY KEY,
    Nom_Articulo VARCHAR(50) NOT NULL,
    Preu_Articulo DECIMAL(10,2) NOT NULL,
    Nif_Fabricante INT,
    CONSTRAINT FK_Articulo_Fabricante FOREIGN KEY (Nif_Fabricante) REFERENCES Fabricante(Nif_Fabricante)
);

-- TABLA FABRICANTES 
insert into fabricante values (1, 'Kingston'); 
insert into fabricante values (2, 'Adata'); 
insert into fabricante values (3, 'Logitech'); 
insert into fabricante values (4, 'Lexar'); 
insert into fabricante values (5, 'Seagate');
-- TABLA articles 
insert into articulo values (1, 'Teclado',  100, 3); 
insert into articulo values (2, 'Disco Duro 300GB',  500, 5); 
insert into articulo values (3, 'Mouse',  80, 3); 
insert into articulo values (4, 'Memoria USB',  150, 4); 
insert into articulo values (5, 'Memoria RAM',  290, 1); 
insert into articulo values (6, 'Disco Duro Extraible 230 GB',  650, 5); 
insert into articulo values (7, 'Memoria USB',  279, 1); 
insert into articulo values (8, 'DVD ROM',  450, 2); 
insert into articulo values (9, 'CD ROM' , 200, 2); 
insert into articulo values (10, 'Tarjeta de red',  150, 3);

--1. Obtindre totes les dades dels productes de la tenda. 
select * from articulo;

--2. Obtindre els noms dels productes de la tenda.
select Nom_Articulo from articulo;

--3. Obtindre els noms i preu dels productes de la tenda. 
select Nom_Articulo,Preu_Articulo 
from articulo;

--4. Obtindre els noms dels articles sense repeticions.
select distinct Nom_Articulo 
from articulo;

--5. Obtindre totes les dades del article amb  Codi de Article igual a 5. 
select * 
from articulo
where Codi_Articulo=5;

--6. Obtindre totes les dades del articles amb nom del producte igual a ‘’Teclado”
select * 
from articulo
where Nom_Articulo='Teclado';

--7. Obtindre totes les dades de ‘Memoria RAM’  i ‘Memoria USB’. 
select *
from articulo
where Nom_Articulo='Memoria RAM' or Nom_Articulo='Memoria USB';

--8.  Obtindre totes les dades dels articles que comencen amb ‘M’
select *
from articulo
where Nom_Articulo like 'M%';

--9. Obtindre el nom dels producte on el preu siga 150 €
select Nom_Articulo
from articulo
where Preu_Articulo=150;

--10. Obtindre el nom dels producte y el preu de aquells que siguen major a 200 € 
select Nom_Articulo,Preu_Articulo
from articulo
where Preu_Articulo>200;

--11. Obtindre totes les dades dels articles on el preu este entre 100 € i 350 €
select *
from articulo
where Preu_Articulo between 100 and 350;

--12. Obtindre el preu Promedi de tots els  productes.
select round(avg(Preu_Articulo),2)
from articulo;

--13. Obtindre el preu mitjà dels articles amb Nif de fabricant igual a  3. 
select round(avg(Preu_Articulo),2)
from articulo
where Nif_Fabricante=3;

--14. Obtindre el nom i preu dels articles ordenats per nom.
select Nom_Articulo,Preu_Articulo
from articulo
order by 1;

--15. Obtindre totes les dades dels producte ordenats descendentemente por preu.
select *
from articulo
order by Preu_Articulo;

--16. Obtindre el nom i preu dels articles amb preu major a 250€ i ordenats descendentment por preu i ascendentment por nom.
select Nom_Articulo,Preu_Articulo
from articulo
where Preu_Articulo>250
order by Preu_Articulo desc, Nom_Articulo asc;