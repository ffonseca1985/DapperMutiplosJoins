USE [master]
GO
/****** Object:  Database [DbTeste]    Script Date: 05/03/2019 23:36:18 ******/
CREATE DATABASE [DbTeste]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbTeste', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DbTeste.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DbTeste_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DbTeste_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DbTeste] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbTeste].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbTeste] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbTeste] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbTeste] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbTeste] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbTeste] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbTeste] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbTeste] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbTeste] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbTeste] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbTeste] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbTeste] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbTeste] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbTeste] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbTeste] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbTeste] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbTeste] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbTeste] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbTeste] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbTeste] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbTeste] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbTeste] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbTeste] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbTeste] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbTeste] SET  MULTI_USER 
GO
ALTER DATABASE [DbTeste] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbTeste] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbTeste] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbTeste] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DbTeste]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 05/03/2019 23:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enderecos]    Script Date: 05/03/2019 23:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enderecos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Investimento]    Script Date: 05/03/2019 23:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Investimento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 05/03/2019 23:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sexo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 05/03/2019 23:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Descricao] [varchar](300) NULL,
	[Sexo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioEmpresa]    Script Date: 05/03/2019 23:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioEmpresa](
	[IdUsuario] [int] NOT NULL,
	[IdEmpresa] [int] NOT NULL,
	[DataInicio] [datetime] NULL,
 CONSTRAINT [PKUsuarioEmpresa] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioEndereco]    Script Date: 05/03/2019 23:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioEndereco](
	[IdUsuario] [int] NOT NULL,
	[IdEndereco] [int] NOT NULL,
 CONSTRAINT [PkUsuarioEndereco] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioInvestimento]    Script Date: 05/03/2019 23:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioInvestimento](
	[IdUsuario] [int] NOT NULL,
	[IdEInvestimento] [int] NOT NULL,
 CONSTRAINT [PkUsuarioInvestimento] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdEInvestimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Empresa] ON 

INSERT [dbo].[Empresa] ([Id], [Nome]) VALUES (1, N'ford')
INSERT [dbo].[Empresa] ([Id], [Nome]) VALUES (2, N'wolks')
INSERT [dbo].[Empresa] ([Id], [Nome]) VALUES (3, N'fiat')
INSERT [dbo].[Empresa] ([Id], [Nome]) VALUES (4, N'GM')
SET IDENTITY_INSERT [dbo].[Empresa] OFF
SET IDENTITY_INSERT [dbo].[Enderecos] ON 

INSERT [dbo].[Enderecos] ([Id], [Nome]) VALUES (1, N'End 1')
INSERT [dbo].[Enderecos] ([Id], [Nome]) VALUES (2, N'End 2')
INSERT [dbo].[Enderecos] ([Id], [Nome]) VALUES (3, N'End 3')
INSERT [dbo].[Enderecos] ([Id], [Nome]) VALUES (4, N'End 4')
SET IDENTITY_INSERT [dbo].[Enderecos] OFF
SET IDENTITY_INSERT [dbo].[Investimento] ON 

INSERT [dbo].[Investimento] ([Id], [Nome]) VALUES (1, N'Renda Fixa')
INSERT [dbo].[Investimento] ([Id], [Nome]) VALUES (2, N'Renda Variavel')
INSERT [dbo].[Investimento] ([Id], [Nome]) VALUES (3, N'Fundos de Investimento')
INSERT [dbo].[Investimento] ([Id], [Nome]) VALUES (4, N'Derivativos')
SET IDENTITY_INSERT [dbo].[Investimento] OFF
SET IDENTITY_INSERT [dbo].[Sexo] ON 

