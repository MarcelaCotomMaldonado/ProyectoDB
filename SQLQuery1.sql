USE [ProyectoBD]
GO
/****** Object:  Table [dbo].[Espacio]    Script Date: 9/05/2024 16:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Espacio](
	[ID_Evento] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](max) NOT NULL,
	[Capacidad] [varchar](max) NOT NULL,
	[Estado] [varchar](max) NOT NULL,
	[Detalles] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Espacio] PRIMARY KEY CLUSTERED 
(
	[ID_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 9/05/2024 16:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evento](
	[ID_Evento] [int] IDENTITY(1,1) NOT NULL,
	[TipoEvento] [varchar](max) NOT NULL,
	[FechaEvento] [date] NOT NULL,
	[HoraEvento] [time](7) NOT NULL,
	[NumeroAsistentesEstimados] [nvarchar](max) NOT NULL,
	[ServiciosSolicitados] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[ID_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizador]    Script Date: 9/05/2024 16:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizador](
	[IDOrganizador] [tinyint] NOT NULL,
	[NombreCompleto] [varchar](max) NOT NULL,
	[Dirección] [varchar](max) NOT NULL,
	[TeléfonoCelular] [varchar](10) NOT NULL,
	[CorreoElectrónico] [varchar](max) NOT NULL,
	[ID_Evento] [int] NOT NULL,
 CONSTRAINT [PK_Organizador] PRIMARY KEY CLUSTERED 
(
	[IDOrganizador] ASC,
	[ID_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 9/05/2024 16:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[Attribute1] [int] NOT NULL,
	[ID_Evento] [int] NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[Attribute1] ASC,
	[ID_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 9/05/2024 16:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[ID_Servicio] [varchar](50) NOT NULL,
	[Descripción] [varchar](max) NOT NULL,
	[Precio] [money] NOT NULL,
	[ID_Evento] [int] NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[ID_Servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 9/05/2024 16:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID_Usuario] [varchar](50) NOT NULL,
	[NombreUsuario] [varchar](max) NOT NULL,
	[Contraseña] [varchar](max) NOT NULL,
	[Rol] [varchar](max) NOT NULL,
	[ID_Evento] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [Relationship1] FOREIGN KEY([Attribute1])
REFERENCES [dbo].[Espacio] ([ID_Evento])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [Relationship1]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [Relationship2] FOREIGN KEY([ID_Evento])
REFERENCES [dbo].[Evento] ([ID_Evento])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [Relationship2]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [Tiene] FOREIGN KEY([ID_Evento])
REFERENCES [dbo].[Espacio] ([ID_Evento])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [Tiene]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [Da] FOREIGN KEY([ID_Evento])
REFERENCES [dbo].[Evento] ([ID_Evento])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [Da]
GO