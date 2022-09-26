CREATE DATABASE autosalon;
USE autosalon;


CREATE TABLE Client
(
	client_id            INTEGER NOT NULL AUTO_INCREMENT,
	name                 VARCHAR(20) NULL,
	surname              VARCHAR(20) NULL,
	passport_data        VARCHAR(20) NULL,
	telephone_number     VARCHAR(20) NULL,
	PRIMARY KEY (client_id)
);



CREATE TABLE Manufacture_country
(
	manufacture_country_id INTEGER NOT NULL AUTO_INCREMENT,
	country              VARCHAR(20) NULL,
	city                 VARCHAR(20) NULL,
	PRIMARY KEY (manufacture_country_id)
);



CREATE TABLE Car_mark
(
	car_mark_id          INTEGER NOT NULL AUTO_INCREMENT,
	mark                 VARCHAR(20) NULL,
	series               INTEGER NULL,
	PRIMARY KEY (car_mark_id)
);



CREATE TABLE Body_type
(
	body_type_id         INTEGER NOT NULL AUTO_INCREMENT,
	body_type_name       CHAR(18) NULL,
	PRIMARY KEY (body_type_id)
);



CREATE TABLE Engine_type
(
	engine_type_id       INTEGER NOT NULL AUTO_INCREMENT,
	engine_type_name     VARCHAR(20) NULL,
	engine_volume        INTEGER NULL,
	engine_power         INTEGER NULL,
	PRIMARY KEY (engine_type_id)
);



CREATE TABLE Engine_layout_type
(
	engine_layout_type_id INTEGER NOT NULL AUTO_INCREMENT,
	engine_layout_type_name VARCHAR(20) NULL,
	PRIMARY KEY (engine_layout_type_id)
);



CREATE TABLE Technical_details
(
	technical_details_id INTEGER NOT NULL AUTO_INCREMENT,
	number_of_doors      INTEGER NULL,
	number_of_seats      INTEGER NULL,
	engine_type_id       INTEGER NULL,
	body_type_id         INTEGER NULL,
	engine_layout_type_id INTEGER NULL,
	PRIMARY KEY (technical_details_id),
	FOREIGN KEY R_7 (body_type_id) REFERENCES Body_type (body_type_id),
	FOREIGN KEY R_8 (engine_type_id) REFERENCES Engine_type (engine_type_id),
	FOREIGN KEY R_9 (engine_layout_type_id) REFERENCES Engine_layout_type (engine_layout_type_id)
);



CREATE TABLE Product
(
	product_id           INTEGER NOT NULL AUTO_INCREMENT,
	car_mark_id          INTEGER NULL,
	model                VARCHAR(20) NULL,
	color                VARCHAR(20) NULL,
	availability         VARCHAR(20) NULL,
	price                INTEGER NULL,
	technical_details_id INTEGER NULL,
	manufacture_country_id INTEGER NULL,
	PRIMARY KEY (product_id),
	FOREIGN KEY R_4 (manufacture_country_id) REFERENCES Manufacture_country (manufacture_country_id),
	FOREIGN KEY R_5 (car_mark_id) REFERENCES Car_mark (car_mark_id),
	FOREIGN KEY R_6 (technical_details_id) REFERENCES Technical_details (technical_details_id)
);



CREATE TABLE Payment_type
(
	payment_type_id      INTEGER NOT NULL AUTO_INCREMENT,
	payment_type         VARCHAR(20) NULL,
	PRIMARY KEY (payment_type_id)
);



CREATE TABLE Contract
(
	conract_id           INTEGER NOT NULL AUTO_INCREMENT,
	product_id           INTEGER NULL,
	client_id            INTEGER NULL,
	datetime             DATE NULL,
	delivery             VARCHAR(20) NULL,
	payment_type_id      INTEGER NULL,
	PRIMARY KEY (conract_id),
	FOREIGN KEY R_1 (client_id) REFERENCES Client (client_id),
	FOREIGN KEY R_2 (product_id) REFERENCES Product (product_id),
	FOREIGN KEY R_10 (payment_type_id) REFERENCES Payment_type (payment_type_id)
);


