/*
Created: 1/04/2024
Modified: 12/05/2024
Model: Microsoft SQL Server 2019
Database: MS SQL Server 2019
*/


-- Create tables section -------------------------------------------------

-- Table Espacio

CREATE TABLE [Espacio] (
  [ID_Evento] Int IDENTITY(1,1) NOT NULL,  -- Consider using a dedicated ID column for Espacio
  [Tipo] Varchar(max) NOT NULL,
  [Capacidad] Varchar(max) NOT NULL,
  [Estado] Varchar(max) NOT NULL,
  [Detalles] Varchar(max) NOT NULL,
  CONSTRAINT [PK_Espacio] PRIMARY KEY ([ID_Evento])  -- Removed duplicate clustered index definition
);

-- Table Organizador

CREATE TABLE [Organizador] (
  [IDOrganizador] Tinyint NOT NULL PRIMARY KEY,
  [NombreCompleto] Varchar(max) NOT NULL,
  [Dirección] Varchar(max) NOT NULL,
  [TeléfonoCelular] Char(10) NOT NULL,
  [CorreoElectrónico] Varchar(max) NOT NULL,
  [ID_Evento] Int NOT NULL  -- Foreign key to Evento (consider if needed)
);

-- Table Evento

CREATE TABLE [Evento] (
  [ID_Evento] Int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [TipoEvento] Varchar(max) NOT NULL,
  [FechaEvento] Date NOT NULL,
  [HoraEvento] Time NOT NULL,
  [NumeroAsistentesEstimados] Nvarchar(max) NOT NULL,
  [ServiciosSolicitados] Varchar(max) NOT NULL
);

-- Table Usuario

CREATE TABLE [Usuario] (
  [Id_Usuario] Int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [NombreUsuario] Varchar(100) NOT NULL,
  [Contraseña] Varchar(100) NOT NULL,
  [Perfil] Varchar(100) NOT NULL,
  [ID_Evento] Int NULL  -- Optional foreign key reference to Evento
);

-- Table Servicio

CREATE TABLE [Servicio] (
  [ID_Servicio] Varchar(50) NOT NULL PRIMARY KEY,
  [Descripción] Varchar(max) NOT NULL,
  [Precio] Money NOT NULL,
  [ID_Evento] Int NULL  -- Optional foreign key reference to Evento
);

-- Table Reserva

CREATE TABLE [Reserva] (
  [ID_Reserva] Varchar(50) NOT NULL PRIMARY KEY,
  [ID_Evento] Int NOT NULL,  -- Foreign key to Evento
  [FechaReserva] Date NOT NULL,
  [HoraInicioReserva] Time NOT NULL,
  [HoraFinReserva] Time NOT NULL
);

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE [Reserva] ADD CONSTRAINT [FK_Reserva_Evento] FOREIGN KEY ([ID_Evento]) REFERENCES [Evento] ([ID_Evento]) ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE [Organizador] ADD CONSTRAINT [FK_Organizador_Evento] FOREIGN KEY ([ID_Evento]) REFERENCES [Evento] ([ID_Evento]) ON UPDATE NO ACTION ON DELETE NO ACTION;
