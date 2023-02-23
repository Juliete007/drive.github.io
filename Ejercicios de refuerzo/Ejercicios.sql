--1.Lista el nombre y los apellidos de todos los empleados.
select nombre, apellido1, apellido2 from empleado;
--2.Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
select distinct apellido1 from empleado;
--3.Lista todas las columnas de la tabla empleado.
select * from empleado;
--4.Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.
select id_departamento from empleado;
--5.Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los identificadores que aparecen repetidos.
select distinct id_departamento from empleado;
--6.Lista el nombre y apellidos de los empleados en una única columna.
select concat(nombre,' ', apellido1,' ', apellido2) from empleado;
--7.Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
select upper(concat(nombre,' ', apellido1,' ', apellido2)) from empleado;
--8.Lista el identificador de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.
select id, substring(nif,1,8), substring(nif,9,9) from empleado;
--9. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular este dato tendrá que restar al valor del presupuesto 
--inicial (columna presupuesto) los gastos que se han generado (columna gastos). 
--Tenga en cuenta que en algunos casos pueden existir valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.
select nombre, (presupuesto-gastos) as presupuesto_actual from departamento;
--10.Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
select nombre, (presupuesto-gastos) as presupuesto_actual from departamento order by presupuesto_actual;
--11.Lista el nombre de todos los departamentos ordenados de forma desscendente.
select nombre from departamento order by nombre desc;
--12.Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
select apellido1, apellido2, nombre from empleado order by apellido1, apellido2, nombre;
--13.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
select nombre, presupuesto from departamento order by presupuesto desc limit 3;
--14.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
select nombre, presupuesto from departamento order by presupuesto limit 3;
--15.Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
select nombre, gastos from departamento order by gastos desc limit 2;
--16.Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
select nombre, gastos from departamento order by gastos limit 2;
--17. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. 
--La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
select * from empleado offset 2 rows;
--18.Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
select nombre, presupuesto from departamento where presupuesto>=15000;
--19. Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que tienen un presupuesto 
--entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto>10000 and presupuesto<200000;
--20.Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto not between 10000 and 20000;
--21. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos 
--donde los gastos sean mayores que el presupuesto del que disponen.
select nombre, gastos, presupuesto from departamento where gastos>presupuesto;
--22.Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos 
--donde los gastos sean menores que el presupuesto del que disponen.
select nombre, gastos, presupuesto from departamento where gastos<presupuesto;
--23. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos 
--donde los gastos sean iguales al presupuesto del que disponen.
select nombre, gastos, presupuesto from departamento where gastos=presupuesto;
--24.Lista todos los datos de los empleados cuyo segundo apellido sea NULL.ç
select * from empleado where apellido2 is null;
--25.Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
select * from empleado where apellido2 is not null;
--26.Lista todos los datos de los empleados cuyo segundo apellido sea López.
select * from empleado where apellido2='López';
--27. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el
--operador IN.
select * from empleado where apellido2='Díaz' or apellido2='Moreno';
--28. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el
--operador IN.
select * from empleado where apellido2 in ('Díaz', 'Moreno');
--29. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
select nombre, apellido1, apellido2, nif from empleado where id_departamento=3;
--30. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
select nombre, apellido1, apellido2, nif from empleado where id_departamento in (2,4,5);
--31. Calcula la suma del presupuesto de todos los departamentos.
select sum(presupuesto) from departamento;
--32. Calcula la media del presupuesto de todos los departamentos.
select avg(presupuesto) from departamento;
--33. Calcula el valor mínimo del presupuesto de todos los departamentos.
select min(presupuesto) from departamento;
--34. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con
--menor presupuesto.
select nombre, presupuesto from departamento where presupuesto = (select min(presupuesto) from departamento);
--35. Calcula el valor máximo del presupuesto de todos los departamentos.
select max(presupuesto) from departamento;
--36. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con
--mayor presupuesto.
select nombre, presupuesto from departamento where presupuesto = (select max(presupuesto) from departamento);
--37. Calcula el número total de empleados que hay en la tabla empleado.
select count(*) from empleado;
--38. Calcula el número de empleados que no tienen NULL en su segundo apellido.
select count(*) from empleado where apellido2 is not null;
--39. Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de
--esta consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado
--asociado.
SELECT d.nombre AS departamento, COUNT(e.id) AS num_empleados
FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento
GROUP BY d.id, d.nombre;
--40. Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un
--presupuesto mayor a 200000 euros.
SELECT d.nombre AS departamento, COUNT(e.id) AS num_empleados
FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento where presupuesto>200000
GROUP BY d.id, d.nombre;