INSERT INTO Client (name, surname, passport_data, telephone_number)
    VALUES
        ('Nikita', 'Zhiznevskiy', '5546 789','+79151618679'),
        ('Renat', 'Khakimov', '5546 397','+791545612'),
		('Andrey', 'Lobankov', '5533 228','+7915654321'),
		('Max', 'Milko', '3366 888','+7915765895'),
		('Grigoriy', 'Golubev', '1199 341','+79158539834'),
		('Kseniya', 'Martemianova', '7722 228','+79159361935'),
		('Sergey', 'Puck', '7721 212','+79158190547'),
		('Nikita', 'Glushko', '5123 134','+79150867898'),
		('Anton', 'Pavlovich', '2442 228','+7915654321'),
		('Pasha', 'Korablikov', '5542 654','+7915654321');

INSERT INTO Car_mark (mark,series)
    VALUES
        ('BMW',2),
        ('BMW',1),
		('Alfa Romeo',1),
		('Alfa Romeo',2),
		('Alfa Romeo',3),
		('Audi',1),
		('Audi',2),
		('Audi',3),
		('Сadillac',1),
		('Сadillac',2);

INSERT INTO Manufacture_country (country,city)
    VALUES
        ('Russia','Kaliningrad'),
        ('Russia','Moscow'),
		('Russia','Moscow'),
		('Russia','Moscow'),
		('Russia','Moscow'),
		('Russia','Volgograd'),
		('Russia','Volgograd'),
		('Russia','Volgograd'),
		('Russia','Saint-Petersburg'),
		('Russia','Saint-Petersburg');

INSERT INTO Body_type (body_type_name)
    VALUES
        ('three-volume'),
        ('three-volume'),
		('two-volume'),
		('three-volume'),
		('two-volume'),
		('two-volume'),
		('two-volume'),
		('two-volume'),
		('three-volume'),
		('three-volume');

INSERT INTO Engine_type (engine_type_name,engine_volume,engine_power)
    VALUES
        ('3S-FE',3.8,100),
        ('3S-FS',3.5,110),
		('3S-FS',3.2,120),
		('3S-FS',3.9,130),
		('2S-GF',4.0,150),
		('3S-GF',4.1,156),
		('4S-GF',4.2,153),
		('3S-FE',3.5,100),
		('3S-FE',3.5,100),
		('3S-FE',3.5,100);


INSERT INTO Engine_layout_type (engine_layout_type_name)
    VALUES
        ('back'),
        ('back'),
		('back'),
		('back'),
		('back'),
		('back'),
		('front'),
		('front'),
		('front'),
		('front');
		

INSERT INTO Payment_type (payment_type)
    VALUES
        ('online'),
        ('cache'),
		('cache'),
		('cache'),
		('cache'),
		('cache'),
		('cache'),
		('cache'),
		('cache'),
		('cache');

INSERT INTO Technical_details (number_of_doors,number_of_seats,engine_type_id,body_type_id,engine_layout_type_id)
    VALUES
        (4,5,1,1,1),
        (2,2,2,2,2),
		(4,4,3,3,3),
		(4,5,4,4,4),
		(2,2,5,5,5),
		(2,2,6,6,6),
		(4,5,7,7,7),
		(4,4,8,8,8),
		(2,2,9,9,9),
		(4,5,10,10,10);

INSERT INTO Product (car_mark_id,model,color,availability,price,technical_details_id,manufacture_country_id)
    VALUES
        (1,'VAZ','black','true','1000000',1,1),
        (2,'VAZ','blue','true','1500000',2,2),
		(3,'VAZ','red','true','1500000',3,3),
		(4,'VAZ','blue','true','1500000',4,4),
		(5,'VAZ','black','true','1600000',5,5),
		(6,'VAZ','black','true','1700000',6,6),
		(7,'VAZ','white','true','1800000',7,7),
		(8,'VAZ','blue','true','2000000',8,8),
		(9,'VAZ','yellow','true','3000000',9,9),
		(10,'VAZ','gray','true','4000000',10,10);


INSERT INTO Contract (product_id,client_id,datetime,delivery,payment_type_id)
    VALUES
        (1,1,'2022-08-22', 'true',1),
        (2,2,'2022-08-21', 'true',2),
		(3,3,'2022-08-22', 'true',3),
		(4,4,'2022-08-23', 'true',4),
		(5,5,'2022-08-24', 'true',5),
		(6,6,'2022-08-25', 'true',6),
		(7,7,'2022-08-26', 'true',7),
		(8,8,'2022-08-27', 'true',8),
		(9,9,'2022-08-28', 'true',9),
		(10,10,'2022-08-29', 'true',10);


