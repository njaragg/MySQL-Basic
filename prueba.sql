create database prueba;


create table prueba.tipos(
	id INT PRIMARY KEY NOT NULL auto_increment,
	nombre_tipo varchar(100) NOT NULL
)

create table prueba.proveedores (
	id INT PRIMARY KEY NOT NULL auto_increment,
	nombre_proveedor varchar(100) NOT NULL,
	rut_proveedor varchar(100) NOT NULL,
	correo_proveedor varchar(100) NOT NULL

)

create table prueba.ventas(
	id INT PRIMARY KEY NOT NULL auto_increment,
	fecha date not null,
	cantidad int NOT null,
	productos_id int NOT null,
	foreign key (productos_id) references productos(id)
	
)



CREATE TABLE prueba.productos (
	id INT PRIMARY KEY NOT NULL auto_increment,
	nombre_producto varchar(100) NOT NULL,
	marca_producto varchar(100) NOT NULL,
	precio int NOT null,
	stock int NOT null,
	proveedores_id int NOT null,
	tipos_id int NOT null,
	foreign key(proveedores_id) references proveedores(id),
	foreign key(tipos_id) references tipos(id)
)

insert into prueba.tipos (nombre_tipo) values 
("Licores"),
("Limpieza"),
("Frutas y verduras"),
("Panaderia"),
("Congelados");

insert into prueba.proveedores (nombre_proveedor,rut_proveedor,correo_proveedor) values ("Nico SA","20.232.232-k","nicosa@gmail.com");

insert into prueba.productos (nombre_producto, marca_producto, precio,stock,proveedores_id,tipos_id) values 
("Pisco 1L","Alto del Carmen",6000,100,1,1),("Sixpack cerveza 500cc","Stella Artois",7490,87,1,1),
("Detergente Líquido Matic Multiacción 350 ml","OMO",1000,100,1,2),("Piña","Piña",2390,20,1,3),
("Papas duquesas","Lider",3300,34,1,5);

insert into prueba.ventas (fecha,cantidad,precio,productos_id) values ('2022-11-11',1,6000,1);

select nombre_producto 'Producto', nombre_tipo 'Categoria'
from prueba.productos p
inner join prueba.tipos t
on p.tipos_id  = t.id;


select nombre_producto 'producto', precio, stock, cantidad 'cantidad vendida', fecha 'fecha Venta'
from prueba.productos p
inner join prueba.ventas v
on p.id  = v.productos_id;


-- si no me equivoco esta query me muestra los productos que no se vendieron (no hay registro de venta en la tabla ventas)
select *
from prueba.productos p
inner join prueba.ventas v
on p.id  != v.productos_id;






