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
        ('Renat', 'Khakimov', '5546 397','+791545612');

INSERT INTO Car_mark (mark,series)
    VALUES
        ('BMW',2),
        ('BMW',1);

INSERT INTO Manufacture_country (country,city)
    VALUES
        ('Russia','Kaliningrad'),
        ('Russia','Moscow');

INSERT INTO Body_type (body_type_name)
    VALUES
        ('three-volume'),
        ('three-volume');

INSERT INTO Engine_type (engine_type_name,engine_volume,engine_power)
    VALUES
        ('3S-FE',3.8,100),
        ('3S-FS',3.5,110);

INSERT INTO Engine_layout_type (engine_layout_type_name)
    VALUES
        ('back'),
        ('back');

INSERT INTO Payment_type (payment_type)
    VALUES
        ('online'),
        ('cache');

INSERT INTO Technical_details (number_of_doors,number_of_seats,engine_type_id,body_type_id,engine_layout_type_id)
    VALUES
        (4,5,1,1,1),
        (2,2,2,2,2);

INSERT INTO Product (car_mark_id,model,color,availability,price,technical_details_id,manufacture_country_id)
    VALUES
        (1,'VAZ','black','true','1000000',1,1),
        (2,'VAZ','blue','true','1500000',2,2);


INSERT INTO Contract (product_id,client_id,datetime,delivery,payment_type_id)
    VALUES
        (1,(Select client_id from Client where passport_data='5546 789'),'2022-08-22', 'true',1),
        (2,(Select client_id from Client where passport_data='5546 397'),'2022-08-21', 'true',2);

