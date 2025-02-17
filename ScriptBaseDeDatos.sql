USE [master]
GO
/****** Object:  Database [CLINICA]    Script Date: 25/12/2024 21:20:47 ******/
CREATE DATABASE [CLINICA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CLINICA', FILENAME = N'C:\Base de Datos\CLINICA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CLINICA_log', FILENAME = N'C:\Base de Datos\CLINICA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CLINICA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CLINICA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CLINICA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CLINICA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CLINICA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CLINICA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CLINICA] SET ARITHABORT OFF 
GO
ALTER DATABASE [CLINICA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CLINICA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CLINICA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CLINICA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CLINICA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CLINICA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CLINICA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CLINICA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CLINICA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CLINICA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CLINICA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CLINICA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CLINICA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CLINICA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CLINICA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CLINICA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CLINICA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CLINICA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CLINICA] SET  MULTI_USER 
GO
ALTER DATABASE [CLINICA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CLINICA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CLINICA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CLINICA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CLINICA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CLINICA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CLINICA] SET QUERY_STORE = OFF
GO
USE [CLINICA]
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidades](
	[codEspecialidad_e] [char](2) NOT NULL,
	[descripcion_e] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Especialidades] PRIMARY KEY CLUSTERED 
(
	[codEspecialidad_e] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[codLoc_L] [char](4) NOT NULL,
	[descripcion_L] [varchar](50) NOT NULL,
	[codProv_L] [char](2) NOT NULL,
 CONSTRAINT [PK_Localididades] PRIMARY KEY CLUSTERED 
(
	[codLoc_L] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[legajo_M] [int] IDENTITY(1,1) NOT NULL,
	[DNI_M] [char](8) NOT NULL,
	[Nombre_M] [varchar](50) NOT NULL,
	[Apellido_M] [varchar](50) NOT NULL,
	[Sexo_M] [char](1) NOT NULL,
	[Fecha Nacimiento_M] [char](10) NOT NULL,
	[Direccion_M] [varchar](50) NOT NULL,
	[codLoc_M] [char](4) NULL,
	[codProv_M] [char](2) NOT NULL,
	[CorreoElectronico_M] [varchar](50) NULL,
	[codEspecialidad_M] [char](2) NOT NULL,
	[Rango Horario_M] [char](1) NOT NULL,
	[User_M] [varchar](50) NOT NULL,
	[Password_M] [varchar](50) NOT NULL,
	[IdNacionalidad_M] [char](2) NULL,
	[Estado_M] [int] NULL,
 CONSTRAINT [PK_Medicos] PRIMARY KEY CLUSTERED 
(
	[legajo_M] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[codProv_P] [char](2) NOT NULL,
	[descripcion_P] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[codProv_P] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nacionalidades]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nacionalidades](
	[IdNacionalidad_N] [char](2) NOT NULL,
	[Descripcion_N] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Nacionalidades] PRIMARY KEY CLUSTERED 
(
	[IdNacionalidad_N] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TraerMedicos]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TraerMedicos]
as
SELECT legajo_M AS Legajo, DNI_M as DNI, 
CONCAT(Nombre_M, ' ', Apellido_M) AS [Nombre completo], 
Sexo_M AS Sexo, [Fecha Nacimiento_M] AS [Fecha de nacimiento],
Direccion_M AS Direccion, Localidades.descripcion_L AS Localidad, 
Provincias.descripcion_P AS Provincia, 
CorreoElectronico_M AS Email, Especialidades.descripcion_e AS Especialidad,
[Rango Horario_M] AS [Horario], User_M AS Usuario, Password_M AS Contraseña, Nacionalidades.Descripcion_N AS Nacionalidad FROM (Medicos INNER JOIN Provincias	ON Medicos.codProv_M = Provincias.codProv_P) INNER JOIN Localidades ON Medicos.codLoc_M = Localidades.codLoc_L INNER JOIN Especialidades ON Medicos.codEspecialidad_M = Especialidades.codEspecialidad_e INNER JOIN Nacionalidades ON Medicos.IdNacionalidad_M = Nacionalidades.IdNacionalidad_N
where Estado_M = 1
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[DNI_Pac] [char](8) NOT NULL,
	[Nombre_Pac] [varchar](50) NOT NULL,
	[Apellido_Pac] [varchar](50) NOT NULL,
	[Fecha Nacimiento_Pac] [char](10) NOT NULL,
	[Sexo_Pac] [char](1) NOT NULL,
	[Direccion_Pac] [varchar](50) NOT NULL,
	[CodLoc_Pac] [char](2) NOT NULL,
	[CodProv_Pac] [char](2) NOT NULL,
	[IdNacionalidad_Pac] [char](2) NOT NULL,
	[CorreoElectronico_Pac] [varchar](50) NULL,
	[Telefono_Pac] [varchar](20) NULL,
	[Estado_Pac] [int] NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[DNI_Pac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TraerPacientesModificar]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create   View [dbo].[TraerPacientesModificar]