INSERT [dbo].[Sexo] ([Id], [Nome]) VALUES (1, N'Masc')
INSERT [dbo].[Sexo] ([Id], [Nome]) VALUES (2, N'Fem')
SET IDENTITY_INSERT [dbo].[Sexo] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Nome], [Descricao], [Sexo]) VALUES (1, N'maria', N'descricao maria', 2)
INSERT [dbo].[Usuario] ([Id], [Nome], [Descricao], [Sexo]) VALUES (2, N'jose', N'descricao jose', 1)
INSERT [dbo].[Usuario] ([Id], [Nome], [Descricao], [Sexo]) VALUES (3, N'pedro', N'descricao pedro', 1)
INSERT [dbo].[Usuario] ([Id], [Nome], [Descricao], [Sexo]) VALUES (4, N'marcos', N'descricao marcos', 1)
INSERT [dbo].[Usuario] ([Id], [Nome], [Descricao], [Sexo]) VALUES (5, N'joao', N'descricao joao', 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (1, 1, CAST(N'2019-03-05T21:26:39.703' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (1, 2, CAST(N'2019-03-05T21:26:56.483' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (1, 3, CAST(N'2019-03-05T21:27:10.287' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (1, 4, CAST(N'2019-03-05T21:27:15.530' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (2, 1, CAST(N'2019-03-05T21:27:48.553' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (2, 2, CAST(N'2019-03-05T21:27:48.557' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (2, 3, CAST(N'2019-03-05T21:27:48.557' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (2, 4, CAST(N'2019-03-05T21:27:48.557' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (3, 1, CAST(N'2019-03-05T21:27:50.320' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (3, 2, CAST(N'2019-03-05T21:27:50.320' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (3, 3, CAST(N'2019-03-05T21:27:50.320' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (3, 4, CAST(N'2019-03-05T21:27:50.320' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (4, 1, CAST(N'2019-03-05T21:27:52.237' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (4, 2, CAST(N'2019-03-05T21:27:52.237' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (4, 3, CAST(N'2019-03-05T21:27:52.237' AS DateTime))
INSERT [dbo].[UsuarioEmpresa] ([IdUsuario], [IdEmpresa], [DataInicio]) VALUES (4, 4, CAST(N'2019-03-05T21:27:52.237' AS DateTime))
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (1, 1)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (1, 2)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (1, 3)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (1, 4)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (2, 1)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (2, 2)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (2, 3)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (2, 4)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (3, 1)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (3, 2)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (3, 3)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (3, 4)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (4, 1)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (4, 2)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (4, 3)
INSERT [dbo].[UsuarioEndereco] ([IdUsuario], [IdEndereco]) VALUES (4, 4)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (1, 1)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (1, 2)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (1, 3)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (1, 4)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (2, 1)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (2, 2)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (2, 3)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (2, 4)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (3, 1)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (3, 2)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (3, 3)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (3, 4)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (4, 1)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (4, 2)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (4, 3)
INSERT [dbo].[UsuarioInvestimento] ([IdUsuario], [IdEInvestimento]) VALUES (4, 4)
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [Sexo]
GO
ALTER TABLE [dbo].[UsuarioEmpresa] ADD  DEFAULT (getdate()) FOR [DataInicio]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FKSexo] FOREIGN KEY([Sexo])
REFERENCES [dbo].[Sexo] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FKSexo]
GO
/****** Object:  StoredProcedure [dbo].[BuscarUsuarioInvestimento]    Script Date: 05/03/2019 23:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[BuscarUsuarioInvestimento]
as
select  us.Id, us.Nome, us.Descricao, 
		sx.Id as SexoId, 
		sx.Nome, 
		inv.Id as InvestId, 
		inv.Nome,
		ep.Id as EmpresId,
		ep.Nome
		from Usuario us
	join sexo sx on us.sexo = sx.id
	join UsuarioInvestimento uv on uv.idUsuario = us.Id
	join Investimento inv on inv.Id = uv.idEInvestimento	
	join UsuarioEmpresa ue on ue.IdUsuario = us.id
	join Empresa ep on ep.id = ue.idEmpresa
GO
USE [master]
GO
ALTER DATABASE [DbTeste] SET  READ_WRITE 
GO
