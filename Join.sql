create database abarrotes;
use abarrotes;

create table if not exists cereales (
	IDCereal int not null,
    tipoCereal varchar(255) not null,
    estado varchar(255) not null,
    primary key(IDCereal)
);

alter table cereales modify column IDCereal int auto_increment;
-- insert into cereales (tipoCereal, estado) values ("grasoso", "buen estado"), ("natural","vencido");
insert into cereales (tipoCereal, estado) values ("natural","por vencer");

select * from cereales;

show create table cereales;


select * from cereales where iDCereal = 1;
select * from cereales where tipoCereal = "natural" and estado = "vencido";


delete from cereales where estado = "por vencer";

-- Error Code: 1175. You are using safe update mode and you tried to update a table 
-- without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in 
-- Preferences -> SQL Editor and reconnect.

delete from cereales where IDCereal = 4;

update cereales set tipoCereal = "natural" where IDCereal = 2;

UPDATE cereales set tipoCereal = "grasoso" where IDCereal = 3;



create database clientes;
show databases;
use clientes;

CREATE TABLE animales (
	id int,
    tipo varchar(255),
    estado varchar(255),
	PRIMARY KEY (id)    
);

-- INSERT INTO animales(tipo, estado) VALUES ("perro", "alegre");
-- esta línea no será ejecutado

ALTER TABLE animales MODIFY COLUMN id int auto_increment;

SHOW CREATE TABLE animales;

