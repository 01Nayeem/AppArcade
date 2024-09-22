--Create Database AppArcade

use AppArcade

Create Table user_info
(
UserId INT IDENTITY(1,1) PRIMARY KEY,
Username VARCHAR(30) not null CHECK(Username NOT Like '%[^a-zA-Z]%'),
Email VARCHAR(50) UNIQUE not null CHECK(Email Like '%_@__%.__%'),
UserPassword VARCHAR(30) not null CHECK(LEN(UserPassword)>=6),
PhoneNumber VARCHAR(30) UNIQUE not null CHECK(LEN(PhoneNumber)= 11 AND PhoneNumber Like '0%' AND PhoneNumber NOT LIKE '%[^0-9]%')
);

--drop table user_info;
truncate table user_info
insert into user_info (Username,Email,UserPassword,PhoneNumber)values ('nayeem','nayeem.cse.20200104016@aust.edu','01676659428','01676659422');

SELECT * FROM user_info;


create table admin_info
(
AdminId INT IDENTITY(1,1) PRIMARY KEY,
AdminName varchar(50) not null check(AdminName NOT Like '%[^a-zA-Z]%'),
AdminPassword varchar(50) not null Check(LEN(AdminPassword)>=6),
AdminEmail varchar(50) not null Check(AdminEmail Like '%_@__%.__%')
);

--drop table admin_info;
Insert into admin_info(AdminName,AdminPassword,AdminEmail) values('Easin','123456','easin.cse.20200104087@asut.edu');

select * from admin_info;


CREATE TABLE Product_info 
(
Product_id INT IDENTITY(1,1) PRIMARY KEY,
Product_Name VARCHAR(50) not null,
Product_Image NVARCHAR(MAX) not null,
Product_Price DECIMAL(10,2) not null,
Product_Category NVARCHAR(255) not null,
Product_Description NVARCHAR(MAX) null,
Product_Data NVARCHAR(MAX)  null
);


insert into Product_info values('Valorant','D:\3.2 Project\FileStream\ERD.jpg',20.00,'Game','FPS','D:\3.2 Project\FileStream\ppt2.pdf')

select * from Product_info


CREATE TABLE Cart (
    CartId INT Identity(1,1) PRIMARY KEY,    
    UserId INT FOREIGN KEY REFERENCES user_info(UserId),
    Product_id INT FOREIGN KEY REFERENCES Product_info(Product_id)
);

select *from Cart


CREATE TABLE Chat
(
    ChatId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    UserId int foreign key references user_info(UserId),
    Message NVARCHAR(MAX) NOT NULL,
    Timestamp DATETIME NOT NULL DEFAULT GETUTCDATE()
);

select * from Chat
--drop table Chat
Insert into Chat values('1','Hello', '')


create table UserLibrary
(
	LibraryId Int IDENTITY(1,1) primary key,
	USERID int foreign key references user_info(UserId),
	PRODUCTID int foreign key references Product_info(Product_id),
	PDate datetime not null
);

select * from UserLibrary
insert UserLibrary values ('1','1','12/2/12')
