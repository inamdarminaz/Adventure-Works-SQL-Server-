CREATE DATABASE [ADVENTUREWORKS]

USE [ADVENTUREWORKS]
GO

CREATE TABLE [ADVENTUREWORKS].[dbo].[Person]
(
	BusinessEntityId INT PRIMARY KEY IDENTITY(100,1),
	PersonType NCHAR(2) NOT NULL,
	NameStyle VARCHAR(20) NOT NULL,
	Title NCHAR(8) NULL,
	FirstName VARCHAR(20) NOT NULL,
	MiddleName VARCHAR(20) NULL,
	LastName VARCHAR(20) NOT NULL,
	Suffix NVARCHAR(10) NULL,
	EmailPromotion INT NOT NULL,
	AdditionalContactInfo VARCHAR(30) NULL,
	Demographics VARCHAR(30) NULL,
	RowGuid INT UNIQUE,
	ModifiedDate DATETIME NOT NULL,
)

CREATE TABLE [ADVENTUREWORKS].[dbo].[EmailAddress]
(
	BusinessEntityID INT FOREIGN KEY REFERENCES [ADVENTUREWORKS].[dbo].[Person](BusinessEntityId) ,
	EmailAddressID INT PRIMARY KEY,
	EmailAddress VARCHAR(50),
	RowGuid INT IDENTITY,
	ModifiedDate DateTime NOT NULL,
)

CREATE TABLE [ADVENTUREWORKS].[dbo].[ContactType]
(
	ContactTypeID INT IDENTITY,
	Name VARCHAR(50) UNIQUE,
	ModifiedDate DATETIME
)

CREATE TABLE [ADVENTUREWORKS].[dbo].[BusinessEntityContact]
(
	BusinessEntityID INT FOREIGN KEY REFERENCES [ADVENTUREWORKS].[dbo].[Person](BusinessEntityId),
	RowGuid INT UNIQUE,
	ModifiedDate DateTime
)


CREATE TABLE [ADVENTUREWORKS].[dbo].[CountryRegion]
(
	CountryRegionCode NVARCHAR(3) PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	ModifiedDate DATETIME
)

CREATE TABLE [ADVENTUREWORKS].[dbo].[StateProvince]
(
	StateProvinceID INT IDENTITY PRIMARY KEY,
	StateProvinceCode NCHAR(3),
	CountryRegionCode NVARCHAR(3) FOREIGN KEY REFERENCES [ADVENTUREWORKS].[dbo].[CountryRegion](CountryRegionCode),
	IsOnlyStateProvinceFlag BIT,
	Name VARCHAR(50),
	TerritoryID INT NULL,
	RowGuid INT UNIQUE,
	ModifiedDate DATETIME 
)

CREATE TABLE [ADVENTUREWORKS].[dbo].[Address]
(
	AddressID INT IDENTITY PRIMARY KEY,
	AddressLine1 VARCHAR(60),
	AddressLine2 VARCHAR(60) NULL,
	City NVARCHAR(30),
	StateProvinceID INT FOREIGN KEY REFERENCES [ADVENTUREWORKS].[dbo].[StateProvince](StateProvinceID),
	PostalCode NVARCHAR(15),
	SpatialLocation BIGINT,
	ModifiedDAte DATETIME
)

CREATE TABLE [ADVENTUREWORKS].[dbo].[AddressType]
(
	AddressType INT IDENTITY PRIMARY KEY,
	Name VARCHAR(50),
	RowGuid INT UNIQUE,
	ModifiedDAte DATETIME
)

CREATE TABLE [ADVENTUREWORKS].[dbo].[BusinessEntity]
(
	BusinessEntityID INT FOREIGN KEY REFERENCES [ADVENTUREWORKS].[dbo].[Person](BusinessEntityId) ,
	RowGuid INT UNIQUE,
	ModifiedDAte DATETIME
)

CREATE TABLE [ADVENTUREWORKS].[dbo].[BusinessEntityAddress]
(
	BusinessEntityID INT FOREIGN KEY REFERENCES [ADVENTUREWORKS].[dbo].[Person](BusinessEntityId) ,
	AddressID INT FOREIGN KEY REFERENCES [ADVENTUREWORKS].[dbo].[Address](AddressID),
	AddressTypeID INT FOREIGN KEY REFERENCES [ADVENTUREWORKS].[dbo].[AddressType](AddressType),
	RowGuid INT UNIQUE,
	ModifiedDAte DATETIME
)

CREATE TABLE [ADVENTUREWORKS].[dbo].[Person_Temporal]
(
	BusinessEntityId INT PRIMARY KEY IDENTITY(100,1),
	PersonType NCHAR(2) NOT NULL,
	NameStyle VARCHAR(20) NOT NULL,
	Title NCHAR(8) NULL,
	FirstName VARCHAR(20) NOT NULL,
	MiddleName VARCHAR(20) NULL,
	LastName VARCHAR(20) NOT NULL,
	Suffix NVARCHAR(10) NULL,
	EmailPromotion INT NOT NULL,
	ValidFrom DATETIME2(7),
	ValidTo DATETIME2(7)
)

CREATE TABLE [ADVENTUREWORKS].[dbo].[Person_Temporal_History]
(
	BusinessEntityId INT PRIMARY KEY IDENTITY(100,1),
	PersonType NCHAR(2) NOT NULL,
	NameStyle VARCHAR(20) NOT NULL,
	Title NCHAR(8) NULL,
	FirstName VARCHAR(20) NOT NULL,
	MiddleName VARCHAR(20) NULL,
	LastName VARCHAR(20) NOT NULL,
	Suffix NVARCHAR(10) NULL,
	EmailPromotion INT NOT NULL,
	ValidFrom DATETIME2(7),
	ValidTo DATETIME2(7)
)