CREATE TABLE `animales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO animales(tipo, estado) VALUES ("perro", "alegre");
INSERT INTO animales(tipo, estado) VALUES ("dragon", "happy");
INSERT INTO animales(tipo, estado) VALUES ("tigre", "unhappy");


SELECT * FROM animales WHERE id = 1;
SELECT * FROM animales WHERE estado = 'alegre' AND tipo = 'perro';

UPDATE animales set estado = "feliz" where id = 1;


DELETE FROM animales where id = 4;

UPDATE animales set estado = 'Bien' where id = 1;
use clientes;

create table if not exists employees(
	id SERIAL primary key,
	married boolean,
	name varchar(250) not null,
	email varchar (250) not null,
	genre char(1),
	salary numeric (9,2) check (salary > 15000),
	birth_date DATE check (birth_date > '1975-01-01'),
	start_at TIME,
	unique(email, name)
);

INSERT INTO employees (married, name, email, genre, salary, birth_date, start_at)
values 
(true, 'Carlos2', 'carlos2@gmail.com', 'M', 6100000.97, '1977-10-13','00:30:00'),
(false, 'Pedro', 'pedro@gmail.com', 'M', 1200000.98, '2000-11-11','08:30:00');

select * from employees;

delete from employees where name ="Carlos2" and id = 7 ;

update employees set genre = "F" where email = "juan@gmail.com";

use clientes;

CREATE TABLE usuarios(
	id int not null auto_increment,
	nombre varchar(50) not null,
	edad int not null,
	email varchar(100) not null,
	primary key(id)
);

INSERT INTO usuarios (nombre, edad, email) values ('Pediro','20','pediro@gmail.com');
INSERT INTO usuarios (nombre, edad, email) values ('Camilo','15','camilo@gmail.com');
INSERT INTO usuarios (nombre, edad, email) values ('Juan','29','juan@gmail.com');
INSERT INTO usuarios (nombre, edad, email) values ('Camila','36','camila@gmail.com');

select * from usuarios;
select * from usuarios limit 1;
select * from usuarios where edad > 15;
select *  from usuarios where edad >= 15;
select * from usuarios where edad > 20 and email = 'juan@gmail.com';
select * from usuarios where edad > 19 or email = 'camilo@gmail.com';
select * from usuarios where email != 'camilo@gmail.com';
select * from usuarios where edad between 15 and 30;
select * from usuarios where email like '%gmail%';
select * from usuarios where email like '%gmail';
select * from usuarios where email like 'camilo%';


select * from usuarios order by edad asc;
select * from usuarios order by edad desc;

select max(edad) as mayorEdad from usuarios;
select min(edad) as menorEdad from usuarios;

select id, nombre from usuarios;
select id, nombre as apodo from usuarios;

create table if not exists manufacturer(
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	num_employees INT,
	constraint pk_manufacturer PRIMARY KEY(id)
);


select * from manufacturer;


create table productos (
	id int not null auto_increment,
    nombre varchar(50) not null,
    created_by int not null,
    marca varchar(50) not null,
    primary key(id),
    foreign key(created_by) references usuarios(id)
);

rename table producto to product;

insert into producto (nombre, created_by, marca) 
values
	('ipad', 1, 'apple'),
    ('iphone', 1, 'apple'),
    ('watch', 2, 'apple'),
    ('macbook', 1, 'apple'),
    ('imac', 3, 'apple'),
    ('ipad mini', 2, 'apple');
    
select * from product;

select * from users;

select avg(id) as promedio from product;

rename table usuarios to users;

select u.id as id_usuario, u.nombre, u.edad, p.marca, p.nombre, p.id as id_producto from users u right join product p on u.id = p.created_by;


select u.id, u.email, p.nombre from users u left join producto p on u.id = p.created_by;


create table productos (
	id int not null auto_increment,
    nombre varchar(50) not null,
    created_by int not null,
    marca varchar(50) not null,
    primary key(id),
    foreign key(created_by) references usuarios(id)
);

rename table productos to producto;

insert into producto (nombre, created_by, marca) 
values
	('ipad', 1, 'apple'),
    ('iphone', 1, 'apple'),
    ('watch', 2, 'apple'),
    ('macbook', 1, 'apple'),
    ('imac', 3, 'apple'),
    ('ipad mini', 2, 'apple');
    
select * from producto;

select u.id, u.email, p.nombre from usuarios u left join producto p on u.id = p.created_by;
select u.id, u.email, p.nombre from usuarios u right join producto p on u.id = p.created_by;

create database abarrotes;
use abarrotes;

create table if not exists cereales (
	IDCereal int not null,
    tipoCereal varchar(255) not null,
    estado varchar(255) not null,
    primary key(IDCereal)
);

alter table cereales modify column IDCereal int auto_increment;
-- insert into cereales (tipoCereal, estado) values ("grasoso", "buen estado"), ("natural","vencido");
insert into cereales (tipoCereal, estado) values ("natural","por vencer");

select * from cereales;

show create table cereales;


select * from cereales where iDCereal = 1;
select * from cereales where tipoCereal = "natural" and estado = "vencido";


delete from cereales where estado = "por vencer";

-- Error Code: 1175. You are using safe update mode and you tried to update a table 
-- without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in 
-- Preferences -> SQL Editor and reconnect.

delete from cereales where IDCereal = 4;

update cereales set tipoCereal = "natural" where IDCereal = 2;

UPDATE cereales set tipoCereal = "grasoso" where IDCereal = 3;


create table if not exists arroz(
	IDArroz int not null auto_increment,
    tipo varchar(255),
    estado varchar(255),
    nombre varchar(255),
    primary key(IDArroz)
);

insert into arroz (tipo, estado,nombre) values ("integral","bueno","tucapel"), ("normal","bueno","carozzi"),("vegano","malo","la flora"),("cocido","pesimo","mami");

select * from arroz;
update arroz set email = "cocido@gmail.com" where IDArroz = 4;

alter table arroz add email varchar(255);

update arroz set peso = 36 where IDArroz = 4;


select * from arroz limit 1;
select * from arroz where estado = "bueno";

select * from arroz where email != "normal@gmail.com";

alter table arroz add peso int not null;

select * from arroz where peso between 15 and 36;

select * from arroz where email like "normal%";

select * from arroz order by peso desc;

select max(peso) as mayor from arroz;

select min(peso) as menor from arroz;


select IDArroz as id, tipo as tipejo from arroz;


select rice.IDArroz, rice.email, tal.nombre, tal.IDTallarin from arroz rice left join tallarin tal on rice.IDArroz = tal.created_by;
select rice.IDArroz, rice.email, tal.nombre, tal.IDTallarin from arroz rice inner join tallarin tal on rice.IDArroz = tal.created_by;
select rice.IDArroz, rice.email, tal.nombre, tal.IDTallarin from arroz rice cross join tallarin tal;


insert into tallarin (nombre, created_by, marca)
values
	("MAC",5,"apple");
    
    delete from tallarin where IDTallarin = 10;
    
    select * from tallarin;
    
    
    select count(estado) as contador, estado, email from arroz where email like "%.com" group by estado;
    
    select count(IDTallarin)as cont, marca from tallarin group by marca;
    
    select count(p.IDTallarin), u.nombre from tallarin p left join arroz u
    on u.IDArroz = p.created_by group by p.created_by
    having count(p.IDTallarin) >= 2;
    
    select count(p.IDTallarin), u.nombre from tallarin p left join arroz u
    on u.IDArroz = p.created_by group by p.created_by
	having count(p.IDTallarin) >= 2;
    
    
    CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
  
  create table if not exists tallarin(
	IDTallarin int not null auto_increment,
    nombre varchar(255) not null,
    created_by int not null,
    marca varchar(50),
    primary key(IDTallarin),
    foreign key(created_by) references arroz(IDArroz)
);

rename table cereales to cereal;

insert into tallarin (nombre, created_by, marca)
values
	('ipad', 1, 'apple'),
    ('iphone', 1, 'apple'),
    ('watch', 2, 'apple'),
    ('macbook', 1, 'apple'),
    ('imac', 3, 'apple'),
    ('ipad mini', 2, 'apple');


insert into tallarin (nombre, created_by, marca)
values
	('iphoneX', 1, 'apple');
    
    insert into arroz (tipo, estado, nombre, email, peso)
values
	('normal', 'bueno', 'tucapel', 'normal@gmail.com',40);
    
    select * from arroz;
    
    select * from tallarin;
    
    update tallarin set IDTallarin = 7 where IDTallarin = 9;
    delete from tallarin where IDTallarin = 8;
    
    select rice.IDArroz, rice.email, pro.nombre from arroz rice left join tallarin pro on rice.IDArroz = pro.created_by;
    select rice.IDArroz, rice.email, pro.nombre, pro.IDTallarin from arroz rice right join tallarin pro on rice.IDArroz = pro.created_by;
    
    
select count(p.IDTallarin), u.nombre from tallarin p left join arroz u on u.IDArroz = p.created_by group by p.created_by
having count(p.IDTallarin) >=2;



-- MySQL Script generated by MySQL Workbench
-- Sun May 29 21:26:38 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `mydb`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`brand` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `brand_id` INT NOT NULL,
  `created_by` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `created_by_idx` (`created_by` ASC) VISIBLE,
  INDEX `band_id_idx` (`brand_id` ASC) VISIBLE,
  CONSTRAINT `created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `band_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `mydb`.`brand` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_detail` (
  `id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  INDEX `fk_order_has_product_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_order_has_product_order1_idx` (`order_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_has_product_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


use clientes;

show databases;

select * from animales;

select id as animal, tipo as tipejo from animales;

select * from animales where estado like '%gre' and id = 4;
select * from animales order by id desc;

select max(id) as edad_maxima from animales;
alter table animales modify column estado varchar(105);

update animales set id = 4 where id = 5;


select * from arroz;
create table if not exists galleta(
	IDGalleta int not null,
    tipo varchar(255),
    estado varchar(255),
    primary key(IDGalleta)
);

alter table galleta modify column IDGalleta int auto_increment;

insert into galleta (tipo, estado) values ("sin azúcar", "malo"), ("azucarada", "buen estado");

select * from galleta;

show create table galleta;

select * from galleta where tipo = "azucarada" and estado = "vencido";

delete from galleta where tipo = "azucarada" and IDGalleta >= 4;

update galleta set tipo = "azucarada" where IDGalleta = 5;


select * from producto;