As 
Select DNI_Pac,Nombre_Pac,Apellido_Pac,[Fecha Nacimiento_Pac] as FechaNacimiento_Pac,Sexo_Pac,Direccion_Pac,CodProv_Pac,Provincias.descripcion_P,CodLoc_Pac,Localidades.descripcion_L,IdNacionalidad_Pac,Nacionalidades.Descripcion_N,CorreoElectronico_Pac,Telefono_Pac,Estado_Pac,'Estado_Descripcion' = case when Estado_Pac = 1 then 'Activo' when Estado_Pac = 0 then 'Inactivo' end
From Pacientes
Inner Join Provincias On Pacientes.CodProv_Pac = Provincias.codProv_P
Inner Join Localidades On Pacientes.CodLoc_Pac = Localidades.codLoc_L
Inner Join Nacionalidades On Pacientes.IdNacionalidad_Pac = Nacionalidades.IdNacionalidad_N
GO
/****** Object:  View [dbo].[TraerPerfilMedico]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TraerPerfilMedico]
AS
SELECT legajo_M, DNI_M, CONCAT(Nombre_M, ' ', Apellido_M) AS NombreCompleto, Sexo_M,[Fecha Nacimiento_M], CorreoElectronico_M, 
Especialidades.descripcion_e,IdNacionalidad_M, Nacionalidades.Descripcion_N
FROM Medicos 
	INNER JOIN Nacionalidades 
	ON IdNacionalidad_M = IdNacionalidad_N 
		INNER JOIN Especialidades 
		ON codEspecialidad_M = codEspecialidad_e
GO
/****** Object:  Table [dbo].[Dias]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dias](
	[codDia_d] [char](2) NOT NULL,
	[descripcion_d] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dias] PRIMARY KEY CLUSTERED 
(
	[codDia_d] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnosJunio]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnosJunio](
	[Id_turno] [int] IDENTITY(1,1) NOT NULL,
	[Legajo_TJ] [int] NOT NULL,
	[CodDia_TJ] [char](2) NOT NULL,
	[CodHorario_TJ] [char](5) NOT NULL,
	[CodFecha_TJ] [char](5) NOT NULL,
	[DNI_TJ] [char](8) NULL,
	[Disponibilidad_TJ] [bit] NOT NULL,
	[Asistío_TJ] [bit] NULL,
	[Observacion_TJ] [varchar](150) NULL,
	[MedicoActivo_TJ] [bit] NOT NULL,
 CONSTRAINT [PK_TurnosJunio] PRIMARY KEY CLUSTERED 
(
	[Id_turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TraerTurnos]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[TraerTurnos]
as
select Id_turno, (Medicos.Apellido_M+', '+Medicos.Nombre_M) as Medico, Especialidades.descripcion_e as Especialidad,Dias.descripcion_d as Dia, CodHorario_TJ as Horario, CodFecha_TJ as Fecha
from ((TurnosJunio inner join Medicos 
on TurnosJunio.Legajo_TJ = Medicos.legajo_M) inner join Dias
on TurnosJunio.CodDia_TJ = Dias.codDia_d) inner join Especialidades
on Medicos.codEspecialidad_M = Especialidades.codEspecialidad_e
GO
/****** Object:  View [dbo].[TraerPacientes]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[TraerPacientes]
AS
	SELECT DNI_Pac AS DNI, CONCAT(Nombre_Pac,' ' ,Apellido_Pac) AS [Nombre completo], Sexo_Pac AS Sexo, [Fecha Nacimiento_Pac] 
	AS [Fecha de nacimiento], Direccion_Pac AS Direccion, Localidades.descripcion_L AS Localidad, Provincias.descripcion_P AS Provincia,
	Nacionalidades.Descripcion_N AS Nacionalidad,CorreoElectronico_Pac AS [Correo Electronico], Telefono_Pac AS Telefono
	FROM Pacientes
		INNER JOIN Provincias ON CodProv_Pac = codProv_P
			INNER JOIN Localidades ON CodLoc_Pac = codLoc_L
				INNER JOIN Nacionalidades ON IdNacionalidad_Pac = IdNacionalidad_N
	WHERE Estado_Pac = 1
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[NombreUser_A] [varchar](50) NOT NULL,
	[ContraseñaUser_A] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NombreUser_A] PRIMARY KEY CLUSTERED 
(
	[NombreUser_A] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiasMedicos]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiasMedicos](
	[legajo_DM] [int] NOT NULL,
	[codDia_DM] [char](2) NOT NULL,
	[codHorario_DM] [char](5) NOT NULL,
	[MedicoActivo_DM] [bit] NOT NULL,
 CONSTRAINT [PK_DiasMedicos] PRIMARY KEY CLUSTERED 
(
	[legajo_DM] ASC,
	[codDia_DM] ASC,
	[codHorario_DM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FechasJunio]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FechasJunio](
	[codFecha_f] [char](5) NOT NULL,
	[codDia_f] [char](2) NOT NULL,
 CONSTRAINT [PK_FechasJunio] PRIMARY KEY CLUSTERED 
(
	[codFecha_f] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horarios]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horarios](
	[codHorario_h] [char](5) NOT NULL,
	[descripcion_h] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Horarios] PRIMARY KEY CLUSTERED 
(
	[codHorario_h] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turnos]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turnos](
	[NumTurno_tu] [int] NOT NULL,
	[LegajoMed_tu] [char](8) NOT NULL,
	[DNIPaciente_tu] [char](8) NOT NULL,
	[Nombre_tu] [varchar](20) NOT NULL,
	[Apellido_tu] [varchar](30) NOT NULL,
	[Dia_tu] [char](9) NOT NULL,
	[Hora_tu] [time](7) NULL,
	[Fecha_tu] [date] NULL,
	[Presencia_tu] [char](8) NOT NULL,
	[Observacion_tu] [text] NOT NULL,
 CONSTRAINT [PK_Turnos] PRIMARY KEY CLUSTERED 
(
	[NumTurno_tu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[CodUsuario_us] [int] IDENTITY(1,1) NOT NULL,
	[Usuario_us] [varchar](20) NOT NULL,
	[Contrasenia_us] [varchar](20) NOT NULL,
	[Legajo_us] [char](8) NULL,
	[TipoUsuario_us] [bit] NOT NULL,
	[Estado_us] [bit] NOT NULL,
 CONSTRAINT [Pk_Usuarios] PRIMARY KEY CLUSTERED 
(
	[CodUsuario_us] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admins] ([NombreUser_A], [ContraseñaUser_A]) VALUES (N'carlos', N'123')
INSERT [dbo].[Admins] ([NombreUser_A], [ContraseñaUser_A]) VALUES (N'teresa', N'456')
GO
INSERT [dbo].[Dias] ([codDia_d], [descripcion_d]) VALUES (N'01', N'Lunes')
INSERT [dbo].[Dias] ([codDia_d], [descripcion_d]) VALUES (N'02', N'Martes')
INSERT [dbo].[Dias] ([codDia_d], [descripcion_d]) VALUES (N'03', N'Miercoles')
INSERT [dbo].[Dias] ([codDia_d], [descripcion_d]) VALUES (N'04', N'Jueves')
INSERT [dbo].[Dias] ([codDia_d], [descripcion_d]) VALUES (N'05', N'Viernes')
INSERT [dbo].[Dias] ([codDia_d], [descripcion_d]) VALUES (N'06', N'Sabado')
GO
INSERT [dbo].[DiasMedicos] ([legajo_DM], [codDia_DM], [codHorario_DM], [MedicoActivo_DM]) VALUES (50, N'01', N'08.00', 0)
INSERT [dbo].[DiasMedicos] ([legajo_DM], [codDia_DM], [codHorario_DM], [MedicoActivo_DM]) VALUES (50, N'01', N'09.00', 0)
INSERT [dbo].[DiasMedicos] ([legajo_DM], [codDia_DM], [codHorario_DM], [MedicoActivo_DM]) VALUES (50, N'01', N'10.00', 0)
INSERT [dbo].[DiasMedicos] ([legajo_DM], [codDia_DM], [codHorario_DM], [MedicoActivo_DM]) VALUES (50, N'01', N'11.00', 0)
INSERT [dbo].[DiasMedicos] ([legajo_DM], [codDia_DM], [codHorario_DM], [MedicoActivo_DM]) VALUES (50, N'01', N'12.00', 0)
INSERT [dbo].[DiasMedicos] ([legajo_DM], [codDia_DM], [codHorario_DM], [MedicoActivo_DM]) VALUES (51, N'01', N'13.00', 1)
INSERT [dbo].[DiasMedicos] ([legajo_DM], [codDia_DM], [codHorario_DM], [MedicoActivo_DM]) VALUES (51, N'01', N'14.00', 1)
INSERT [dbo].[DiasMedicos] ([legajo_DM], [codDia_DM], [codHorario_DM], [MedicoActivo_DM]) VALUES (51, N'01', N'15.00', 1)
INSERT [dbo].[DiasMedicos] ([legajo_DM], [codDia_DM], [codHorario_DM], [MedicoActivo_DM]) VALUES (51, N'01', N'16.00', 1)
GO
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'01', N'Cardiologia')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'02', N'Dermatologia ')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'03', N'Endocrinología')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'04', N'Gastroenterología')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'05', N'Geriatría')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'06', N'Ginecología y Obstetricia
')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'07', N'Hematología')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'08', N'Infectología')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'09', N'Medicina Familiar
')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'10', N'Medicina General
')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'11', N'Medicina Interna
')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'12', N'Nefrología')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'13', N'Neumología')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'14', N'Neurología')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'15', N'Oftalmología
')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'16', N'Oncología')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'17', N'Ortopedia y Traumatología
')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'18', N'Otorrinolaringología')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'19', N'Pediatría')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'20', N'Psiquiatría')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'21', N'Radiología')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'22', N'Reumatología')
INSERT [dbo].[Especialidades] ([codEspecialidad_e], [descripcion_e]) VALUES (N'23', N'Urología ')
GO
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'01/01', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'01/02', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'01/03', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'01/06', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'02/01', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'02/12', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'03/01', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'03/02', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'03/03', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'03/06', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'03/12', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'04/01', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'04/02', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'04/03', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'04/06', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'04/12', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'05/02', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'05/03', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'05/06', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'05/12', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'06/01', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'06/02', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'06/03', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'06/06', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'06/12', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'07/01', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'07/02', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'07/03', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'07/06', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'07/12', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'08/01', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'08/02', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'08/03', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'08/06', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'09/01', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'09/12', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'10/01', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'10/02', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'10/03', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'10/06', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'10/12', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'11/01', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'11/02', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'11/03', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'11/06', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'11/12', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'12/02', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'12/03', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'12/06', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'12/12', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'13/01', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'13/02', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'13/03', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'13/06', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'13/12', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'14/01', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'14/02', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'14/03', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'14/06', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'14/12', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'15/01', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'15/02', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'15/03', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'15/06', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'16/01', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'16/12', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'17/01', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'17/02', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'17/03', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'17/06', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'17/12', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'18/01', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'18/02', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'18/03', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'18/06', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'18/12', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'19/02', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'19/03', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'19/06', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'19/12', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'20/01', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'20/02', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'20/03', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'20/06', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'20/12', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'21/01', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'21/02', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'21/03', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'21/06', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'21/12', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'22/01', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'22/02', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'22/03', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'22/06', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'23/01', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'23/12', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'24/01', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'24/02', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'24/03', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'24/06', N'01')
GO
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'24/12', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'25/01', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'25/02', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'25/03', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'25/06', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'25/12', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'26/02', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'26/03', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'26/06', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'26/12', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'27/01', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'27/02', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'27/03', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'27/06', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'27/12', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'28/01', N'02')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'28/02', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'28/03', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'28/06', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'28/12', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'29/01', N'03')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'29/03', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'29/06', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'29/11', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'30/01', N'04')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'30/11', N'06')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'30/12', N'01')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'31/01', N'05')
INSERT [dbo].[FechasJunio] ([codFecha_f], [codDia_f]) VALUES (N'31/12', N'02')
GO
INSERT [dbo].[Horarios] ([codHorario_h], [descripcion_h]) VALUES (N'08.00', N'M')
INSERT [dbo].[Horarios] ([codHorario_h], [descripcion_h]) VALUES (N'09.00', N'M')
INSERT [dbo].[Horarios] ([codHorario_h], [descripcion_h]) VALUES (N'10.00', N'M')
INSERT [dbo].[Horarios] ([codHorario_h], [descripcion_h]) VALUES (N'11.00', N'M')
INSERT [dbo].[Horarios] ([codHorario_h], [descripcion_h]) VALUES (N'12.00', N'M')
INSERT [dbo].[Horarios] ([codHorario_h], [descripcion_h]) VALUES (N'13.00', N'T')
INSERT [dbo].[Horarios] ([codHorario_h], [descripcion_h]) VALUES (N'14.00', N'T')
INSERT [dbo].[Horarios] ([codHorario_h], [descripcion_h]) VALUES (N'15.00', N'T')
INSERT [dbo].[Horarios] ([codHorario_h], [descripcion_h]) VALUES (N'16.00', N'T')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1   ', N'25 De Mayo', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'10  ', N'Bahía Blanca ', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'100 ', N'Olavarría', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1000', N'Aldea Valle María', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1001', N'Altamirano Sur', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1002', N'Antelo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1003', N'Antonio Tomás', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1004', N'Aranguren', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1005', N'Arroyo Barú', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1006', N'Arroyo Burgos', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1007', N'Arroyo Clé', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1008', N'Arroyo Corralito', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1009', N'Arroyo del Medio', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'101 ', N'Partido de la Costa', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1010', N'Arroyo Maturrango', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1011', N'Arroyo Palo Seco', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1012', N'Banderas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1013', N'Basavilbaso', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1014', N'Betbeder', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1015', N'Bovril', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1016', N'Caseros', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1017', N'Ceibas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1018', N'Cerrito', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1019', N'Chajarí', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'102 ', N'Pehuajó', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1020', N'Chilcas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1021', N'Clodomiro Ledesma', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1022', N'Col. Alemana', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1023', N'Col. Avellaneda', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1024', N'Col. Avigdor', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1025', N'Col. Ayuí', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1026', N'Col. Baylina', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1027', N'Col. Carrasco', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1028', N'Col. Celina', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1029', N'Col. Cerrito', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'103 ', N'Pellegrini', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1030', N'Col. Crespo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1031', N'Col. Elia', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1032', N'Col. Ensayo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1033', N'Col. Gral. Roca', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1034', N'Col. La Argentina', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1035', N'Col. Merou', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1036', N'Col. Oficial Nª3', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1037', N'Col. Oficial Nº13', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1038', N'Col. Oficial Nº14', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1039', N'Col. Oficial Nº5', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'104 ', N'Pergamino', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1040', N'Col. Reffino', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1041', N'Col. Tunas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1042', N'Col. Viraró', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1043', N'Colón', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1044', N'Concepción del Uruguay', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1045', N'Concordia', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1046', N'Conscripto Bernardi', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1047', N'Costa Grande', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1048', N'Costa San Antonio', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1049', N'Costa Uruguay N.', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'105 ', N'Pigüé', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1050', N'Costa Uruguay S.', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1051', N'Crespo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1052', N'Crucecitas 3ª', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1053', N'Crucecitas 7ª', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1054', N'Crucecitas 8ª', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1055', N'Cuchilla Redonda', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1056', N'Curtiembre', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1057', N'Diamante', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1058', N'Distrito 6º', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1059', N'Distrito Chañar', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'106 ', N'Pila', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1060', N'Distrito Chiqueros', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1061', N'Distrito Cuarto', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1062', N'Distrito Diego López', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1063', N'Distrito Pajonal', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1064', N'Distrito Sauce', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1065', N'Distrito Tala', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1066', N'Distrito Talitas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1067', N'Don Cristóbal 1ª Sección', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1068', N'Don Cristóbal 2ª Sección', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1069', N'Durazno', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'107 ', N'Pilar', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1070', N'El Cimarrón', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1071', N'El Gramillal', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1072', N'El Palenque', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1073', N'El Pingo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1074', N'El Quebracho', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1075', N'El Redomón', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1076', N'El Solar', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1077', N'Enrique Carbo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1078', N'9', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1079', N'Espinillo N.', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'108 ', N'Pinamar', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1080', N'Estación Campos', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1081', N'Estación Escriña', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1082', N'Estación Lazo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1083', N'Estación Raíces', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1084', N'Estación Yerúa', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1085', N'Estancia Grande', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1086', N'Estancia Líbaros', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1087', N'Estancia Racedo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1088', N'Estancia Solá', N'9 ')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1089', N'Estancia Yuquerí', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'109 ', N'Pinar del Sol', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1090', N'Estaquitas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1091', N'Faustino M. Parera', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1092', N'Febre', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1093', N'Federación', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1094', N'Federal', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1095', N'Gdor. Echagüe', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1096', N'Gdor. Mansilla', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1097', N'Gilbert', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1098', N'González Calderón', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1099', N'Gral. Almada', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'11  ', N'Balcarce', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'110 ', N'Polvorines', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1100', N'Gral. Alvear', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1101', N'Gral. Campos', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1102', N'Gral. Galarza', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1103', N'Gral. Ramírez', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1104', N'Gualeguay', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1105', N'Gualeguaychú', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1106', N'Gualeguaycito', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1107', N'Guardamonte', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1108', N'Hambis', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1109', N'Hasenkamp', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'111 ', N'Pte. Perón', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1110', N'Hernandarias', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1111', N'Hernández', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1112', N'Herrera', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1113', N'Hinojal', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1114', N'Hocker', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1115', N'Ing. Sajaroff', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1116', N'Irazusta', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1117', N'Isletas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1118', N'J.J De Urquiza', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1119', N'Jubileo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'112 ', N'Puán', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1120', N'La Clarita', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1121', N'La Criolla', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1122', N'La Esmeralda', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1123', N'La Florida', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1124', N'La Fraternidad', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1125', N'La Hierra', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1126', N'La Ollita', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1127', N'La Paz', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1128', N'La Picada', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1129', N'La Providencia', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'113 ', N'Punta Indio', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1130', N'La Verbena', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1131', N'Laguna Benítez', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1132', N'Larroque', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1133', N'Las Cuevas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1134', N'Las Garzas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1135', N'Las Guachas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1136', N'Las Mercedes', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1137', N'Las Moscas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1138', N'Las Mulitas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1139', N'Las Toscas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'114 ', N'Ramallo', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1140', N'Laurencena', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1141', N'Libertador San Martín', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1142', N'Loma Limpia', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1143', N'Los Ceibos', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1144', N'Los Charruas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1145', N'Los Conquistadores', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1146', N'Lucas González', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1147', N'Lucas N.', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1148', N'Lucas S. 1ª', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1149', N'Lucas S. 2ª', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'115 ', N'Rauch', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1150', N'Maciá', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1151', N'María Grande', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1152', N'María Grande 2ª', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1153', N'Médanos', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1154', N'Mojones N.', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1155', N'Mojones S.', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1156', N'Molino Doll', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1157', N'Monte Redondo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1158', N'Montoya', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1159', N'Mulas Grandes', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'116 ', N'Rivadavia', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1160', N'Ñancay', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1161', N'Nogoyá', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1162', N'Nueva Escocia', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1163', N'Nueva Vizcaya', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1164', N'Ombú', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1165', N'Oro Verde', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1166', N'Paraná', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1167', N'Pasaje Guayaquil', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1168', N'Pasaje Las Tunas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1169', N'Paso de La Arena', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'117 ', N'Rojas', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1170', N'Paso de La Laguna', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1171', N'Paso de Las Piedras', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1172', N'Paso Duarte', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1173', N'Pastor Britos', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1174', N'Pedernal', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1175', N'Perdices', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1176', N'Picada Berón', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1177', N'Piedras Blancas', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1178', N'Primer Distrito Cuchilla', N'9 ')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1179', N'Primero de Mayo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'118 ', N'Roque Pérez', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1180', N'Pronunciamiento', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1181', N'Pto. Algarrobo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1182', N'Pto. Ibicuy', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1183', N'Pueblo Brugo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1184', N'Pueblo Cazes', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1185', N'Pueblo Gral. Belgrano', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1186', N'Pueblo Liebig', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1187', N'Puerto Yeruá', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1188', N'Punta del Monte', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1189', N'Quebracho', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'119 ', N'Saavedra', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1190', N'Quinto Distrito', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1191', N'Raices Oeste', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1192', N'Rincón de Nogoyá', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1193', N'Rincón del Cinto', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1194', N'Rincón del Doll', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1195', N'Rincón del Gato', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1196', N'Rocamora', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1197', N'Rosario del Tala', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1198', N'San Benito', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1199', N'San Cipriano', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'12  ', N'Baradero', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'120 ', N'Saladillo', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1200', N'San Ernesto', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1201', N'San Gustavo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1202', N'San Jaime', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1203', N'San José', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1204', N'San José de Feliciano', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1205', N'San Justo', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1206', N'San Marcial', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1207', N'San Pedro', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1208', N'San Ramírez', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1209', N'San Ramón', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'121 ', N'Salliqueló', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1210', N'San Roque', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1211', N'San Salvador', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1212', N'San Víctor', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1213', N'Santa Ana', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1214', N'Santa Anita', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1215', N'Santa Elena', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1216', N'Santa Lucía', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1217', N'Santa Luisa', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1218', N'Sauce de Luna', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1219', N'Sauce Montrull', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'122 ', N'Salto', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1220', N'Sauce Pinto', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1221', N'Sauce Sur', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1222', N'Seguí', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1223', N'Sir Leonard', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1224', N'Sosa', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1225', N'Tabossi', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1226', N'Tezanos Pinto', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1227', N'Ubajay', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1228', N'Urdinarrain', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1229', N'Veinte de Septiembre', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'123 ', N'San Andrés de Giles', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1230', N'Viale', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1231', N'Victoria', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1232', N'Villa Clara', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1233', N'Villa del Rosario', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1234', N'Villa Domínguez', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1235', N'Villa Elisa', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1236', N'Villa Fontana', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1237', N'Villa Gdor. Etchevehere', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1238', N'Villa Mantero', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1239', N'Villa Paranacito', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'124 ', N'San Antonio de Areco', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1240', N'Villa Urquiza', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1241', N'Villaguay', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1242', N'Walter Moss', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1243', N'Yacaré', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1244', N'Yeso Oeste', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1245', N'Buena Vista', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1246', N'Clorinda', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1247', N'Col. Pastoril', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1248', N'Cte. Fontana', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1249', N'El Colorado', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'125 ', N'San Antonio de Padua', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1250', N'El Espinillo', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1251', N'Estanislao Del Campo', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1252', N'10', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1253', N'Fortín Lugones', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1254', N'Gral. Lucio V. Mansilla', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1255', N'Gral. Manuel Belgrano', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1256', N'Gral. Mosconi', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1257', N'Gran Guardia', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1258', N'Herradura', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1259', N'Ibarreta', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'126 ', N'San Bernardo', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1260', N'Ing. Juárez', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1261', N'Laguna Blanca', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1262', N'Laguna Naick Neck', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1263', N'Laguna Yema', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1264', N'Las Lomitas', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1265', N'Los Chiriguanos', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1266', N'Mayor V. Villafañe', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1267', N'Misión San Fco.', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1268', N'Palo Santo', N'10')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1269', N'Pirané', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'127 ', N'San Cayetano', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1270', N'Pozo del Maza', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1271', N'Riacho He-He', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1272', N'San Hilario', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1273', N'San Martín II', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1274', N'Siete Palmas', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1275', N'Subteniente Perín', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1276', N'Tres Lagunas', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1277', N'Villa Dos Trece', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1278', N'Villa Escolar', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1279', N'Villa Gral. Güemes', N'10')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'128 ', N'San Clemente del Tuyú', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1280', N'Abdon Castro Tolay', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1281', N'Abra Pampa', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1282', N'Abralaite', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1283', N'Aguas Calientes', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1284', N'Arrayanal', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1285', N'Barrios', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1286', N'Caimancito', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1287', N'Calilegua', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1288', N'Cangrejillos', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1289', N'Caspala', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'129 ', N'San Nicolás', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1290', N'Catuá', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1291', N'Cieneguillas', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1292', N'Coranzulli', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1293', N'Cusi-Cusi', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1294', N'El Aguilar', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1295', N'El Carmen', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1296', N'El Cóndor', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1297', N'El Fuerte', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1298', N'El Piquete', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1299', N'El Talar', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'13  ', N'Benito Juárez', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'130 ', N'San Pedro', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1300', N'Fraile Pintado', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1301', N'Hipólito Yrigoyen', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1302', N'Huacalera', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1303', N'Humahuaca', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1304', N'La Esperanza', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1305', N'La Mendieta', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1306', N'La Quiaca', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1307', N'Ledesma', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1308', N'Libertador Gral. San Martin', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1309', N'Maimara', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'131 ', N'San Vicente', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1310', N'Mina Pirquitas', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1311', N'Monterrico', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1312', N'Palma Sola', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1313', N'Palpalá', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1314', N'Pampa Blanca', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1315', N'Pampichuela', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1316', N'Perico', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1317', N'Puesto del Marqués', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1318', N'Puesto Viejo', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1319', N'Pumahuasi', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'132 ', N'Santa Teresita', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1320', N'Purmamarca', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1321', N'Rinconada', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1322', N'Rodeitos', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1323', N'Rosario de Río Grande', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1324', N'San Antonio', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1325', N'San Francisco', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1326', N'San Pedro', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1327', N'San Rafael', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1328', N'San Salvador', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1329', N'Santa Ana', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'133 ', N'Suipacha', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1330', N'Santa Catalina', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1331', N'Santa Clara', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1332', N'Susques', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1333', N'Tilcara', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1334', N'Tres Cruces', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1335', N'Tumbaya', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1336', N'Valle Grande', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1337', N'Vinalito', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1338', N'Volcán', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1339', N'Yala', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'134 ', N'Tandil', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1340', N'Yaví', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1341', N'Yuto', N'11')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1342', N'Abramo', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1343', N'Adolfo Van Praet', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1344', N'Agustoni', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1345', N'Algarrobo del Aguila', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1346', N'Alpachiri', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1347', N'Alta Italia', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1348', N'Anguil', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1349', N'Arata', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'135 ', N'Tapalqué', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1350', N'Ataliva Roca', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1351', N'Bernardo Larroude', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1352', N'Bernasconi', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1353', N'Caleufú', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1354', N'Carro Quemado', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1355', N'Catriló', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1356', N'Ceballos', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1357', N'Chacharramendi', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1358', N'Col. Barón', N'12')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1359', N'Col. Santa María', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'136 ', N'Tordillo', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1360', N'Conhelo', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1361', N'Coronel Hilario Lagos', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1362', N'Cuchillo-Có', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1363', N'Doblas', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1364', N'Dorila', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1365', N'Eduardo Castex', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1366', N'Embajador Martini', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1367', N'Falucho', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1368', N'Gral. Acha', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1369', N'Gral. Manuel Campos', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'137 ', N'Tornquist', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1370', N'Gral. Pico', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1371', N'Guatraché', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1372', N'Ing. Luiggi', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1373', N'Intendente Alvear', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1374', N'Jacinto Arauz', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1375', N'La Adela', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1376', N'La Humada', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1377', N'La Maruja', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1378', N'12', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1379', N'La Reforma', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'138 ', N'Trenque Lauquen', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1380', N'Limay Mahuida', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1381', N'Lonquimay', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1382', N'Loventuel', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1383', N'Luan Toro', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1384', N'Macachín', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1385', N'Maisonnave', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1386', N'Mauricio Mayer', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1387', N'Metileo', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1388', N'Miguel Cané', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1389', N'Miguel Riglos', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'139 ', N'Tres Lomas', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1390', N'Monte Nievas', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1391', N'Parera', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1392', N'Perú', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1393', N'Pichi-Huinca', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1394', N'Puelches', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1395', N'Puelén', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1396', N'Quehue', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1397', N'Quemú Quemú', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1398', N'Quetrequén', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1399', N'Rancul', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'14  ', N'Berisso', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'140 ', N'Villa Gesell', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1400', N'Realicó', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1401', N'Relmo', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1402', N'Rolón', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1403', N'Rucanelo', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1404', N'Sarah', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1405', N'Speluzzi', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1406', N'Sta. Isabel', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1407', N'Sta. Rosa', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1408', N'Sta. Teresa', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1409', N'Telén', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'141 ', N'Villarino', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1410', N'Toay', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1411', N'Tomas M. de Anchorena', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1412', N'Trenel', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1413', N'Unanue', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1414', N'Uriburu', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1415', N'Veinticinco de Mayo', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1416', N'Vertiz', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1417', N'Victorica', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1418', N'Villa Mirasol', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1419', N'Winifreda', N'12')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'142 ', N'Zárate', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1420', N'Arauco', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1421', N'Capital', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1422', N'Castro Barros', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1423', N'Chamical', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1424', N'Chilecito', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1425', N'Coronel F. Varela', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1426', N'Famatina', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1427', N'Gral. A.V.Peñaloza', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1428', N'Gral. Belgrano', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1429', N'Gral. J.F. Quiroga', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'143 ', N'11 de Septiembre', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1430', N'Gral. Lamadrid', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1431', N'Gral. Ocampo', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1432', N'Gral. San Martín', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1433', N'Independencia', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1434', N'Rosario Penaloza', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1435', N'San Blas de Los Sauces', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1436', N'Sanagasta', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1437', N'Vinchina', N'13')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1438', N'Capital', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1439', N'Chacras de Coria', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'144 ', N'20 de Junio', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1440', N'Dorrego', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1441', N'Gllen', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1442', N'Godoy Cruz', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1443', N'Gral. Alvear', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1444', N'Guaymallén', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1445', N'Junín', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1446', N'La Paz', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1447', N'Las Heras', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1448', N'Lavalle', N'14')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1449', N'Luján', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'145 ', N'25 de Mayo', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1450', N'Luján De Cuyo', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1451', N'Maipú', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1452', N'Malargüe', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1453', N'Rivadavia', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1454', N'San Carlos', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1455', N'San Martín', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1456', N'San Rafael', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1457', N'Sta. Rosa', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1458', N'Tunuyán', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1459', N'Tupungato', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'146 ', N'Acassuso', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1460', N'Villa Nueva', N'14')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1461', N'Alba Posse', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1462', N'Almafuerte', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1463', N'Apóstoles', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1464', N'Aristóbulo Del Valle', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1465', N'Arroyo Del Medio', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1466', N'Azara', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1467', N'Bdo. De Irigoyen', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1468', N'Bonpland', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1469', N'Caá Yari', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'147 ', N'Adrogué', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1470', N'Campo Grande', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1471', N'Campo Ramón', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1472', N'Campo Viera', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1473', N'Candelaria', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1474', N'Capioví', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1475', N'Caraguatay', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1476', N'Cdte. Guacurarí', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1477', N'Cerro Azul', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1478', N'Cerro Corá', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1479', N'Col. Alberdi', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'148 ', N'Aldo Bonzi', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1480', N'Col. Aurora', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1481', N'Col. Delicia', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1482', N'Col. Polana', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1483', N'Col. Victoria', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1484', N'Col. Wanda', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1485', N'Concepción De La Sierra', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1486', N'Corpus', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1487', N'Dos Arroyos', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1488', N'Dos de Mayo', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1489', N'El Alcázar', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'149 ', N'Área Reserva Cinturón Ecológico', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1490', N'El Dorado', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1491', N'El Soberbio', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1492', N'Esperanza', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1493', N'F. Ameghino', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1494', N'Fachinal', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1495', N'Garuhapé', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1496', N'Garupá', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1497', N'Gdor. López', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1498', N'Gdor. Roca', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1499', N'Gral. Alvear', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'15  ', N'Bolívar', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'150 ', N'Avellaneda', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1500', N'Gral. Urquiza', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1501', N'Guaraní', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1502', N'H. Yrigoyen', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1503', N'Iguazú', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1504', N'Itacaruaré', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1505', N'Jardín América', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1506', N'Leandro N. Alem', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1507', N'Libertad', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1508', N'Loreto', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1509', N'Los Helechos', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'151 ', N'Banfield', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1510', N'Mártires', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1511', N'15', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1512', N'Mojón Grande', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1513', N'Montecarlo', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1514', N'Nueve de Julio', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1515', N'Oberá', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1516', N'Olegario V. Andrade', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1517', N'Panambí', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1518', N'Posadas', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1519', N'Profundidad', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'152 ', N'Barrio Parque', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1520', N'Pto. Iguazú', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1521', N'Pto. Leoni', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1522', N'Pto. Piray', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1523', N'Pto. Rico', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1524', N'Ruiz de Montoya', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1525', N'San Antonio', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1526', N'San Ignacio', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1527', N'San Javier', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1528', N'San José', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1529', N'San Martín', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'153 ', N'Barrio Santa Teresita', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1530', N'San Pedro', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1531', N'San Vicente', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1532', N'Santiago De Liniers', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1533', N'Santo Pipo', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1534', N'Sta. Ana', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1535', N'Sta. María', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1536', N'Tres Capones', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1537', N'Veinticinco de Mayo', N'15')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1538', N'Wanda', N'15')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1539', N'Aguada San Roque', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'154 ', N'Beccar', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1540', N'Aluminé', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1541', N'Andacollo', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1542', N'Añelo', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1543', N'Bajada del Agrio', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1544', N'Barrancas', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1545', N'Buta Ranquil', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1546', N'Capital', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1547', N'Caviahué', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1548', N'Centenario', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1549', N'Chorriaca', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'155 ', N'Bella Vista', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1550', N'Chos Malal', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1551', N'Cipolletti', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1552', N'Covunco Abajo', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1553', N'Coyuco Cochico', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1554', N'Cutral Có', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1555', N'El Cholar', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1556', N'El Huecú', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1557', N'El Sauce', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1558', N'Guañacos', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1559', N'Huinganco', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'156 ', N'Berazategui', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1560', N'Las Coloradas', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1561', N'Las Lajas', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1562', N'Las Ovejas', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1563', N'Loncopué', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1564', N'Los Catutos', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1565', N'Los Chihuidos', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1566', N'Los Miches', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1567', N'Manzano Amargo', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1568', N'16', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1569', N'Octavio Pico', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'157 ', N'Bernal Este', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1570', N'Paso Aguerre', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1571', N'Picún Leufú', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1572', N'Piedra del Aguila', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1573', N'Pilo Lil', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1574', N'Plaza Huincul', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1575', N'Plottier', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1576', N'Quili Malal', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1577', N'Ramón Castro', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1578', N'Rincón de Los Sauces', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1579', N'San Martín de Los Andes', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'158 ', N'Bernal Oeste', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1580', N'San Patricio del Chañar', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1581', N'Santo Tomás', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1582', N'Sauzal Bonito', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1583', N'Senillosa', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1584', N'Taquimilán', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1585', N'Tricao Malal', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1586', N'Varvarco', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1587', N'Villa Curí Leuvu', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1588', N'Villa del Nahueve', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1589', N'Villa del Puente Picún Leuvú', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'159 ', N'Billinghurst', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1590', N'Villa El Chocón', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1591', N'Villa La Angostura', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1592', N'Villa Pehuenia', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1593', N'Villa Traful', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1594', N'Vista Alegre', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1595', N'Zapala', N'16')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1596', N'Aguada Cecilio', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1597', N'Aguada de Guerra', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1598', N'Allén', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1599', N'Arroyo de La Ventana', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'16  ', N'Bragado', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'160 ', N'Boulogne', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1600', N'Arroyo Los Berros', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1601', N'Bariloche', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1602', N'Calte. Cordero', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1603', N'Campo Grande', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1604', N'Catriel', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1605', N'Cerro Policía', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1606', N'Cervantes', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1607', N'Chelforo', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1608', N'Chimpay', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1609', N'Chinchinales', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'161 ', N'Burzaco', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1610', N'Chipauquil', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1611', N'Choele Choel', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1612', N'Cinco Saltos', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1613', N'Cipolletti', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1614', N'Clemente Onelli', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1615', N'Colán Conhue', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1616', N'Comallo', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1617', N'Comicó', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1618', N'Cona Niyeu', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1619', N'Coronel Belisle', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'162 ', N'Carapachay', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1620', N'Cubanea', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1621', N'Darwin', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1622', N'Dina Huapi', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1623', N'El Bolsón', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1624', N'El Caín', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1625', N'El Manso', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1626', N'Gral. Conesa', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1627', N'Gral. Enrique Godoy', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1628', N'Gral. Fernandez Oro', N'17')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1629', N'Gral. Roca', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'163 ', N'Caseros', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1630', N'Guardia Mitre', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1631', N'Ing. Huergo', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1632', N'Ing. Jacobacci', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1633', N'Laguna Blanca', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1634', N'Lamarque', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1635', N'Las Grutas', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1636', N'Los Menucos', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1637', N'Luis Beltrán', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1638', N'Mainqué', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1639', N'Mamuel Choique', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'164 ', N'Castelar', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1640', N'Maquinchao', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1641', N'Mencué', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1642', N'Mtro. Ramos Mexia', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1643', N'Nahuel Niyeu', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1644', N'Naupa Huen', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1645', N'Ñorquinco', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1646', N'Ojos de Agua', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1647', N'Paso de Agua', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1648', N'Paso Flores', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1649', N'Peñas Blancas', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'165 ', N'Churruca', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1650', N'Pichi Mahuida', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1651', N'Pilcaniyeu', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1652', N'Pomona', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1653', N'Prahuaniyeu', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1654', N'Rincón Treneta', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1655', N'Río Chico', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1656', N'Río Colorado', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1657', N'Roca', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1658', N'San Antonio Oeste', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1659', N'San Javier', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'166 ', N'Ciudad Evita', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1660', N'Sierra Colorada', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1661', N'Sierra Grande', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1662', N'Sierra Pailemán', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1663', N'Valcheta', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1664', N'Valle Azul', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1665', N'Viedma', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1666', N'Villa Llanquín', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1667', N'Villa Mascardi', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1668', N'Villa Regina', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1669', N'Yaminué', N'17')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'167 ', N'Ciudad Madero', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1670', N'A. Saravia', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1671', N'Aguaray', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1672', N'Angastaco', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1673', N'Animaná', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1674', N'Cachi', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1675', N'Cafayate', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1676', N'Campo Quijano', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1677', N'Campo Santo', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1678', N'Capital', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1679', N'Cerrillos', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'168 ', N'Ciudadela', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1680', N'Chicoana', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1681', N'Col. Sta. Rosa', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1682', N'Coronel Moldes', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1683', N'El Bordo', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1684', N'El Carril', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1685', N'El Galpón', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1686', N'El Jardín', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1687', N'El Potrero', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1688', N'El Quebrachal', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1689', N'El Tala', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'169 ', N'Claypole', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1690', N'Embarcación', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1691', N'Gral. Ballivian', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1692', N'Gral. Güemes', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1693', N'Gral. Mosconi', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1694', N'Gral. Pizarro', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1695', N'Guachipas', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1696', N'Hipólito Yrigoyen', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1697', N'Iruyá', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1698', N'Isla De Cañas', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1699', N'J. V. Gonzalez', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'17  ', N'Brandsen', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'170 ', N'Crucecita', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1700', N'La Caldera', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1701', N'La Candelaria', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1702', N'La Merced', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1703', N'La Poma', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1704', N'La Viña', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1705', N'Las Lajitas', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1706', N'Los Toldos', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1707', N'Metán', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1708', N'Molinos', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1709', N'Nazareno', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'171 ', N'Dock Sud', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1710', N'Orán', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1711', N'Payogasta', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1712', N'Pichanal', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1713', N'Prof. S. Mazza', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1714', N'Río Piedras', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1715', N'Rivadavia Banda Norte', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1716', N'Rivadavia Banda Sur', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1717', N'Rosario de La Frontera', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1718', N'Rosario de Lerma', N'18')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1719', N'Saclantás', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'172 ', N'Don Bosco', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1720', N'18', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1721', N'San Antonio', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1722', N'San Carlos', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1723', N'San José De Metán', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1724', N'San Ramón', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1725', N'Santa Victoria E.', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1726', N'Santa Victoria O.', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1727', N'Tartagal', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1728', N'Tolar Grande', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1729', N'Urundel', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'173 ', N'Don Orione', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1730', N'Vaqueros', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1731', N'Villa San Lorenzo', N'18')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1732', N'Albardón', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1733', N'Angaco', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1734', N'Calingasta', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1735', N'Capital', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1736', N'Caucete', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1737', N'Chimbas', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1738', N'Iglesia', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1739', N'Jachal', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'174 ', N'El Jagüel', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1740', N'Nueve de Julio', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1741', N'Pocito', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1742', N'Rawson', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1743', N'Rivadavia', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1744', N'19', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1745', N'San Martín', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1746', N'Santa Lucía', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1747', N'Sarmiento', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1748', N'Ullum', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1749', N'Valle Fértil', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'175 ', N'El Libertador', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1750', N'Veinticinco de Mayo', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1751', N'Zonda', N'19')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1752', N'Alto Pelado', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1753', N'Alto Pencoso', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1754', N'Anchorena', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1755', N'Arizona', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1756', N'Bagual', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1757', N'Balde', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1758', N'Batavia', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1759', N'Beazley', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'176 ', N'El Palomar', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1760', N'Buena Esperanza', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1761', N'Candelaria', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1762', N'Capital', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1763', N'Carolina', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1764', N'Carpintería', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1765', N'Concarán', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1766', N'Cortaderas', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1767', N'El Morro', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1768', N'El Trapiche', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1769', N'El Volcán', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'177 ', N'El Tala', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1770', N'Fortín El Patria', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1771', N'Fortuna', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1772', N'Fraga', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1773', N'Juan Jorba', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1774', N'Juan Llerena', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1775', N'Juana Koslay', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1776', N'Justo Daract', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1777', N'La Calera', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1778', N'La Florida', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1779', N'La Punilla', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'178 ', N'El Trébol', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1780', N'La Toma', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1781', N'Lafinur', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1782', N'Las Aguadas', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1783', N'Las Chacras', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1784', N'Las Lagunas', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1785', N'Las Vertientes', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1786', N'Lavaisse', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1787', N'Leandro N. Alem', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1788', N'Los Molles', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1789', N'Luján', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'179 ', N'Ezeiza', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1790', N'Mercedes', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1791', N'Merlo', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1792', N'Naschel', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1793', N'Navia', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1794', N'Nogolí', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1795', N'Nueva Galia', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1796', N'Papagayos', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1797', N'Paso Grande', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1798', N'Potrero de Los Funes', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1799', N'Quines', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'18  ', N'Campana', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'180 ', N'Ezpeleta', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1800', N'Renca', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1801', N'Saladillo', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1802', N'San Francisco', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1803', N'San Gerónimo', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1804', N'San Martín', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1805', N'San Pablo', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1806', N'Santa Rosa de Conlara', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1807', N'Talita', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1808', N'Tilisarao', N'20')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1809', N'Unión', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'181 ', N'Florencio Varela', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1810', N'Villa de La Quebrada', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1811', N'Villa de Praga', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1812', N'Villa del Carmen', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1813', N'Villa Gral. Roca', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1814', N'Villa Larca', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1815', N'Villa Mercedes', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1816', N'Zanjitas', N'20')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1817', N'Calafate', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1818', N'Caleta Olivia', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1819', N'Cañadón Seco', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'182 ', N'Florida', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1820', N'Comandante Piedrabuena', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1821', N'El Calafate', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1822', N'El Chaltén', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1823', N'Gdor. Gregores', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1824', N'Hipólito Yrigoyen', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1825', N'Jaramillo', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1826', N'Koluel Kaike', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1827', N'Las Heras', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1828', N'Los Antiguos', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1829', N'Perito Moreno', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'183 ', N'Francisco Álvarez', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1830', N'Pico Truncado', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1831', N'Pto. Deseado', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1832', N'Pto. San Julián', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1833', N'Pto. 21', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1834', N'Río Cuarto', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1835', N'Río Gallegos', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1836', N'Río Turbio', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1837', N'Tres Lagos', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1838', N'Veintiocho De Noviembre', N'21')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1839', N'Aarón Castellanos', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'184 ', N'Gerli', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1840', N'Acebal', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1841', N'Aguará Grande', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1842', N'Albarellos', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1843', N'Alcorta', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1844', N'Aldao', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1845', N'Alejandra', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1846', N'Álvarez', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1847', N'Ambrosetti', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1848', N'Amenábar', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1849', N'Angélica', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'185 ', N'Glew', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1850', N'Angeloni', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1851', N'Arequito', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1852', N'Arminda', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1853', N'Armstrong', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1854', N'Arocena', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1855', N'Arroyo Aguiar', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1856', N'Arroyo Ceibal', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1857', N'Arroyo Leyes', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1858', N'Arroyo Seco', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1859', N'Arrufó', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'186 ', N'González Catán', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1860', N'Arteaga', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1861', N'Ataliva', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1862', N'Aurelia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1863', N'Avellaneda', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1864', N'Barrancas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1865', N'Bauer Y Sigel', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1866', N'Bella Italia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1867', N'Berabevú', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1868', N'Berna', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1869', N'Bernardo de Irigoyen', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'187 ', N'Gral. Lamadrid', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1870', N'Bigand', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1871', N'Bombal', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1872', N'Bouquet', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1873', N'Bustinza', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1874', N'Cabal', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1875', N'Cacique Ariacaiquin', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1876', N'Cafferata', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1877', N'Calchaquí', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1878', N'Campo Andino', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1879', N'Campo Piaggio', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'188 ', N'Grand Bourg', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1880', N'Cañada de Gómez', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1881', N'Cañada del Ucle', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1882', N'Cañada Rica', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1883', N'Cañada Rosquín', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1884', N'Candioti', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1885', N'Capital', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1886', N'Capitán Bermúdez', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1887', N'Capivara', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1888', N'Carcarañá', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1889', N'Carlos Pellegrini', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'189 ', N'Gregorio de Laferrere', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1890', N'Carmen', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1891', N'Carmen Del Sauce', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1892', N'Carreras', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1893', N'Carrizales', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1894', N'Casalegno', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1895', N'Casas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1896', N'Casilda', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1897', N'Castelar', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1898', N'Castellanos', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1899', N'Cayastá', N'22')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'19  ', N'Cañuelas', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'190 ', N'Guillermo Enrique Hudson', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1900', N'Cayastacito', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1901', N'Centeno', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1902', N'Cepeda', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1903', N'Ceres', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1904', N'Chabás', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1905', N'Chañar Ladeado', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1906', N'Chapuy', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1907', N'Chovet', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1908', N'Christophersen', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1909', N'Classon', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'191 ', N'Haedo', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1910', N'Cnel. Arnold', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1911', N'Cnel. Bogado', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1912', N'Cnel. Dominguez', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1913', N'Cnel. Fraga', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1914', N'Col. Aldao', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1915', N'Col. Ana', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1916', N'Col. Belgrano', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1917', N'Col. Bicha', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1918', N'Col. Bigand', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1919', N'Col. Bossi', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'192 ', N'Hurlingham', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1920', N'Col. Cavour', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1921', N'Col. Cello', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1922', N'Col. Dolores', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1923', N'Col. Dos Rosas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1924', N'Col. Durán', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1925', N'Col. Iturraspe', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1926', N'Col. Margarita', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1927', N'Col. Mascias', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1928', N'Col. Raquel', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1929', N'Col. Rosa', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'193 ', N'Ing. Sourdeaux', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1930', N'Col. San José', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1931', N'Constanza', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1932', N'Coronda', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1933', N'Correa', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1934', N'Crispi', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1935', N'Cululú', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1936', N'Curupayti', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1937', N'Desvio Arijón', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1938', N'Diaz', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1939', N'Diego de Alvear', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'194 ', N'Isidro Casanova', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1940', N'Egusquiza', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1941', N'El Arazá', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1942', N'El Rabón', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1943', N'El Sombrerito', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1944', N'El Trébol', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1945', N'Elisa', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1946', N'Elortondo', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1947', N'Emilia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1948', N'Empalme San Carlos', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1949', N'Empalme Villa Constitucion', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'195 ', N'Ituzaingó', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1950', N'Esmeralda', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1951', N'Esperanza', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1952', N'Estación Alvear', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1953', N'Estacion Clucellas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1954', N'Esteban Rams', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1955', N'Esther', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1956', N'Esustolia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1957', N'Eusebia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1958', N'Felicia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1959', N'Fidela', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'196 ', N'José C. Paz', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1960', N'Fighiera', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1961', N'Firmat', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1962', N'Florencia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1963', N'Fortín Olmos', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1964', N'Franck', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1965', N'Fray Luis Beltrán', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1966', N'Frontera', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1967', N'Fuentes', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1968', N'Funes', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1969', N'Gaboto', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'197 ', N'José Ingenieros', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1970', N'Galisteo', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1971', N'Gálvez', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1972', N'Garabalto', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1973', N'Garibaldi', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1974', N'Gato Colorado', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1975', N'Gdor. Crespo', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1976', N'Gessler', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1977', N'Godoy', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1978', N'Golondrina', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1979', N'Gral. Gelly', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'198 ', N'José Marmol', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1980', N'Gral. Lagos', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1981', N'Granadero Baigorria', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1982', N'Gregoria Perez De Denis', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1983', N'Grutly', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1984', N'Guadalupe N.', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1985', N'Gödeken', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1986', N'Helvecia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1987', N'Hersilia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1988', N'Hipatía', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1989', N'Huanqueros', N'22')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'199 ', N'La Lucila', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1990', N'Hugentobler', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1991', N'Hughes', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1992', N'Humberto 1º', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1993', N'Humboldt', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1994', N'Ibarlucea', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1995', N'Ing. Chanourdie', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1996', N'Intiyaco', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1997', N'Ituzaingó', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1998', N'Jacinto L. Aráuz', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'1999', N'Josefina', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2   ', N'3 de Febrero', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'20  ', N'Capilla del Señor', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'200 ', N'La Reja', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2000', N'Juan B. Molina', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2001', N'Juan de Garay', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2002', N'Juncal', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2003', N'La Brava', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2004', N'La Cabral', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2005', N'La Camila', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2006', N'La Chispa', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2007', N'La Clara', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2008', N'La Criolla', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2009', N'La Gallareta', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'201 ', N'La Tablada', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2010', N'La Lucila', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2011', N'La Pelada', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2012', N'La Penca', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2013', N'La Rubia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2014', N'La Sarita', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2015', N'La Vanguardia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2016', N'Labordeboy', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2017', N'Laguna Paiva', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2018', N'Landeta', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2019', N'Lanteri', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'202 ', N'Lanús', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2020', N'Larrechea', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2021', N'Las Avispas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2022', N'Las Bandurrias', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2023', N'Las Garzas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2024', N'Las Palmeras', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2025', N'Las Parejas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2026', N'Las Petacas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2027', N'Las Rosas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2028', N'Las Toscas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2029', N'Las Tunas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'203 ', N'Llavallol', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2030', N'Lazzarino', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2031', N'Lehmann', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2032', N'Llambi Campbell', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2033', N'Logroño', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2034', N'Loma Alta', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2035', N'López', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2036', N'Los Amores', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2037', N'Los Cardos', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2038', N'Los Laureles', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2039', N'Los Molinos', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'204 ', N'Loma Hermosa', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2040', N'Los Quirquinchos', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2041', N'Lucio V. Lopez', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2042', N'Luis Palacios', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2043', N'Ma. Juana', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2044', N'Ma. Luisa', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2045', N'Ma. Susana', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2046', N'Ma. Teresa', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2047', N'Maciel', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2048', N'Maggiolo', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2049', N'Malabrigo', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'205 ', N'Lomas de Zamora', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2050', N'Marcelino Escalada', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2051', N'Margarita', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2052', N'Matilde', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2053', N'Mauá', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2054', N'Máximo Paz', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2055', N'Melincué', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2056', N'Miguel Torres', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2057', N'Moisés Ville', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2058', N'Monigotes', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2059', N'Monje', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'206 ', N'Lomas del Millón', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2060', N'Monte Obscuridad', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2061', N'Monte Vera', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2062', N'Montefiore', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2063', N'Montes de Oca', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2064', N'Murphy', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2065', N'Ñanducita', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2066', N'Naré', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2067', N'Nelson', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2068', N'Nicanor E. Molinas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2069', N'Nuevo Torino', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'207 ', N'Lomas del Mirador', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2070', N'Oliveros', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2071', N'Palacios', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2072', N'Pavón', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2073', N'Pavón Arriba', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2074', N'Pedro Gómez Cello', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2075', N'Pérez', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2076', N'Peyrano', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2077', N'Piamonte', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2078', N'Pilar', N'22')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2079', N'Piñero', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'208 ', N'Longchamps', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2080', N'Plaza Clucellas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2081', N'Portugalete', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2082', N'Pozo Borrado', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2083', N'Progreso', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2084', N'Providencia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2085', N'Pte. Roca', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2086', N'Pueblo Andino', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2087', N'Pueblo Esther', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2088', N'Pueblo Gral. San Martín', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2089', N'Pueblo Irigoyen', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'209 ', N'Los Polvorines', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2090', N'Pueblo Marini', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2091', N'Pueblo Muñoz', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2092', N'Pueblo Uranga', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2093', N'Pujato', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2094', N'Pujato N.', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2095', N'Rafaela', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2096', N'Ramayón', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2097', N'Ramona', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2098', N'Reconquista', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2099', N'Recreo', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'21  ', N'Capítán Sarmiento', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'210 ', N'Luis Guillón', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2100', N'Ricardone', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2101', N'Rivadavia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2102', N'Roldán', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2103', N'Romang', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2104', N'Rosario', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2105', N'Rueda', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2106', N'Rufino', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2107', N'Sa Pereira', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2108', N'Saguier', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2109', N'Saladero M. Cabal', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'211 ', N'Malvinas Argentinas', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2110', N'Salto Grande', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2111', N'San Agustín', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2112', N'San Antonio de Obligado', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2113', N'San Bernardo (N.J.)', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2114', N'San Bernardo (S.J.)', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2115', N'San Carlos Centro', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2116', N'San Carlos N.', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2117', N'San Carlos S.', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2118', N'San Cristóbal', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2119', N'San Eduardo', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'212 ', N'Martín Coronado', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2120', N'San Eugenio', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2121', N'San Fabián', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2122', N'San Fco. de Santa Fé', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2123', N'San Genaro', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2124', N'San Genaro N.', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2125', N'San Gregorio', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2126', N'San Guillermo', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2127', N'San Javier', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2128', N'San Jerónimo del Sauce', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2129', N'San Jerónimo N.', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'213 ', N'Martínez', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2130', N'San Jerónimo S.', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2131', N'San Jorge', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2132', N'San José de La Esquina', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2133', N'San José del Rincón', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2134', N'San Justo', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2135', N'San Lorenzo', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2136', N'San Mariano', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2137', N'San Martín de Las Escobas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2138', N'San Martín N.', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2139', N'San Vicente', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'214 ', N'Merlo', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2140', N'Sancti Spititu', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2141', N'Sanford', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2142', N'Santo Domingo', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2143', N'Santo Tomé', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2144', N'Santurce', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2145', N'Sargento Cabral', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2146', N'Sarmiento', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2147', N'Sastre', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2148', N'Sauce Viejo', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2149', N'Serodino', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'215 ', N'Ministro Rivadavia', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2150', N'Silva', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2151', N'Soldini', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2152', N'Soledad', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2153', N'Soutomayor', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2154', N'Sta. Clara de Buena Vista', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2155', N'Sta. Clara de Saguier', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2156', N'Sta. Isabel', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2157', N'Sta. Margarita', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2158', N'Sta. Maria Centro', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2159', N'Sta. María N.', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'216 ', N'Monte Chingolo', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2160', N'Sta. Rosa', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2161', N'Sta. Teresa', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2162', N'Suardi', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2163', N'Sunchales', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2164', N'Susana', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2165', N'Tacuarendí', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2166', N'Tacural', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2167', N'Tartagal', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2168', N'Teodelina', N'22')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2169', N'Theobald', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'217 ', N'Monte Grande', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2170', N'Timbúes', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2171', N'Toba', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2172', N'Tortugas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2173', N'Tostado', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2174', N'Totoras', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2175', N'Traill', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2176', N'Venado Tuerto', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2177', N'Vera', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2178', N'Vera y Pintado', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2179', N'Videla', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'218 ', N'Moreno', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2180', N'Vila', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2181', N'Villa Amelia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2182', N'Villa Ana', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2183', N'Villa Cañas', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2184', N'Villa Constitución', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2185', N'Villa Eloísa', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2186', N'Villa Gdor. Gálvez', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2187', N'Villa Guillermina', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2188', N'Villa Minetti', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2189', N'Villa Mugueta', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'219 ', N'Morón', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2190', N'Villa Ocampo', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2191', N'Villa San José', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2192', N'Villa Saralegui', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2193', N'Villa Trinidad', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2194', N'Villada', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2195', N'Virginia', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2196', N'Wheelwright', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2197', N'Zavalla', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2198', N'Zenón Pereira', N'22')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2199', N'Añatuya', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'22  ', N'Carapachay', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'220 ', N'Muñiz', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2200', N'Árraga', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2201', N'Bandera', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2202', N'Bandera Bajada', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2203', N'Beltrán', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2204', N'Brea Pozo', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2205', N'Campo Gallo', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2206', N'Capital', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2207', N'Chilca Juliana', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2208', N'Choya', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2209', N'Clodomira', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'221 ', N'Olivos', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2210', N'Col. Alpina', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2211', N'Col. Dora', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2212', N'Col. El Simbolar Robles', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2213', N'El Bobadal', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2214', N'El Charco', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2215', N'El Mojón', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2216', N'Estación Atamisqui', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2217', N'Estación Simbolar', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2218', N'Fernández', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2219', N'Fortín Inca', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'222 ', N'Pablo Nogués', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2220', N'Frías', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2221', N'Garza', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2222', N'Gramilla', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2223', N'Guardia Escolta', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2224', N'Herrera', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2225', N'Icaño', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2226', N'Ing. Forres', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2227', N'La Banda', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2228', N'La Cañada', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2229', N'Laprida', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'223 ', N'Pablo Podestá', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2230', N'Lavalle', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2231', N'Loreto', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2232', N'Los Juríes', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2233', N'Los Núñez', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2234', N'Los Pirpintos', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2235', N'Los Quiroga', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2236', N'Los Telares', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2237', N'Lugones', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2238', N'Malbrán', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2239', N'Matara', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'224 ', N'Paso del Rey', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2240', N'Medellín', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2241', N'Monte Quemado', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2242', N'Nueva Esperanza', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2243', N'Nueva Francia', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2244', N'Palo Negro', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2245', N'Pampa de Los Guanacos', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2246', N'Pinto', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2247', N'Pozo Hondo', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2248', N'Quimilí', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2249', N'Real Sayana', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'225 ', N'Pereyra', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2250', N'Sachayoj', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2251', N'San Pedro de Guasayán', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2252', N'Selva', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2253', N'Sol de Julio', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2254', N'Sumampa', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2255', N'Suncho Corral', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2256', N'Taboada', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2257', N'Tapso', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2258', N'Termas de Rio Hondo', N'23')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2259', N'Tintina', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'226 ', N'Piñeiro', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2260', N'Tomas Young', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2261', N'Vilelas', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2262', N'Villa Atamisqui', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2263', N'Villa La Punta', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2264', N'Villa Ojo de Agua', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2265', N'Villa Río Hondo', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2266', N'Villa Salavina', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2267', N'Villa Unión', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2268', N'Vilmer', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2269', N'Weisburd', N'23')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'227 ', N'Plátanos', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2270', N'Río Grande', N'24')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2271', N'Tolhuin', N'24')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2272', N'Ushuaia', N'24')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2273', N'Acheral', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2274', N'Agua Dulce', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2275', N'Aguilares', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2276', N'Alderetes', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2277', N'Alpachiri', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2278', N'Alto Verde', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2279', N'Amaicha del Valle', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'228 ', N'Pontevedra', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2280', N'Amberes', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2281', N'Ancajuli', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2282', N'Arcadia', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2283', N'Atahona', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2284', N'Banda del Río Sali', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2285', N'Bella Vista', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2286', N'Buena Vista', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2287', N'Burruyacú', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2288', N'Capitán Cáceres', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2289', N'Cevil Redondo', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'229 ', N'Quilmes', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2290', N'Choromoro', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2291', N'Ciudacita', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2292', N'Colalao del Valle', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2293', N'Colombres', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2294', N'Concepción', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2295', N'Delfín Gallo', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2296', N'El Bracho', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2297', N'El Cadillal', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2298', N'El Cercado', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2299', N'El Chañar', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'23  ', N'Carhue', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'230 ', N'Rafael Calzada', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2300', N'El Manantial', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2301', N'El Mojón', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2302', N'El Mollar', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2303', N'El Naranjito', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2304', N'El Naranjo', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2305', N'El Polear', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2306', N'El Puestito', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2307', N'El Sacrificio', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2308', N'El Timbó', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2309', N'Escaba', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'231 ', N'Rafael Castillo', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2310', N'Esquina', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2311', N'Estación Aráoz', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2312', N'Famaillá', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2313', N'Gastone', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2314', N'Gdor. Garmendia', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2315', N'Gdor. Piedrabuena', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2316', N'Graneros', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2317', N'Huasa Pampa', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2318', N'J. B. Alberdi', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2319', N'La Cocha', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'232 ', N'Ramos Mejía', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2320', N'La Esperanza', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2321', N'La Florida', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2322', N'La Ramada', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2323', N'La Trinidad', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2324', N'Lamadrid', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2325', N'Las Cejas', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2326', N'Las Talas', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2327', N'Las Talitas', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2328', N'Los Bulacio', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2329', N'Los Gómez', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'233 ', N'Ranelagh', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2330', N'Los Nogales', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2331', N'Los Pereyra', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2332', N'Los Pérez', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2333', N'Los Puestos', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2334', N'Los Ralos', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2335', N'Los Sarmientos', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2336', N'Los Sosa', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2337', N'Lules', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2338', N'M. García Fernández', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2339', N'Manuela Pedraza', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'234 ', N'Remedios de Escalada', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2340', N'Medinas', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2341', N'Monte Bello', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2342', N'Monteagudo', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2343', N'Monteros', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2344', N'Padre Monti', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2345', N'Pampa Mayo', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2346', N'Quilmes', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2347', N'Raco', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2348', N'Ranchillos', N'25')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2349', N'Río Chico', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'235 ', N'Sáenz Peña', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2350', N'Río Colorado', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2351', N'Río Seco', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2352', N'Rumi Punco', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2353', N'San Andrés', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2354', N'San Felipe', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2355', N'San Ignacio', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2356', N'San Javier', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2357', N'San José', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2358', N'San Miguel de 25', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2359', N'San Pedro', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'236 ', N'San Antonio de Padua', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2360', N'San Pedro de Colalao', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2361', N'Santa Rosa de Leales', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2362', N'Sgto. Moya', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2363', N'Siete de Abril', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2364', N'Simoca', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2365', N'Soldado Maldonado', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2366', N'Sta. Ana', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2367', N'Sta. Cruz', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2368', N'Sta. Lucía', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2369', N'Taco Ralo', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'237 ', N'San Fernando', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2370', N'Tafí del Valle', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2371', N'Tafí Viejo', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2372', N'Tapia', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2373', N'Teniente Berdina', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2374', N'Trancas', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2375', N'Villa Belgrano', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2376', N'Villa Benjamín Araoz', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2377', N'Villa Chiligasta', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2378', N'Villa de Leales', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2379', N'Villa Quinteros', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'238 ', N'San Francisco Solano', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2380', N'Yánima', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2381', N'Yerba Buena', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'2382', N'Yerba Buena (S)', N'25')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'239 ', N'San Isidro', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'24  ', N'Cariló', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'240 ', N'San José', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'241 ', N'San Justo', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'242 ', N'San Martín', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'243 ', N'San Miguel', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'244 ', N'Santos Lugares', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'245 ', N'Sarandí', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'246 ', N'Sourigues', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'247 ', N'Tapiales', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'248 ', N'Temperley', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'249 ', N'Tigre', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'25  ', N'Carlos Casares', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'250 ', N'Tortuguitas', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'251 ', N'Tristán Suárez', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'252 ', N'Trujui', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'253 ', N'Turdera', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'254 ', N'Valentín Alsina', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'255 ', N'Vicente López', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'256 ', N'Villa Adelina', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'257 ', N'Villa Ballester', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'258 ', N'Villa Bosch', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'259 ', N'Villa Caraza', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'26  ', N'Carlos Tejedor', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'260 ', N'Villa Celina', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'261 ', N'Villa Centenario', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'262 ', N'Villa de Mayo', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'263 ', N'Villa Diamante', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'264 ', N'Villa Domínico', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'265 ', N'Villa España', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'266 ', N'Villa Fiorito', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'267 ', N'Villa Guillermina', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'268 ', N'Villa Insuperable', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'269 ', N'Villa José León Suárez', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'27  ', N'Carmen de Areco', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'270 ', N'Villa La Florida', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'271 ', N'Villa Luzuriaga', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'272 ', N'Villa Martelli', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'273 ', N'Villa Obrera', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'274 ', N'Villa Progreso', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'275 ', N'Villa Raffo', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'276 ', N'Villa Sarmiento', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'277 ', N'Villa Tesei', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'278 ', N'Villa Udaondo', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'279 ', N'Virrey del Pino', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'28  ', N'Carmen de Patagones', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'280 ', N'Wilde', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'281 ', N'William Morris', N'2 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'282 ', N'Agronomía', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'283 ', N'Almagro', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'284 ', N'Balvanera', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'285 ', N'Barracas', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'286 ', N'Belgrano', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'287 ', N'Boca', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'288 ', N'Boedo', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'289 ', N'Caballito', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'29  ', N'Castelli', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'290 ', N'Chacarita', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'291 ', N'Coghlan', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'292 ', N'Colegiales', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'293 ', N'Constitución', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'294 ', N'Flores', N'3 ')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'295 ', N'Floresta', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'296 ', N'La Paternal', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'297 ', N'Liniers', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'298 ', N'Mataderos', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'299 ', N'Monserrat', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'3   ', N'A. Alsina', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'30  ', N'Chacabuco ', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'300 ', N'Monte Castro', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'301 ', N'Nueva Pompeya', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'302 ', N'Núñez', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'303 ', N'Palermo', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'304 ', N'Parque Avellaneda', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'305 ', N'Parque Chacabuco', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'306 ', N'Parque Chas', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'307 ', N'Parque Patricios', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'308 ', N'Puerto Madero', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'309 ', N'Recoleta', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'31  ', N'Chascomús ', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'310 ', N'Retiro', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'311 ', N'Saavedra', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'312 ', N'San Cristóbal', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'313 ', N'San Nicolás', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'314 ', N'San Telmo', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'315 ', N'Vélez Sársfield', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'316 ', N'Versalles', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'317 ', N'Villa Crespo', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'318 ', N'Villa del Parque', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'319 ', N'Villa Devoto', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'32  ', N'Chivilcoy', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'320 ', N'Villa Gral. Mitre', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'321 ', N'Villa Lugano', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'322 ', N'Villa Luro', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'323 ', N'Villa Ortúzar', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'324 ', N'Villa Pueyrredón', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'325 ', N'Villa Real', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'326 ', N'Villa Riachuelo', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'327 ', N'Villa Santa Rita', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'328 ', N'Villa Soldati', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'329 ', N'Villa Urquiza', N'3 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'33  ', N'Colón', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'330 ', N'Aconquija', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'331 ', N'Ancasti', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'332 ', N'Andalgalá', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'333 ', N'Antofagasta', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'334 ', N'Belén', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'335 ', N'Capayán', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'336 ', N'Capital', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'337 ', N'4', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'338 ', N'Corral Quemado', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'339 ', N'El Alto', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'34  ', N'Coronel Dorrego', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'340 ', N'El Rodeo', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'341 ', N'F.Mamerto Esquiú', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'342 ', N'Fiambalá', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'343 ', N'Hualfín', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'344 ', N'Huillapima', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'345 ', N'Icaño', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'346 ', N'La Puerta', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'347 ', N'Las Juntas', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'348 ', N'Londres', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'349 ', N'Los Altos', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'35  ', N'Coronel Pringles', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'350 ', N'Los Varela', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'351 ', N'Mutquín', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'352 ', N'Paclín', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'353 ', N'Poman', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'354 ', N'Pozo de La Piedra', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'355 ', N'Puerta de Corral', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'356 ', N'Puerta San José', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'357 ', N'Recreo', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'358 ', N'S.F.V de 4', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'359 ', N'San Fernando', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'36  ', N'Coronel Rosales', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'360 ', N'San Fernando del Valle', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'361 ', N'San José', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'362 ', N'Santa María', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'363 ', N'Santa Rosa', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'364 ', N'Saujil', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'365 ', N'Tapso', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'366 ', N'Tinogasta', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'367 ', N'Valle Viejo', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'368 ', N'Villa Vil', N'4 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'369 ', N'Aviá Teraí', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'37  ', N'Coronel Suarez', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'370 ', N'Barranqueras', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'371 ', N'Basail', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'372 ', N'Campo Largo', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'373 ', N'Capital', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'374 ', N'Capitán Solari', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'375 ', N'Charadai', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'376 ', N'Charata', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'377 ', N'Chorotis', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'378 ', N'Ciervo Petiso', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'379 ', N'Cnel. Du Graty', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'38  ', N'Costa Azul', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'380 ', N'Col. Benítez', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'381 ', N'Col. Elisa', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'382 ', N'Col. Popular', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'383 ', N'Colonias Unidas', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'384 ', N'Concepción', N'5 ')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'385 ', N'Corzuela', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'386 ', N'Cote Lai', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'387 ', N'El Sauzalito', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'388 ', N'Enrique Urien', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'389 ', N'Fontana', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'39  ', N'Costa Chica', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'390 ', N'Fte. Esperanza', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'391 ', N'Gancedo', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'392 ', N'Gral. Capdevila', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'393 ', N'Gral. Pinero', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'394 ', N'Gral. San Martín', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'395 ', N'Gral. Vedia', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'396 ', N'Hermoso Campo', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'397 ', N'I. del Cerrito', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'398 ', N'J.J. Castelli', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'399 ', N'La Clotilde', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'4   ', N'A. Gonzáles Cháves', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'40  ', N'Costa del Este', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'400 ', N'La Eduvigis', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'401 ', N'La Escondida', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'402 ', N'La Leonesa', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'403 ', N'La Tigra', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'404 ', N'La Verde', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'405 ', N'Laguna Blanca', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'406 ', N'Laguna Limpia', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'407 ', N'Lapachito', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'408 ', N'Las Breñas', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'409 ', N'Las Garcitas', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'41  ', N'Costa Esmeralda', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'410 ', N'Las Palmas', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'411 ', N'Los Frentones', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'412 ', N'Machagai', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'413 ', N'Makallé', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'414 ', N'Margarita Belén', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'415 ', N'Miraflores', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'416 ', N'Misión N. Pompeya', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'417 ', N'Napenay', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'418 ', N'Pampa Almirón', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'419 ', N'Pampa del Indio', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'42  ', N'Daireaux', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'420 ', N'Pampa del Infierno', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'421 ', N'Pdcia. de La Plaza', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'422 ', N'Pdcia. Roca', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'423 ', N'Pdcia. Roque Sáenz Peña', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'424 ', N'Pto. Bermejo', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'425 ', N'Pto. Eva Perón', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'426 ', N'Puero Tirol', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'427 ', N'Puerto Vilelas', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'428 ', N'Quitilipi', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'429 ', N'Resistencia', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'43  ', N'Darregueira', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'430 ', N'Sáenz Peña', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'431 ', N'Samuhú', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'432 ', N'San Bernardo', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'433 ', N'Santa Sylvina', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'434 ', N'Taco Pozo', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'435 ', N'Tres Isletas', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'436 ', N'Villa Ángela', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'437 ', N'Villa Berthet', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'438 ', N'Villa R. Bermejito', N'5 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'439 ', N'Aldea Apeleg', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'44  ', N'Del viso', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'440 ', N'Aldea Beleiro', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'441 ', N'Aldea Epulef', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'442 ', N'Alto Río Sengerr', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'443 ', N'Buen Pasto', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'444 ', N'Camarones', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'445 ', N'Carrenleufú', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'446 ', N'Cholila', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'447 ', N'Co. Centinela', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'448 ', N'Colan Conhué', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'449 ', N'Comodoro Rivadavia', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'45  ', N'Dolores', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'450 ', N'Corcovado', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'451 ', N'Cushamen', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'452 ', N'Dique F. Ameghino', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'453 ', N'Dolavón', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'454 ', N'Dr. R. Rojas', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'455 ', N'El Hoyo', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'456 ', N'El Maitén', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'457 ', N'Epuyén', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'458 ', N'Esquel', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'459 ', N'Facundo', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'46  ', N'Don Torcuato', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'460 ', N'Gaimán', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'461 ', N'Gan Gan', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'462 ', N'Gastre', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'463 ', N'Gdor. Costa', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'464 ', N'Gualjaina', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'465 ', N'J. de San Martín', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'466 ', N'Lago Blanco', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'467 ', N'Lago Puelo', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'468 ', N'Lagunita Salada', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'469 ', N'Las Plumas', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'47  ', N'Ensenada', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'470 ', N'Los Altares', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'471 ', N'Paso de los Indios', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'472 ', N'Paso del Sapo', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'473 ', N'Pto. Madryn', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'474 ', N'Pto. Pirámides', N'6 ')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'475 ', N'Rada Tilly', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'476 ', N'Rawson', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'477 ', N'Río Mayo', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'478 ', N'Río Pico', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'479 ', N'Sarmiento', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'48  ', N'Escobar', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'480 ', N'Tecka', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'481 ', N'Telsen', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'482 ', N'Trelew', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'483 ', N'Trevelin', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'484 ', N'Veintiocho de Julio', N'6 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'485 ', N'Achiras', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'486 ', N'Adelia Maria', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'487 ', N'Agua de Oro', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'488 ', N'Alcira Gigena', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'489 ', N'Aldea Santa Maria', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'49  ', N'Exaltación de la Cruz', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'490 ', N'Alejandro Roca', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'491 ', N'Alejo Ledesma', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'492 ', N'Alicia', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'493 ', N'Almafuerte', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'494 ', N'Alpa Corral', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'495 ', N'Alta Gracia', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'496 ', N'Alto Alegre', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'497 ', N'Alto de Los Quebrachos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'498 ', N'Altos de Chipion', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'499 ', N'Amboy', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'5   ', N'Aguas Verdes', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'50  ', N'Florentino Ameghino', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'500 ', N'Ambul', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'501 ', N'Ana Zumaran', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'502 ', N'Anisacate', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'503 ', N'Arguello', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'504 ', N'Arias', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'505 ', N'Arroyito', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'506 ', N'Arroyo Algodon', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'507 ', N'Arroyo Cabral', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'508 ', N'Arroyo Los Patos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'509 ', N'Assunta', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'51  ', N'Garín', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'510 ', N'Atahona', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'511 ', N'Ausonia', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'512 ', N'Avellaneda', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'513 ', N'Ballesteros', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'514 ', N'Ballesteros Sud', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'515 ', N'Balnearia', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'516 ', N'Bañado de Soto', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'517 ', N'Bell Ville', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'518 ', N'Bengolea', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'519 ', N'Benjamin Gould', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'52  ', N'Gral. Alvarado', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'520 ', N'Berrotaran', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'521 ', N'Bialet Masse', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'522 ', N'Bouwer', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'523 ', N'Brinkmann', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'524 ', N'Buchardo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'525 ', N'Bulnes', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'526 ', N'Cabalango', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'527 ', N'Calamuchita', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'528 ', N'Calchin', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'529 ', N'Calchin Oeste', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'53  ', N'Gral. Alvear', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'530 ', N'Calmayo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'531 ', N'Camilo Aldao', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'532 ', N'Caminiaga', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'533 ', N'Cañada de Luque', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'534 ', N'Cañada de Machado', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'535 ', N'Cañada de Rio Pinto', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'536 ', N'Cañada del Sauce', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'537 ', N'Canals', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'538 ', N'Candelaria Sud', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'539 ', N'Capilla de Remedios', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'54  ', N'Gral. Arenales', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'540 ', N'Capilla de Siton', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'541 ', N'Capilla del Carmen', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'542 ', N'Capilla del Monte', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'543 ', N'Capital', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'544 ', N'Capitan Gral B. O´Higgins', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'545 ', N'Carnerillo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'546 ', N'Carrilobo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'547 ', N'Casa Grande', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'548 ', N'Cavanagh', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'549 ', N'Cerro Colorado', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'55  ', N'Gral. Belgrano', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'550 ', N'Chaján', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'551 ', N'Chalacea', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'552 ', N'Chañar Viejo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'553 ', N'Chancaní', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'554 ', N'Charbonier', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'555 ', N'Charras', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'556 ', N'Chazón', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'557 ', N'Chilibroste', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'558 ', N'Chucul', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'559 ', N'Chuña', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'56  ', N'Gral. Guido', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'560 ', N'Chuña Huasi', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'561 ', N'Churqui Cañada', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'562 ', N'Cienaga Del Coro', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'563 ', N'Cintra', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'564 ', N'Col. Almada', N'7 ')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'565 ', N'Col. Anita', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'566 ', N'Col. Barge', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'567 ', N'Col. Bismark', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'568 ', N'Col. Bremen', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'569 ', N'Col. Caroya', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'57  ', N'Gral. Lamadrid', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'570 ', N'Col. Italiana', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'571 ', N'Col. Iturraspe', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'572 ', N'Col. Las Cuatro Esquinas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'573 ', N'Col. Las Pichanas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'574 ', N'Col. Marina', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'575 ', N'Col. Prosperidad', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'576 ', N'Col. San Bartolome', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'577 ', N'Col. San Pedro', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'578 ', N'Col. Tirolesa', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'579 ', N'Col. Vicente Aguero', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'58  ', N'Gral. Las Heras', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'580 ', N'Col. Videla', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'581 ', N'Col. Vignaud', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'582 ', N'Col. Waltelina', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'583 ', N'Colazo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'584 ', N'Comechingones', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'585 ', N'Conlara', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'586 ', N'Copacabana', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'587 ', N'7', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'588 ', N'Coronel Baigorria', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'589 ', N'Coronel Moldes', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'59  ', N'Gral. Lavalle', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'590 ', N'Corral de Bustos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'591 ', N'Corralito', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'592 ', N'Cosquín', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'593 ', N'Costa Sacate', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'594 ', N'Cruz Alta', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'595 ', N'Cruz de Caña', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'596 ', N'Cruz del Eje', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'597 ', N'Cuesta Blanca', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'598 ', N'Dean Funes', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'599 ', N'Del Campillo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'6   ', N'Alberti', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'60  ', N'Gral. Madariaga', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'600 ', N'Despeñaderos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'601 ', N'Devoto', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'602 ', N'Diego de Rojas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'603 ', N'Dique Chico', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'604 ', N'El Arañado', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'605 ', N'El Brete', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'606 ', N'El Chacho', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'607 ', N'El Crispín', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'608 ', N'El Fortín', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'609 ', N'El Manzano', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'61  ', N'Gral. Pacheco', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'610 ', N'El Rastreador', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'611 ', N'El Rodeo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'612 ', N'El Tío', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'613 ', N'Elena', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'614 ', N'Embalse', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'615 ', N'Esquina', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'616 ', N'Estación Gral. Paz', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'617 ', N'Estación Juárez Celman', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'618 ', N'Estancia de Guadalupe', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'619 ', N'Estancia Vieja', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'62  ', N'Gral. Paz', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'620 ', N'Etruria', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'621 ', N'Eufrasio Loza', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'622 ', N'Falda del Carmen', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'623 ', N'Freyre', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'624 ', N'Gral. Baldissera', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'625 ', N'Gral. Cabrera', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'626 ', N'Gral. Deheza', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'627 ', N'Gral. Fotheringham', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'628 ', N'Gral. Levalle', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'629 ', N'Gral. Roca', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'63  ', N'Gral. Pinto', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'630 ', N'Guanaco Muerto', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'631 ', N'Guasapampa', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'632 ', N'Guatimozin', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'633 ', N'Gutenberg', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'634 ', N'Hernando', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'635 ', N'Huanchillas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'636 ', N'Huerta Grande', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'637 ', N'Huinca Renanco', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'638 ', N'Idiazabal', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'639 ', N'Impira', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'64  ', N'Gral. Pueyrredón', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'640 ', N'Inriville', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'641 ', N'Isla Verde', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'642 ', N'Italó', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'643 ', N'James Craik', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'644 ', N'Jesús María', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'645 ', N'Jovita', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'646 ', N'Justiniano Posse', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'647 ', N'Km 658', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'648 ', N'L. V. Mansilla', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'649 ', N'La Batea', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'65  ', N'Gral. Rodríguez', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'650 ', N'La Calera', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'651 ', N'La Carlota', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'652 ', N'La Carolina', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'653 ', N'La Cautiva', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'654 ', N'La Cesira', N'7 ')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'655 ', N'La Cruz', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'656 ', N'La Cumbre', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'657 ', N'La Cumbrecita', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'658 ', N'La Falda', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'659 ', N'La Francia', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'66  ', N'Gral. Viamonte', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'660 ', N'La Granja', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'661 ', N'La Higuera', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'662 ', N'La Laguna', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'663 ', N'La Paisanita', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'664 ', N'La Palestina', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'665 ', N'12', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'666 ', N'La Paquita', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'667 ', N'La Para', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'668 ', N'La Paz', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'669 ', N'La Playa', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'67  ', N'Gral. Villegas', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'670 ', N'La Playosa', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'671 ', N'La Población', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'672 ', N'La Posta', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'673 ', N'La Puerta', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'674 ', N'La Quinta', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'675 ', N'La Rancherita', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'676 ', N'La Rinconada', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'677 ', N'La Serranita', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'678 ', N'La Tordilla', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'679 ', N'Laborde', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'68  ', N'Guaminí', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'680 ', N'Laboulaye', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'681 ', N'Laguna Larga', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'682 ', N'Las Acequias', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'683 ', N'Las Albahacas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'684 ', N'Las Arrias', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'685 ', N'Las Bajadas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'686 ', N'Las Caleras', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'687 ', N'Las Calles', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'688 ', N'Las Cañadas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'689 ', N'Las Gramillas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'69  ', N'Guernica', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'690 ', N'Las Higueras', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'691 ', N'Las Isletillas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'692 ', N'Las Junturas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'693 ', N'Las Palmas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'694 ', N'Las Peñas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'695 ', N'Las Peñas Sud', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'696 ', N'Las Perdices', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'697 ', N'Las Playas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'698 ', N'Las Rabonas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'699 ', N'Las Saladas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'7   ', N'Arrecifes', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'70  ', N'Hipólito Yrigoyen', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'700 ', N'Las Tapias', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'701 ', N'Las Varas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'702 ', N'Las Varillas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'703 ', N'Las Vertientes', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'704 ', N'Leguizamón', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'705 ', N'Leones', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'706 ', N'Los Cedros', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'707 ', N'Los Cerrillos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'708 ', N'Los Chañaritos (C.E)', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'709 ', N'Los Chanaritos (R.S)', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'71  ', N'Ing. Maschwitz', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'710 ', N'Los Cisnes', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'711 ', N'Los Cocos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'712 ', N'Los Cóndores', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'713 ', N'Los Hornillos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'714 ', N'Los Hoyos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'715 ', N'Los Mistoles', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'716 ', N'Los Molinos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'717 ', N'Los Pozos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'718 ', N'Los Reartes', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'719 ', N'Los Surgentes', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'72  ', N'Junín', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'720 ', N'Los Talares', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'721 ', N'Los Zorros', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'722 ', N'Lozada', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'723 ', N'Luca', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'724 ', N'Luque', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'725 ', N'Luyaba', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'726 ', N'Malagueño', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'727 ', N'Malena', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'728 ', N'Malvinas Argentinas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'729 ', N'Manfredi', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'73  ', N'La Plata', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'730 ', N'Maquinista Gallini', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'731 ', N'Marcos Juárez', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'732 ', N'Marull', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'733 ', N'Matorrales', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'734 ', N'Mattaldi', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'735 ', N'Mayu Sumaj', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'736 ', N'Media Naranja', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'737 ', N'Melo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'738 ', N'Mendiolaza', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'739 ', N'Mi Granja', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'74  ', N'Laprida', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'740 ', N'Mina Clavero', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'741 ', N'Miramar', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'742 ', N'Morrison', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'743 ', N'Morteros', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'744 ', N'Mte. Buey', N'7 ')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'745 ', N'Mte. Cristo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'746 ', N'Mte. De Los Gauchos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'747 ', N'Mte. Leña', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'748 ', N'Mte. Maíz', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'749 ', N'Mte. Ralo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'75  ', N'Las Flores', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'750 ', N'Nicolás Bruzone', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'751 ', N'Noetinger', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'752 ', N'Nono', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'753 ', N'Nueva 7', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'754 ', N'Obispo Trejo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'755 ', N'Olaeta', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'756 ', N'Oliva', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'757 ', N'Olivares San Nicolás', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'758 ', N'Onagolty', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'759 ', N'Oncativo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'76  ', N'Las Toninas', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'760 ', N'Ordoñez', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'761 ', N'Pacheco De Melo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'762 ', N'Pampayasta N.', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'763 ', N'Pampayasta S.', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'764 ', N'Panaholma', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'765 ', N'Pascanas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'766 ', N'Pasco', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'767 ', N'Paso del Durazno', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'768 ', N'Paso Viejo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'769 ', N'Pilar', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'77  ', N'Leandro N. Alem', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'770 ', N'Pincén', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'771 ', N'Piquillín', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'772 ', N'Plaza de Mercedes', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'773 ', N'Plaza Luxardo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'774 ', N'Porteña', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'775 ', N'Potrero de Garay', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'776 ', N'Pozo del Molle', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'777 ', N'Pozo Nuevo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'778 ', N'Pueblo Italiano', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'779 ', N'Puesto de Castro', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'78  ', N'Lincoln', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'780 ', N'Punta del Agua', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'781 ', N'Quebracho Herrado', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'782 ', N'Quilino', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'783 ', N'Rafael García', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'784 ', N'Ranqueles', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'785 ', N'Rayo Cortado', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'786 ', N'Reducción', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'787 ', N'Rincón', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'788 ', N'Río Bamba', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'789 ', N'Río Ceballos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'79  ', N'Loberia', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'790 ', N'Río Cuarto', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'791 ', N'Río de Los Sauces', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'792 ', N'Río Primero', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'793 ', N'Río Segundo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'794 ', N'Río Tercero', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'795 ', N'Rosales', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'796 ', N'Rosario del Saladillo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'797 ', N'Sacanta', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'798 ', N'Sagrada Familia', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'799 ', N'Saira', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'8   ', N'Ayacucho', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'80  ', N'Lobos', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'800 ', N'Saladillo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'801 ', N'Saldán', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'802 ', N'Salsacate', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'803 ', N'Salsipuedes', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'804 ', N'Sampacho', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'805 ', N'San Agustín', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'806 ', N'San Antonio de Arredondo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'807 ', N'San Antonio de Litín', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'808 ', N'San Basilio', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'809 ', N'San Carlos Minas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'81  ', N'Los Cardales', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'810 ', N'San Clemente', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'811 ', N'San Esteban', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'812 ', N'San Francisco', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'813 ', N'San Ignacio', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'814 ', N'San Javier', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'815 ', N'San Jerónimo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'816 ', N'San Joaquín', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'817 ', N'San José de La Dormida', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'818 ', N'San José de Las Salinas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'819 ', N'San Lorenzo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'82  ', N'Los Toldos', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'820 ', N'San Marcos Sierras', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'821 ', N'San Marcos Sud', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'822 ', N'San Pedro', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'823 ', N'San Pedro N.', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'824 ', N'San Roque', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'825 ', N'San Vicente', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'826 ', N'Santa Catalina', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'827 ', N'Santa Elena', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'828 ', N'Santa Eufemia', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'829 ', N'Santa Maria', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'83  ', N'Lucila del Mar', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'830 ', N'Sarmiento', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'831 ', N'Saturnino M.Laspiur', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'832 ', N'Sauce Arriba', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'833 ', N'Sebastián Elcano', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'834 ', N'Seeber', N'7 ')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'835 ', N'Segunda Usina', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'836 ', N'Serrano', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'837 ', N'Serrezuela', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'838 ', N'Sgo. Temple', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'839 ', N'Silvio Pellico', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'84  ', N'Luján', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'840 ', N'Simbolar', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'841 ', N'Sinsacate', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'842 ', N'Sta. Rosa de Calamuchita', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'843 ', N'Sta. Rosa de Río Primero', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'844 ', N'Suco', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'845 ', N'Tala Cañada', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'846 ', N'Tala Huasi', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'847 ', N'Talaini', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'848 ', N'Tancacha', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'849 ', N'Tanti', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'85  ', N'Magdalena', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'850 ', N'Ticino', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'851 ', N'Tinoco', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'852 ', N'Tío Pujio', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'853 ', N'Toledo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'854 ', N'Toro Pujio', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'855 ', N'Tosno', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'856 ', N'Tosquita', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'857 ', N'Tránsito', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'858 ', N'Tuclame', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'859 ', N'Tutti', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'86  ', N'Maipú', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'860 ', N'Ucacha', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'861 ', N'Unquillo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'862 ', N'Valle de Anisacate', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'863 ', N'Valle Hermoso', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'864 ', N'Vélez Sarfield', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'865 ', N'Viamonte', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'866 ', N'Vicuña Mackenna', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'867 ', N'Villa Allende', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'868 ', N'Villa Amancay', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'869 ', N'Villa Ascasubi', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'87  ', N'Mar Chiquita', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'870 ', N'Villa Candelaria N.', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'871 ', N'Villa Carlos Paz', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'872 ', N'Villa Cerro Azul', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'873 ', N'Villa Ciudad de América', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'874 ', N'Villa Ciudad Pque Los Reartes', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'875 ', N'Villa Concepción del Tío', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'876 ', N'Villa Cura Brochero', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'877 ', N'Villa de Las Rosas', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'878 ', N'Villa de María', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'879 ', N'Villa de Pocho', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'88  ', N'Mar de Ajó', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'880 ', N'Villa de Soto', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'881 ', N'Villa del Dique', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'882 ', N'Villa del Prado', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'883 ', N'Villa del Rosario', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'884 ', N'Villa del Totoral', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'885 ', N'Villa Dolores', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'886 ', N'Villa El Chancay', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'887 ', N'Villa Elisa', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'888 ', N'Villa Flor Serrana', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'889 ', N'Villa Fontana', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'89  ', N'Mar de las Pampas', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'890 ', N'Villa Giardino', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'891 ', N'Villa Gral. Belgrano', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'892 ', N'Villa Gutierrez', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'893 ', N'Villa Huidobro', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'894 ', N'Villa La Bolsa', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'895 ', N'Villa Los Aromos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'896 ', N'Villa Los Patos', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'897 ', N'Villa María', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'898 ', N'Villa Nueva', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'899 ', N'Villa Pque. Santa Ana', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'9   ', N'Azul', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'90  ', N'Mar del Plata', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'900 ', N'Villa Pque. Siquiman', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'901 ', N'Villa Quillinzo', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'902 ', N'Villa Rossi', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'903 ', N'Villa Rumipal', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'904 ', N'Villa San Esteban', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'905 ', N'Villa San Isidro', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'906 ', N'Villa 21', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'907 ', N'Villa Sarmiento (G.R)', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'908 ', N'Villa Sarmiento (S.A)', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'909 ', N'Villa Tulumba', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'91  ', N'Mar del Tuyú', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'910 ', N'Villa Valeria', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'911 ', N'Villa Yacanto', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'912 ', N'Washington', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'913 ', N'Wenceslao Escalante', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'914 ', N'Ycho Cruz Sierras', N'7 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'915 ', N'Alvear', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'916 ', N'Bella Vista', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'917 ', N'Berón de Astrada', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'918 ', N'Bonpland', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'919 ', N'Caá Cati', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'92  ', N'Marcos Paz', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'920 ', N'Capital', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'921 ', N'Chavarría', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'922 ', N'Col. C. Pellegrini', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'923 ', N'Col. Libertad', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'924 ', N'Col. Liebig', N'8 ')
GO
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'925 ', N'Col. Sta Rosa', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'926 ', N'Concepción', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'927 ', N'Cruz de Los Milagros', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'928 ', N'Curuzú-Cuatiá', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'929 ', N'Empedrado', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'93  ', N'Mercedes', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'930 ', N'Esquina', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'931 ', N'Estación Torrent', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'932 ', N'Felipe Yofré', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'933 ', N'Garruchos', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'934 ', N'Gdor. Agrónomo', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'935 ', N'Gdor. Martínez', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'936 ', N'Goya', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'937 ', N'Guaviravi', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'938 ', N'Herlitzka', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'939 ', N'Ita-Ibate', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'94  ', N'Miramar', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'940 ', N'Itatí', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'941 ', N'Ituzaingó', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'942 ', N'José Rafael Gómez', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'943 ', N'Juan Pujol', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'944 ', N'La Cruz', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'945 ', N'Lavalle', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'946 ', N'Lomas de Vallejos', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'947 ', N'Loreto', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'948 ', N'Mariano I. Loza', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'949 ', N'Mburucuyá', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'95  ', N'Monte', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'950 ', N'Mercedes', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'951 ', N'Mocoretá', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'952 ', N'Mte. Caseros', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'953 ', N'Nueve de Julio', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'954 ', N'Palmar Grande', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'955 ', N'Parada Pucheta', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'956 ', N'Paso de La Patria', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'957 ', N'Paso de Los Libres', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'958 ', N'Pedro R. Fernandez', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'959 ', N'Perugorría', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'96  ', N'Monte Hermoso', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'960 ', N'Pueblo Libertador', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'961 ', N'Ramada Paso', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'962 ', N'Riachuelo', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'963 ', N'Saladas', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'964 ', N'San Antonio', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'965 ', N'San Carlos', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'966 ', N'San Cosme', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'967 ', N'San Lorenzo', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'968 ', N'20 del Palmar', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'969 ', N'San Miguel', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'97  ', N'Munro', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'970 ', N'San Roque', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'971 ', N'Santa Ana', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'972 ', N'Santa Lucía', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'973 ', N'Santo Tomé', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'974 ', N'Sauce', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'975 ', N'Tabay', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'976 ', N'Tapebicuá', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'977 ', N'Tatacua', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'978 ', N'Virasoro', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'979 ', N'Yapeyú', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'98  ', N'Navarro', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'980 ', N'Yataití Calle', N'8 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'981 ', N'Alarcón', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'982 ', N'Alcaraz', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'983 ', N'Alcaraz N.', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'984 ', N'Alcaraz S.', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'985 ', N'Aldea Asunción', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'986 ', N'Aldea Brasilera', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'987 ', N'Aldea Elgenfeld', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'988 ', N'Aldea Grapschental', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'989 ', N'Aldea Ma. Luisa', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'99  ', N'Necochea', N'1 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'990 ', N'Aldea Protestante', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'991 ', N'Aldea Salto', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'992 ', N'Aldea San Antonio (G)', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'993 ', N'Aldea San Antonio (P)', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'994 ', N'Aldea 19', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'995 ', N'Aldea San Miguel', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'996 ', N'Aldea San Rafael', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'997 ', N'Aldea Spatzenkutter', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'998 ', N'Aldea Sta. María', N'9 ')
INSERT [dbo].[Localidades] ([codLoc_L], [descripcion_L], [codProv_L]) VALUES (N'999 ', N'Aldea Sta. Rosa', N'9 ')
GO
SET IDENTITY_INSERT [dbo].[Medicos] ON 

INSERT [dbo].[Medicos] ([legajo_M], [DNI_M], [Nombre_M], [Apellido_M], [Sexo_M], [Fecha Nacimiento_M], [Direccion_M], [codLoc_M], [codProv_M], [CorreoElectronico_M], [codEspecialidad_M], [Rango Horario_M], [User_M], [Password_M], [IdNacionalidad_M], [Estado_M]) VALUES (50, N'46433918', N'Javier', N'Dandrea', N'M', N'12/09/1998', N'Cañonera 1231', N'18  ', N'21', N'javito@gmail.com', N'15', N'M', N'Javito123', N'123', N'12', 0)
INSERT [dbo].[Medicos] ([legajo_M], [DNI_M], [Nombre_M], [Apellido_M], [Sexo_M], [Fecha Nacimiento_M], [Direccion_M], [codLoc_M], [codProv_M], [CorreoElectronico_M], [codEspecialidad_M], [Rango Horario_M], [User_M], [Password_M], [IdNacionalidad_M], [Estado_M]) VALUES (51, N'46433917', N'Javier', N'Dandrea', N'M', N'12/09/1998', N'Cañonera 1231', N'19  ', N'2 ', N'javito@gmail.com', N'05', N'T', N'Javito', N'123', N'06', 1)
SET IDENTITY_INSERT [dbo].[Medicos] OFF
GO
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'01', N'Argentina')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'02', N'Bolivia')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'03', N'Brasil')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'04', N'Canadá')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'05', N'Chile')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'06', N'Colombia')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'07', N'Cuba')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'08', N'Ecuador')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'09', N'El Salvador')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'10', N'España')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'11', N'Estados Unidos')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'12', N'Guatemala')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'13', N'Haití')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'14', N'Honduras')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'15', N'Italia')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'16', N'Jamaica')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'17', N'México')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'18', N'Nicaragua')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'19', N'Panamá')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'20', N'Paraguay')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'21', N'Perú')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'22', N'Uruguay')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'23', N'Venezuela')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'24', N'Puerto Rico')
INSERT [dbo].[Nacionalidades] ([IdNacionalidad_N], [Descripcion_N]) VALUES (N'25', N'Republica Dominicana')
GO
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'10582693', N'Adrian', N'Ruiz', N'18/10/1932', N'M', N'Oceania 77', N'  ', N'  ', N'  ', N'mail@mail.com', N'1122334455', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'11111111', N'Angela', N'Garcia', N'23/12/1997', N'F', N'Churich 478', N'  ', N'  ', N'  ', N'mail@mail.com', N'1122334455', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'12258852', N'Paloma', N'Reyes', N'27/03/1952', N'F', N'España 147', N'  ', N'  ', N'  ', N'mail@mail.com', N'1122334455', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'14141151', N'Felipe', N'Reyes', N'25/09/1950', N'M', N'Salta 2114', N'  ', N'  ', N'  ', N'email@email.com', N'1122334455', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'16959595', N'Karen', N'Rodriguez', N'16/09/1977', N'F', N'Olivetti 9999', N'  ', N'  ', N'  ', N'mail@mail.com', N'1122334455', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'16985741', N'Fabiana', N'Morales', N'14/10/1964', N'F', N'Murillo 2111', N'  ', N'  ', N'  ', N'email@email.com', N'1122334455', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'21212252', N'Marcos', N'Castillo ', N'13/07/1983', N'M', N'General Paz 144', N'30', N'4 ', N'15', N'mail@mail.com', N'1122334455', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'22222222', N'Ramiro', N'Lopes', N'14/09/2000', N'M', N'Córdoba 490', N'13', N'8 ', N'14', N'mail@mail.com', N'1122334455', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'22555666', N'Pamela', N'Cruz', N'16/09/1977', N'F', N'Por ahi 123', N'13', N'8 ', N'01', N'email@email.com', N'1122334455', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'30259259', N'Lucas', N'Rodriguez', N'26/12/1974', N'M', N'Entre rios 963', N'49', N'21', N'01', N'mail@mail.com', N'1122334455', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'31456987', N'Guillermo', N'Flores', N'10/10/1988', N'M', N'La Rioja 4400', N'21', N'5 ', N'22', N'email@email.com', N'11223344', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'33333333', N'Lara ', N'Hernandez', N'03/03/1984', N'F', N'Concejal Larroca 478', N'29', N'4 ', N'21', N'mail@mail.com', N'1122334455', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'37844111', N'Julieta', N'Ramirez', N'14/08/1996', N'F', N'Newton 369', N'48', N'20', N'22', N'mail@mail.com', N'1122334455', 1)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'44445555', N'Julian', N'Alvarez', N'18/07/1990', N'M', N'Direccion1', N'21', N'5 ', N'01', N'correo@gmail.com', N'1134567890', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'46433918', N'Javier', N'Dandrea', N'17/03/2005', N'M', N'Cañonera 1231', N'13', N'8 ', N'22', N'javito@gmail.com', N'1123434322', 1)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'52698524', N'Octavio', N'Castro', N'12/12/2008', N'M', N'Murillo 1999', N'9 ', N'3 ', N'01', N'email@email.com', N'1122334455', 1)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'59841841', N'Fabio', N'Torres', N'30/10/2020', N'M', N'Mendoza 478', N'13', N'8 ', N'19', N'email@email.com', N'1122334455', 1)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'66668888', N'Roberto', N'DeNirou', N'18/07/1993', N'M', N'Direccion2', N'32', N'14', N'05', N'rdenirou@gmail.com', N'12345678', 1)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'96325874', N'Paola', N'Rodriguez', N'06/06/1942', N'F', N'Lamberti 3665', N'15', N'9 ', N'17', N'mail@mail.com', N'1122334455', 1)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'99997777', N'Marco', N'Aurelio', N'18/07/1991', N'M', N'Direccion3', N'13', N'8 ', N'08', N'correo@gmail.com', N'1168965183', 0)
INSERT [dbo].[Pacientes] ([DNI_Pac], [Nombre_Pac], [Apellido_Pac], [Fecha Nacimiento_Pac], [Sexo_Pac], [Direccion_Pac], [CodLoc_Pac], [CodProv_Pac], [IdNacionalidad_Pac], [CorreoElectronico_Pac], [Telefono_Pac], [Estado_Pac]) VALUES (N'99999999', N'Javier', N'Dandrea', N'14/02/2000', N'M', N'Cañonera 1231', N'40', N'16', N'16', N'javito@gmail.com', N'1123434322', 0)
GO
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'1 ', N'Buenos Aires')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'10', N'Formosa')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'11', N'Jujuy')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'12', N'La Pampa')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'13', N'La Rioja')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'14', N'Mendoza')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'15', N'Misiones')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'16', N'Neuquén')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'17', N'Río Negro')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'18', N'Salta')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'19', N'San Juan')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'2 ', N'Buenos Aires-GBA')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'20', N'San Luis')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'21', N'Santa Cruz')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'22', N'Santa Fe')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'23', N'Santiago Del Estero ')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'24', N'Tierra Del Fuego')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'25', N'Tucumán')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'3 ', N'Capital Federal')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'4 ', N'Catamarca')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'5 ', N'Chaco')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'6 ', N'Chubut')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'7 ', N'Córdoba')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'8 ', N'Corrientes')
INSERT [dbo].[Provincias] ([codProv_P], [descripcion_P]) VALUES (N'9 ', N'Entre Ríos')
GO
SET IDENTITY_INSERT [dbo].[TurnosJunio] ON 

INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1855, 50, N'01', N'08.00', N'02/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1856, 50, N'01', N'08.00', N'03/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1857, 50, N'01', N'08.00', N'03/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1858, 50, N'01', N'08.00', N'03/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1859, 50, N'01', N'08.00', N'06/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1860, 50, N'01', N'08.00', N'09/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1861, 50, N'01', N'08.00', N'10/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1862, 50, N'01', N'08.00', N'10/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1863, 50, N'01', N'08.00', N'10/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1864, 50, N'01', N'08.00', N'13/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1865, 50, N'01', N'08.00', N'16/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1866, 50, N'01', N'08.00', N'17/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1867, 50, N'01', N'08.00', N'17/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1868, 50, N'01', N'08.00', N'17/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1869, 50, N'01', N'08.00', N'20/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1870, 50, N'01', N'08.00', N'23/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1871, 50, N'01', N'08.00', N'24/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1872, 50, N'01', N'08.00', N'24/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1873, 50, N'01', N'08.00', N'24/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1874, 50, N'01', N'08.00', N'27/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1875, 50, N'01', N'08.00', N'30/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1876, 50, N'01', N'09.00', N'02/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1877, 50, N'01', N'09.00', N'03/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1878, 50, N'01', N'09.00', N'03/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1879, 50, N'01', N'09.00', N'03/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1880, 50, N'01', N'09.00', N'06/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1881, 50, N'01', N'09.00', N'09/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1882, 50, N'01', N'09.00', N'10/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1883, 50, N'01', N'09.00', N'10/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1884, 50, N'01', N'09.00', N'10/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1885, 50, N'01', N'09.00', N'13/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1886, 50, N'01', N'09.00', N'16/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1887, 50, N'01', N'09.00', N'17/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1888, 50, N'01', N'09.00', N'17/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1889, 50, N'01', N'09.00', N'17/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1890, 50, N'01', N'09.00', N'20/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1891, 50, N'01', N'09.00', N'23/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1892, 50, N'01', N'09.00', N'24/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1893, 50, N'01', N'09.00', N'24/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1894, 50, N'01', N'09.00', N'24/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1895, 50, N'01', N'09.00', N'27/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1896, 50, N'01', N'09.00', N'30/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1897, 50, N'01', N'10.00', N'02/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1898, 50, N'01', N'10.00', N'03/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1899, 50, N'01', N'10.00', N'03/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1900, 50, N'01', N'10.00', N'03/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1901, 50, N'01', N'10.00', N'06/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1902, 50, N'01', N'10.00', N'09/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1903, 50, N'01', N'10.00', N'10/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1904, 50, N'01', N'10.00', N'10/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1905, 50, N'01', N'10.00', N'10/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1906, 50, N'01', N'10.00', N'13/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1907, 50, N'01', N'10.00', N'16/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1908, 50, N'01', N'10.00', N'17/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1909, 50, N'01', N'10.00', N'17/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1910, 50, N'01', N'10.00', N'17/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1911, 50, N'01', N'10.00', N'20/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1912, 50, N'01', N'10.00', N'23/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1913, 50, N'01', N'10.00', N'24/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1914, 50, N'01', N'10.00', N'24/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1915, 50, N'01', N'10.00', N'24/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1916, 50, N'01', N'10.00', N'27/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1917, 50, N'01', N'10.00', N'30/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1918, 50, N'01', N'11.00', N'02/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1919, 50, N'01', N'11.00', N'03/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1920, 50, N'01', N'11.00', N'03/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1921, 50, N'01', N'11.00', N'03/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1922, 50, N'01', N'11.00', N'06/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1923, 50, N'01', N'11.00', N'09/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1924, 50, N'01', N'11.00', N'10/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1925, 50, N'01', N'11.00', N'10/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1926, 50, N'01', N'11.00', N'10/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1927, 50, N'01', N'11.00', N'13/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1928, 50, N'01', N'11.00', N'16/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1929, 50, N'01', N'11.00', N'17/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1930, 50, N'01', N'11.00', N'17/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1931, 50, N'01', N'11.00', N'17/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1932, 50, N'01', N'11.00', N'20/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1933, 50, N'01', N'11.00', N'23/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1934, 50, N'01', N'11.00', N'24/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1935, 50, N'01', N'11.00', N'24/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1936, 50, N'01', N'11.00', N'24/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1937, 50, N'01', N'11.00', N'27/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1938, 50, N'01', N'11.00', N'30/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1939, 50, N'01', N'12.00', N'02/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1940, 50, N'01', N'12.00', N'03/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1941, 50, N'01', N'12.00', N'03/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1942, 50, N'01', N'12.00', N'03/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1943, 50, N'01', N'12.00', N'06/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1944, 50, N'01', N'12.00', N'09/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1945, 50, N'01', N'12.00', N'10/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1946, 50, N'01', N'12.00', N'10/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1947, 50, N'01', N'12.00', N'10/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1948, 50, N'01', N'12.00', N'13/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1949, 50, N'01', N'12.00', N'16/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1950, 50, N'01', N'12.00', N'17/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1951, 50, N'01', N'12.00', N'17/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1952, 50, N'01', N'12.00', N'17/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1953, 50, N'01', N'12.00', N'20/01', NULL, 1, NULL, NULL, 0)
GO
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1954, 50, N'01', N'12.00', N'23/12', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1955, 50, N'01', N'12.00', N'24/02', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1956, 50, N'01', N'12.00', N'24/03', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1957, 50, N'01', N'12.00', N'24/06', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1958, 50, N'01', N'12.00', N'27/01', NULL, 1, NULL, NULL, 0)
INSERT [dbo].[TurnosJunio] ([Id_turno], [Legajo_TJ], [CodDia_TJ], [CodHorario_TJ], [CodFecha_TJ], [DNI_TJ], [Disponibilidad_TJ], [Asistío_TJ], [Observacion_TJ], [MedicoActivo_TJ]) VALUES (1959, 50, N'01', N'12.00', N'30/12', NULL, 1, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[TurnosJunio] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([CodUsuario_us], [Usuario_us], [Contrasenia_us], [Legajo_us], [TipoUsuario_us], [Estado_us]) VALUES (8, N'Javito123', N'jav_med', N'28349   ', 1, 1)
INSERT [dbo].[Usuarios] ([CodUsuario_us], [Usuario_us], [Contrasenia_us], [Legajo_us], [TipoUsuario_us], [Estado_us]) VALUES (9, N'Katu_9_12', N'Katu123', N'28427   ', 0, 1)
INSERT [dbo].[Usuarios] ([CodUsuario_us], [Usuario_us], [Contrasenia_us], [Legajo_us], [TipoUsuario_us], [Estado_us]) VALUES (11, N'MedicoCabecera', N'Master123', N'17273   ', 0, 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Medicos]    Script Date: 25/12/2024 21:20:47 ******/
ALTER TABLE [dbo].[Medicos] ADD  CONSTRAINT [UK_Medicos] UNIQUE NONCLUSTERED 
(
	[DNI_M] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Pacientes]    Script Date: 25/12/2024 21:20:47 ******/
