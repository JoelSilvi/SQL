--MANUFACTURER
create table if not exists manufacturer(
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	num_employees INT,
	constraint pk_manufacturer PRIMARY KEY(id)
);

select * from manufacturer;

insert into manufacturer (name, num_employees)
values ('Toyota', 45000);

-- MODEL

CREATE TABLE model (
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	manufacturer_id int,
	constraint pk_model PRIMARY KEY(id),
	constraint pk_model_manufact foreign key(manufacturer_id) references manufacturer(id)
);

select * from model;

insert into model (name, manufacturer_id)
values ('Prius', 2);

-- VERSION
CREATE TABLE IF NOT EXISTS version(
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	engine VARCHAR(50),
	price NUMERIC,
	cc NUMERIC(2,1),
	id_model INT,
	CONSTRAINT pk_version PRIMARY KEY(id),
	CONSTRAINT fk_version FOREIGN KEY(id_model) REFERENCES model(id)
	ON UPDATE SET null ON DELETE SET null
);

SELECT * FROM version;

INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Basic', 'Diesel 4C', 30000, 1.9, 2),
		('Medium', 'Diesel 5C', 50000, 2.9, 2),
		('Advanced', 'Diesel 6C v', 80000, 3.9, 2);
		
INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Sport', 'Gasolina 4C', 50000, 2.1, 3),
		('Sport Advanced', 'Gasolina 8C', 90000, 3.2, 3);


-- EXTRA
CREATE TABLE IF NOT EXISTS extra(
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	description VARCHAR(300),
	CONSTRAINT pk_extra PRIMARY KEY(id)
);

select * from extra_version;

alter table extra_version rename constraint px_extra_version to pk_extra_version;

CREATE TABLE IF NOT EXISTS extra_version(
	id_version INT,
	id_extra INT,
	price NUMERIC NOT NULL CHECK (price >= 0),
	CONSTRAINT pk_extra_version PRIMARY KEY(id_version, id_extra),
	CONSTRAINT fk_version_extra FOREIGN KEY(id_version) REFERENCES version(id) ON UPDATE cascade ON DELETE cascade,
	CONSTRAINT fk_extra_version FOREIGN KEY(id_extra) REFERENCES extra(id) ON UPDATE cascade ON DELETE cascade	
);

INSERT INTO extra (name, description)
VALUES ('Techo solar', 'lorem ipsum dolor ...'),
		('Climatizador', 'lorem ipsum dolor ...'),
		('Wifi', 'lorem ipsum dolor ...'),
		('Frigorífico', 'lorem ipsum dolor ...');

SELECT * FROM extra;

SELECT * FROM extra_version;

-- Ford Mondeo Basic techo solar
INSERT INTO extra_version VALUES (1, 1, 3000);
-- Ford Mondeo Basic climatizador
INSERT INTO extra_version VALUES (1, 2, 1000);
-- Ford Mondeo Basic Wifi
INSERT INTO extra_version VALUES (1, 3, 500);

-- Ford Mondeo Advance techo solar
INSERT INTO extra_version VALUES (3, 1, 3300);
-- Ford Mondeo Advance climatizador
INSERT INTO extra_version VALUES (3, 2, 1200);
-- Ford Mondeo Advance Wifi
INSERT INTO extra_version VALUES (3, 3, 500);


CREATE TABLE IF NOT EXISTS employee(
	id SERIAL,
	name VARCHAR(30),
	nif VARCHAR(9) NOT NULL UNIQUE,
	phone VARCHAR(9),
	CONSTRAINT pk_employee PRIMARY KEY(id)	
);

INSERT INTO employee (name,nif,phone)
VALUES('Bob','123456789','112233445'),
	  ('Mike','12345789','112488645');

select * from employee;

CREATE TABLE IF NOT EXISTS customer(
	id SERIAL,
	name VARCHAR(30),
	email VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT pk_customer PRIMARY KEY(id)
);

INSERT INTO customer (name,email)
VALUES('customer1','c1@gmail.com'),
	  ('customer2','c2@gmail.com');
	  
CREATE TABLE IF NOT EXISTS vehicle(
	id SERIAL,
	license_num VARCHAR(7),
	creation_date DATE,
	pricee_gross NUMERIC,
	pricee_net NUMERIC,
	type VARCHAR(30),
	
	id_manufacturer INT,
	id_model INT,
	id_version INT,
	id_extra INT,
	
	CONSTRAINT pk_vehicle PRIMARY KEY(id),
	CONSTRAINT fk_vehicle_manufacturer FOREIGN KEY(id_manufacturer) REFERENCES manufacturer(id),
	CONSTRAINT fk_vehicle_model FOREIGN KEY(id_model) REFERENCES model(id),
	CONSTRAINT fk_vehicle_extra_version FOREIGN KEY(id_version, id_extra) REFERENCES
				extra_version(id_version, id_extra)
);

select * from vehicle;

INSERT INTO vehicle (license_num, price_gross, id_manufacturer, id_model, id_version, id_extra)
VALUES('1234PPP', 40000, 1, 2, 1, 2);

INSERT INTO vehicle (license_num, price_gross, id_manufacturer, id_model, id_version, id_extra)
VALUES('3456TTT', 30000, 1, 3, 3, 3);


update vehicle set creation_date = '2013-10-19' where id = 2 returning *;

CREATE TABLE sale(
	id SERIAL,
	sale_date DATE,
	channel VARCHAR(255),
	
	id_vehicle INT,
	id_employee INT,
	id_customer INT,
	
	CONSTRAINT pk_sale PRIMARY KEY(id),
	CONSTRAINT fk_sale_vehicle FOREIGN KEY(id_vehicle) REFERENCES vehicle(id),
	CONSTRAINT fk_sale_employee FOREIGN KEY(id_employee) REFERENCES employee(id),
	CONSTRAINT fk_sale_customer FOREIGN KEY(id_customer) REFERENCES customer(id)
	
);

INSERT INTO sale(sale_date, channel, id_vehicle, id_employee, id_customer)
VALUES ('2022-01-01', 'Phone', 1, 1, 1);


select * from sale;