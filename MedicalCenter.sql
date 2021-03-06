USE [master]
GO
/****** Object:  Database [Kursovaya_Polina]    Script Date: 25.11.2021 19:13:33 ******/
CREATE DATABASE [Kursovaya_Polina]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kursovaya_Polina', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ Kursovaya_Polina.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Kursovaya_Polina_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ Kursovaya_Polina_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kursovaya_Polina] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kursovaya_Polina].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kursovaya_Polina] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kursovaya_Polina] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kursovaya_Polina] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Kursovaya_Polina] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kursovaya_Polina] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET RECOVERY FULL 
GO
ALTER DATABASE [Kursovaya_Polina] SET  MULTI_USER 
GO
ALTER DATABASE [Kursovaya_Polina] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kursovaya_Polina] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kursovaya_Polina] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kursovaya_Polina] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kursovaya_Polina] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kursovaya_Polina] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Kursovaya_Polina', N'ON'
GO
ALTER DATABASE [Kursovaya_Polina] SET QUERY_STORE = OFF
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 25.11.2021 19:13:34 ******/
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [DESKTOP-H4GUTBQ\Никита]    Script Date: 25.11.2021 19:13:34 ******/
CREATE LOGIN [DESKTOP-H4GUTBQ\Никита] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DESKTOP-H4GUTBQ\Никита]
GO
USE [Kursovaya_Polina]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrators](
	[IdAdministrator] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAdministrator] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[IdAppointment] [int] IDENTITY(1,1) NOT NULL,
	[IdDoctor] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[IdPatient] [int] NULL,
	[Complaints] [varchar](500) NULL,
	[Recommendations] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAppointment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentsDiagnoses]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentsDiagnoses](
	[IdAppointment] [int] NOT NULL,
	[IdDiagnose] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentsMedicaments]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentsMedicaments](
	[IdAppointment] [int] NOT NULL,
	[IdMedicament] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentsServices]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentsServices](
	[IdAppointment] [int] NOT NULL,
	[IdService] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnoses]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnoses](
	[IdDiagnose] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDiagnose] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[IdDoctor] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [varchar](50) NOT NULL,
	[IdSpecialization] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DosageForms]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DosageForms](
	[IdForm] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdForm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicaments]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicaments](
	[IdMedicament] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DosageForm] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[IdSupplier] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedicament] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[IdPatient] [int] NULL,
	[TotalPrice] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersMedicaments]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersMedicaments](
	[IdOrder] [int] NOT NULL,
	[IdMedicament] [int] NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[IdPatient] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [varchar](50) NOT NULL,
	[Birthdate] [date] NOT NULL,
	[PhoneNumber] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPatient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[IdService] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicesDoctors]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicesDoctors](
	[IdService] [int] NOT NULL,
	[IdDoctor] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specializations]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specializations](
	[IdSpecialization] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSpecialization] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[IdSupplier] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeUsers]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeUsers](
	[IdTypeUser] [int] IDENTITY(1,1) NOT NULL,
	[NameType] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTypeUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25.11.2021 19:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[FIO] [varchar](50) NOT NULL,
	[TypeUser] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrators] ON 

