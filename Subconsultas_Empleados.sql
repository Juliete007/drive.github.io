--Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN)
select * 
from empleado 
where id_departamento = (select id 
						 from departamento 
						 where nombre = 'Sistemas');

--Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
select nombre, presupuesto
from departamento 
where presupuesto=(select max(presupuesto) 
				   from departamento);

--Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
select nombre, presupuesto
from departamento 
where presupuesto=(select min(presupuesto) 
				   from departamento);

--4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT
select nombre, presupuesto
from departamento 
where presupuesto>=all(select presupuesto 
					   from departamento);

--5. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.
select nombre, presupuesto
from departamento 
where presupuesto<=all(select presupuesto 
					   from departamento);

--6.Devuelve los nombres de los departamentos que tienen empleados asociados.
select nombre
from departamento d
where d.id=any(select e.id_departamento 
			   from empleado e);

--7.Devuelve los nombres de los departamentos que no tienen empleados asociados.
select nombre
from departamento d
where d.id<>all(select e.id_departamento 
				from empleado e
			   where e.id_departamento is not null);

--8.Devuelve los nombres de los departamentos que tienen empleados asociados.
select d.nombre
from departamento d
where d.id in (select e.id_departamento 
			   from empleado e);

--9.Devuelve los nombres de los departamentos que no tienen empleados asociados.
select d.nombre
from departamento d
where d.id not in (select e.id_departamento 
				   from empleado e 
				   where e.id_departamento is not null);
				   
--10.Devuelve los nombres de los departamentos que tienen empleados asociados.
select d.nombre
from departamento d
where exists (select e.id_departamento 
			  from empleado e 
			  where d.id=e.id_departamento);

--11.Devuelve los nombres de los departamentos que tienen empleados asociados.
select d.nombre
from departamento d
where not exists (select e.id_departamento 
				  from empleado e 
				  where d.id=e.id_departamento);