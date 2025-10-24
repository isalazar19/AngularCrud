select emp.IdEmpleado, emp.NombreCompleto, emp.IdDepartamento, dpto.Nombre, emp.Sueldo, emp.FechaContrato, emp.FechaCreacion
from Empleado emp
inner join Departamento dpto on dpto.IdDepartamento = emp.IdDepartamento

--Mostrar Cuenta de Empleados por Depto y Total Sueldo por Depto
select dpto.IdDepartamento, dpto.Nombre Depto, count(emp.IdDepartamento) Cuenta_Emp, COALESCE(SUM(emp.Sueldo), 0) Total_Dpto
from Departamento dpto
left outer join Empleado emp on emp.IdDepartamento = dpto.IdDepartamento
group by dpto.IdDepartamento, dpto.Nombre

--Mostrar los Empleados de cada Depto que ganan mas
select emp.NombreCompleto Empleado, emp.Sueldo, CAST(dpto.IdDepartamento AS varchar(10)) +'-'+ dpto.Nombre Departamento
from Empleado emp
left outer join Departamento dpto on dpto.IdDepartamento=emp.IdDepartamento
where emp.Sueldo = (select max(e2.sueldo) from Empleado e2 where e2.IdDepartamento=emp.IdDepartamento)
order by dpto.IdDepartamento, emp.Sueldo

--DBCC CHECKIDENT ('Empleado', RESEED, 8);