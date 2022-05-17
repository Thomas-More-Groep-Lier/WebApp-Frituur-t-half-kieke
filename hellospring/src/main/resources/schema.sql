
-- delete all tables to hava a clean start
drop table if exists OrderDetail;
drop table if exists ClientOrder;
drop table if exists Client;
drop table if exists Product;
drop table if exists TimeSlot;
drop table if exists AppUser;
drop table if exists Vacation;

-- Create tables
--Vacation 
 CREATE TABLE Vacation(
	Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fromDate varchar (30) NOT NULL,
	untilDate varchar (30) NOT NULL,
    PRIMARY KEY (Id)
);
--User
CREATE TABLE AppUser(
	Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	UserName varchar (30) NOT NULL,
	Password varchar (30) NOT NULL,
    PRIMARY KEY (Id)
);
--Client
CREATE TABLE Client(
	Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Firstname varchar(30) NOT NULL,
 	Lastname varchar (30) NOT NULL,
	EmailAdress varchar (20) NOT NULL,
	PhoneNumber varchar (20) NOT NULL,
    PRIMARY KEY (Id)
);
--Product
CREATE TABLE Product(
	Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Description varchar (30) NOT NULL,
	Price float(2) NOT NULL,
	Category varchar (20) NOT NULL,
	Status bit NOT NULL,
    PRIMARY KEY (Id)
);
--TimeSlot
CREATE TABLE TimeSlot(
	Id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	IsActive boolean NULL,
	SpotAvailable boolean NOT NULL,
	MaxNumberOfOrders int NOT NULL,
	OrdersPlaced int NOT NULL,
	FromTime varchar (8) NOT NULL,
	Until varchar (8) NOT NULL,
	DayOfTheWeek int NOT NULL,
    PRIMARY KEY (Id)
);
-- Associate tables
-- Client <-> TimeSlot => Order
CREATE TABLE ClientOrder(
    Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ClientId int NOT NULL,
	TimeSlotId int NOT NULL,
 	PRIMARY KEY (Id)
);
-- Order <-> Product => OrderDetail
CREATE TABLE OrderDetail(
    Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	OrderId int NOT NULL,
	ProductId int NOT NULL,
	NumberOfProducts int NOT NULL,
 	PRIMARY KEY (id)
);

-- Foreign keys
-- Reference: ClientOrder <-> Client (table: ClientOrder)
ALTER TABLE ClientOrder
    ADD FOREIGN KEY (ClientId)
    REFERENCES Client (Id);

-- Reference: ClientOrder <-> TimeSlot (table: ClientOrder)
ALTER TABLE ClientOrder
    ADD FOREIGN KEY (TimeSlotId)
    REFERENCES TimeSlot (Id);

-- Reference: OrderDetail <-> Order (table: OrderDetail)
ALTER TABLE OrderDetail
    ADD FOREIGN KEY (OrderId)
    REFERENCES ClientOrder (Id);

-- Reference: OrderDetail <-> Product (table: OrderDetail)
ALTER TABLE OrderDetail
    ADD FOREIGN KEY (ProductId)
    REFERENCES Product (Id);