ALTER TABLE [dbo].[Pacientes] ADD  CONSTRAINT [UK_Pacientes] UNIQUE NONCLUSTERED 
(
	[DNI_Pac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_TurnosJunio]    Script Date: 25/12/2024 21:20:47 ******/
ALTER TABLE [dbo].[TurnosJunio] ADD  CONSTRAINT [UK_TurnosJunio] UNIQUE NONCLUSTERED 
(
	[Legajo_TJ] ASC,
	[CodDia_TJ] ASC,
	[CodHorario_TJ] ASC,
	[CodFecha_TJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Uk_Usuarios_Legajo]    Script Date: 25/12/2024 21:20:47 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [Uk_Usuarios_Legajo] UNIQUE NONCLUSTERED 
(
	[Legajo_us] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Uk_Usuarios_Usuario]    Script Date: 25/12/2024 21:20:47 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [Uk_Usuarios_Usuario] UNIQUE NONCLUSTERED 
(
	[Usuario_us] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Medicos] ADD  CONSTRAINT [DF_Medicos_Estado]  DEFAULT ((1)) FOR [Estado_M]
GO
ALTER TABLE [dbo].[Pacientes] ADD  DEFAULT ((1)) FOR [Estado_Pac]
GO
ALTER TABLE [dbo].[TurnosJunio] ADD  DEFAULT ((1)) FOR [Disponibilidad_TJ]
GO
ALTER TABLE [dbo].[TurnosJunio] ADD  DEFAULT ((1)) FOR [MedicoActivo_TJ]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [Estado_us]
GO
ALTER TABLE [dbo].[DiasMedicos]  WITH CHECK ADD  CONSTRAINT [FK_DiasMedicos_Dias] FOREIGN KEY([codDia_DM])
REFERENCES [dbo].[Dias] ([codDia_d])
GO
ALTER TABLE [dbo].[DiasMedicos] CHECK CONSTRAINT [FK_DiasMedicos_Dias]
GO
ALTER TABLE [dbo].[DiasMedicos]  WITH CHECK ADD  CONSTRAINT [FK_DiasMedicos_Horarios] FOREIGN KEY([codHorario_DM])
REFERENCES [dbo].[Horarios] ([codHorario_h])
GO
ALTER TABLE [dbo].[DiasMedicos] CHECK CONSTRAINT [FK_DiasMedicos_Horarios]
GO
ALTER TABLE [dbo].[DiasMedicos]  WITH CHECK ADD  CONSTRAINT [FK_DiasMedicos_Medicos] FOREIGN KEY([legajo_DM])
REFERENCES [dbo].[Medicos] ([legajo_M])
GO
ALTER TABLE [dbo].[DiasMedicos] CHECK CONSTRAINT [FK_DiasMedicos_Medicos]
GO
ALTER TABLE [dbo].[FechasJunio]  WITH CHECK ADD  CONSTRAINT [FK_FechasJunio_Dias] FOREIGN KEY([codDia_f])
REFERENCES [dbo].[Dias] ([codDia_d])
GO
ALTER TABLE [dbo].[FechasJunio] CHECK CONSTRAINT [FK_FechasJunio_Dias]
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD  CONSTRAINT [FK_Localidades_Provincias] FOREIGN KEY([codProv_L])
REFERENCES [dbo].[Provincias] ([codProv_P])
GO
ALTER TABLE [dbo].[Localidades] CHECK CONSTRAINT [FK_Localidades_Provincias]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Especialidades] FOREIGN KEY([codEspecialidad_M])
REFERENCES [dbo].[Especialidades] ([codEspecialidad_e])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Especialidades]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Localididades] FOREIGN KEY([codLoc_M])
REFERENCES [dbo].[Localidades] ([codLoc_L])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Localididades]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Nacionalidades] FOREIGN KEY([IdNacionalidad_M])
REFERENCES [dbo].[Nacionalidades] ([IdNacionalidad_N])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Nacionalidades]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Provincias] FOREIGN KEY([codProv_M])
REFERENCES [dbo].[Provincias] ([codProv_P])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Provincias]
GO
ALTER TABLE [dbo].[TurnosJunio]  WITH CHECK ADD  CONSTRAINT [FK_TurnosJunio_DiasMedicos] FOREIGN KEY([Legajo_TJ], [CodDia_TJ], [CodHorario_TJ])
REFERENCES [dbo].[DiasMedicos] ([legajo_DM], [codDia_DM], [codHorario_DM])
GO
ALTER TABLE [dbo].[TurnosJunio] CHECK CONSTRAINT [FK_TurnosJunio_DiasMedicos]
GO
ALTER TABLE [dbo].[TurnosJunio]  WITH CHECK ADD  CONSTRAINT [FK_TurnosJunio_FechasJunio] FOREIGN KEY([CodFecha_TJ])
REFERENCES [dbo].[FechasJunio] ([codFecha_f])
GO
ALTER TABLE [dbo].[TurnosJunio] CHECK CONSTRAINT [FK_TurnosJunio_FechasJunio]
GO
ALTER TABLE [dbo].[TurnosJunio]  WITH CHECK ADD  CONSTRAINT [FK_TurnosJunio_Pacientes] FOREIGN KEY([DNI_TJ])
REFERENCES [dbo].[Pacientes] ([DNI_Pac])
GO
ALTER TABLE [dbo].[TurnosJunio] CHECK CONSTRAINT [FK_TurnosJunio_Pacientes]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [CHK_Medicos_Estado] CHECK  (([Estado_M]=(1) OR [Estado_M]=(0)))
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [CHK_Medicos_Estado]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [CHK_Pacientes_Estado] CHECK  (([Estado_Pac]=(1) OR [Estado_Pac]=(0)))
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [CHK_Pacientes_Estado]
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarMedico]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ACTUALIZAR REGISTRO DE UN MÉDICO
CREATE PROCEDURE [dbo].[SP_ActualizarMedico]
@Legajo int,
@Dni char(8),
@Nombre varchar(50),
@Apellido varchar(50) ,
@sexo char(1),
@fechaN char(10),
@Direccion varchar(50) ,
@codLoc char(2) ,
@codProv char(2) ,
@Correo varchar(50) ,
@CodEspe char(2) ,
@RangoHorario char(1),
@Usuario varchar(50),
@Contra varchar(50),
@IdNac char(2),
@Estado bit
AS
UPDATE Medicos SET DNI_M = @Dni, Nombre_M = @Nombre, Apellido_M = @Apellido, Sexo_M = @sexo, [Fecha Nacimiento_M] = @fechaN, Direccion_M = @Direccion, codLoc_M = @codLoc, codProv_M = @codProv, CorreoElectronico_M = @Correo, codEspecialidad_M = @CodEspe, [Rango Horario_M] = @RangoHorario, User_M = @Usuario, Password_M = @Contra, IdNacionalidad_M = @IdNac, Estado_M = @Estado
WHERE legajo_M = @Legajo
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarPaciente]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create   procedure [dbo].[SP_ActualizarPaciente]
@Dni char(8),
@Nombre varchar(50),
@Apellido varchar(50) ,
@fechaN char(10),
@sexo char(1),
@Direccion varchar(50) ,
@codLoc char(2) ,
@codProv char(2) ,
@IdNac char(2),
@Correo varchar(50) ,
@Telefono varchar(20),
@Estado int
As
Update Pacientes Set DNI_Pac = @Dni, Nombre_Pac = @Nombre, Apellido_Pac = @Apellido, Sexo_Pac = @sexo, [Fecha Nacimiento_Pac] = @fechaN, Direccion_Pac = @Direccion, CodLoc_Pac = @codLoc, CodProv_Pac = @codProv, CorreoElectronico_Pac = @Correo, IdNacionalidad_Pac = @IdNac,Telefono_Pac = @Telefono, Estado_Pac = @Estado
Where DNI_Pac = @Dni
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarTurno]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarTurno]
	@NumTurno int,
	@Presencia char(8),
	@Observacion text