INSERT [dbo].[Administrators] ([IdAdministrator], [FIO]) VALUES (1, N'Левина Теона Тихоновна')
INSERT [dbo].[Administrators] ([IdAdministrator], [FIO]) VALUES (2, N'Сидорова Ульяна Петровна')
SET IDENTITY_INSERT [dbo].[Administrators] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([IdAppointment], [IdDoctor], [DateTime], [IdPatient], [Complaints], [Recommendations]) VALUES (1, 3, CAST(N'2020-12-16T12:00:00.000' AS DateTime), 5, N'Зуд кожи лица, высыпания', N'Принимать тавегил 3 раза в день, исключить вредную пищу, повторный приём через месяц')
INSERT [dbo].[Appointments] ([IdAppointment], [IdDoctor], [DateTime], [IdPatient], [Complaints], [Recommendations]) VALUES (2, 3, CAST(N'2020-07-21T17:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Appointments] ([IdAppointment], [IdDoctor], [DateTime], [IdPatient], [Complaints], [Recommendations]) VALUES (3, 3, CAST(N'2021-08-01T17:00:00.000' AS DateTime), 2, N'Высыпания на спине', N'Наладить питание, исключив сладкую пищу')
INSERT [dbo].[Appointments] ([IdAppointment], [IdDoctor], [DateTime], [IdPatient], [Complaints], [Recommendations]) VALUES (5, 3, CAST(N'2021-01-18T15:00:00.000' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[Appointments] ([IdAppointment], [IdDoctor], [DateTime], [IdPatient], [Complaints], [Recommendations]) VALUES (6, 7, CAST(N'2020-10-07T11:00:00.000' AS DateTime), 5, N'Высыпания на лице', N'Сменить уходовую косметику, пить больше воды')
INSERT [dbo].[Appointments] ([IdAppointment], [IdDoctor], [DateTime], [IdPatient], [Complaints], [Recommendations]) VALUES (7, 21, CAST(N'2020-04-14T14:00:00.000' AS DateTime), 9, N'Болевые ощущения вруке после падения', N'Спокойный образ жизни, принимать кальций, наложить гипс, при болях принимать нурофен')
INSERT [dbo].[Appointments] ([IdAppointment], [IdDoctor], [DateTime], [IdPatient], [Complaints], [Recommendations]) VALUES (8, 3, CAST(N'2021-11-14T10:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Appointments] ([IdAppointment], [IdDoctor], [DateTime], [IdPatient], [Complaints], [Recommendations]) VALUES (9, 3, CAST(N'2021-11-14T11:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Appointments] ([IdAppointment], [IdDoctor], [DateTime], [IdPatient], [Complaints], [Recommendations]) VALUES (10, 3, CAST(N'2021-11-14T12:00:00.000' AS DateTime), 16, NULL, NULL)
INSERT [dbo].[Appointments] ([IdAppointment], [IdDoctor], [DateTime], [IdPatient], [Complaints], [Recommendations]) VALUES (12, 3, CAST(N'2021-11-12T10:00:00.000' AS DateTime), 11, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
INSERT [dbo].[AppointmentsDiagnoses] ([IdAppointment], [IdDiagnose]) VALUES (1, 1)
INSERT [dbo].[AppointmentsDiagnoses] ([IdAppointment], [IdDiagnose]) VALUES (3, 1)
INSERT [dbo].[AppointmentsDiagnoses] ([IdAppointment], [IdDiagnose]) VALUES (6, 2)
INSERT [dbo].[AppointmentsDiagnoses] ([IdAppointment], [IdDiagnose]) VALUES (6, 3)
INSERT [dbo].[AppointmentsDiagnoses] ([IdAppointment], [IdDiagnose]) VALUES (7, 6)
GO
INSERT [dbo].[AppointmentsMedicaments] ([IdAppointment], [IdMedicament]) VALUES (1, 23)
INSERT [dbo].[AppointmentsMedicaments] ([IdAppointment], [IdMedicament]) VALUES (7, 14)
GO
INSERT [dbo].[AppointmentsServices] ([IdAppointment], [IdService]) VALUES (1, 2)
INSERT [dbo].[AppointmentsServices] ([IdAppointment], [IdService]) VALUES (3, 2)
INSERT [dbo].[AppointmentsServices] ([IdAppointment], [IdService]) VALUES (5, 4)
INSERT [dbo].[AppointmentsServices] ([IdAppointment], [IdService]) VALUES (6, 8)
INSERT [dbo].[AppointmentsServices] ([IdAppointment], [IdService]) VALUES (7, 11)
INSERT [dbo].[AppointmentsServices] ([IdAppointment], [IdService]) VALUES (7, 14)
INSERT [dbo].[AppointmentsServices] ([IdAppointment], [IdService]) VALUES (7, 15)
GO
SET IDENTITY_INSERT [dbo].[Diagnoses] ON 

INSERT [dbo].[Diagnoses] ([IdDiagnose], [Name]) VALUES (3, N'Акне')
INSERT [dbo].[Diagnoses] ([IdDiagnose], [Name]) VALUES (8, N'Аллергический конъюнктивит')
INSERT [dbo].[Diagnoses] ([IdDiagnose], [Name]) VALUES (9, N'Аллергический ринит')
INSERT [dbo].[Diagnoses] ([IdDiagnose], [Name]) VALUES (1, N'Аллергия')
INSERT [dbo].[Diagnoses] ([IdDiagnose], [Name]) VALUES (5, N'Кариес')
INSERT [dbo].[Diagnoses] ([IdDiagnose], [Name]) VALUES (6, N'Перелом')
INSERT [dbo].[Diagnoses] ([IdDiagnose], [Name]) VALUES (4, N'Простуда')
INSERT [dbo].[Diagnoses] ([IdDiagnose], [Name]) VALUES (7, N'Растяжение связок')
INSERT [dbo].[Diagnoses] ([IdDiagnose], [Name]) VALUES (2, N'Угревая сыпь')
SET IDENTITY_INSERT [dbo].[Diagnoses] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (1, N'Булатова Лилия Николаевна', 1)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (2, N'Филатова Полина Михайловна', 1)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (3, N'Куликова Светлана Артёмовна', 2)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (4, N'Никольская Яна Арсентьевна', 3)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (5, N'Жукова Василиса Данииловна', 3)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (6, N'Пономарев Артём Даниилович', 4)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (7, N'Волкова Таисия Ярославовна', 4)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (8, N'Корнилова Анна Егоровна', 5)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (9, N'Михеева Виктория Владимировна', 6)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (10, N'Егоров Андрей Владимирович', 6)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (11, N'Кузнецова Светлана Ярославовна', 7)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (12, N'Соколова Вероника Александровна', 7)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (13, N'Черных Кирилл Дмитриевич', 8)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (14, N'Романова Альбина Александровна', 9)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (15, N'Шестакова Анна Ильинична', 9)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (16, N'Кононова Анастасия Дмитриевна', 10)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (17, N'Селиванов Вадим Георгиевич', 10)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (18, N'Смирнова Диана Кирилловна', 11)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (19, N'Курочкин Алексей Никитич', 11)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (20, N'Успенская Мария Семёновна', 12)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (21, N'Ильина Александра Олеговна', 13)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (22, N'Калинин Евгений Михайлович', 14)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (23, N'Щербаков Михаил Тимурович', 14)
INSERT [dbo].[Doctors] ([IdDoctor], [FIO], [IdSpecialization]) VALUES (24, N'Маркова Евгения Александровна', 15)
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[DosageForms] ON 

INSERT [dbo].[DosageForms] ([IdForm], [Name]) VALUES (10, N'Аэрозоли')
INSERT [dbo].[DosageForms] ([IdForm], [Name]) VALUES (5, N'Гель')
INSERT [dbo].[DosageForms] ([IdForm], [Name]) VALUES (7, N'Капли')
INSERT [dbo].[DosageForms] ([IdForm], [Name]) VALUES (3, N'Капсулы')
INSERT [dbo].[DosageForms] ([IdForm], [Name]) VALUES (4, N'Крем')
INSERT [dbo].[DosageForms] ([IdForm], [Name]) VALUES (9, N'Микстуры')
INSERT [dbo].[DosageForms] ([IdForm], [Name]) VALUES (6, N'Настойка')
INSERT [dbo].[DosageForms] ([IdForm], [Name]) VALUES (2, N'Порошок')
INSERT [dbo].[DosageForms] ([IdForm], [Name]) VALUES (8, N'Сироп')
INSERT [dbo].[DosageForms] ([IdForm], [Name]) VALUES (1, N'Таблетки')
SET IDENTITY_INSERT [dbo].[DosageForms] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicaments] ON 

INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (1, N'Авиамарин', 1, 150, 5, 2)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (2, N'Адепресс', 1, 460, 3, 4)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (3, N'Бактерисепт', 10, 100, 5, 7)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (4, N'Бепантол', 4, 320, 2, 6)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (5, N'Быструмгель', 5, 300, 4, 10)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (6, N'Гексализ', 1, 305, 11, 6)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (7, N'Гексорал', 10, 360, 7, 2)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (8, N'Зодак', 1, 260, 3, 1)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (9, N'Ибуклин', 1, 140, 2, 2)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (10, N'Ибуфен', 8, 340, 5, 3)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (11, N'Каметон', 10, 220, 4, 5)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (12, N'Левомеколь', 4, 150, 6, 9)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (13, N'Маалокс', 2, 370, 3, 7)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (14, N'Нурофен', 3, 330, 9, 6)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (15, N'Но-шпа', 1, 130, 4, 8)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (16, N'Омега-3', 3, 1100, 2, 8)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (17, N'Пантенол', 4, 460, 6, 10)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (18, N'Синекод', 9, 370, 3, 4)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (19, N'ТераФлю', 2, 460, 9, 1)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (20, N'Фенистил', 5, 420, 6, 3)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (21, N'Систейн', 7, 520, 5, 7)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (22, N'Суприма-бронхо', 6, 175, 4, 6)
INSERT [dbo].[Medicaments] ([IdMedicament], [Name], [DosageForm], [Price], [Quantity], [IdSupplier]) VALUES (23, N'Тавегил', 1, 220, 5, 5)
SET IDENTITY_INSERT [dbo].[Medicaments] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([IdOrder], [Date], [IdPatient], [TotalPrice]) VALUES (1, CAST(N'2020-05-04' AS Date), 5, 440)
INSERT [dbo].[Orders] ([IdOrder], [Date], [IdPatient], [TotalPrice]) VALUES (2, CAST(N'2020-11-04' AS Date), 13, 460)
INSERT [dbo].[Orders] ([IdOrder], [Date], [IdPatient], [TotalPrice]) VALUES (3, CAST(N'2021-11-13' AS Date), 5, 1820)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[OrdersMedicaments] ([IdOrder], [IdMedicament], [Quantity]) VALUES (1, 23, 2)
INSERT [dbo].[OrdersMedicaments] ([IdOrder], [IdMedicament], [Quantity]) VALUES (2, 14, 1)
INSERT [dbo].[OrdersMedicaments] ([IdOrder], [IdMedicament], [Quantity]) VALUES (2, 15, 1)
INSERT [dbo].[OrdersMedicaments] ([IdOrder], [IdMedicament], [Quantity]) VALUES (3, 7, 2)
INSERT [dbo].[OrdersMedicaments] ([IdOrder], [IdMedicament], [Quantity]) VALUES (3, 16, 1)
GO
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (1, N'Смирнов Роман Степанович', CAST(N'2021-04-12' AS Date), N'89212104608')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (2, N'Буров Кирилл Михайлович', CAST(N'1962-02-05' AS Date), N'89210433023')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (5, N'Чумакова София Васильевна', CAST(N'1939-10-22' AS Date), N'89218592877')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (6, N'Смирнов Лев Егорович', CAST(N'1941-01-14' AS Date), N'89213881917')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (7, N'Юдин Арсений Вячеславович', CAST(N'1949-09-20' AS Date), N'89216604477')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (8, N'Михайлов Алексей Сергеевич', CAST(N'2003-02-25' AS Date), N'89219716898')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (9, N'Степанов Леонид Артёмович', CAST(N'2019-01-09' AS Date), N'89214224464')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (10, N'Смирнов Александр Ильич', CAST(N'1941-03-05' AS Date), N'89214203472')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (11, N'Золотарева Екатерина Дмитриевна', CAST(N'1983-04-01' AS Date), N'89214259036')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (12, N'Зайцев Александр Владимирович', CAST(N'1970-08-20' AS Date), N'89210769758')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (13, N'Горшков Кирилл Маркович', CAST(N'1944-08-25' AS Date), N'89217062710')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (14, N'Соловьева Яна Арсентьевна', CAST(N'1973-12-26' AS Date), N'89214058889')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (15, N'Новикова Кира Никитична', CAST(N'2004-08-01' AS Date), N'89210421781')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (16, N'Григорьева Кристина Тимуровна', CAST(N'2007-12-12' AS Date), N'89216884366')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (17, N'Сидоров Михаил Тимурович', CAST(N'1993-03-12' AS Date), N'89217344446')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (18, N'Емельянов Дмитрий Матвеевич', CAST(N'1982-04-05' AS Date), N'89215284077')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (19, N'Сорокина Мария Борисовна', CAST(N'1988-01-04' AS Date), N'89212930859')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (20, N'Иванов Андрей Миронович', CAST(N'1957-05-01' AS Date), N'89213797469')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (21, N'Зимина Ульяна Лукинична', CAST(N'2007-10-18' AS Date), N'89219364833')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (22, N'Павлова Лилия Михайловна', CAST(N'1959-12-17' AS Date), N'89215186968')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (23, N'Архипов Дмитрий Маркович', CAST(N'1984-11-06' AS Date), N'89216124719')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (24, N'Шестакова Ева Александровна', CAST(N'1960-12-14' AS Date), N'89219983575')
INSERT [dbo].[Patients] ([IdPatient], [FIO], [Birthdate], [PhoneNumber]) VALUES (25, N'Белова Евангелина Михайловна', CAST(N'1996-03-03' AS Date), N'89211413474')
SET IDENTITY_INSERT [dbo].[Patients] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([IdService], [Name], [Price]) VALUES (2, N'Первичный осмотр врача аллрголога', 2400)
INSERT [dbo].[Services] ([IdService], [Name], [Price]) VALUES (4, N'Повторный осмотр врача аллрголога', 2200)
INSERT [dbo].[Services] ([IdService], [Name], [Price]) VALUES (8, N'Первичный осмотр врача дерматолога', 2500)
INSERT [dbo].[Services] ([IdService], [Name], [Price]) VALUES (10, N'Повторный осмотр врача дерматолога', 2200)
INSERT [dbo].[Services] ([IdService], [Name], [Price]) VALUES (11, N'Первичный осмотр врача травматолога', 1800)
INSERT [dbo].[Services] ([IdService], [Name], [Price]) VALUES (12, N'Повторный осмотр врача травматолога', 1500)
INSERT [dbo].[Services] ([IdService], [Name], [Price]) VALUES (13, N'УЗИ', 1300)
INSERT [dbo].[Services] ([IdService], [Name], [Price]) VALUES (14, N'Наложение гипса', 1100)
INSERT [dbo].[Services] ([IdService], [Name], [Price]) VALUES (15, N'Рентген', 1200)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
INSERT [dbo].[ServicesDoctors] ([IdService], [IdDoctor]) VALUES (2, 3)
INSERT [dbo].[ServicesDoctors] ([IdService], [IdDoctor]) VALUES (4, 3)
INSERT [dbo].[ServicesDoctors] ([IdService], [IdDoctor]) VALUES (8, 7)
INSERT [dbo].[ServicesDoctors] ([IdService], [IdDoctor]) VALUES (11, 21)
INSERT [dbo].[ServicesDoctors] ([IdService], [IdDoctor]) VALUES (14, 21)
INSERT [dbo].[ServicesDoctors] ([IdService], [IdDoctor]) VALUES (15, 21)
GO
SET IDENTITY_INSERT [dbo].[Specializations] ON 

INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (1, N'Акушер-гинеколог')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (2, N'Аллерголог')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (3, N'Гинеколог')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (4, N'Дерматолог')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (5, N'Косметолог')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (7, N'Ортопед')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (6, N'Офтальмолог')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (8, N'Педиатр')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (9, N'Психолог')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (10, N'Стоматолог')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (11, N'Стоматолог-ортодонт')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (12, N'Терапевт')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (13, N'Травматолог')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (14, N'Уролог')
INSERT [dbo].[Specializations] ([IdSpecialization], [Name]) VALUES (15, N'Эндокринолог')
SET IDENTITY_INSERT [dbo].[Specializations] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([IdSupplier], [Name]) VALUES (10, N'Астра Фарма')
INSERT [dbo].[Suppliers] ([IdSupplier], [Name]) VALUES (4, N'Биоритм')
INSERT [dbo].[Suppliers] ([IdSupplier], [Name]) VALUES (5, N'ДИЛЕО фарма')
INSERT [dbo].[Suppliers] ([IdSupplier], [Name]) VALUES (7, N'Кей Групп')
INSERT [dbo].[Suppliers] ([IdSupplier], [Name]) VALUES (6, N'Медея-Фарм')
INSERT [dbo].[Suppliers] ([IdSupplier], [Name]) VALUES (1, N'МедиаМед')
INSERT [dbo].[Suppliers] ([IdSupplier], [Name]) VALUES (3, N'Медторг')
INSERT [dbo].[Suppliers] ([IdSupplier], [Name]) VALUES (9, N'Парус Фарма')
INSERT [dbo].[Suppliers] ([IdSupplier], [Name]) VALUES (8, N'Фармсервис')
INSERT [dbo].[Suppliers] ([IdSupplier], [Name]) VALUES (2, N'Фарм-Трэйд')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeUsers] ON 

INSERT [dbo].[TypeUsers] ([IdTypeUser], [NameType]) VALUES (1, N'Администратор')
INSERT [dbo].[TypeUsers] ([IdTypeUser], [NameType]) VALUES (2, N'Врач')
INSERT [dbo].[TypeUsers] ([IdTypeUser], [NameType]) VALUES (3, N'Пациент')
SET IDENTITY_INSERT [dbo].[TypeUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (2, N'levina.tt', N'levina', N'Левина Теона Тихоновна', 1)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (3, N'123', N'123', N'Сидорова Ульяна Петровна', 1)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (5, N'bulatova.ln', N'bulatova', N'Булатова Лилия Николаевна', 2)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (6, N'filatova.pm', N'filatova', N'Филатова Полина Михайловна', 2)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (7, N'12', N'12', N'Куликова Светлана Артёмовна', 2)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (8, N'nikolskaya.ya', N'nikolskaya', N'Никольская Яна Арсентьевна', 2)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (9, N'jukova.vd', N'jukova', N'Жукова Василиса Данииловна', 2)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (10, N'ponomarev.ad', N'ponomarev', N'Пономарев Артём Даниилович', 2)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (11, N'volkova.ty', N'volkova', N'Волкова Таисия Ярославовна', 2)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (12, N'kornilova.ae', N'kornilova', N'Корнилова Анна Егоровна', 2)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (13, N'miheeva.vv', N'miheeva', N'Михеева Виктория Владимировна', 2)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (14, N'egorov.av', N'egorov', N'Егоров Андрей Владимирович', 2)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (15, N'smirnov.rs', N'smirnov', N'Смирнов Роман Степанович', 3)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (16, N'burov.km', N'burov', N'Буров Кирилл Михайлович', 3)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (17, N'1', N'1', N'Чумакова София Васильевна', 3)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (19, N'smirnov.le', N'smirnov1', N'Смирнов Лев Егорович', 3)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (20, N'judin.av', N'judin', N'Юдин Арсений Вячеславович', 3)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (21, N'mihajlov.as', N'mihajlov', N'Михайлов Алексей Сергеевич', 3)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (22, N'stepanov.la', N'stepanov', N'Степанов Леонид Артёмович', 3)
INSERT [dbo].[Users] ([IdUser], [Login], [Password], [FIO], [TypeUser]) VALUES (25, N'smirnov.ai', N'smirnov2', N'Смирнов Александр Ильич', 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Administ__C1BEAA5C49C86B4D]    Script Date: 25.11.2021 19:13:34 ******/
ALTER TABLE [dbo].[Administrators] ADD UNIQUE NONCLUSTERED 
(
	[FIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Diagnose__737584F60D688C40]    Script Date: 25.11.2021 19:13:34 ******/
ALTER TABLE [dbo].[Diagnoses] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Doctors__C1BEAA5C7F3FA66E]    Script Date: 25.11.2021 19:13:34 ******/
ALTER TABLE [dbo].[Doctors] ADD UNIQUE NONCLUSTERED 
(
	[FIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__DosageFo__737584F6EDD49743]    Script Date: 25.11.2021 19:13:34 ******/
ALTER TABLE [dbo].[DosageForms] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Patients__85FB4E3865F5E82D]    Script Date: 25.11.2021 19:13:34 ******/
ALTER TABLE [dbo].[Patients] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Patients__C1BEAA5C7A0CC038]    Script Date: 25.11.2021 19:13:34 ******/
ALTER TABLE [dbo].[Patients] ADD UNIQUE NONCLUSTERED 
(
	[FIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Services__737584F62A7EFEF1]    Script Date: 25.11.2021 19:13:34 ******/
ALTER TABLE [dbo].[Services] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Speciali__737584F6AA7A3186]    Script Date: 25.11.2021 19:13:34 ******/
ALTER TABLE [dbo].[Specializations] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Supplier__737584F6F206A92D]    Script Date: 25.11.2021 19:13:34 ******/
ALTER TABLE [dbo].[Suppliers] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TypeUser__BA7C3F28E6444BB7]    Script Date: 25.11.2021 19:13:34 ******/
ALTER TABLE [dbo].[TypeUsers] ADD UNIQUE NONCLUSTERED 
(
	[NameType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__5E55825B04719594]    Script Date: 25.11.2021 19:13:34 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__87909B15C140A844]    Script Date: 25.11.2021 19:13:34 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__C1BEAA5C95F01BCA]    Script Date: 25.11.2021 19:13:34 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[FIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([IdDoctor])
REFERENCES [dbo].[Doctors] ([IdDoctor])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([IdPatient])
REFERENCES [dbo].[Patients] ([IdPatient])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AppointmentsDiagnoses]  WITH CHECK ADD FOREIGN KEY([IdAppointment])
REFERENCES [dbo].[Appointments] ([IdAppointment])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AppointmentsDiagnoses]  WITH CHECK ADD FOREIGN KEY([IdDiagnose])
REFERENCES [dbo].[Diagnoses] ([IdDiagnose])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AppointmentsMedicaments]  WITH CHECK ADD FOREIGN KEY([IdAppointment])
REFERENCES [dbo].[Appointments] ([IdAppointment])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AppointmentsMedicaments]  WITH CHECK ADD FOREIGN KEY([IdMedicament])
REFERENCES [dbo].[Medicaments] ([IdMedicament])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AppointmentsServices]  WITH CHECK ADD FOREIGN KEY([IdAppointment])
REFERENCES [dbo].[Appointments] ([IdAppointment])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AppointmentsServices]  WITH CHECK ADD FOREIGN KEY([IdService])
REFERENCES [dbo].[Services] ([IdService])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD FOREIGN KEY([IdSpecialization])
REFERENCES [dbo].[Specializations] ([IdSpecialization])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Medicaments]  WITH CHECK ADD FOREIGN KEY([DosageForm])
REFERENCES [dbo].[DosageForms] ([IdForm])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Medicaments]  WITH CHECK ADD FOREIGN KEY([IdSupplier])
REFERENCES [dbo].[Suppliers] ([IdSupplier])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([IdPatient])
REFERENCES [dbo].[Patients] ([IdPatient])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdersMedicaments]  WITH CHECK ADD FOREIGN KEY([IdMedicament])
REFERENCES [dbo].[Medicaments] ([IdMedicament])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdersMedicaments]  WITH CHECK ADD FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Orders] ([IdOrder])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServicesDoctors]  WITH CHECK ADD FOREIGN KEY([IdDoctor])
REFERENCES [dbo].[Doctors] ([IdDoctor])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServicesDoctors]  WITH CHECK ADD FOREIGN KEY([IdService])
REFERENCES [dbo].[Services] ([IdService])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([TypeUser])
REFERENCES [dbo].[TypeUsers] ([IdTypeUser])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [Kursovaya_Polina] SET  READ_WRITE 
GO
