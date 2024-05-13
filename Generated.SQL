/*
Created: 11/05/2024
Modified: 11/05/2024
Model: Microsoft SQL Server 2019
Database: MS SQL Server 2019
*/


-- Create tables section -------------------------------------------------

-- Table Usuario

CREATE TABLE [Usuario]
(
 [Id_Usuario] Int IDENTITY(1,1) NOT NULL,
 [NombreUsuario] Varchar(100) NOT NULL,
 [Contraseña] Varchar(100) NOT NULL
)
go

-- Add keys for table Usuario

ALTER TABLE [Usuario] ADD CONSTRAINT [PK_Usuario] PRIMARY KEY ([Id_Usuario])
go

ALTER TABLE [Usuario] ADD CONSTRAINT [Id_Usuario] UNIQUE CLUSTERED ([Id_Usuario])
go

-- Table Rol

CREATE TABLE [Rol]
(
 [Id_Roles] Int IDENTITY(1,1) NOT NULL,
 [Director] Varchar(100) NOT NULL,
 [Supervisor] Varchar(100) NOT NULL,
 [Digitador] Varchar(100) NOT NULL,
 [Id_Usuario] Int NOT NULL
)
go

-- Add keys for table Rol

ALTER TABLE [Rol] ADD CONSTRAINT [PK_Rol] PRIMARY KEY ([Id_Roles],[Id_Usuario])
go

ALTER TABLE [Rol] ADD CONSTRAINT [Id_Roles] UNIQUE CLUSTERED ([Id_Roles])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Rol] ADD CONSTRAINT [Tiene] FOREIGN KEY ([Id_Usuario]) REFERENCES [Usuario] ([Id_Usuario]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