AS
BEGIN
	UPDATE Turnos SET  Presencia_tu = @Presencia, Observacion_tu = @Observacion WHERE NumTurno_tu = @NumTurno
END
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarUsuario]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ActualizarUsuario]
	@Usuario varchar(20),
	@Contrasenia varchar(20),
	@Legajo char (8)
AS
BEGIN
	UPDATE Usuarios SET Usuario_us = @Usuario, Contrasenia_us = @Contrasenia WHERE Legajo_us = @Legajo
END
RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarMedico]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_AgregarMedico]
@Dni char(8),
@Nombre varchar(50),
@Apellido varchar(50) ,
@sexo char(1),
@fechaN char(10),
@Direccion varchar(50) ,
@codLoc char(2) ,
@codProv char(2) ,
@Correo varchar(50) ,
@CodEspe char(2) ,
@RangoHorario char(1),
@Usuario varchar(50),
@Contra varchar(50),
@IdNac char(2),
@Estado  bit 
as
insert into medicos
select @Dni,@Nombre,@Apellido,@sexo,@fechaN,@Direccion,@codLoc,@codProv,@Correo,@CodEspe,@RangoHorario,@Usuario,@Contra,@IdNac,@Estado
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarPaciente]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_AgregarPaciente]
@Dni char(8),
@Nombre varchar(50),
@Apellido varchar(50) ,
@fechaN char(10),
@sexo char(1),
@Direccion varchar(50) ,
@codLoc char(2) ,
@codProv char(2) ,
@IdNac char(2),
@Correo varchar(50) ,
@Telefono varchar(20),
@Estado  bit 
as
insert into Pacientes
select @Dni,@Nombre,@Apellido,@fechaN,@sexo,@Direccion,@codLoc,@codProv,@IdNac,@Correo,@Telefono,@Estado
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarTurno]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarTurno]
(
@Legajo char(8),
@DNI char(8),
@Nombre varchar(20),
@Apellido varchar(30),
@Dia char(9),
@Hora time(7),
@Fecha date
)
AS
INSERT INTO Turnos(LegajoMed_tu, DNIPaciente_tu, Nombre_tu, Apellido_tu, Dia_tu, Hora_tu, Fecha_tu)
Select @Legajo, @DNI, @Nombre, @Apellido, @Dia, @Hora, @Fecha
RETURN
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarUsuarioMed]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_AgregarUsuarioMed]
(
@Usuario varchar(20),
@Contra varchar(20),
@Legajo char(8)
)
AS
INSERT INTO Usuarios(Usuario_us, Contrasenia_us, Legajo_us, TipoUsuario_us)
Select @Usuario, @Contra, @Legajo, 0
RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_BuscarAdmin]    Script Date: 25/12/2024 21:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_BuscarAdmin]
@Nombre varchar(50),
@Contraseña varchar(50)
as
select * from Admins where NombreUser_A = @Nombre and ContraseñaUser_A = @Contraseña
GO
USE [master]
GO
ALTER DATABASE [CLINICA] SET  READ_WRITE 
GO
