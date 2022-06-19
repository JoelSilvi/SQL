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

CREATE TABLE IF NOT EXISTS extra_version(
	id_version INT,
	id_extra INT,
	price NUMERIC NOT NULL CHECK (price >= 0),
	CONSTRAINT px_extra_version PRIMARY KEY(id_version, id_extra),
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