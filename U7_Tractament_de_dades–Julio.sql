--1. Afegix un nou producte amb les següents dades: clave_articulo = 11, nombre = Altavoces, precio = 120 € i c_fab = 2.
insert into articles
values(11,'Altavoces',120,2);

--2. Inserta un nou fabricant indicant el seu codi i el seu nom (6, Lenovo). 
insert into fabricantes
values(6,'Lenovo');

--3. Inserta un nou fabricant indicant únicament el seu nom (Asus). 
insert into fabricantes (nif_fab,nom_fab)
values(7,'Asus');

--4. Inserta un nou producte associat al nou fabricant Asus. La sentencia d’inserció ha d’incloure: codi, nom, preu i codi_fabricant.
insert into articles
values(13,'Teclado',60,7)

--5. Inserta un nou producte associat al nou fabricant Lenovo. La sentencia d’inserció ha d’incloure: nom, preu i codi_fabricant.
insert into articles
values(12,'Ratón',60,6)

--6. Elimina el fabricant Xiaomi. ¿Es possible eliminar-lo? Si no es possible, ¿què canvis deuria realitzar per que fora possible eliminar-lo?
DELETE FROM fabricantes WHERE nom_fab = 'Xiaomi';

--7. Elimina el fabricant Lexar. ¿Es possible eliminar-lo? Si no fora possible, ¿què canvis deuria realitzar per que fora possible eliminar-lo?
DELETE FROM fabricantes WHERE nom_fab = 'Lexar';

--8. Actualitza el codi del fabricant Lenovo i assigna-li el valor 20. ¿Es possible actualitzar-lo? Si no fora
--possible, canvis deuria realitzar per que fora possible eliminar-lo?
UPDATE fabricantes SET nif_fab = 20 WHERE nom_fab = 'Lenovo';
--La llave (nif_fab)=(6) todavía es referida desde la tabla «articles».


--9. Actualitza el codi del fabricant Asus i assigna-li el valor 30. ¿Es possible actualitzar-lo? Si no fora possible,
--canvis deuria realitzar per que fora possible eliminar-lo?
UPDATE fabricantes SET nif_fab = 30 WHERE nom_fab = 'Asus';
--La llave (nif_fab)=(6) todavía es referida desde la tabla «articles».

--10. Actualitza el preu de tots els productes sumant-li 5€ al seu preu actual.
UPDATE articles SET precio = precio + 5;

--11. Elimina totes les memòries USB que tenen un preu superior a 200 €.
DELETE FROM articles WHERE nom_art LIKE 'Memoria USB' AND precio > 200;

--12. Canvia el nom del product9 9 a ‘Impressora Làser’.
UPDATE articles SET nom_art = 'Impressora Làser' WHERE cod_art = 9;

--13. Aplicar un descompte del 10% a tots els productes.
UPDATE articles SET precio = precio * 0.9

--14. Aplicar un descompte de 5% a tots els productes amb preu major o igual a 300 €.
UPDATE articles SET precio = precio * 0.95 where precio>=300

--15. Borra el producte amb clau 8 i verifica si està eliminat.
DELETE FROM articles WHERE cod_art=8;

--16. Crea una nova taula amb el nom fabricant_productes que tinga les següents columnes: nom_fabricant,
--nom_producte i preu. Una vegada creada la taula, inserta tots els registres de la base de dades tenda en
--aquesta taula, fent ús d’una única operació d’inserció.

CREATE TABLE fabricant_productes (
  nom_fabricant VARCHAR(30),
  nom_producte VARCHAR(30),
  preu INTEGER
);

INSERT INTO fabricant_productes (nom_fabricant, nom_producte, preu)
SELECT nom_fab, nom_art, precio
FROM articles
INNER JOIN fabricantes ON articles.fabricante_id = fabricantes.nif_fab;
