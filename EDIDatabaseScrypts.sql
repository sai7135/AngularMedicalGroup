USE [master]
GO
/****** Object:  Database [EDIDatabase]    Script Date: 03/06/2021 17:15:46 ******/
CREATE DATABASE [EDIDatabase] ON  PRIMARY 
( NAME = N'EDIDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\EDIDatabase.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EDIDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\EDIDatabase_log.ldf' , SIZE = 466944KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EDIDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EDIDatabase] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [EDIDatabase] SET ANSI_NULLS OFF
GO
ALTER DATABASE [EDIDatabase] SET ANSI_PADDING OFF
GO
ALTER DATABASE [EDIDatabase] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [EDIDatabase] SET ARITHABORT OFF
GO
ALTER DATABASE [EDIDatabase] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [EDIDatabase] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [EDIDatabase] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [EDIDatabase] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [EDIDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [EDIDatabase] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [EDIDatabase] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [EDIDatabase] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [EDIDatabase] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [EDIDatabase] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [EDIDatabase] SET  ENABLE_BROKER
GO
ALTER DATABASE [EDIDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [EDIDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [EDIDatabase] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [EDIDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [EDIDatabase] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [EDIDatabase] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [EDIDatabase] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [EDIDatabase] SET  READ_WRITE
GO
ALTER DATABASE [EDIDatabase] SET RECOVERY FULL
GO
ALTER DATABASE [EDIDatabase] SET  MULTI_USER
GO
ALTER DATABASE [EDIDatabase] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [EDIDatabase] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'EDIDatabase', N'ON'
GO
USE [EDIDatabase]
GO
/****** Object:  Table [dbo].[subscriber]    Script Date: 03/06/2021 17:15:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[subscriber](
	[transactionid] [varchar](9) NULL,
	[billingproviderloopid] [int] NULL,
	[loopid] [int] NULL,
	[lastname] [varchar](60) NULL,
	[firstname] [varchar](35) NULL,
	[subscriberid] [varchar](60) NULL,
	[address1] [varchar](55) NULL,
	[address2] [varchar](55) NULL,
	[city] [varchar](30) NULL,
	[state] [varchar](2) NULL,
	[postalcode] [varchar](15) NULL,
	[dob] [varchar](35) NULL,
	[gender] [char](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[subscriber] ([transactionid], [billingproviderloopid], [loopid], [lastname], [firstname], [subscriberid], [address1], [address2], [city], [state], [postalcode], [dob], [gender]) VALUES (N'0001', 1, 2, N'CUSTOMER', N'KAREN', N'YYX123456789', N'228 PINEAPPLE CIRCLE', NULL, N'CORA', N'PA', N'15108', N'19630625', N'M')
/****** Object:  Table [dbo].[Claim837PDetails]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Claim837PDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionSetControl] [nvarchar](50) NULL,
	[BillingProviderID] [nvarchar](20) NULL,
	[BillingProviderLastName] [varchar](60) NULL,
	[BillingProviderFirstName] [varchar](35) NULL,
	[BillingProviderNameMiddle] [varchar](25) NULL,
	[BillingProviderNameSuffix] [varchar](10) NULL,
	[BillingProviderAddress1] [nvarchar](55) NULL,
	[BillingProviderAddress2] [nvarchar](55) NULL,
	[BillingProviderCity] [varchar](30) NULL,
	[BillingProviderStateOrProvinceCode] [varchar](2) NULL,
	[BillingProviderPostalCode] [varchar](15) NULL,
	[BillingProviderCountryCode] [varchar](3) NULL,
	[BillingProviderCountrySubDivisionCode] [nvarchar](3) NULL,
	[BillingProviderTaxId] [nvarchar](50) NULL,
	[MemberID] [nvarchar](20) NULL,
	[MemberLastName] [varchar](60) NULL,
	[MemberFirstName] [varchar](35) NULL,
	[MemberMiddleName] [varchar](25) NULL,
	[MemberSuffix] [varchar](10) NULL,
	[MemberAddress1] [varchar](55) NULL,
	[MemberAddress2] [varchar](55) NULL,
	[MemberCity] [varchar](30) NULL,
	[MemberState] [varchar](2) NULL,
	[MemberPostalCode] [varchar](15) NULL,
	[MemberCountryCode] [varchar](3) NULL,
	[MemberCountrySubDivisionCode] [varchar](3) NULL,
	[MemberBirthDate] [varchar](35) NULL,
	[MemberGender] [char](1) NULL,
	[Claimid] [varchar](38) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[claim]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[claim](
	[claimid] [int] IDENTITY(1,1) NOT NULL,
	[fileid] [varchar](1) NULL,
	[transactionid] [varchar](9) NULL,
	[parentloopid] [int] NULL,
	[claimsenderid] [varchar](38) NULL,
	[diagnosiscode1] [varchar](33) NULL,
	[diagnosiscode2] [varchar](33) NULL,
	[diagnosiscode3] [varchar](33) NULL,
	[diagnosiscode4] [varchar](33) NULL,
	[diagnosiscode5] [varchar](33) NULL,
	[diagnosiscode6] [varchar](33) NULL,
	[diagnosiscode7] [varchar](33) NULL,
	[diagnosiscode8] [varchar](33) NULL,
	[diagnosiscode9] [varchar](33) NULL,
	[diagnosiscode10] [varchar](33) NULL,
	[diagnosiscode11] [varchar](33) NULL,
	[diagnosiscode12] [varchar](33) NULL,
PRIMARY KEY CLUSTERED 
(
	[claimid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[claim] ON
INSERT [dbo].[claim] ([claimid], [fileid], [transactionid], [parentloopid], [claimsenderid], [diagnosiscode1], [diagnosiscode2], [diagnosiscode3], [diagnosiscode4], [diagnosiscode5], [diagnosiscode6], [diagnosiscode7], [diagnosiscode8], [diagnosiscode9], [diagnosiscode10], [diagnosiscode11], [diagnosiscode12]) VALUES (4, N'8', N'0001', 3, N'945405', N'BK:2533', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[claim] OFF
/****** Object:  Table [dbo].[BillingProvider]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillingProvider](
	[transactionid] [varchar](9) NULL,
	[billingproviderloopid] [int] NULL,
	[billingproviderlastname] [varchar](60) NULL,
	[billingprovidernpi] [varchar](80) NULL,
	[taxid] [varchar](50) NULL,
	[address1] [varchar](55) NULL,
	[address2] [varchar](55) NULL,
	[city] [varchar](30) NULL,
	[state] [varchar](2) NULL,
	[postalcode] [varchar](15) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[BillingProvider] ([transactionid], [billingproviderloopid], [billingproviderlastname], [billingprovidernpi], [taxid], [address1], [address2], [city], [state], [postalcode]) VALUES (N'0001', 1, N'EDI SPECIALTY SAMPLE', N'123456789', NULL, N'1212 DEPOT DRIVE', NULL, N'CHICAGO', N'IL', N'606930159')
/****** Object:  Table [dbo].[BenefitMaster]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BenefitMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[HealthPlanCode] [varchar](10) NULL,
	[BenefitCode] [varchar](20) NULL,
	[EmployerGroup] [varchar](500) NULL,
	[Description] [varchar](3000) NULL,
	[EffectiveFromDate] [date] NULL,
	[EffectiveToDate] [date] NULL,
	[AccumilationPeriod] [int] NULL,
	[LineOfBusiness] [varchar](3) NULL,
	[FinancialResponcibilitySet] [varchar](100) NULL,
	[OOPMaximumMember] [float] NULL,
	[OOPMaximumSubscriber] [float] NULL,
	[DeductableForMember] [float] NULL,
	[DeductableForSubscriber] [float] NULL,
	[InNetworkOOPMaximumMember] [float] NULL,
	[InNetworkOOPMaximumSubscriber] [float] NULL,
	[InNetworkDeductableForMember] [float] NULL,
	[InNetworkDeductableForSuscriber] [float] NULL,
	[OutNetworkOOPMaximumMember] [float] NULL,
	[OutNetworkOOPMaximumSubscriber] [float] NULL,
	[OutNetworkDeductableForMember] [float] NULL,
	[OutNetworkDeductableForSusbscriber] [float] NULL,
	[OOPMaximumCombinedMember] [float] NULL,
	[OOPMaximumCombinedSuscriber] [float] NULL,
	[DeductableCombinedMember] [float] NULL,
	[DeductableCombinedSuscriber] [float] NULL,
	[note] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BenefitMaster] ON
INSERT [dbo].[BenefitMaster] ([id], [HealthPlanCode], [BenefitCode], [EmployerGroup], [Description], [EffectiveFromDate], [EffectiveToDate], [AccumilationPeriod], [LineOfBusiness], [FinancialResponcibilitySet], [OOPMaximumMember], [OOPMaximumSubscriber], [DeductableForMember], [DeductableForSubscriber], [InNetworkOOPMaximumMember], [InNetworkOOPMaximumSubscriber], [InNetworkDeductableForMember], [InNetworkDeductableForSuscriber], [OutNetworkOOPMaximumMember], [OutNetworkOOPMaximumSubscriber], [OutNetworkDeductableForMember], [OutNetworkDeductableForSusbscriber], [OOPMaximumCombinedMember], [OOPMaximumCombinedSuscriber], [DeductableCombinedMember], [DeductableCombinedSuscriber], [note]) VALUES (1, N'BCCE', N'RFU*52JG', NULL, N'$30/VST-PCP; $50/VSP-SPEC; $150/ER; $30/UC', CAST(0x90400B00 AS Date), NULL, 12, N'HMO', NULL, 6000, NULL, 3000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BenefitMaster] ([id], [HealthPlanCode], [BenefitCode], [EmployerGroup], [Description], [EffectiveFromDate], [EffectiveToDate], [AccumilationPeriod], [LineOfBusiness], [FinancialResponcibilitySet], [OOPMaximumMember], [OOPMaximumSubscriber], [DeductableForMember], [DeductableForSubscriber], [InNetworkOOPMaximumMember], [InNetworkOOPMaximumSubscriber], [InNetworkDeductableForMember], [InNetworkDeductableForSuscriber], [OutNetworkOOPMaximumMember], [OutNetworkOOPMaximumSubscriber], [OutNetworkDeductableForMember], [OutNetworkDeductableForSusbscriber], [OOPMaximumCombinedMember], [OOPMaximumCombinedSuscriber], [DeductableCombinedMember], [DeductableCombinedSuscriber], [note]) VALUES (2, N'BCCE', N'H9K*1TF3', NULL, N'NOT YET COMPETED* - CLASSIC HMO 20/40/250/125', CAST(0x423A0B00 AS Date), NULL, 12, N'HMO', NULL, 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BenefitMaster] ([id], [HealthPlanCode], [BenefitCode], [EmployerGroup], [Description], [EffectiveFromDate], [EffectiveToDate], [AccumilationPeriod], [LineOfBusiness], [FinancialResponcibilitySet], [OOPMaximumMember], [OOPMaximumSubscriber], [DeductableForMember], [DeductableForSubscriber], [InNetworkOOPMaximumMember], [InNetworkOOPMaximumSubscriber], [InNetworkDeductableForMember], [InNetworkDeductableForSuscriber], [OutNetworkOOPMaximumMember], [OutNetworkOOPMaximumSubscriber], [OutNetworkDeductableForMember], [OutNetworkDeductableForSusbscriber], [OOPMaximumCombinedMember], [OOPMaximumCombinedSuscriber], [DeductableCombinedMember], [DeductableCombinedSuscriber], [note]) VALUES (3, N'BCCE', N'DDH*HYGS', NULL, N'NOT YET COMPETED* - CLASSIC HMO 20/40/250/125', CAST(0x423A0B00 AS Date), NULL, 12, N'HMO', NULL, 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BenefitMaster] OFF
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers] 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'24e47f43-a76b-4a4d-8d2f-819a5802f0ad', N'saikiran@captivatesoft.com', 0, N'AECpOcUiBn2ABIdURGAswlAjO9kuAvbNnv15wrNbH+EiLZBmKLk1PKFL6nlcKnWFqA==', N'a8bbd94b-982c-4503-9486-b35409a79146', NULL, 0, 0, NULL, 0, 0, N'admin')
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'users')
/****** Object:  Table [dbo].[ambulancepickup]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ambulancepickup](
	[claimid] [int] NULL,
	[address1] [varchar](55) NULL,
	[address2] [varchar](55) NULL,
	[city] [varchar](30) NULL,
	[state] [varchar](2) NULL,
	[postalcode] [varchar](15) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ambulancedroplocation]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ambulancedroplocation](
	[claimid] [int] NULL,
	[organizationname] [varchar](60) NULL,
	[organizationnpi] [varchar](60) NULL,
	[address1] [varchar](55) NULL,
	[address2] [varchar](55) NULL,
	[city] [varchar](30) NULL,
	[state] [varchar](2) NULL,
	[postalcode] [varchar](15) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202009021114192_InitialCreate', N'Angular_API.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416A9954B77B10DEC16AE93B4413717ACB345DF025AA21D61254A95A86C82A25FD6877E527FA14389BAF1A28BADD84EB1C0C222876786C321391C0EF3EFDFFF8C7F7CF23DE31147B11B908979343A340D4CECC071C96A622674F9ED3BF3C71FBEFC627CEEF84FC66F39DD09A38396249E980F9486A79615DB0FD847F1C877ED288883251DD9816F2127B08E0F0FBFB78E8E2C0C10266019C6F84342A8EBE3F4033E6701B1714813E45D050EF6625E0E35F314D5B8463E8E4364E3893925ABC443D1FDF4F67294519BC6D473114832C7DED2341021014514E43CFD18E3398D02B29A875080BCBBE71003DD127931E6F29F96E45DBB7278CCBA62950D73283B8969E0F7043C3AE1BAB1C4E66B69D82C7407DA3B072DD367D6EB548313F3D2C169D187C00305880C4F675EC48827E655C1621A87D7988EF286A30CF22202B8CF41F46954453C303AB73B286CE97874C8FE1D18B3C4A349842704273442DE81719B2C3CD7FE153FDF059F30999C1C2D9627EFDEBC45CEC9DBEFF0C99B6A4FA1AF40572B80A2DB28087104B2E165D17FD3B0EAED2CB161D1ACD226D30AD8124C0BD3B8424FEF3159D1079830C7EF4CE3C27DC24E5EC28DEB2371611641231A25F0799D781E5A78B8A8B71A79B2FF1BB81EBF793B08D76BF4E8AED2A117F8C3C489605E7DC05E5A1B3FB86136BD6AE37DCFC92EA2C067DF75FBCA6AEFE74112D9AC338196E40E452B4CEBD28DADD2783B9934831ADEAC73D4FD376D26A96CDE4A52D6A1756642CE62DBB32197F765F976B6B86918C2E0A5A6C534D26470F26635125A1F189CC6009AD2748EBA9A0E812EFD9F57C2731FB9DE004B61072EE0852CDDC8C7452F7F0AC0F010E92DF32D8A6358099C5F50FCD0203AFC1C40F439B693080C744E911FBE38B7DB8780E0EBC45F30BBDF1EAFC186E6EE7370816C1A44E784B5DA18EF7D607F0A127A4E9C3344F1476AE780ECF3CEF5BB030C22CED4B6711C5F803163671680939D035E127A72DC1B8E2D50BB7645661E727DB52F222CA5F73969E98FA829249F4443A6F24B9A447D1FAC5CD24DD49C542F6A46D12A2A27EB2B2A03EB2629A7D40B9A12B4CA99510DE6E9A52334BCAB97C2EEBFAFB7D9E6AD5B0B2A6A9CC30A897FC60447B08C39B788521C917204BAAC1BBB7016D2E1634C5F7C6F4A39FD86BC6468566BCD867411187E36A4B0FB3F1B5231A1F8D1759857D2E1009413037C277AF5D9AA7DCE09926D7B3AD4BAB96DE6DB590374D3651AC781EDA6B34011FAE2818BBAFCE0C319ED518CAC376224043A0686EEB22D0F4AA06FA6685437E40C7B9862636A67A1C1198A6DE4C86A840E393D04CB775485606544A42EDC37124FB0741CB146881D826298A92EA1F2B47089ED86C86BD592D0B2E316C6FA5EF0106BCE70880963D8AA892ECCD501102640C1471894360D8DAD8AC5351BA2C66BD58D799B0B5B8EBB1497D88A4DB6F8CE1ABBE4FEDB8B1866B3C6B6609CCD2AE922803698B70B03E56795AE06201E5CF6CD40851393C640B94BB51503AD6B6C07065A57C9AB33D0EC88DA75FC85F3EABE9967FDA0BCFD6DBD515D3BB0CD9A3EF6CC3433DF13DA50688123D93CCF16AC123F51C5E10CE4E4E7B398BBBAA28930F039A6F5904DE9EF2AFD50AB194434A226C0D2D05A40F935A004244DA81EC2E5B1BC46E9B817D103368FBB35C2F2B55F80ADD8808C5DBD0EAD10EA2F4D45E3EC74FA287A56588364E49D0E0B151C8541888B57BDE31D94A28BCBCA8AE9E20BF7F1862B1DE383D1A0A016CF55A3A4BC33836B2937CD762DA91CB23E2ED9465A12DC278D96F2CE0CAE256EA3ED4A5238053DDC828D5454DFC2079A6C79A4A3D86D8ABAB1956549F182B1A549A71A5FA13074C9AA925EC54B8C79965B35FB76DE3FE9C8CF302C3B56E41E15D2169C6810A115166A8135487AE146313D43142D108BF3CC1C5F2253EEAD9AE53F6759DD3EE541CCF7819C9AFDE6A6275FDED7F65AD919E11817D0439F793469185D31FEEAE6064B7743C05111B99F055EE213BD83A56F9DDDDF55DB672532C2D812E4971C28495B929B5B577DA7819127C5408354F82FEB0F941E42A7EEDCFBAC2A5CE791EA51F20055154517B4DAD9C0E91C995E8325FA88FDC7AA15E165E6154F4CA902F0A29E1895DC0609AC52D71DB59E7E52C5ACD7744714724CAA9042550F29AB99243521AB156BE16934AAA6E8CE41CE1DA9A2CBB5DD91155924556845F51AD80A99C5BAEEA88A44932AB0A2BA3B769975222EA27BBC73694F2E6B6F5DD9E176B3BD4B83F1322BE2305B5FE50EBF0A5429EE89C56FE925305EBE97D6A43DE1AD6D4D594C63336BD260E8579EDAED777DE169BCB2D763D6AEB46B8B7BD395BE1EAF9FCDBEA86548073C91A4E05E1CF48403DD981FAEDA1FD148A7AD8CC4347235C2C6FE1C53EC8F18C168FE8737F35CCC96F19CE00A117789639AA57198C78747C7C23B9CFD791363C5B1E3290EA7BA8731F531DB424616794491FD8022393F6283772325A8147ABE240E7E9A987FA6AD4ED32806FB95161F1897F147E2FE9140C55D9460E32F39DF73983CFA0E2F370A41FF7A154F22BAABFCF2F7FBACE9817113C1743A350E0545AF33FCF58712BDA4C99A6E20CDDACF275EEF6CABBD4D50A20AB365FDA7080B970EF20C2197F22B1F3D7DDD5734E553838D1015CF0986C21B4485BAE702EB60699F0A38F049D3A702FD3AAB7E3AB08E68DA67032EE90F263E1AE8BE0CE52D77B80F290E4CDB5892523DB7265D6F9481B9EBBD49CACDDE68A2CBF9D73DE006CDB1DECC457965B9CB836D9D8AD4E4C1B07769F72F9E8FBC2F29C8A5D3BEDBCCE36D261B375C28FDAF728CF7202B4E91E5B3FB4CE26DDB9A2E02BCE7E998FDF285F7CCD8F836BFFBACE06D1B9B2E40BCE7C6D62BF777CF6C6D57FBE78E2DADF316BAF34C5E3929497393A38A22B765EA66217738FE2F023082CCA3CC1E58AA53C39AD25A5B1896247AA6FA9C3491B1347124BE124533DB7E7DE51B7E6367394D335B4D2667136FBEFE37F2E634CDBC35F991BBC831566628AAF2BE5BD6B1A6F4A9D794535CEB494B0A7B9BCFDA782DFF9A528807514A6DF6686E975F4FC6F0202A1972EAF4C810962F8A61EFACFC4D46D8BF63775542B0BFD048B05DDB350B9A4BB20CF2CD5B90282711223457982207B6D46944DD25B22954B30074FA423C0DEAB16B9005762EC94D42C3844297B1BFF06A012FE60434F14FD3A0EB328F6F42F6150FD10510D36581FB1BF253E27A4E21F7852226A48160DE050FF7B2B1A42CECBB7A2E90AE03D21188ABAF708AEEB01F7A0016DF90397AC4EBC806E6F71EAF90FD5C46007520ED035157FBF8CC45AB08F931C728DBC327D8B0E33FFDF01FBA69168A9A540000, N'6.2.0-61023')
/****** Object:  Table [dbo].[servicefacilitylocation]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[servicefacilitylocation](
	[claimid] [int] NULL,
	[lastname] [varchar](60) NULL,
	[firstname] [varchar](35) NULL,
	[organizationnpi] [varchar](60) NULL,
	[address1] [varchar](55) NULL,
	[address2] [varchar](55) NULL,
	[city] [varchar](30) NULL,
	[state] [varchar](2) NULL,
	[postalcode] [varchar](15) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[renderingprovider]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[renderingprovider](
	[claimid] [int] NULL,
	[lastname] [varchar](60) NULL,
	[firstname] [varchar](35) NULL,
	[renderprovidernpi] [varchar](60) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[referingprovider]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[referingprovider](
	[claimid] [int] NULL,
	[lastname] [varchar](60) NULL,
	[firstname] [varchar](35) NULL,
	[referingprovidernpi] [varchar](60) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[providerNpi] [nvarchar](10) NULL,
	[providerID] [nvarchar](20) NOT NULL,
	[category] [nvarchar](100) NULL,
	[providerType] [nvarchar](100) NULL,
	[primarySpeciality] [nvarchar](100) NULL,
	[preferedSpeciality] [bit] NULL,
	[referAnyMember] [bit] NULL,
	[title] [nvarchar](10) NULL,
	[lastName] [nvarchar](500) NULL,
	[firstName] [nvarchar](500) NULL,
	[middle] [nvarchar](500) NULL,
	[suffix] [nvarchar](10) NULL,
	[profSuffix] [nvarchar](10) NULL,
	[middleName] [nvarchar](500) NULL,
	[gender] [nvarchar](10) NULL,
	[dob] [nvarchar](100) NULL,
	[ssn] [nvarchar](20) NULL,
	[citizenship] [nvarchar](20) NULL,
	[birthCity] [nvarchar](30) NULL,
	[birthState] [nvarchar](5) NULL,
	[birthCountry] [nvarchar](200) NULL,
	[contractType] [nvarchar](100) NULL,
	[fromDate] [nvarchar](100) NULL,
	[contractTermedDate] [nvarchar](100) NULL,
	[paymentType] [nvarchar](200) NULL,
	[account] [nvarchar](200) NULL,
	[carrierlocaity] [nvarchar](200) NULL,
	[cliaCertified] [bit] NULL,
	[clia1Waivable] [bit] NULL,
	[clia2Waivable] [bit] NULL,
	[authorizationValidForDays] [nvarchar](10) NULL,
	[allowedVisits] [nvarchar](10) NULL,
	[acceptPatients] [bit] NULL,
	[allowedAsRefferingToProvider] [bit] NULL,
	[practiceType] [nvarchar](20) NULL,
	[name] [nvarchar](100) NULL,
	[address1] [nvarchar](1000) NULL,
	[address2] [nvarchar](1000) NULL,
	[aptNo] [nvarchar](100) NULL,
	[city] [nvarchar](100) NULL,
	[state] [nvarchar](5) NULL,
	[doctorCountry] [nvarchar](200) NULL,
	[country] [nvarchar](200) NULL,
	[zip] [nvarchar](50) NULL,
	[phone] [nvarchar](200) NULL,
	[fax] [nvarchar](200) NULL,
	[contractTemplate] [nvarchar](200) NULL,
	[contractFromDate] [nvarchar](100) NULL,
	[contractToDate] [nvarchar](100) NULL,
	[parentPayorFacility1] [nvarchar](50) NULL,
	[parentPayorFacility2] [nvarchar](50) NULL,
	[appType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[providerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Provider] ([providerNpi], [providerID], [category], [providerType], [primarySpeciality], [preferedSpeciality], [referAnyMember], [title], [lastName], [firstName], [middle], [suffix], [profSuffix], [middleName], [gender], [dob], [ssn], [citizenship], [birthCity], [birthState], [birthCountry], [contractType], [fromDate], [contractTermedDate], [paymentType], [account], [carrierlocaity], [cliaCertified], [clia1Waivable], [clia2Waivable], [authorizationValidForDays], [allowedVisits], [acceptPatients], [allowedAsRefferingToProvider], [practiceType], [name], [address1], [address2], [aptNo], [city], [state], [doctorCountry], [country], [zip], [phone], [fax], [contractTemplate], [contractFromDate], [contractToDate], [parentPayorFacility1], [parentPayorFacility2], [appType]) VALUES (N'1053547174', N'1053547174', N'MD - MD', N'SPECIALIST SERVICESS PROVIDER', N'SHO', 0, 0, N'', N'LAKSHMI', N'AGGARWAL ', N'', NULL, N'', N'', N'Female', N'', NULL, N'', N'', N'', N'', N'NON CONTRACTED', N'2017-05-31T18:30:00.000Z', N'', N'FEE FOR SERVICE', N'5800-000 NO CONTRACT PROVIDER', NULL, 0, 0, 0, N'', N'', 1, 1, N'UNKNOWN - UNKNOWN', N'COUNTY OF SUTTER', N'3181 SW SAM JACKSON PARK RD', N'', N'', N'PORTLAND', N'OR', N'', N'', N'97239-3011', N'503-494-8211', N'', N'', N'2017-05-31T18:30:00.000Z', N'', N'AMG', N'AMG', N'')
INSERT [dbo].[Provider] ([providerNpi], [providerID], [category], [providerType], [primarySpeciality], [preferedSpeciality], [referAnyMember], [title], [lastName], [firstName], [middle], [suffix], [profSuffix], [middleName], [gender], [dob], [ssn], [citizenship], [birthCity], [birthState], [birthCountry], [contractType], [fromDate], [contractTermedDate], [paymentType], [account], [carrierlocaity], [cliaCertified], [clia1Waivable], [clia2Waivable], [authorizationValidForDays], [allowedVisits], [acceptPatients], [allowedAsRefferingToProvider], [practiceType], [name], [address1], [address2], [aptNo], [city], [state], [doctorCountry], [country], [zip], [phone], [fax], [contractTemplate], [contractFromDate], [contractToDate], [parentPayorFacility1], [parentPayorFacility2], [appType]) VALUES (N'1790989226', N'1790989226', N'MD - MD', N'OTHER', N'PHA', 0, 0, N'', N'BENNETT', N'ABABIO', N'', N'', N'', N'', N'Male', N'', NULL, N'', N'', N'', N'', N'NON CONTRACTED', N'2019-04-30T18:30:00.000Z', N'', N'', N'5800-000 NO CONTRACT PROVIDER', N'14112-03', 0, 0, 0, N'', N'', 1, 1, N'UNKNOWN - UNKNOWN', N'CALIFORNIA PACIFIC MEDICAL CENTER', N'2250 HICKORY RD STE 240', N'', N'', N'PLYMOUTH MEETING', N'PA', NULL, N'', N'19462-1047', N'610-834-1122', N'', N'NON CONTRACTED [ 2018/01/01 PCP CAPITATION WITH CARVE OUT [ 2018/01/01 ]', N'2019-04-30T18:30:00.000Z', N'', N'AMG', N'AMG', N'')
/****** Object:  Table [dbo].[patient]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[patient](
	[transactionid] [varchar](9) NULL,
	[subscriberloopid] [int] NULL,
	[loopid] [int] NULL,
	[lastname] [varchar](60) NULL,
	[firstname] [varchar](35) NULL,
	[patientidd] [varchar](60) NULL,
	[address1] [varchar](55) NULL,
	[address2] [varchar](55) NULL,
	[city] [varchar](30) NULL,
	[state] [varchar](2) NULL,
	[postalcode] [varchar](15) NULL,
	[dob] [varchar](35) NULL,
	[gender] [char](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[patient] ([transactionid], [subscriberloopid], [loopid], [lastname], [firstname], [patientidd], [address1], [address2], [city], [state], [postalcode], [dob], [gender]) VALUES (N'0001', 2, 3, N'CUSTOMER', N'COLE', NULL, N'228 PINEAPPLE CIRCLE', NULL, N'CORA', N'CO', N'15108', N'19940921', N'M')
INSERT [dbo].[patient] ([transactionid], [subscriberloopid], [loopid], [lastname], [firstname], [patientidd], [address1], [address2], [city], [state], [postalcode], [dob], [gender]) VALUES (N'0001', 2, 3, N'CUSTOMER', N'COLE', NULL, N'228 PINEAPPLE CIRCLE', NULL, N'CORA', N'CO', N'15108', N'19940921', N'M')
INSERT [dbo].[patient] ([transactionid], [subscriberloopid], [loopid], [lastname], [firstname], [patientidd], [address1], [address2], [city], [state], [postalcode], [dob], [gender]) VALUES (N'0001', 2, 3, N'CUSTOMER', N'COLE', NULL, N'228 PINEAPPLE CIRCLE', NULL, N'CORA', N'CO', N'15108', N'19940921', N'M')
INSERT [dbo].[patient] ([transactionid], [subscriberloopid], [loopid], [lastname], [firstname], [patientidd], [address1], [address2], [city], [state], [postalcode], [dob], [gender]) VALUES (N'0001', 2, 3, N'CUSTOMER', N'COLE', NULL, N'228 PINEAPPLE CIRCLE', NULL, N'CORA', N'CO', N'15108', N'19940921', N'M')
/****** Object:  Table [dbo].[Organization]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[organizationId] [nvarchar](20) NOT NULL,
	[category] [nvarchar](50) NULL,
	[organizationName] [nvarchar](100) NOT NULL,
	[organizationLongName] [nvarchar](200) NOT NULL,
	[accountingSystemName] [nvarchar](50) NULL,
	[taxId] [nvarchar](9) NULL,
	[organizationNpi] [nvarchar](10) NULL,
	[ssn] [nvarchar](10) NULL,
	[taxonomyCode] [nvarchar](10) NOT NULL,
	[capitationAccount] [nvarchar](20) NULL,
	[claimsAccount] [nvarchar](10) NULL,
	[ptoAddress1] [nvarchar](200) NOT NULL,
	[ptoAddress2] [nvarchar](200) NULL,
	[ptoCity] [nvarchar](50) NOT NULL,
	[ptoState] [nvarchar](2) NOT NULL,
	[ptoZip] [nvarchar](15) NOT NULL,
	[ptoInternationalZip] [nvarchar](15) NULL,
	[ptoCountryDistict] [nvarchar](15) NULL,
	[ptoCountry] [nvarchar](15) NULL,
	[ptoPhone] [nvarchar](50) NULL,
	[ptoFax] [nvarchar](50) NULL,
	[ptoEmail] [nvarchar](100) NULL,
	[ptoContactPerson] [nvarchar](100) NULL,
	[blAddress1] [nvarchar](200) NULL,
	[blAddress2] [nvarchar](200) NULL,
	[blCity] [nvarchar](50) NULL,
	[blState] [nvarchar](2) NULL,
	[blZip] [nvarchar](15) NULL,
	[blInternationalZip] [nvarchar](15) NULL,
	[blCountryDistict] [nvarchar](15) NULL,
	[blCountry] [nvarchar](15) NULL,
	[blPhone] [nvarchar](50) NULL,
	[blFax] [nvarchar](50) NULL,
	[blEmail] [nvarchar](100) NULL,
	[blContactPerson] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[organizationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Organization] ([organizationId], [category], [organizationName], [organizationLongName], [accountingSystemName], [taxId], [organizationNpi], [ssn], [taxonomyCode], [capitationAccount], [claimsAccount], [ptoAddress1], [ptoAddress2], [ptoCity], [ptoState], [ptoZip], [ptoInternationalZip], [ptoCountryDistict], [ptoCountry], [ptoPhone], [ptoFax], [ptoEmail], [ptoContactPerson], [blAddress1], [blAddress2], [blCity], [blState], [blZip], [blInternationalZip], [blCountryDistict], [blCountry], [blPhone], [blFax], [blEmail], [blContactPerson]) VALUES (N'941084206', N'', N'GARY K ARABATYAN DDS INC', N'GARY K ARABATYAN DDS INC', N'', N'941084206', N'1174776587', N'', N'193400000X', N'', N'', N'450 SUTTER ST SUITE 1233', N'', N'SAN FRANCISCO', N'CA', N'94108-4206', N'', N'', N'', N'(415) 986-6223', N'(415) 986-6237', N'', N'', N'450 SUTTER ST SUITE 1233', N'', N'SAN FRANCISCO', N'CA', N'94108-4206', N'', N'', N'', N'(415) 986-6223', N'(415) 986-6237', N'', N'')
INSERT [dbo].[Organization] ([organizationId], [category], [organizationName], [organizationLongName], [accountingSystemName], [taxId], [organizationNpi], [ssn], [taxonomyCode], [capitationAccount], [claimsAccount], [ptoAddress1], [ptoAddress2], [ptoCity], [ptoState], [ptoZip], [ptoInternationalZip], [ptoCountryDistict], [ptoCountry], [ptoPhone], [ptoFax], [ptoEmail], [ptoContactPerson], [blAddress1], [blAddress2], [blCity], [blState], [blZip], [blInternationalZip], [blCountryDistict], [blCountry], [blPhone], [blFax], [blEmail], [blContactPerson]) VALUES (N'941096919', N'', N'CALIFORNIA PACIFIC MEDICAL CENTER', N'CALIFORNIA PACIFIC MEDICAL CENTER', N'', N'941096919', N'1902421571', N'', N'261QM1300X', N'', N'', N'1101 VAN NESS AVE', N'', N'SAN FRANCISCO', N'CA', N'94109-6919', N'', N'', N'', N'(415) 600-3954', N'() -', N'', N'', N'1101 VAN NESS AVE', N'', N'SAN FRANCISCO', N'CA', N'94109-6919', N'', N'', N'', N'(415) 600-3954', N'() -', N'', N'')
INSERT [dbo].[Organization] ([organizationId], [category], [organizationName], [organizationLongName], [accountingSystemName], [taxId], [organizationNpi], [ssn], [taxonomyCode], [capitationAccount], [claimsAccount], [ptoAddress1], [ptoAddress2], [ptoCity], [ptoState], [ptoZip], [ptoInternationalZip], [ptoCountryDistict], [ptoCountry], [ptoPhone], [ptoFax], [ptoEmail], [ptoContactPerson], [blAddress1], [blAddress2], [blCity], [blState], [blZip], [blInternationalZip], [blCountryDistict], [blCountry], [blPhone], [blFax], [blEmail], [blContactPerson]) VALUES (N'959932241', N'', N'COUNTY OF SUTTER', N'COUNTY OF SUTTER', N'', N'959932241', N'1063933919', N'', N'261QC1500X', N'', N'', N'1531 BUTTE HOUSE RD STE A', N'', N'YUBA CITY', N'CA', N'959932241', N'', N'', N'', N'(530) 822-7505', N'() -', N'', N'', N'1531 BUTTE HOUSE RD STE A', N'', N'YUBA CITY', N'CA', N'959932241', N'', N'', N'', N'(530) 822-7505', N'() -', N'', N'')
/****** Object:  Table [dbo].[MembersHealthPlantb]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MembersHealthPlantb](
	[Member_Key_ID] [int] NULL,
	[BenefitCode] [varchar](30) NULL,
	[fromdate] [date] NULL,
	[todate] [date] NULL,
	[EmpGrp] [varchar](100) NULL,
	[MaintReason] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MembersHealthPlantb] ([Member_Key_ID], [BenefitCode], [fromdate], [todate], [EmpGrp], [MaintReason]) VALUES (3, N'H9K*1TF3', CAST(0x0C420B00 AS Date), CAST(0x2D420B00 AS Date), N'', 1)
INSERT [dbo].[MembersHealthPlantb] ([Member_Key_ID], [BenefitCode], [fromdate], [todate], [EmpGrp], [MaintReason]) VALUES (3, N'RFU*52JG', CAST(0x2E420B00 AS Date), CAST(0x48000000 AS Date), N'', 1)
INSERT [dbo].[MembersHealthPlantb] ([Member_Key_ID], [BenefitCode], [fromdate], [todate], [EmpGrp], [MaintReason]) VALUES (4, N'RFU*52JG', CAST(0x10420B00 AS Date), CAST(0x39420B00 AS Date), N'', 1)
INSERT [dbo].[MembersHealthPlantb] ([Member_Key_ID], [BenefitCode], [fromdate], [todate], [EmpGrp], [MaintReason]) VALUES (1, N'DDH*HYGS', CAST(0x1F420B00 AS Date), NULL, N'', 1)
INSERT [dbo].[MembersHealthPlantb] ([Member_Key_ID], [BenefitCode], [fromdate], [todate], [EmpGrp], [MaintReason]) VALUES (1, N'H9K*1TF3', CAST(0x243F0B00 AS Date), CAST(0x1E420B00 AS Date), N'', 1)
/****** Object:  Table [dbo].[Members]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Members](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[memberID] [varchar](80) NULL,
	[HealthPlanCode] [varchar](5) NULL,
	[lastName] [varchar](60) NULL,
	[firstName] [varchar](35) NULL,
	[middleName] [varchar](25) NULL,
	[suffixName] [varchar](10) NULL,
	[address1] [varchar](55) NULL,
	[address2] [varchar](55) NULL,
	[city] [varchar](30) NULL,
	[state] [varchar](2) NULL,
	[postalCode] [varchar](15) NULL,
	[countryCode] [varchar](3) NULL,
	[dob] [varchar](35) NULL,
	[gender] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [uqmemberhp] ON [dbo].[Members] 
(
	[memberID] ASC,
	[HealthPlanCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Members] ON
INSERT [dbo].[Members] ([id], [memberID], [HealthPlanCode], [lastName], [firstName], [middleName], [suffixName], [address1], [address2], [city], [state], [postalCode], [countryCode], [dob], [gender]) VALUES (1, N'987654321A', N'BCCE', N'MADDUKURI', N'RAVI', N'KIRAN', N'', N'1101 VAN NESS AVENUE', N'', N'SAN FRANCISCO', N'CA', N'941096911', N'', N'1996-04-20T18:30:00.000Z', N'm')
INSERT [dbo].[Members] ([id], [memberID], [HealthPlanCode], [lastName], [firstName], [middleName], [suffixName], [address1], [address2], [city], [state], [postalCode], [countryCode], [dob], [gender]) VALUES (3, N'123456789A', N'BCCE', N'maddukuri', N'satish', N'kiran', N'', N'1101 VAN NESS AVENUE', N'', N'SAN FRANCISCO', N'CA', N'941096911', N'', N'1996-04-11T18:30:00.000Z', N'm')
INSERT [dbo].[Members] ([id], [memberID], [HealthPlanCode], [lastName], [firstName], [middleName], [suffixName], [address1], [address2], [city], [state], [postalCode], [countryCode], [dob], [gender]) VALUES (4, N'9758465213A', N'BCCE', N'maddukuri', N'sai', N'kiran', N'', N'1101 VAN NESS AVENUE', N'', N'SAN FRANCISCO', N'CA', N'941096911', N'', N'1993-05-03T18:30:00.000Z', N'm')
SET IDENTITY_INSERT [dbo].[Members] OFF
/****** Object:  Table [dbo].[MemberPCPtb]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberPCPtb](
	[member_key_id] [int] NULL,
	[pcpid] [varchar](80) NULL,
	[fromdate] [date] NULL,
	[todate] [date] NULL,
	[MaintReason] [int] NULL,
	[organization] [varchar](60) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MemberPCPtb] ([member_key_id], [pcpid], [fromdate], [todate], [MaintReason], [organization]) VALUES (3, N'1053547174', CAST(0x0C420B00 AS Date), CAST(0x2D420B00 AS Date), 1, NULL)
INSERT [dbo].[MemberPCPtb] ([member_key_id], [pcpid], [fromdate], [todate], [MaintReason], [organization]) VALUES (4, N'1790989226', CAST(0x0D420B00 AS Date), CAST(0x2F420B00 AS Date), 1, NULL)
INSERT [dbo].[MemberPCPtb] ([member_key_id], [pcpid], [fromdate], [todate], [MaintReason], [organization]) VALUES (1, N'1790989226', CAST(0xE0410B00 AS Date), NULL, 1, N'CALIFORNIA PACIFIC MEDICAL CENTER')
INSERT [dbo].[MemberPCPtb] ([member_key_id], [pcpid], [fromdate], [todate], [MaintReason], [organization]) VALUES (1, N'1053547174', CAST(0x273F0B00 AS Date), CAST(0xDF410B00 AS Date), 1, N'COUNTY OF SUTTER')
/****** Object:  Table [dbo].[file837table]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[file837table](
	[fileid] [int] IDENTITY(1,1) NOT NULL,
	[uploadedfilename] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[file837table] ON
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (1, N'EDI.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (2, N'EDI.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (3, N'EDI.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (4, N'EDI.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (5, N'EDI.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (6, N'EDI.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (7, N'EDI.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (8, N'EDI.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (9, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (10, N'trail2.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (11, N'trail3.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (12, N'trail4.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (13, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (14, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (15, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (26, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (27, N'EDI837File1.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (28, N'EDI837File1.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (29, N'EDI837File1.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (30, N'trail2.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (31, N'EDI837File1.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (32, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (33, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (34, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (35, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (36, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (37, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (38, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (39, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (40, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (41, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (42, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (43, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (44, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (45, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (46, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (47, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (48, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (49, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (50, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (51, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (52, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (53, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (54, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (55, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (56, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (57, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (58, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (59, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (60, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (61, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (62, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (63, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (64, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (65, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (66, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (67, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (68, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (69, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (70, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (71, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (72, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (73, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (74, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (75, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (76, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (77, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (78, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (79, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (80, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (81, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (82, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (83, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (84, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (85, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (86, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (87, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (88, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (89, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (90, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (91, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (92, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (93, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (94, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (95, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (96, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (97, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (98, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (99, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (100, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (101, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (102, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (103, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (104, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (105, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (106, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (107, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (108, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (109, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (110, N'837P IG testFile.txt')
GO
print 'Processed 100 total records'
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (111, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (112, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (113, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (117, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (118, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (119, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (120, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (121, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (122, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (123, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (124, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (125, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (126, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (127, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (128, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (129, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (130, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (131, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (132, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (133, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (134, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (135, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (136, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (137, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (138, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (139, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (140, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (141, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (142, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (143, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (144, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (145, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (146, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (147, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (148, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (149, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (150, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (151, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (152, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (153, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (154, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (155, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (156, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (157, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (158, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (159, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (160, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (161, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (162, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (163, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (164, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (165, N'trail2.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (166, N'trail3.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (167, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (168, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (169, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (170, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (171, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (172, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (173, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (174, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (175, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (176, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (178, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (16, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (17, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (18, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (19, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (20, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (21, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (22, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (23, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (24, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (25, N'trail1.CLM')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (114, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (115, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (116, N'837P IG testFile.txt')
INSERT [dbo].[file837table] ([fileid], [uploadedfilename]) VALUES (177, N'837P IG testFile.txt')
SET IDENTITY_INSERT [dbo].[file837table] OFF
/****** Object:  Table [dbo].[EDI_837P_SupportDoc]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EDI_837P_SupportDoc](
	[formidentification] [int] NULL,
	[L2440_FRM_FRM01] [varchar](20) NULL,
	[L2440_FRM_FRM02] [varchar](1) NULL,
	[L2440_FRM_FRM03] [varchar](50) NULL,
	[L2440_FRM_FRM04] [varchar](8) NULL,
	[L2440_FRM_FRM05] [varchar](6) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20061, N'1A', N'', N'J0234', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20061, N'1B', N'', N'500', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20061, N'1C', N'', N'4', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20061, N'4', N'Y', NULL, NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20061, N'5A', N'', N'5', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20061, N'5B', N'', N'3', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20061, N'8', N'', N'Methodist Hospital', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20061, N'9', N'', N'Indianapolis', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20061, N'10', N'', N'IN', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20061, N'11', N'', N'', N'19971101', NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20061, N'12', N'N', NULL, NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20062, N'1A', N'', N'J0234', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20062, N'1B', N'', N'500', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20062, N'1C', N'', N'4', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20062, N'4', N'Y', NULL, NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20062, N'5A', N'', N'5', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20062, N'5B', N'', N'3', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20062, N'8', N'', N'Methodist Hospital', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20062, N'9', N'', N'Indianapolis', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20062, N'10', N'', N'IN', NULL, NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20062, N'11', N'', N'', N'19971101', NULL)
INSERT [dbo].[EDI_837P_SupportDoc] ([formidentification], [L2440_FRM_FRM01], [L2440_FRM_FRM02], [L2440_FRM_FRM03], [L2440_FRM_FRM04], [L2440_FRM_FRM05]) VALUES (20062, N'12', N'N', NULL, NULL, NULL)
/****** Object:  Table [dbo].[EDI_837P_subscriber]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EDI_837P_subscriber](
	[Fileid] [varchar](30) NOT NULL,
	[HeaderID] [varchar](30) NOT NULL,
	[L2000B_1_HL_1_HL01] [varchar](12) NULL,
	[L2000B_1_HL_1_HL02] [varchar](12) NULL,
	[L2000B_1_HL_1_HL03] [varchar](2) NULL,
	[L2000B_1_HL_1_HL04] [varchar](1) NULL,
	[L2000B_1_SBR_1_SBR01] [varchar](1) NULL,
	[L2000B_1_SBR_1_SBR02] [varchar](2) NULL,
	[L2000B_1_SBR_1_SBR03] [varchar](50) NULL,
	[L2000B_1_SBR_1_SBR04] [varchar](60) NULL,
	[L2000B_1_SBR_1_SBR05] [varchar](3) NULL,
	[L2000B_1_SBR_1_SBR09] [varchar](2) NULL,
	[L2000B_1_PAT_1_PAT05] [varchar](3) NULL,
	[L2000B_1_PAT_1_PAT06] [varchar](35) NULL,
	[L2000B_1_PAT_1_PAT07] [varchar](2) NULL,
	[L2000B_1_PAT_1_PAT08] [varchar](10) NULL,
	[L2000B_1_PAT_1_PAT09] [varchar](1) NULL,
	[L2010BA_1_NM1_1_NM101] [varchar](3) NULL,
	[L2010BA_1_NM1_1_NM102] [varchar](1) NULL,
	[L2010BA_1_NM1_1_NM103] [varchar](60) NULL,
	[L2010BA_1_NM1_1_NM104] [varchar](35) NULL,
	[L2010BA_1_NM1_1_NM105] [varchar](25) NULL,
	[L2010BA_1_NM1_1_NM107] [varchar](10) NULL,
	[L2010BA_1_NM1_1_NM108] [varchar](2) NULL,
	[L2010BA_1_NM1_1_NM109] [varchar](80) NULL,
	[L2010BA_1_N3_1_N301] [varchar](55) NULL,
	[L2010BA_1_N3_1_N302] [varchar](55) NULL,
	[L2010BA_1_N4_1_N401] [varchar](30) NULL,
	[L2010BA_1_N4_1_N402] [varchar](2) NULL,
	[L2010BA_1_N4_1_N403] [varchar](15) NULL,
	[L2010BA_1_N4_1_N404] [varchar](3) NULL,
	[L2010BA_1_N4_1_N407] [varchar](3) NULL,
	[L2010BA_1_DMG_1_DMG01] [varchar](3) NULL,
	[L2010BA_1_DMG_1_DMG02] [varchar](35) NULL,
	[L2010BA_1_DMG_1_DMG03] [varchar](1) NULL,
	[L2010BA_1_REF_1_REF01] [varchar](2) NULL,
	[L2010BA_1_REF_1_REF02] [varchar](50) NULL,
	[L2010BA_1_REF_2_REF01] [varchar](2) NULL,
	[L2010BA_1_REF_2_REF02] [varchar](50) NULL,
	[L2010BA_1_PER_1_PER01] [varchar](2) NULL,
	[L2010BA_1_PER_1_PER02] [varchar](60) NULL,
	[L2010BA_1_PER_1_PER03] [varchar](2) NULL,
	[L2010BA_1_PER_1_PER04] [varchar](256) NULL,
	[L2010BA_1_PER_1_PER05] [varchar](2) NULL,
	[L2010BA_1_PER_1_PER06] [varchar](256) NULL,
	[L2010BB_1_NM1_1_NM101] [varchar](3) NULL,
	[L2010BB_1_NM1_1_NM102] [varchar](1) NULL,
	[L2010BB_1_NM1_1_NM103] [varchar](60) NULL,
	[L2010BB_1_NM1_1_NM108] [varchar](2) NULL,
	[L2010BB_1_NM1_1_NM109] [varchar](80) NULL,
	[L2010BB_1_N3_1_N301] [varchar](55) NULL,
	[L2010BB_1_N3_1_N302] [varchar](55) NULL,
	[L2010BB_1_N4_1_N401] [varchar](30) NULL,
	[L2010BB_1_N4_1_N402] [varchar](2) NULL,
	[L2010BB_1_N4_1_N403] [varchar](15) NULL,
	[L2010BB_1_N4_1_N404] [varchar](3) NULL,
	[L2010BB_1_N4_1_N407] [varchar](3) NULL,
	[L2010BB_1_REF_1_REF01] [varchar](3) NULL,
	[L2010BB_1_REF_1_REF02] [varchar](50) NULL,
	[L2010BB_1_REF_2_REF01] [varchar](3) NULL,
	[L2010BB_1_REF_2_REF02] [varchar](50) NULL,
	[L2010BB_1_REF_3_REF01] [varchar](3) NULL,
	[L2010BB_1_REF_3_REF02] [varchar](50) NULL,
	[L2010BB_1_REF_4_REF01] [varchar](3) NULL,
	[L2010BB_1_REF_4_REF02] [varchar](50) NULL,
	[L2010BB_1_REF_5_REF01] [varchar](3) NULL,
	[L2010BB_1_REF_5_REF02] [varchar](50) NULL,
	[L2010BB_1_REF_6_REF01] [varchar](3) NULL,
	[L2010BB_1_REF_6_REF02] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[EDI_837P_subscriber] ([Fileid], [HeaderID], [L2000B_1_HL_1_HL01], [L2000B_1_HL_1_HL02], [L2000B_1_HL_1_HL03], [L2000B_1_HL_1_HL04], [L2000B_1_SBR_1_SBR01], [L2000B_1_SBR_1_SBR02], [L2000B_1_SBR_1_SBR03], [L2000B_1_SBR_1_SBR04], [L2000B_1_SBR_1_SBR05], [L2000B_1_SBR_1_SBR09], [L2000B_1_PAT_1_PAT05], [L2000B_1_PAT_1_PAT06], [L2000B_1_PAT_1_PAT07], [L2000B_1_PAT_1_PAT08], [L2000B_1_PAT_1_PAT09], [L2010BA_1_NM1_1_NM101], [L2010BA_1_NM1_1_NM102], [L2010BA_1_NM1_1_NM103], [L2010BA_1_NM1_1_NM104], [L2010BA_1_NM1_1_NM105], [L2010BA_1_NM1_1_NM107], [L2010BA_1_NM1_1_NM108], [L2010BA_1_NM1_1_NM109], [L2010BA_1_N3_1_N301], [L2010BA_1_N3_1_N302], [L2010BA_1_N4_1_N401], [L2010BA_1_N4_1_N402], [L2010BA_1_N4_1_N403], [L2010BA_1_N4_1_N404], [L2010BA_1_N4_1_N407], [L2010BA_1_DMG_1_DMG01], [L2010BA_1_DMG_1_DMG02], [L2010BA_1_DMG_1_DMG03], [L2010BA_1_REF_1_REF01], [L2010BA_1_REF_1_REF02], [L2010BA_1_REF_2_REF01], [L2010BA_1_REF_2_REF02], [L2010BA_1_PER_1_PER01], [L2010BA_1_PER_1_PER02], [L2010BA_1_PER_1_PER03], [L2010BA_1_PER_1_PER04], [L2010BA_1_PER_1_PER05], [L2010BA_1_PER_1_PER06], [L2010BB_1_NM1_1_NM101], [L2010BB_1_NM1_1_NM102], [L2010BB_1_NM1_1_NM103], [L2010BB_1_NM1_1_NM108], [L2010BB_1_NM1_1_NM109], [L2010BB_1_N3_1_N301], [L2010BB_1_N3_1_N302], [L2010BB_1_N4_1_N401], [L2010BB_1_N4_1_N402], [L2010BB_1_N4_1_N403], [L2010BB_1_N4_1_N404], [L2010BB_1_N4_1_N407], [L2010BB_1_REF_1_REF01], [L2010BB_1_REF_1_REF02], [L2010BB_1_REF_2_REF01], [L2010BB_1_REF_2_REF02], [L2010BB_1_REF_3_REF01], [L2010BB_1_REF_3_REF02], [L2010BB_1_REF_4_REF01], [L2010BB_1_REF_4_REF02], [L2010BB_1_REF_5_REF01], [L2010BB_1_REF_5_REF02], [L2010BB_1_REF_6_REF01], [L2010BB_1_REF_6_REF02]) VALUES (N'178', N'987654', N'2', N'1', N'22', N'1', N'P', N'', N'GRP01020102', N'', N'', N'CI', N'D8', N'19970314', NULL, NULL, NULL, N'IL', N'1', N'2DOE', N'2JOHN', N'T', N'JR', N'MI', N'122456', N'123 MAIN STREET', N'456 SIDE STREET', N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'D8', N'19690815', N'M', N'SY', N'123456789', N'Y4', N'4445555', N'IC', N'JOHN SMITH', N'TE', N'5555551234', N'EX', N'123', N'PR', N'2', N'ABC INSURANCE CO', N'PI', N'11122333', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, NULL, NULL, NULL, NULL, N'FY', N'FY435261708', NULL, NULL, N'G2', N'G212345', N'LU', N'LU12345')
INSERT [dbo].[EDI_837P_subscriber] ([Fileid], [HeaderID], [L2000B_1_HL_1_HL01], [L2000B_1_HL_1_HL02], [L2000B_1_HL_1_HL03], [L2000B_1_HL_1_HL04], [L2000B_1_SBR_1_SBR01], [L2000B_1_SBR_1_SBR02], [L2000B_1_SBR_1_SBR03], [L2000B_1_SBR_1_SBR04], [L2000B_1_SBR_1_SBR05], [L2000B_1_SBR_1_SBR09], [L2000B_1_PAT_1_PAT05], [L2000B_1_PAT_1_PAT06], [L2000B_1_PAT_1_PAT07], [L2000B_1_PAT_1_PAT08], [L2000B_1_PAT_1_PAT09], [L2010BA_1_NM1_1_NM101], [L2010BA_1_NM1_1_NM102], [L2010BA_1_NM1_1_NM103], [L2010BA_1_NM1_1_NM104], [L2010BA_1_NM1_1_NM105], [L2010BA_1_NM1_1_NM107], [L2010BA_1_NM1_1_NM108], [L2010BA_1_NM1_1_NM109], [L2010BA_1_N3_1_N301], [L2010BA_1_N3_1_N302], [L2010BA_1_N4_1_N401], [L2010BA_1_N4_1_N402], [L2010BA_1_N4_1_N403], [L2010BA_1_N4_1_N404], [L2010BA_1_N4_1_N407], [L2010BA_1_DMG_1_DMG01], [L2010BA_1_DMG_1_DMG02], [L2010BA_1_DMG_1_DMG03], [L2010BA_1_REF_1_REF01], [L2010BA_1_REF_1_REF02], [L2010BA_1_REF_2_REF01], [L2010BA_1_REF_2_REF02], [L2010BA_1_PER_1_PER01], [L2010BA_1_PER_1_PER02], [L2010BA_1_PER_1_PER03], [L2010BA_1_PER_1_PER04], [L2010BA_1_PER_1_PER05], [L2010BA_1_PER_1_PER06], [L2010BB_1_NM1_1_NM101], [L2010BB_1_NM1_1_NM102], [L2010BB_1_NM1_1_NM103], [L2010BB_1_NM1_1_NM108], [L2010BB_1_NM1_1_NM109], [L2010BB_1_N3_1_N301], [L2010BB_1_N3_1_N302], [L2010BB_1_N4_1_N401], [L2010BB_1_N4_1_N402], [L2010BB_1_N4_1_N403], [L2010BB_1_N4_1_N404], [L2010BB_1_N4_1_N407], [L2010BB_1_REF_1_REF01], [L2010BB_1_REF_1_REF02], [L2010BB_1_REF_2_REF01], [L2010BB_1_REF_2_REF02], [L2010BB_1_REF_3_REF01], [L2010BB_1_REF_3_REF02], [L2010BB_1_REF_4_REF01], [L2010BB_1_REF_4_REF02], [L2010BB_1_REF_5_REF01], [L2010BB_1_REF_5_REF02], [L2010BB_1_REF_6_REF01], [L2010BB_1_REF_6_REF02]) VALUES (N'178', N'987654', N'4', N'1', N'22', N'1', N'P', N'', N'GRP01020102', N'', N'', N'CI', N'D8', N'19970314', NULL, NULL, NULL, N'IL', N'1', N'DO4E', N'JOH4N', N'T', N'JR', N'MI', N'124456', N'123 MAIN STREET', N'456 SIDE STREET', N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'D8', N'19690815', N'M', N'SY', N'123456789', N'Y4', N'4445555', N'IC', N'JOHN SMITH', N'TE', N'5555551234', N'EX', N'123', N'PR', N'2', N'ABC INSURANCE CO', N'PI', N'11122333', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, NULL, NULL, NULL, NULL, N'FY', N'FY435261708', NULL, NULL, N'G2', N'G212345', N'LU', N'LU12345')
/****** Object:  Table [dbo].[EDI_837P_ServiceLine]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EDI_837P_ServiceLine](
	[ServiceLineId] [int] IDENTITY(1,1) NOT NULL,
	[claimid] [int] NULL,
	[Fileid] [varchar](30) NOT NULL,
	[HeaderID] [varchar](30) NOT NULL,
	[subscriber_patientid] [varchar](12) NULL,
	[L2400_1_LX_1_LX01] [varchar](6) NULL,
	[L2400_1_SV1_1_SV101_01] [varchar](2) NULL,
	[L2400_1_SV1_1_SV101_02] [varchar](48) NULL,
	[L2400_1_SV1_1_SV101_03] [varchar](2) NULL,
	[L2400_1_SV1_1_SV101_04] [varchar](2) NULL,
	[L2400_1_SV1_1_SV101_05] [varchar](2) NULL,
	[L2400_1_SV1_1_SV101_06] [varchar](2) NULL,
	[L2400_1_SV1_1_SV101_07] [varchar](80) NULL,
	[L2400_1_SV1_1_SV102] [varchar](18) NULL,
	[L2400_1_SV1_1_SV103] [varchar](2) NULL,
	[L2400_1_SV1_1_SV104] [varchar](15) NULL,
	[L2400_1_SV1_1_SV105] [varchar](2) NULL,
	[L2400_1_SV1_1_SV107_1] [varchar](2) NULL,
	[L2400_1_SV1_1_SV107_2] [varchar](2) NULL,
	[L2400_1_SV1_1_SV107_3] [varchar](2) NULL,
	[L2400_1_SV1_1_SV107_4] [varchar](2) NULL,
	[L2400_1_SV1_1_SV109] [varchar](1) NULL,
	[L2400_1_SV1_1_SV111] [varchar](1) NULL,
	[L2400_1_SV1_1_SV112] [varchar](1) NULL,
	[L2400_1_SV1_1_SV115] [varchar](1) NULL,
	[L2400_1_SV5_1_SV501_01] [varchar](2) NULL,
	[L2400_1_SV5_1_SV501_02] [varchar](48) NULL,
	[L2400_1_SV5_1_SV502] [varchar](2) NULL,
	[L2400_1_SV5_1_SV503] [varchar](15) NULL,
	[L2400_1_SV5_1_SV504] [varchar](18) NULL,
	[L2400_1_SV5_1_SV505] [varchar](18) NULL,
	[L2400_1_SV5_1_SV506] [varchar](1) NULL,
	[L2400_1_PWK_1_PWK01] [varchar](2) NULL,
	[L2400_1_PWK_1_PWK02] [varchar](2) NULL,
	[L2400_1_PWK_1_PWK05] [varchar](2) NULL,
	[L2400_1_PWK_1_PWK06] [varchar](80) NULL,
	[L2400_1_PWK_2_PWK01] [varchar](2) NULL,
	[L2400_1_PWK_2_PWK02] [varchar](2) NULL,
	[L2400_1_PWK_2_PWK05] [varchar](2) NULL,
	[L2400_1_PWK_2_PWK06] [varchar](80) NULL,
	[L2400_1_PWK_3_PWK01] [varchar](2) NULL,
	[L2400_1_PWK_3_PWK02] [varchar](2) NULL,
	[L2400_1_PWK_3_PWK05] [varchar](2) NULL,
	[L2400_1_PWK_3_PWK06] [varchar](80) NULL,
	[L2400_1_PWK_4_PWK01] [varchar](2) NULL,
	[L2400_1_PWK_4_PWK02] [varchar](2) NULL,
	[L2400_1_PWK_4_PWK05] [varchar](2) NULL,
	[L2400_1_PWK_4_PWK06] [varchar](80) NULL,
	[L2400_1_PWK_5_PWK01] [varchar](2) NULL,
	[L2400_1_PWK_5_PWK02] [varchar](2) NULL,
	[L2400_1_PWK_5_PWK05] [varchar](2) NULL,
	[L2400_1_PWK_5_PWK06] [varchar](80) NULL,
	[L2400_1_PWK_6_PWK01] [varchar](2) NULL,
	[L2400_1_PWK_6_PWK02] [varchar](2) NULL,
	[L2400_1_PWK_6_PWK05] [varchar](2) NULL,
	[L2400_1_PWK_6_PWK06] [varchar](80) NULL,
	[L2400_1_PWK_7_PWK01] [varchar](2) NULL,
	[L2400_1_PWK_7_PWK02] [varchar](2) NULL,
	[L2400_1_PWK_7_PWK05] [varchar](2) NULL,
	[L2400_1_PWK_7_PWK06] [varchar](80) NULL,
	[L2400_1_PWK_8_PWK01] [varchar](2) NULL,
	[L2400_1_PWK_8_PWK02] [varchar](2) NULL,
	[L2400_1_PWK_8_PWK05] [varchar](2) NULL,
	[L2400_1_PWK_8_PWK06] [varchar](80) NULL,
	[L2400_1_PWK_9_PWK01] [varchar](2) NULL,
	[L2400_1_PWK_9_PWK02] [varchar](2) NULL,
	[L2400_1_PWK_9_PWK05] [varchar](2) NULL,
	[L2400_1_PWK_9_PWK06] [varchar](80) NULL,
	[L2400_1_PWK_10_PWK01] [varchar](2) NULL,
	[L2400_1_PWK_10_PWK02] [varchar](2) NULL,
	[L2400_1_PWK_10_PWK05] [varchar](2) NULL,
	[L2400_1_PWK_10_PWK06] [varchar](80) NULL,
	[L2400_1_PWK_11_PWK01] [varchar](2) NULL,
	[L2400_1_PWK_11_PWK02] [varchar](2) NULL,
	[L2400_1_PWK_11_PWK05] [varchar](2) NULL,
	[L2400_1_PWK_11_PWK06] [varchar](80) NULL,
	[L2400_1_CR1_1_CR101] [varchar](2) NULL,
	[L2400_1_CR1_1_CR102] [varchar](10) NULL,
	[L2400_1_CR1_1_CR104] [varchar](1) NULL,
	[L2400_1_CR1_1_CR105] [varchar](2) NULL,
	[L2400_1_CR1_1_CR106] [varchar](15) NULL,
	[L2400_1_CR1_1_CR109] [varchar](80) NULL,
	[L2400_1_CR1_1_CR110] [varchar](80) NULL,
	[L2400_1_CR3_1_CR301] [varchar](1) NULL,
	[L2400_1_CR3_1_CR302] [varchar](2) NULL,
	[L2400_1_CR3_1_CR303] [varchar](15) NULL,
	[L2400_1_CRC_1_CRC01] [varchar](2) NULL,
	[L2400_1_CRC_1_CRC02] [varchar](1) NULL,
	[L2400_1_CRC_1_CRC03] [varchar](3) NULL,
	[L2400_1_CRC_1_CRC04] [varchar](3) NULL,
	[L2400_1_CRC_1_CRC05] [varchar](3) NULL,
	[L2400_1_CRC_1_CRC06] [varchar](3) NULL,
	[L2400_1_CRC_1_CRC07] [varchar](3) NULL,
	[L2400_1_CRC_2_CRC01] [varchar](2) NULL,
	[L2400_1_CRC_2_CRC02] [varchar](1) NULL,
	[L2400_1_CRC_2_CRC03] [varchar](3) NULL,
	[L2400_1_CRC_2_CRC04] [varchar](3) NULL,
	[L2400_1_CRC_2_CRC05] [varchar](3) NULL,
	[L2400_1_CRC_2_CRC06] [varchar](3) NULL,
	[L2400_1_CRC_2_CRC07] [varchar](3) NULL,
	[L2400_1_CRC_3_CRC01] [varchar](2) NULL,
	[L2400_1_CRC_3_CRC02] [varchar](1) NULL,
	[L2400_1_CRC_3_CRC03] [varchar](3) NULL,
	[L2400_1_CRC_3_CRC04] [varchar](3) NULL,
	[L2400_1_CRC_3_CRC05] [varchar](3) NULL,
	[L2400_1_CRC_3_CRC06] [varchar](3) NULL,
	[L2400_1_CRC_3_CRC07] [varchar](3) NULL,
	[L2400_1_CRC_4_CRC01] [varchar](2) NULL,
	[L2400_1_CRC_4_CRC02] [varchar](1) NULL,
	[L2400_1_CRC_4_CRC03] [varchar](3) NULL,
	[L2400_1_CRC_4_CRC04] [varchar](3) NULL,
	[L2400_1_CRC_4_CRC05] [varchar](3) NULL,
	[L2400_1_CRC_4_CRC06] [varchar](3) NULL,
	[L2400_1_CRC_4_CRC07] [varchar](3) NULL,
	[L2400_1_CRC_5_CRC01] [varchar](2) NULL,
	[L2400_1_CRC_5_CRC02] [varchar](1) NULL,
	[L2400_1_CRC_5_CRC03] [varchar](3) NULL,
	[L2400_1_CRC_5_CRC04] [varchar](3) NULL,
	[L2400_1_CRC_5_CRC05] [varchar](3) NULL,
	[L2400_1_CRC_5_CRC06] [varchar](3) NULL,
	[L2400_1_CRC_5_CRC07] [varchar](3) NULL,
	[L2400_1_DTP_1_DTP01] [varchar](3) NULL,
	[L2400_1_DTP_1_DTP02] [varchar](3) NULL,
	[L2400_1_DTP_1_DTP03] [varchar](35) NULL,
	[L2400_1_DTP_2_DTP01] [varchar](3) NULL,
	[L2400_1_DTP_2_DTP02] [varchar](3) NULL,
	[L2400_1_DTP_2_DTP03] [varchar](35) NULL,
	[L2400_1_DTP_3_DTP01] [varchar](3) NULL,
	[L2400_1_DTP_3_DTP02] [varchar](3) NULL,
	[L2400_1_DTP_3_DTP03] [varchar](35) NULL,
	[L2400_1_DTP_4_DTP01] [varchar](3) NULL,
	[L2400_1_DTP_4_DTP02] [varchar](3) NULL,
	[L2400_1_DTP_4_DTP03] [varchar](35) NULL,
	[L2400_1_DTP_5_DTP01] [varchar](3) NULL,
	[L2400_1_DTP_5_DTP02] [varchar](3) NULL,
	[L2400_1_DTP_5_DTP03] [varchar](35) NULL,
	[L2400_1_DTP_6_DTP01] [varchar](3) NULL,
	[L2400_1_DTP_6_DTP02] [varchar](3) NULL,
	[L2400_1_DTP_6_DTP03] [varchar](35) NULL,
	[L2400_1_DTP_7_DTP01] [varchar](3) NULL,
	[L2400_1_DTP_7_DTP02] [varchar](3) NULL,
	[L2400_1_DTP_7_DTP03] [varchar](35) NULL,
	[L2400_1_DTP_8_DTP01] [varchar](3) NULL,
	[L2400_1_DTP_8_DTP02] [varchar](3) NULL,
	[L2400_1_DTP_8_DTP03] [varchar](35) NULL,
	[L2400_1_DTP_9_DTP01] [varchar](3) NULL,
	[L2400_1_DTP_9_DTP02] [varchar](3) NULL,
	[L2400_1_DTP_9_DTP03] [varchar](35) NULL,
	[L2400_1_DTP_10_DTP01] [varchar](3) NULL,
	[L2400_1_DTP_10_DTP02] [varchar](3) NULL,
	[L2400_1_DTP_10_DTP03] [varchar](35) NULL,
	[L2400_1_QTY_1_QTY01] [varchar](2) NULL,
	[L2400_1_QTY_1_QTY02] [varchar](15) NULL,
	[L2400_1_QTY_2_QTY01] [varchar](2) NULL,
	[L2400_1_QTY_2_QTY02] [varchar](15) NULL,
	[L2400_1_MEA_1_MEA01] [varchar](2) NULL,
	[L2400_1_MEA_1_MEA02] [varchar](3) NULL,
	[L2400_1_MEA_1_MEA03] [varchar](20) NULL,
	[L2400_1_MEA_2_MEA01] [varchar](2) NULL,
	[L2400_1_MEA_2_MEA02] [varchar](3) NULL,
	[L2400_1_MEA_2_MEA03] [varchar](20) NULL,
	[L2400_1_MEA_3_MEA01] [varchar](2) NULL,
	[L2400_1_MEA_3_MEA02] [varchar](3) NULL,
	[L2400_1_MEA_3_MEA03] [varchar](20) NULL,
	[L2400_1_MEA_4_MEA01] [varchar](2) NULL,
	[L2400_1_MEA_4_MEA02] [varchar](3) NULL,
	[L2400_1_MEA_4_MEA03] [varchar](20) NULL,
	[L2400_1_MEA_5_MEA01] [varchar](2) NULL,
	[L2400_1_MEA_5_MEA02] [varchar](3) NULL,
	[L2400_1_MEA_5_MEA03] [varchar](20) NULL,
	[L2400_1_CN1_1_CN101] [varchar](2) NULL,
	[L2400_1_CN1_1_CN102] [varchar](18) NULL,
	[L2400_1_CN1_1_CN103] [varchar](6) NULL,
	[L2400_1_CN1_1_CN104] [varchar](50) NULL,
	[L2400_1_CN1_1_CN105] [varchar](6) NULL,
	[L2400_1_CN1_1_CN106] [varchar](30) NULL,
	[L2400_1_REF_1_REF01] [varchar](3) NULL,
	[L2400_1_REF_1_REF02] [varchar](50) NULL,
	[L2400_1_REF_1_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_1_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_2_REF01] [varchar](3) NULL,
	[L2400_1_REF_2_REF02] [varchar](50) NULL,
	[L2400_1_REF_2_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_2_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_3_REF01] [varchar](3) NULL,
	[L2400_1_REF_3_REF02] [varchar](50) NULL,
	[L2400_1_REF_3_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_3_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_4_REF01] [varchar](3) NULL,
	[L2400_1_REF_4_REF02] [varchar](50) NULL,
	[L2400_1_REF_4_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_4_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_5_REF01] [varchar](3) NULL,
	[L2400_1_REF_5_REF02] [varchar](50) NULL,
	[L2400_1_REF_5_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_5_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_6_REF01] [varchar](3) NULL,
	[L2400_1_REF_6_REF02] [varchar](50) NULL,
	[L2400_1_REF_6_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_6_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_7_REF01] [varchar](3) NULL,
	[L2400_1_REF_7_REF02] [varchar](50) NULL,
	[L2400_1_REF_7_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_7_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_8_REF01] [varchar](3) NULL,
	[L2400_1_REF_8_REF02] [varchar](50) NULL,
	[L2400_1_REF_8_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_8_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_9_REF01] [varchar](3) NULL,
	[L2400_1_REF_9_REF02] [varchar](50) NULL,
	[L2400_1_REF_9_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_9_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_11_REF01] [varchar](3) NULL,
	[L2400_1_REF_11_REF02] [varchar](50) NULL,
	[L2400_1_REF_11_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_11_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_12_REF01] [varchar](3) NULL,
	[L2400_1_REF_12_REF02] [varchar](50) NULL,
	[L2400_1_REF_12_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_12_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_13_REF01] [varchar](3) NULL,
	[L2400_1_REF_13_REF02] [varchar](50) NULL,
	[L2400_1_REF_13_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_13_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_14_REF01] [varchar](3) NULL,
	[L2400_1_REF_14_REF02] [varchar](50) NULL,
	[L2400_1_REF_14_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_14_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_15_REF01] [varchar](3) NULL,
	[L2400_1_REF_15_REF02] [varchar](50) NULL,
	[L2400_1_REF_15_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_15_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_16_REF01] [varchar](3) NULL,
	[L2400_1_REF_16_REF02] [varchar](50) NULL,
	[L2400_1_REF_16_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_16_REF04_2] [varchar](50) NULL,
	[L2400_1_REF_17_REF01] [varchar](3) NULL,
	[L2400_1_REF_17_REF02] [varchar](50) NULL,
	[L2400_1_REF_17_REF04_1] [varchar](3) NULL,
	[L2400_1_REF_17_REF04_2] [varchar](50) NULL,
	[L2400_1_AMT_1_AMT01] [varchar](3) NULL,
	[L2400_1_AMT_1_AMT02] [varchar](18) NULL,
	[L2400_1_K3_1_K301] [varchar](80) NULL,
	[L2400_1_K3_2_K301] [varchar](80) NULL,
	[L2400_1_K3_3_K301] [varchar](80) NULL,
	[L2400_1_K3_4_K301] [varchar](80) NULL,
	[L2400_1_K3_5_K301] [varchar](80) NULL,
	[L2400_1_K3_6_K301] [varchar](80) NULL,
	[L2400_1_K3_7_K301] [varchar](80) NULL,
	[L2400_1_K3_8_K301] [varchar](80) NULL,
	[L2400_1_K3_9_K301] [varchar](80) NULL,
	[L2400_1_K3_10_K301] [varchar](80) NULL,
	[L2400_1_NTE_1_NTE01] [varchar](3) NULL,
	[L2400_1_NTE_1_NTE02] [varchar](80) NULL,
	[L2400_1_NTE_2_NTE01] [varchar](3) NULL,
	[L2400_1_NTE_2_NTE02] [varchar](80) NULL,
	[L2400_1_PS1_1_PS101] [varchar](50) NULL,
	[L2400_1_PS1_1_PS102] [varchar](18) NULL,
	[L2400_1_HCP_1_HCP01] [varchar](2) NULL,
	[L2400_1_HCP_1_HCP02] [varchar](18) NULL,
	[L2400_1_HCP_1_HCP03] [varchar](18) NULL,
	[L2400_1_HCP_1_HCP04] [varchar](50) NULL,
	[L2400_1_HCP_1_HCP05] [varchar](9) NULL,
	[L2400_1_HCP_1_HCP06] [varchar](50) NULL,
	[L2400_1_HCP_1_HCP07] [varchar](18) NULL,
	[L2400_1_HCP_1_HCP09] [varchar](2) NULL,
	[L2400_1_HCP_1_HCP10] [varchar](48) NULL,
	[L2400_1_HCP_1_HCP11] [varchar](2) NULL,
	[L2400_1_HCP_1_HCP12] [varchar](15) NULL,
	[L2400_1_HCP_1_HCP13] [varchar](2) NULL,
	[L2400_1_HCP_1_HCP14] [varchar](2) NULL,
	[L2400_1_HCP_1_HCP15] [varchar](2) NULL,
	[L2410_1_LIN_1_LIN01] [varchar](20) NULL,
	[L2410_1_LIN_1_LIN02] [varchar](2) NULL,
	[L2410_1_LIN_1_LIN03] [varchar](48) NULL,
	[L2410_1_CTP_1_CTP04] [varchar](15) NULL,
	[L2410_1_CTP_1_CTP05] [varchar](2) NULL,
	[L2410_1_REF_1_REF01] [varchar](3) NULL,
	[L2410_1_REF_1_REF02] [varchar](50) NULL,
	[L2410_1_REF_2_REF01] [varchar](3) NULL,
	[L2410_1_REF_2_REF02] [varchar](50) NULL,
	[L2420A_1_NM1_1_NM101] [varchar](3) NULL,
	[L2420A_1_NM1_1_NM102] [varchar](1) NULL,
	[L2420A_1_NM1_1_NM103] [varchar](60) NULL,
	[L2420A_1_NM1_1_NM104] [varchar](35) NULL,
	[L2420A_1_NM1_1_NM105] [varchar](25) NULL,
	[L2420A_1_NM1_1_NM107] [varchar](10) NULL,
	[L2420A_1_NM1_1_NM108] [varchar](2) NULL,
	[L2420A_1_NM1_1_NM109] [varchar](80) NULL,
	[L2420A_1_PRV_1_PRV01] [varchar](3) NULL,
	[L2420A_1_PRV_1_PRV02] [varchar](3) NULL,
	[L2420A_1_PRV_1_PRV03] [varchar](50) NULL,
	[L2420A_1_REF_1_REF01] [varchar](3) NULL,
	[L2420A_1_REF_1_REF02] [varchar](50) NULL,
	[L2420A_1_REF_1_REF04_1] [varchar](3) NULL,
	[L2420A_1_REF_1_REF04_2] [varchar](50) NULL,
	[L2420A_1_REF_2_REF01] [varchar](3) NULL,
	[L2420A_1_REF_2_REF02] [varchar](50) NULL,
	[L2420A_1_REF_2_REF04_1] [varchar](3) NULL,
	[L2420A_1_REF_2_REF04_2] [varchar](50) NULL,
	[L2420A_1_REF_3_REF01] [varchar](3) NULL,
	[L2420A_1_REF_3_REF02] [varchar](50) NULL,
	[L2420A_1_REF_3_REF04_1] [varchar](3) NULL,
	[L2420A_1_REF_3_REF04_2] [varchar](50) NULL,
	[L2420A_1_REF_4_REF01] [varchar](3) NULL,
	[L2420A_1_REF_4_REF02] [varchar](50) NULL,
	[L2420A_1_REF_4_REF04_1] [varchar](3) NULL,
	[L2420A_1_REF_4_REF04_2] [varchar](50) NULL,
	[L2420B_1_NM1_1_NM101] [varchar](3) NULL,
	[L2420B_1_NM1_1_NM102] [varchar](1) NULL,
	[L2420B_1_NM1_1_NM108] [varchar](2) NULL,
	[L2420B_1_NM1_1_NM109] [varchar](80) NULL,
	[L2420B_1_REF_1_REF01] [varchar](3) NULL,
	[L2420B_1_REF_1_REF02] [varchar](50) NULL,
	[L2420B_1_REF_1_REF04_1] [varchar](3) NULL,
	[L2420B_1_REF_1_REF04_2] [varchar](50) NULL,
	[L2420B_1_REF_2_REF01] [varchar](3) NULL,
	[L2420B_1_REF_2_REF02] [varchar](50) NULL,
	[L2420B_1_REF_2_REF04_1] [varchar](3) NULL,
	[L2420B_1_REF_2_REF04_2] [varchar](50) NULL,
	[L2420B_1_REF_3_REF01] [varchar](3) NULL,
	[L2420B_1_REF_3_REF02] [varchar](50) NULL,
	[L2420B_1_REF_3_REF04_1] [varchar](3) NULL,
	[L2420B_1_REF_3_REF04_2] [varchar](50) NULL,
	[L2420C_1_NM1_1_NM101] [varchar](3) NULL,
	[L2420C_1_NM1_1_NM102] [varchar](1) NULL,
	[L2420C_1_NM1_1_NM103] [varchar](60) NULL,
	[L2420C_1_NM1_1_NM108] [varchar](2) NULL,
	[L2420C_1_NM1_1_NM109] [varchar](80) NULL,
	[L2420C_1_N3_1_N301] [varchar](55) NULL,
	[L2420C_1_N3_1_N302] [varchar](55) NULL,
	[L2420C_1_N4_1_N401] [varchar](30) NULL,
	[L2420C_1_N4_1_N402] [varchar](2) NULL,
	[L2420C_1_N4_1_N403] [varchar](15) NULL,
	[L2420C_1_N4_1_N404] [varchar](3) NULL,
	[L2420C_1_N4_1_N407] [varchar](3) NULL,
	[L2420C_1_REF_1_REF01] [varchar](3) NULL,
	[L2420C_1_REF_1_REF02] [varchar](50) NULL,
	[L2420C_1_REF_1_REF04_1] [varchar](3) NULL,
	[L2420C_1_REF_1_REF04_2] [varchar](50) NULL,
	[L2420C_1_REF_2_REF01] [varchar](3) NULL,
	[L2420C_1_REF_2_REF02] [varchar](50) NULL,
	[L2420C_1_REF_2_REF04_1] [varchar](3) NULL,
	[L2420C_1_REF_2_REF04_2] [varchar](50) NULL,
	[L2420D_1_NM1_1_NM101] [varchar](3) NULL,
	[L2420D_1_NM1_1_NM102] [varchar](1) NULL,
	[L2420D_1_NM1_1_NM103] [varchar](80) NULL,
	[L2420D_1_NM1_1_NM104] [varchar](35) NULL,
	[L2420D_1_NM1_1_NM105] [varchar](25) NULL,
	[L2420D_1_NM1_1_NM107] [varchar](10) NULL,
	[L2420D_1_NM1_1_NM108] [varchar](2) NULL,
	[L2420D_1_NM1_1_NM109] [varchar](80) NULL,
	[L2420D_1_REF_1_REF01] [varchar](3) NULL,
	[L2420D_1_REF_1_REF02] [varchar](50) NULL,
	[L2420D_1_REF_1_REF04_1] [varchar](3) NULL,
	[L2420D_1_REF_1_REF04_2] [varchar](50) NULL,
	[L2420D_1_REF_2_REF01] [varchar](3) NULL,
	[L2420D_1_REF_2_REF02] [varchar](50) NULL,
	[L2420D_1_REF_2_REF04_1] [varchar](3) NULL,
	[L2420D_1_REF_2_REF04_2] [varchar](50) NULL,
	[L2420D_1_REF_3_REF01] [varchar](3) NULL,
	[L2420D_1_REF_3_REF02] [varchar](50) NULL,
	[L2420D_1_REF_3_REF04_1] [varchar](3) NULL,
	[L2420D_1_REF_3_REF04_2] [varchar](50) NULL,
	[L2420D_1_REF_4_REF01] [varchar](3) NULL,
	[L2420D_1_REF_4_REF02] [varchar](50) NULL,
	[L2420D_1_REF_4_REF04_1] [varchar](3) NULL,
	[L2420D_1_REF_4_REF04_2] [varchar](50) NULL,
	[L2420E_1_NM1_1_NM101] [varchar](3) NULL,
	[L2420E_1_NM1_1_NM102] [varchar](1) NULL,
	[L2420E_1_NM1_1_NM103] [varchar](60) NULL,
	[L2420E_1_NM1_1_NM104] [varchar](35) NULL,
	[L2420E_1_NM1_1_NM105] [varchar](25) NULL,
	[L2420E_1_NM1_1_NM107] [varchar](10) NULL,
	[L2420E_1_NM1_1_NM108] [varchar](2) NULL,
	[L2420E_1_NM1_1_NM109] [varchar](80) NULL,
	[L2420E_1_N3_1_N301] [varchar](55) NULL,
	[L2420E_1_N3_1_N302] [varchar](55) NULL,
	[L2420E_1_N4_1_N401] [varchar](30) NULL,
	[L2420E_1_N4_1_N402] [varchar](2) NULL,
	[L2420E_1_N4_1_N403] [varchar](15) NULL,
	[L2420E_1_N4_1_N404] [varchar](3) NULL,
	[L2420E_1_N4_1_N407] [varchar](3) NULL,
	[L2420E_1_REF_1_REF01] [varchar](3) NULL,
	[L2420E_1_REF_1_REF02] [varchar](50) NULL,
	[L2420E_1_REF_1_REF04_1] [varchar](3) NULL,
	[L2420E_1_REF_1_REF04_2] [varchar](50) NULL,
	[L2420E_1_REF_2_REF01] [varchar](3) NULL,
	[L2420E_1_REF_2_REF02] [varchar](50) NULL,
	[L2420E_1_REF_2_REF04_1] [varchar](3) NULL,
	[L2420E_1_REF_2_REF04_2] [varchar](50) NULL,
	[L2420E_1_REF_3_REF01] [varchar](3) NULL,
	[L2420E_1_REF_3_REF02] [varchar](50) NULL,
	[L2420E_1_REF_3_REF04_1] [varchar](3) NULL,
	[L2420E_1_REF_3_REF04_2] [varchar](50) NULL,
	[L2420E_1_PER_1_PER01] [varchar](2) NULL,
	[L2420E_1_PER_1_PER02] [varchar](60) NULL,
	[L2420E_1_PER_1_PER03] [varchar](2) NULL,
	[L2420E_1_PER_1_PER04] [varchar](256) NULL,
	[L2420E_1_PER_1_PER05] [varchar](2) NULL,
	[L2420E_1_PER_1_PER06] [varchar](256) NULL,
	[L2420E_1_PER_1_PER07] [varchar](2) NULL,
	[L2420E_1_PER_1_PER08] [varchar](256) NULL,
	[L2420F_1_NM1_1_NM101] [varchar](3) NULL,
	[L2420F_1_NM1_1_NM102] [varchar](1) NULL,
	[L2420F_1_NM1_1_NM103] [varchar](60) NULL,
	[L2420F_1_NM1_1_NM104] [varchar](35) NULL,
	[L2420F_1_NM1_1_NM105] [varchar](25) NULL,
	[L2420F_1_NM1_1_NM107] [varchar](10) NULL,
	[L2420F_1_NM1_1_NM108] [varchar](2) NULL,
	[L2420F_1_NM1_1_NM109] [varchar](80) NULL,
	[L2420F_1_REF_1_REF01] [varchar](3) NULL,
	[L2420F_1_REF_1_REF02] [varchar](50) NULL,
	[L2420F_1_REF_1_REF04_1] [varchar](3) NULL,
	[L2420F_1_REF_1_REF04_2] [varchar](50) NULL,
	[L2420F_1_REF_2_REF01] [varchar](3) NULL,
	[L2420F_1_REF_2_REF02] [varchar](50) NULL,
	[L2420F_1_REF_2_REF04_1] [varchar](3) NULL,
	[L2420F_1_REF_2_REF04_2] [varchar](50) NULL,
	[L2420F_1_REF_3_REF01] [varchar](3) NULL,
	[L2420F_1_REF_3_REF02] [varchar](50) NULL,
	[L2420F_1_REF_3_REF04_1] [varchar](3) NULL,
	[L2420F_1_REF_3_REF04_2] [varchar](50) NULL,
	[L2420F_2_NM1_1_NM101] [varchar](3) NULL,
	[L2420F_2_NM1_1_NM102] [varchar](1) NULL,
	[L2420F_2_NM1_1_NM103] [varchar](60) NULL,
	[L2420F_2_NM1_1_NM104] [varchar](35) NULL,
	[L2420F_2_NM1_1_NM105] [varchar](25) NULL,
	[L2420F_2_NM1_1_NM107] [varchar](10) NULL,
	[L2420F_2_NM1_1_NM108] [varchar](2) NULL,
	[L2420F_2_NM1_1_NM109] [varchar](80) NULL,
	[L2420F_2_REF_1_REF01] [varchar](3) NULL,
	[L2420F_2_REF_1_REF02] [varchar](50) NULL,
	[L2420F_2_REF_1_REF04_1] [varchar](3) NULL,
	[L2420F_2_REF_1_REF04_2] [varchar](50) NULL,
	[L2420F_2_REF_2_REF01] [varchar](3) NULL,
	[L2420F_2_REF_2_REF02] [varchar](50) NULL,
	[L2420F_2_REF_2_REF04_1] [varchar](3) NULL,
	[L2420F_2_REF_2_REF04_2] [varchar](50) NULL,
	[L2420F_2_REF_3_REF01] [varchar](3) NULL,
	[L2420F_2_REF_3_REF02] [varchar](50) NULL,
	[L2420F_2_REF_3_REF04_1] [varchar](3) NULL,
	[L2420F_2_REF_3_REF04_2] [varchar](50) NULL,
	[L2420G_1_NM1_1_NM101] [varchar](3) NULL,
	[L2420G_1_NM1_1_NM102] [varchar](1) NULL,
	[L2420G_1_N3_1_N301] [varchar](55) NULL,
	[L2420G_1_N3_1_N302] [varchar](55) NULL,
	[L2420G_1_N4_1_N401] [varchar](30) NULL,
	[L2420G_1_N4_1_N402] [varchar](2) NULL,
	[L2420G_1_N4_1_N403] [varchar](15) NULL,
	[L2420G_1_N4_1_N404] [varchar](3) NULL,
	[L2420G_1_N4_1_N407] [varchar](3) NULL,
	[L2420H_1_NM1_1_NM101] [varchar](3) NULL,
	[L2420H_1_NM1_1_NM102] [varchar](1) NULL,
	[L2420H_1_N3_1_N301] [varchar](55) NULL,
	[L2420H_1_N3_1_N302] [varchar](55) NULL,
	[L2420H_1_N4_1_N401] [varchar](30) NULL,
	[L2420H_1_N4_1_N402] [varchar](2) NULL,
	[L2420H_1_N4_1_N403] [varchar](15) NULL,
	[L2420H_1_N4_1_N404] [varchar](3) NULL,
	[L2420H_1_N4_1_N407] [varchar](3) NULL,
	[L2430_1_SVD_1_SVD01] [varchar](80) NULL,
	[L2430_1_SVD_1_SVD02] [varchar](18) NULL,
	[L2430_1_SVD_1_SVD03_1] [varchar](2) NULL,
	[L2430_1_SVD_1_SVD03_2] [varchar](48) NULL,
	[L2430_1_SVD_1_SVD03_3] [varchar](2) NULL,
	[L2430_1_SVD_1_SVD03_4] [varchar](2) NULL,
	[L2430_1_SVD_1_SVD03_5] [varchar](2) NULL,
	[L2430_1_SVD_1_SVD03_6] [varchar](2) NULL,
	[L2430_1_SVD_1_SVD03_7] [varchar](80) NULL,
	[L2430_1_SVD_1_SVD05] [varchar](15) NULL,
	[L2430_1_SVD_1_SVD06] [varchar](6) NULL,
	[L2430_1_CAS_1_CAS01] [varchar](2) NULL,
	[L2430_1_CAS_1_CAS02] [varchar](5) NULL,
	[L2430_1_CAS_1_CAS03] [varchar](18) NULL,
	[L2430_1_CAS_1_CAS04] [varchar](15) NULL,
	[L2430_1_CAS_1_CAS05] [varchar](5) NULL,
	[L2430_1_CAS_1_CAS06] [varchar](18) NULL,
	[L2430_1_CAS_1_CAS07] [varchar](15) NULL,
	[L2430_1_CAS_1_CAS08] [varchar](5) NULL,
	[L2430_1_CAS_1_CAS09] [varchar](18) NULL,
	[L2430_1_CAS_1_CAS10] [varchar](15) NULL,
	[L2430_1_CAS_1_CAS11] [varchar](5) NULL,
	[L2430_1_CAS_1_CAS12] [varchar](18) NULL,
	[L2430_1_CAS_1_CAS13] [varchar](15) NULL,
	[L2430_1_CAS_1_CAS14] [varchar](5) NULL,
	[L2430_1_CAS_1_CAS15] [varchar](18) NULL,
	[L2430_1_CAS_1_CAS16] [varchar](15) NULL,
	[L2430_1_CAS_1_CAS17] [varchar](5) NULL,
	[L2430_1_CAS_1_CAS18] [varchar](18) NULL,
	[L2430_1_CAS_1_CAS19] [varchar](15) NULL,
	[L2430_1_CAS_2_CAS01] [varchar](2) NULL,
	[L2430_1_CAS_2_CAS02] [varchar](5) NULL,
	[L2430_1_CAS_2_CAS03] [varchar](18) NULL,
	[L2430_1_CAS_2_CAS04] [varchar](15) NULL,
	[L2430_1_CAS_2_CAS05] [varchar](5) NULL,
	[L2430_1_CAS_2_CAS06] [varchar](18) NULL,
	[L2430_1_CAS_2_CAS07] [varchar](15) NULL,
	[L2430_1_CAS_2_CAS08] [varchar](5) NULL,
	[L2430_1_CAS_2_CAS09] [varchar](18) NULL,
	[L2430_1_CAS_2_CAS10] [varchar](15) NULL,
	[L2430_1_CAS_2_CAS11] [varchar](5) NULL,
	[L2430_1_CAS_2_CAS12] [varchar](18) NULL,
	[L2430_1_CAS_2_CAS13] [varchar](15) NULL,
	[L2430_1_CAS_2_CAS14] [varchar](5) NULL,
	[L2430_1_CAS_2_CAS15] [varchar](18) NULL,
	[L2430_1_CAS_2_CAS16] [varchar](15) NULL,
	[L2430_1_CAS_2_CAS17] [varchar](5) NULL,
	[L2430_1_CAS_2_CAS18] [varchar](18) NULL,
	[L2430_1_CAS_2_CAS19] [varchar](15) NULL,
	[L2430_1_CAS_3_CAS01] [varchar](2) NULL,
	[L2430_1_CAS_3_CAS02] [varchar](5) NULL,
	[L2430_1_CAS_3_CAS03] [varchar](18) NULL,
	[L2430_1_CAS_3_CAS04] [varchar](15) NULL,
	[L2430_1_CAS_3_CAS05] [varchar](5) NULL,
	[L2430_1_CAS_3_CAS06] [varchar](18) NULL,
	[L2430_1_CAS_3_CAS07] [varchar](15) NULL,
	[L2430_1_CAS_3_CAS08] [varchar](5) NULL,
	[L2430_1_CAS_3_CAS09] [varchar](18) NULL,
	[L2430_1_CAS_3_CAS10] [varchar](15) NULL,
	[L2430_1_CAS_3_CAS11] [varchar](5) NULL,
	[L2430_1_CAS_3_CAS12] [varchar](18) NULL,
	[L2430_1_CAS_3_CAS13] [varchar](15) NULL,
	[L2430_1_CAS_3_CAS14] [varchar](5) NULL,
	[L2430_1_CAS_3_CAS15] [varchar](18) NULL,
	[L2430_1_CAS_3_CAS16] [varchar](15) NULL,
	[L2430_1_CAS_3_CAS17] [varchar](5) NULL,
	[L2430_1_CAS_3_CAS18] [varchar](18) NULL,
	[L2430_1_CAS_3_CAS19] [varchar](15) NULL,
	[L2430_1_CAS_4_CAS01] [varchar](2) NULL,
	[L2430_1_CAS_4_CAS02] [varchar](5) NULL,
	[L2430_1_CAS_4_CAS03] [varchar](18) NULL,
	[L2430_1_CAS_4_CAS04] [varchar](15) NULL,
	[L2430_1_CAS_4_CAS05] [varchar](5) NULL,
	[L2430_1_CAS_4_CAS06] [varchar](18) NULL,
	[L2430_1_CAS_4_CAS07] [varchar](15) NULL,
	[L2430_1_CAS_4_CAS08] [varchar](5) NULL,
	[L2430_1_CAS_4_CAS09] [varchar](18) NULL,
	[L2430_1_CAS_4_CAS10] [varchar](15) NULL,
	[L2430_1_CAS_4_CAS11] [varchar](5) NULL,
	[L2430_1_CAS_4_CAS12] [varchar](18) NULL,
	[L2430_1_CAS_4_CAS13] [varchar](15) NULL,
	[L2430_1_CAS_4_CAS14] [varchar](5) NULL,
	[L2430_1_CAS_4_CAS15] [varchar](18) NULL,
	[L2430_1_CAS_4_CAS16] [varchar](15) NULL,
	[L2430_1_CAS_4_CAS17] [varchar](5) NULL,
	[L2430_1_CAS_4_CAS18] [varchar](18) NULL,
	[L2430_1_CAS_4_CAS19] [varchar](15) NULL,
	[L2430_1_CAS_5_CAS01] [varchar](2) NULL,
	[L2430_1_CAS_5_CAS02] [varchar](5) NULL,
	[L2430_1_CAS_5_CAS03] [varchar](18) NULL,
	[L2430_1_CAS_5_CAS04] [varchar](15) NULL,
	[L2430_1_CAS_5_CAS05] [varchar](5) NULL,
	[L2430_1_CAS_5_CAS06] [varchar](18) NULL,
	[L2430_1_CAS_5_CAS07] [varchar](15) NULL,
	[L2430_1_CAS_5_CAS08] [varchar](5) NULL,
	[L2430_1_CAS_5_CAS09] [varchar](18) NULL,
	[L2430_1_CAS_5_CAS10] [varchar](15) NULL,
	[L2430_1_CAS_5_CAS11] [varchar](5) NULL,
	[L2430_1_CAS_5_CAS12] [varchar](18) NULL,
	[L2430_1_CAS_5_CAS13] [varchar](15) NULL,
	[L2430_1_CAS_5_CAS14] [varchar](5) NULL,
	[L2430_1_CAS_5_CAS15] [varchar](18) NULL,
	[L2430_1_CAS_5_CAS16] [varchar](15) NULL,
	[L2430_1_CAS_5_CAS17] [varchar](5) NULL,
	[L2430_1_CAS_5_CAS18] [varchar](18) NULL,
	[L2430_1_CAS_5_CAS19] [varchar](15) NULL,
	[L2430_1_DTP_1_DTP01] [varchar](3) NULL,
	[L2430_1_DTP_1_DTP02] [varchar](3) NULL,
	[L2430_1_DTP_1_DTP03] [varchar](35) NULL,
	[L2430_1_AMT_1_AMT01] [varchar](3) NULL,
	[L2430_1_AMT_1_AMT02] [varchar](18) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[EDI_837P_ServiceLine] ON
INSERT [dbo].[EDI_837P_ServiceLine] ([ServiceLineId], [claimid], [Fileid], [HeaderID], [subscriber_patientid], [L2400_1_LX_1_LX01], [L2400_1_SV1_1_SV101_01], [L2400_1_SV1_1_SV101_02], [L2400_1_SV1_1_SV101_03], [L2400_1_SV1_1_SV101_04], [L2400_1_SV1_1_SV101_05], [L2400_1_SV1_1_SV101_06], [L2400_1_SV1_1_SV101_07], [L2400_1_SV1_1_SV102], [L2400_1_SV1_1_SV103], [L2400_1_SV1_1_SV104], [L2400_1_SV1_1_SV105], [L2400_1_SV1_1_SV107_1], [L2400_1_SV1_1_SV107_2], [L2400_1_SV1_1_SV107_3], [L2400_1_SV1_1_SV107_4], [L2400_1_SV1_1_SV109], [L2400_1_SV1_1_SV111], [L2400_1_SV1_1_SV112], [L2400_1_SV1_1_SV115], [L2400_1_SV5_1_SV501_01], [L2400_1_SV5_1_SV501_02], [L2400_1_SV5_1_SV502], [L2400_1_SV5_1_SV503], [L2400_1_SV5_1_SV504], [L2400_1_SV5_1_SV505], [L2400_1_SV5_1_SV506], [L2400_1_PWK_1_PWK01], [L2400_1_PWK_1_PWK02], [L2400_1_PWK_1_PWK05], [L2400_1_PWK_1_PWK06], [L2400_1_PWK_2_PWK01], [L2400_1_PWK_2_PWK02], [L2400_1_PWK_2_PWK05], [L2400_1_PWK_2_PWK06], [L2400_1_PWK_3_PWK01], [L2400_1_PWK_3_PWK02], [L2400_1_PWK_3_PWK05], [L2400_1_PWK_3_PWK06], [L2400_1_PWK_4_PWK01], [L2400_1_PWK_4_PWK02], [L2400_1_PWK_4_PWK05], [L2400_1_PWK_4_PWK06], [L2400_1_PWK_5_PWK01], [L2400_1_PWK_5_PWK02], [L2400_1_PWK_5_PWK05], [L2400_1_PWK_5_PWK06], [L2400_1_PWK_6_PWK01], [L2400_1_PWK_6_PWK02], [L2400_1_PWK_6_PWK05], [L2400_1_PWK_6_PWK06], [L2400_1_PWK_7_PWK01], [L2400_1_PWK_7_PWK02], [L2400_1_PWK_7_PWK05], [L2400_1_PWK_7_PWK06], [L2400_1_PWK_8_PWK01], [L2400_1_PWK_8_PWK02], [L2400_1_PWK_8_PWK05], [L2400_1_PWK_8_PWK06], [L2400_1_PWK_9_PWK01], [L2400_1_PWK_9_PWK02], [L2400_1_PWK_9_PWK05], [L2400_1_PWK_9_PWK06], [L2400_1_PWK_10_PWK01], [L2400_1_PWK_10_PWK02], [L2400_1_PWK_10_PWK05], [L2400_1_PWK_10_PWK06], [L2400_1_PWK_11_PWK01], [L2400_1_PWK_11_PWK02], [L2400_1_PWK_11_PWK05], [L2400_1_PWK_11_PWK06], [L2400_1_CR1_1_CR101], [L2400_1_CR1_1_CR102], [L2400_1_CR1_1_CR104], [L2400_1_CR1_1_CR105], [L2400_1_CR1_1_CR106], [L2400_1_CR1_1_CR109], [L2400_1_CR1_1_CR110], [L2400_1_CR3_1_CR301], [L2400_1_CR3_1_CR302], [L2400_1_CR3_1_CR303], [L2400_1_CRC_1_CRC01], [L2400_1_CRC_1_CRC02], [L2400_1_CRC_1_CRC03], [L2400_1_CRC_1_CRC04], [L2400_1_CRC_1_CRC05], [L2400_1_CRC_1_CRC06], [L2400_1_CRC_1_CRC07], [L2400_1_CRC_2_CRC01], [L2400_1_CRC_2_CRC02], [L2400_1_CRC_2_CRC03], [L2400_1_CRC_2_CRC04], [L2400_1_CRC_2_CRC05], [L2400_1_CRC_2_CRC06], [L2400_1_CRC_2_CRC07], [L2400_1_CRC_3_CRC01], [L2400_1_CRC_3_CRC02], [L2400_1_CRC_3_CRC03], [L2400_1_CRC_3_CRC04], [L2400_1_CRC_3_CRC05], [L2400_1_CRC_3_CRC06], [L2400_1_CRC_3_CRC07], [L2400_1_CRC_4_CRC01], [L2400_1_CRC_4_CRC02], [L2400_1_CRC_4_CRC03], [L2400_1_CRC_4_CRC04], [L2400_1_CRC_4_CRC05], [L2400_1_CRC_4_CRC06], [L2400_1_CRC_4_CRC07], [L2400_1_CRC_5_CRC01], [L2400_1_CRC_5_CRC02], [L2400_1_CRC_5_CRC03], [L2400_1_CRC_5_CRC04], [L2400_1_CRC_5_CRC05], [L2400_1_CRC_5_CRC06], [L2400_1_CRC_5_CRC07], [L2400_1_DTP_1_DTP01], [L2400_1_DTP_1_DTP02], [L2400_1_DTP_1_DTP03], [L2400_1_DTP_2_DTP01], [L2400_1_DTP_2_DTP02], [L2400_1_DTP_2_DTP03], [L2400_1_DTP_3_DTP01], [L2400_1_DTP_3_DTP02], [L2400_1_DTP_3_DTP03], [L2400_1_DTP_4_DTP01], [L2400_1_DTP_4_DTP02], [L2400_1_DTP_4_DTP03], [L2400_1_DTP_5_DTP01], [L2400_1_DTP_5_DTP02], [L2400_1_DTP_5_DTP03], [L2400_1_DTP_6_DTP01], [L2400_1_DTP_6_DTP02], [L2400_1_DTP_6_DTP03], [L2400_1_DTP_7_DTP01], [L2400_1_DTP_7_DTP02], [L2400_1_DTP_7_DTP03], [L2400_1_DTP_8_DTP01], [L2400_1_DTP_8_DTP02], [L2400_1_DTP_8_DTP03], [L2400_1_DTP_9_DTP01], [L2400_1_DTP_9_DTP02], [L2400_1_DTP_9_DTP03], [L2400_1_DTP_10_DTP01], [L2400_1_DTP_10_DTP02], [L2400_1_DTP_10_DTP03], [L2400_1_QTY_1_QTY01], [L2400_1_QTY_1_QTY02], [L2400_1_QTY_2_QTY01], [L2400_1_QTY_2_QTY02], [L2400_1_MEA_1_MEA01], [L2400_1_MEA_1_MEA02], [L2400_1_MEA_1_MEA03], [L2400_1_MEA_2_MEA01], [L2400_1_MEA_2_MEA02], [L2400_1_MEA_2_MEA03], [L2400_1_MEA_3_MEA01], [L2400_1_MEA_3_MEA02], [L2400_1_MEA_3_MEA03], [L2400_1_MEA_4_MEA01], [L2400_1_MEA_4_MEA02], [L2400_1_MEA_4_MEA03], [L2400_1_MEA_5_MEA01], [L2400_1_MEA_5_MEA02], [L2400_1_MEA_5_MEA03], [L2400_1_CN1_1_CN101], [L2400_1_CN1_1_CN102], [L2400_1_CN1_1_CN103], [L2400_1_CN1_1_CN104], [L2400_1_CN1_1_CN105], [L2400_1_CN1_1_CN106], [L2400_1_REF_1_REF01], [L2400_1_REF_1_REF02], [L2400_1_REF_1_REF04_1], [L2400_1_REF_1_REF04_2], [L2400_1_REF_2_REF01], [L2400_1_REF_2_REF02], [L2400_1_REF_2_REF04_1], [L2400_1_REF_2_REF04_2], [L2400_1_REF_3_REF01], [L2400_1_REF_3_REF02], [L2400_1_REF_3_REF04_1], [L2400_1_REF_3_REF04_2], [L2400_1_REF_4_REF01], [L2400_1_REF_4_REF02], [L2400_1_REF_4_REF04_1], [L2400_1_REF_4_REF04_2], [L2400_1_REF_5_REF01], [L2400_1_REF_5_REF02], [L2400_1_REF_5_REF04_1], [L2400_1_REF_5_REF04_2], [L2400_1_REF_6_REF01], [L2400_1_REF_6_REF02], [L2400_1_REF_6_REF04_1], [L2400_1_REF_6_REF04_2], [L2400_1_REF_7_REF01], [L2400_1_REF_7_REF02], [L2400_1_REF_7_REF04_1], [L2400_1_REF_7_REF04_2], [L2400_1_REF_8_REF01], [L2400_1_REF_8_REF02], [L2400_1_REF_8_REF04_1], [L2400_1_REF_8_REF04_2], [L2400_1_REF_9_REF01], [L2400_1_REF_9_REF02], [L2400_1_REF_9_REF04_1], [L2400_1_REF_9_REF04_2], [L2400_1_REF_11_REF01], [L2400_1_REF_11_REF02], [L2400_1_REF_11_REF04_1], [L2400_1_REF_11_REF04_2], [L2400_1_REF_12_REF01], [L2400_1_REF_12_REF02], [L2400_1_REF_12_REF04_1], [L2400_1_REF_12_REF04_2], [L2400_1_REF_13_REF01], [L2400_1_REF_13_REF02], [L2400_1_REF_13_REF04_1], [L2400_1_REF_13_REF04_2], [L2400_1_REF_14_REF01], [L2400_1_REF_14_REF02], [L2400_1_REF_14_REF04_1], [L2400_1_REF_14_REF04_2], [L2400_1_REF_15_REF01], [L2400_1_REF_15_REF02], [L2400_1_REF_15_REF04_1], [L2400_1_REF_15_REF04_2], [L2400_1_REF_16_REF01], [L2400_1_REF_16_REF02], [L2400_1_REF_16_REF04_1], [L2400_1_REF_16_REF04_2], [L2400_1_REF_17_REF01], [L2400_1_REF_17_REF02], [L2400_1_REF_17_REF04_1], [L2400_1_REF_17_REF04_2], [L2400_1_AMT_1_AMT01], [L2400_1_AMT_1_AMT02], [L2400_1_K3_1_K301], [L2400_1_K3_2_K301], [L2400_1_K3_3_K301], [L2400_1_K3_4_K301], [L2400_1_K3_5_K301], [L2400_1_K3_6_K301], [L2400_1_K3_7_K301], [L2400_1_K3_8_K301], [L2400_1_K3_9_K301], [L2400_1_K3_10_K301], [L2400_1_NTE_1_NTE01], [L2400_1_NTE_1_NTE02], [L2400_1_NTE_2_NTE01], [L2400_1_NTE_2_NTE02], [L2400_1_PS1_1_PS101], [L2400_1_PS1_1_PS102], [L2400_1_HCP_1_HCP01], [L2400_1_HCP_1_HCP02], [L2400_1_HCP_1_HCP03], [L2400_1_HCP_1_HCP04], [L2400_1_HCP_1_HCP05], [L2400_1_HCP_1_HCP06], [L2400_1_HCP_1_HCP07], [L2400_1_HCP_1_HCP09], [L2400_1_HCP_1_HCP10], [L2400_1_HCP_1_HCP11], [L2400_1_HCP_1_HCP12], [L2400_1_HCP_1_HCP13], [L2400_1_HCP_1_HCP14], [L2400_1_HCP_1_HCP15], [L2410_1_LIN_1_LIN01], [L2410_1_LIN_1_LIN02], [L2410_1_LIN_1_LIN03], [L2410_1_CTP_1_CTP04], [L2410_1_CTP_1_CTP05], [L2410_1_REF_1_REF01], [L2410_1_REF_1_REF02], [L2410_1_REF_2_REF01], [L2410_1_REF_2_REF02], [L2420A_1_NM1_1_NM101], [L2420A_1_NM1_1_NM102], [L2420A_1_NM1_1_NM103], [L2420A_1_NM1_1_NM104], [L2420A_1_NM1_1_NM105], [L2420A_1_NM1_1_NM107], [L2420A_1_NM1_1_NM108], [L2420A_1_NM1_1_NM109], [L2420A_1_PRV_1_PRV01], [L2420A_1_PRV_1_PRV02], [L2420A_1_PRV_1_PRV03], [L2420A_1_REF_1_REF01], [L2420A_1_REF_1_REF02], [L2420A_1_REF_1_REF04_1], [L2420A_1_REF_1_REF04_2], [L2420A_1_REF_2_REF01], [L2420A_1_REF_2_REF02], [L2420A_1_REF_2_REF04_1], [L2420A_1_REF_2_REF04_2], [L2420A_1_REF_3_REF01], [L2420A_1_REF_3_REF02], [L2420A_1_REF_3_REF04_1], [L2420A_1_REF_3_REF04_2], [L2420A_1_REF_4_REF01], [L2420A_1_REF_4_REF02], [L2420A_1_REF_4_REF04_1], [L2420A_1_REF_4_REF04_2], [L2420B_1_NM1_1_NM101], [L2420B_1_NM1_1_NM102], [L2420B_1_NM1_1_NM108], [L2420B_1_NM1_1_NM109], [L2420B_1_REF_1_REF01], [L2420B_1_REF_1_REF02], [L2420B_1_REF_1_REF04_1], [L2420B_1_REF_1_REF04_2], [L2420B_1_REF_2_REF01], [L2420B_1_REF_2_REF02], [L2420B_1_REF_2_REF04_1], [L2420B_1_REF_2_REF04_2], [L2420B_1_REF_3_REF01], [L2420B_1_REF_3_REF02], [L2420B_1_REF_3_REF04_1], [L2420B_1_REF_3_REF04_2], [L2420C_1_NM1_1_NM101], [L2420C_1_NM1_1_NM102], [L2420C_1_NM1_1_NM103], [L2420C_1_NM1_1_NM108], [L2420C_1_NM1_1_NM109], [L2420C_1_N3_1_N301], [L2420C_1_N3_1_N302], [L2420C_1_N4_1_N401], [L2420C_1_N4_1_N402], [L2420C_1_N4_1_N403], [L2420C_1_N4_1_N404], [L2420C_1_N4_1_N407], [L2420C_1_REF_1_REF01], [L2420C_1_REF_1_REF02], [L2420C_1_REF_1_REF04_1], [L2420C_1_REF_1_REF04_2], [L2420C_1_REF_2_REF01], [L2420C_1_REF_2_REF02], [L2420C_1_REF_2_REF04_1], [L2420C_1_REF_2_REF04_2], [L2420D_1_NM1_1_NM101], [L2420D_1_NM1_1_NM102], [L2420D_1_NM1_1_NM103], [L2420D_1_NM1_1_NM104], [L2420D_1_NM1_1_NM105], [L2420D_1_NM1_1_NM107], [L2420D_1_NM1_1_NM108], [L2420D_1_NM1_1_NM109], [L2420D_1_REF_1_REF01], [L2420D_1_REF_1_REF02], [L2420D_1_REF_1_REF04_1], [L2420D_1_REF_1_REF04_2], [L2420D_1_REF_2_REF01], [L2420D_1_REF_2_REF02], [L2420D_1_REF_2_REF04_1], [L2420D_1_REF_2_REF04_2], [L2420D_1_REF_3_REF01], [L2420D_1_REF_3_REF02], [L2420D_1_REF_3_REF04_1], [L2420D_1_REF_3_REF04_2], [L2420D_1_REF_4_REF01], [L2420D_1_REF_4_REF02], [L2420D_1_REF_4_REF04_1], [L2420D_1_REF_4_REF04_2], [L2420E_1_NM1_1_NM101], [L2420E_1_NM1_1_NM102], [L2420E_1_NM1_1_NM103], [L2420E_1_NM1_1_NM104], [L2420E_1_NM1_1_NM105], [L2420E_1_NM1_1_NM107], [L2420E_1_NM1_1_NM108], [L2420E_1_NM1_1_NM109], [L2420E_1_N3_1_N301], [L2420E_1_N3_1_N302], [L2420E_1_N4_1_N401], [L2420E_1_N4_1_N402], [L2420E_1_N4_1_N403], [L2420E_1_N4_1_N404], [L2420E_1_N4_1_N407], [L2420E_1_REF_1_REF01], [L2420E_1_REF_1_REF02], [L2420E_1_REF_1_REF04_1], [L2420E_1_REF_1_REF04_2], [L2420E_1_REF_2_REF01], [L2420E_1_REF_2_REF02], [L2420E_1_REF_2_REF04_1], [L2420E_1_REF_2_REF04_2], [L2420E_1_REF_3_REF01], [L2420E_1_REF_3_REF02], [L2420E_1_REF_3_REF04_1], [L2420E_1_REF_3_REF04_2], [L2420E_1_PER_1_PER01], [L2420E_1_PER_1_PER02], [L2420E_1_PER_1_PER03], [L2420E_1_PER_1_PER04], [L2420E_1_PER_1_PER05], [L2420E_1_PER_1_PER06], [L2420E_1_PER_1_PER07], [L2420E_1_PER_1_PER08], [L2420F_1_NM1_1_NM101], [L2420F_1_NM1_1_NM102], [L2420F_1_NM1_1_NM103], [L2420F_1_NM1_1_NM104], [L2420F_1_NM1_1_NM105], [L2420F_1_NM1_1_NM107], [L2420F_1_NM1_1_NM108], [L2420F_1_NM1_1_NM109], [L2420F_1_REF_1_REF01], [L2420F_1_REF_1_REF02], [L2420F_1_REF_1_REF04_1], [L2420F_1_REF_1_REF04_2], [L2420F_1_REF_2_REF01], [L2420F_1_REF_2_REF02], [L2420F_1_REF_2_REF04_1], [L2420F_1_REF_2_REF04_2], [L2420F_1_REF_3_REF01], [L2420F_1_REF_3_REF02], [L2420F_1_REF_3_REF04_1], [L2420F_1_REF_3_REF04_2], [L2420F_2_NM1_1_NM101], [L2420F_2_NM1_1_NM102], [L2420F_2_NM1_1_NM103], [L2420F_2_NM1_1_NM104], [L2420F_2_NM1_1_NM105], [L2420F_2_NM1_1_NM107], [L2420F_2_NM1_1_NM108], [L2420F_2_NM1_1_NM109], [L2420F_2_REF_1_REF01], [L2420F_2_REF_1_REF02], [L2420F_2_REF_1_REF04_1], [L2420F_2_REF_1_REF04_2], [L2420F_2_REF_2_REF01], [L2420F_2_REF_2_REF02], [L2420F_2_REF_2_REF04_1], [L2420F_2_REF_2_REF04_2], [L2420F_2_REF_3_REF01], [L2420F_2_REF_3_REF02], [L2420F_2_REF_3_REF04_1], [L2420F_2_REF_3_REF04_2], [L2420G_1_NM1_1_NM101], [L2420G_1_NM1_1_NM102], [L2420G_1_N3_1_N301], [L2420G_1_N3_1_N302], [L2420G_1_N4_1_N401], [L2420G_1_N4_1_N402], [L2420G_1_N4_1_N403], [L2420G_1_N4_1_N404], [L2420G_1_N4_1_N407], [L2420H_1_NM1_1_NM101], [L2420H_1_NM1_1_NM102], [L2420H_1_N3_1_N301], [L2420H_1_N3_1_N302], [L2420H_1_N4_1_N401], [L2420H_1_N4_1_N402], [L2420H_1_N4_1_N403], [L2420H_1_N4_1_N404], [L2420H_1_N4_1_N407], [L2430_1_SVD_1_SVD01], [L2430_1_SVD_1_SVD02], [L2430_1_SVD_1_SVD03_1], [L2430_1_SVD_1_SVD03_2], [L2430_1_SVD_1_SVD03_3], [L2430_1_SVD_1_SVD03_4], [L2430_1_SVD_1_SVD03_5], [L2430_1_SVD_1_SVD03_6], [L2430_1_SVD_1_SVD03_7], [L2430_1_SVD_1_SVD05], [L2430_1_SVD_1_SVD06], [L2430_1_CAS_1_CAS01], [L2430_1_CAS_1_CAS02], [L2430_1_CAS_1_CAS03], [L2430_1_CAS_1_CAS04], [L2430_1_CAS_1_CAS05], [L2430_1_CAS_1_CAS06], [L2430_1_CAS_1_CAS07], [L2430_1_CAS_1_CAS08], [L2430_1_CAS_1_CAS09], [L2430_1_CAS_1_CAS10], [L2430_1_CAS_1_CAS11], [L2430_1_CAS_1_CAS12], [L2430_1_CAS_1_CAS13], [L2430_1_CAS_1_CAS14], [L2430_1_CAS_1_CAS15], [L2430_1_CAS_1_CAS16], [L2430_1_CAS_1_CAS17], [L2430_1_CAS_1_CAS18], [L2430_1_CAS_1_CAS19], [L2430_1_CAS_2_CAS01], [L2430_1_CAS_2_CAS02], [L2430_1_CAS_2_CAS03], [L2430_1_CAS_2_CAS04], [L2430_1_CAS_2_CAS05], [L2430_1_CAS_2_CAS06], [L2430_1_CAS_2_CAS07], [L2430_1_CAS_2_CAS08], [L2430_1_CAS_2_CAS09], [L2430_1_CAS_2_CAS10], [L2430_1_CAS_2_CAS11], [L2430_1_CAS_2_CAS12], [L2430_1_CAS_2_CAS13], [L2430_1_CAS_2_CAS14], [L2430_1_CAS_2_CAS15], [L2430_1_CAS_2_CAS16], [L2430_1_CAS_2_CAS17], [L2430_1_CAS_2_CAS18], [L2430_1_CAS_2_CAS19], [L2430_1_CAS_3_CAS01], [L2430_1_CAS_3_CAS02], [L2430_1_CAS_3_CAS03], [L2430_1_CAS_3_CAS04], [L2430_1_CAS_3_CAS05], [L2430_1_CAS_3_CAS06], [L2430_1_CAS_3_CAS07], [L2430_1_CAS_3_CAS08], [L2430_1_CAS_3_CAS09], [L2430_1_CAS_3_CAS10], [L2430_1_CAS_3_CAS11], [L2430_1_CAS_3_CAS12], [L2430_1_CAS_3_CAS13], [L2430_1_CAS_3_CAS14], [L2430_1_CAS_3_CAS15], [L2430_1_CAS_3_CAS16], [L2430_1_CAS_3_CAS17], [L2430_1_CAS_3_CAS18], [L2430_1_CAS_3_CAS19], [L2430_1_CAS_4_CAS01], [L2430_1_CAS_4_CAS02], [L2430_1_CAS_4_CAS03], [L2430_1_CAS_4_CAS04], [L2430_1_CAS_4_CAS05], [L2430_1_CAS_4_CAS06], [L2430_1_CAS_4_CAS07], [L2430_1_CAS_4_CAS08], [L2430_1_CAS_4_CAS09], [L2430_1_CAS_4_CAS10], [L2430_1_CAS_4_CAS11], [L2430_1_CAS_4_CAS12], [L2430_1_CAS_4_CAS13], [L2430_1_CAS_4_CAS14], [L2430_1_CAS_4_CAS15], [L2430_1_CAS_4_CAS16], [L2430_1_CAS_4_CAS17], [L2430_1_CAS_4_CAS18], [L2430_1_CAS_4_CAS19], [L2430_1_CAS_5_CAS01], [L2430_1_CAS_5_CAS02], [L2430_1_CAS_5_CAS03], [L2430_1_CAS_5_CAS04], [L2430_1_CAS_5_CAS05], [L2430_1_CAS_5_CAS06], [L2430_1_CAS_5_CAS07], [L2430_1_CAS_5_CAS08], [L2430_1_CAS_5_CAS09], [L2430_1_CAS_5_CAS10], [L2430_1_CAS_5_CAS11], [L2430_1_CAS_5_CAS12], [L2430_1_CAS_5_CAS13], [L2430_1_CAS_5_CAS14], [L2430_1_CAS_5_CAS15], [L2430_1_CAS_5_CAS16], [L2430_1_CAS_5_CAS17], [L2430_1_CAS_5_CAS18], [L2430_1_CAS_5_CAS19], [L2430_1_DTP_1_DTP01], [L2430_1_DTP_1_DTP02], [L2430_1_DTP_1_DTP03], [L2430_1_AMT_1_AMT01], [L2430_1_AMT_1_AMT02]) VALUES (20898, 20555, N'178', N'987654', N'3', N'1', N'HC', N'99211', N'25', NULL, NULL, NULL, NULL, N'12.25', N'UN', N'1', N'11', N'1', N'2', N'3', NULL, N'Y', NULL, NULL, NULL, N'HC', N'A4631', N'DA', N'30', N'50', N'5000', N'4', N'03', N'BM', N'AC', N'DMN0012', N'04', N'BM', N'AC', N'DMN0012', N'05', N'BM', N'AC', N'DMN0012', N'06', N'BM', N'AC', N'DMN0012', N'07', N'BM', N'AC', N'DMN0012', N'08', N'BM', N'AC', N'DMN0012', N'09', N'BM', N'AC', N'DMN0012', N'10', N'BM', N'AC', N'DMN0012', N'11', N'BM', N'AC', N'DMN0012', N'12', N'BM', N'AC', N'DMN0012', N'CT', N'AB', NULL, NULL, N'LB', N'140', N'A', N'DH', N'12', N'', N'UNCONSCIOUS', N'I', N'MO', N'6', N'07', N'Y', N'01', NULL, NULL, NULL, NULL, N'70', N'Y', N'65', NULL, NULL, NULL, NULL, N'09', N'N', N'ZV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'472', N'RD8', N'20050314-20050325', N'607', N'D8', N'20050112', N'463', N'D8', N'20050112', N'461', N'D8', N'20050112', N'304', N'D8', N'20050108', N'738', N'D8', N'20050112', N'739', N'D8', N'20050112', N'011', N'D8', N'20050112', N'455', N'D8', N'20050108', N'454', N'D8', N'20050108', N'PT', N'2', N'FL', N'3', N'TR', N'R1', N'113.4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'02', N'550', NULL, NULL, NULL, NULL, N'9B', N'444444', NULL, NULL, N'9D', N'444444', NULL, NULL, N'G1', N'13579', NULL, NULL, N'6R', N'54321', NULL, NULL, N'EW', N'T554', NULL, NULL, N'X4', N'12D4567890', NULL, NULL, N'F4', N'34D1234567', NULL, NULL, N'BT', N'DTP22333444', NULL, NULL, N'9F', N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'T', N'45', N'STATE DATA REQUIREMENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'DCP', N'PATIENT GOAL TO BE OFF OXYGEN BY END OF MONTH', N'PN222222', N'110', N'03', N'100', N'10', N'RPO12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'N4', N'01234567891', N'2', N'UN', NULL, NULL, N'XZ', N'123456', N'82', N'1', N'DOE', N'JANE', N'C', N'', N'XX', N'1234567804', N'PE', N'PXC', N'208D00000X', N'0B', N'12345', NULL, NULL, N'1G', N'12345', NULL, NULL, N'G2', N'12345', NULL, NULL, NULL, NULL, NULL, NULL, N'QB', N'2', N'XX', N'1234567891', N'0B', N'12345', NULL, NULL, N'1G', N'12345', NULL, NULL, N'G2', N'12345', NULL, NULL, N'77', N'2', N'ABC CLINIC', N'XX', N'1234567891', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'G2', N'12345', NULL, NULL, N'LU', N'12345', NULL, NULL, N'DQ', N'1', N'DOE', N'JOHN', N'B', N'', N'XX', N'1234567891', N'0B', N'12345', NULL, NULL, N'1G', N'12345', NULL, NULL, N'G2', N'12345', NULL, NULL, N'LU', N'12345', NULL, NULL, N'DK', N'1', N'RICHARDSON', N'TRENT', N'', N'', N'XX', N'1234567891', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'0B', N'12345', NULL, NULL, N'1G', N'12345', NULL, NULL, N'G2', N'12345', NULL, NULL, N'IC', N'JOHN SMITH', N'TE', N'5555551234', N'EX', N'123', NULL, NULL, N'DN', N'1', N'WELBY', N'MARCUS', N'W', N'JR', N'XX', N'1234567891', N'G2', N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'PW', N'2', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'45', N'2', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'43', N'55', N'HC', N'84550', NULL, NULL, NULL, NULL, NULL, N'3', NULL, N'OA', N'93', N'15.06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'573', N'D8', N'20040203', N'EAF', N'75')
INSERT [dbo].[EDI_837P_ServiceLine] ([ServiceLineId], [claimid], [Fileid], [HeaderID], [subscriber_patientid], [L2400_1_LX_1_LX01], [L2400_1_SV1_1_SV101_01], [L2400_1_SV1_1_SV101_02], [L2400_1_SV1_1_SV101_03], [L2400_1_SV1_1_SV101_04], [L2400_1_SV1_1_SV101_05], [L2400_1_SV1_1_SV101_06], [L2400_1_SV1_1_SV101_07], [L2400_1_SV1_1_SV102], [L2400_1_SV1_1_SV103], [L2400_1_SV1_1_SV104], [L2400_1_SV1_1_SV105], [L2400_1_SV1_1_SV107_1], [L2400_1_SV1_1_SV107_2], [L2400_1_SV1_1_SV107_3], [L2400_1_SV1_1_SV107_4], [L2400_1_SV1_1_SV109], [L2400_1_SV1_1_SV111], [L2400_1_SV1_1_SV112], [L2400_1_SV1_1_SV115], [L2400_1_SV5_1_SV501_01], [L2400_1_SV5_1_SV501_02], [L2400_1_SV5_1_SV502], [L2400_1_SV5_1_SV503], [L2400_1_SV5_1_SV504], [L2400_1_SV5_1_SV505], [L2400_1_SV5_1_SV506], [L2400_1_PWK_1_PWK01], [L2400_1_PWK_1_PWK02], [L2400_1_PWK_1_PWK05], [L2400_1_PWK_1_PWK06], [L2400_1_PWK_2_PWK01], [L2400_1_PWK_2_PWK02], [L2400_1_PWK_2_PWK05], [L2400_1_PWK_2_PWK06], [L2400_1_PWK_3_PWK01], [L2400_1_PWK_3_PWK02], [L2400_1_PWK_3_PWK05], [L2400_1_PWK_3_PWK06], [L2400_1_PWK_4_PWK01], [L2400_1_PWK_4_PWK02], [L2400_1_PWK_4_PWK05], [L2400_1_PWK_4_PWK06], [L2400_1_PWK_5_PWK01], [L2400_1_PWK_5_PWK02], [L2400_1_PWK_5_PWK05], [L2400_1_PWK_5_PWK06], [L2400_1_PWK_6_PWK01], [L2400_1_PWK_6_PWK02], [L2400_1_PWK_6_PWK05], [L2400_1_PWK_6_PWK06], [L2400_1_PWK_7_PWK01], [L2400_1_PWK_7_PWK02], [L2400_1_PWK_7_PWK05], [L2400_1_PWK_7_PWK06], [L2400_1_PWK_8_PWK01], [L2400_1_PWK_8_PWK02], [L2400_1_PWK_8_PWK05], [L2400_1_PWK_8_PWK06], [L2400_1_PWK_9_PWK01], [L2400_1_PWK_9_PWK02], [L2400_1_PWK_9_PWK05], [L2400_1_PWK_9_PWK06], [L2400_1_PWK_10_PWK01], [L2400_1_PWK_10_PWK02], [L2400_1_PWK_10_PWK05], [L2400_1_PWK_10_PWK06], [L2400_1_PWK_11_PWK01], [L2400_1_PWK_11_PWK02], [L2400_1_PWK_11_PWK05], [L2400_1_PWK_11_PWK06], [L2400_1_CR1_1_CR101], [L2400_1_CR1_1_CR102], [L2400_1_CR1_1_CR104], [L2400_1_CR1_1_CR105], [L2400_1_CR1_1_CR106], [L2400_1_CR1_1_CR109], [L2400_1_CR1_1_CR110], [L2400_1_CR3_1_CR301], [L2400_1_CR3_1_CR302], [L2400_1_CR3_1_CR303], [L2400_1_CRC_1_CRC01], [L2400_1_CRC_1_CRC02], [L2400_1_CRC_1_CRC03], [L2400_1_CRC_1_CRC04], [L2400_1_CRC_1_CRC05], [L2400_1_CRC_1_CRC06], [L2400_1_CRC_1_CRC07], [L2400_1_CRC_2_CRC01], [L2400_1_CRC_2_CRC02], [L2400_1_CRC_2_CRC03], [L2400_1_CRC_2_CRC04], [L2400_1_CRC_2_CRC05], [L2400_1_CRC_2_CRC06], [L2400_1_CRC_2_CRC07], [L2400_1_CRC_3_CRC01], [L2400_1_CRC_3_CRC02], [L2400_1_CRC_3_CRC03], [L2400_1_CRC_3_CRC04], [L2400_1_CRC_3_CRC05], [L2400_1_CRC_3_CRC06], [L2400_1_CRC_3_CRC07], [L2400_1_CRC_4_CRC01], [L2400_1_CRC_4_CRC02], [L2400_1_CRC_4_CRC03], [L2400_1_CRC_4_CRC04], [L2400_1_CRC_4_CRC05], [L2400_1_CRC_4_CRC06], [L2400_1_CRC_4_CRC07], [L2400_1_CRC_5_CRC01], [L2400_1_CRC_5_CRC02], [L2400_1_CRC_5_CRC03], [L2400_1_CRC_5_CRC04], [L2400_1_CRC_5_CRC05], [L2400_1_CRC_5_CRC06], [L2400_1_CRC_5_CRC07], [L2400_1_DTP_1_DTP01], [L2400_1_DTP_1_DTP02], [L2400_1_DTP_1_DTP03], [L2400_1_DTP_2_DTP01], [L2400_1_DTP_2_DTP02], [L2400_1_DTP_2_DTP03], [L2400_1_DTP_3_DTP01], [L2400_1_DTP_3_DTP02], [L2400_1_DTP_3_DTP03], [L2400_1_DTP_4_DTP01], [L2400_1_DTP_4_DTP02], [L2400_1_DTP_4_DTP03], [L2400_1_DTP_5_DTP01], [L2400_1_DTP_5_DTP02], [L2400_1_DTP_5_DTP03], [L2400_1_DTP_6_DTP01], [L2400_1_DTP_6_DTP02], [L2400_1_DTP_6_DTP03], [L2400_1_DTP_7_DTP01], [L2400_1_DTP_7_DTP02], [L2400_1_DTP_7_DTP03], [L2400_1_DTP_8_DTP01], [L2400_1_DTP_8_DTP02], [L2400_1_DTP_8_DTP03], [L2400_1_DTP_9_DTP01], [L2400_1_DTP_9_DTP02], [L2400_1_DTP_9_DTP03], [L2400_1_DTP_10_DTP01], [L2400_1_DTP_10_DTP02], [L2400_1_DTP_10_DTP03], [L2400_1_QTY_1_QTY01], [L2400_1_QTY_1_QTY02], [L2400_1_QTY_2_QTY01], [L2400_1_QTY_2_QTY02], [L2400_1_MEA_1_MEA01], [L2400_1_MEA_1_MEA02], [L2400_1_MEA_1_MEA03], [L2400_1_MEA_2_MEA01], [L2400_1_MEA_2_MEA02], [L2400_1_MEA_2_MEA03], [L2400_1_MEA_3_MEA01], [L2400_1_MEA_3_MEA02], [L2400_1_MEA_3_MEA03], [L2400_1_MEA_4_MEA01], [L2400_1_MEA_4_MEA02], [L2400_1_MEA_4_MEA03], [L2400_1_MEA_5_MEA01], [L2400_1_MEA_5_MEA02], [L2400_1_MEA_5_MEA03], [L2400_1_CN1_1_CN101], [L2400_1_CN1_1_CN102], [L2400_1_CN1_1_CN103], [L2400_1_CN1_1_CN104], [L2400_1_CN1_1_CN105], [L2400_1_CN1_1_CN106], [L2400_1_REF_1_REF01], [L2400_1_REF_1_REF02], [L2400_1_REF_1_REF04_1], [L2400_1_REF_1_REF04_2], [L2400_1_REF_2_REF01], [L2400_1_REF_2_REF02], [L2400_1_REF_2_REF04_1], [L2400_1_REF_2_REF04_2], [L2400_1_REF_3_REF01], [L2400_1_REF_3_REF02], [L2400_1_REF_3_REF04_1], [L2400_1_REF_3_REF04_2], [L2400_1_REF_4_REF01], [L2400_1_REF_4_REF02], [L2400_1_REF_4_REF04_1], [L2400_1_REF_4_REF04_2], [L2400_1_REF_5_REF01], [L2400_1_REF_5_REF02], [L2400_1_REF_5_REF04_1], [L2400_1_REF_5_REF04_2], [L2400_1_REF_6_REF01], [L2400_1_REF_6_REF02], [L2400_1_REF_6_REF04_1], [L2400_1_REF_6_REF04_2], [L2400_1_REF_7_REF01], [L2400_1_REF_7_REF02], [L2400_1_REF_7_REF04_1], [L2400_1_REF_7_REF04_2], [L2400_1_REF_8_REF01], [L2400_1_REF_8_REF02], [L2400_1_REF_8_REF04_1], [L2400_1_REF_8_REF04_2], [L2400_1_REF_9_REF01], [L2400_1_REF_9_REF02], [L2400_1_REF_9_REF04_1], [L2400_1_REF_9_REF04_2], [L2400_1_REF_11_REF01], [L2400_1_REF_11_REF02], [L2400_1_REF_11_REF04_1], [L2400_1_REF_11_REF04_2], [L2400_1_REF_12_REF01], [L2400_1_REF_12_REF02], [L2400_1_REF_12_REF04_1], [L2400_1_REF_12_REF04_2], [L2400_1_REF_13_REF01], [L2400_1_REF_13_REF02], [L2400_1_REF_13_REF04_1], [L2400_1_REF_13_REF04_2], [L2400_1_REF_14_REF01], [L2400_1_REF_14_REF02], [L2400_1_REF_14_REF04_1], [L2400_1_REF_14_REF04_2], [L2400_1_REF_15_REF01], [L2400_1_REF_15_REF02], [L2400_1_REF_15_REF04_1], [L2400_1_REF_15_REF04_2], [L2400_1_REF_16_REF01], [L2400_1_REF_16_REF02], [L2400_1_REF_16_REF04_1], [L2400_1_REF_16_REF04_2], [L2400_1_REF_17_REF01], [L2400_1_REF_17_REF02], [L2400_1_REF_17_REF04_1], [L2400_1_REF_17_REF04_2], [L2400_1_AMT_1_AMT01], [L2400_1_AMT_1_AMT02], [L2400_1_K3_1_K301], [L2400_1_K3_2_K301], [L2400_1_K3_3_K301], [L2400_1_K3_4_K301], [L2400_1_K3_5_K301], [L2400_1_K3_6_K301], [L2400_1_K3_7_K301], [L2400_1_K3_8_K301], [L2400_1_K3_9_K301], [L2400_1_K3_10_K301], [L2400_1_NTE_1_NTE01], [L2400_1_NTE_1_NTE02], [L2400_1_NTE_2_NTE01], [L2400_1_NTE_2_NTE02], [L2400_1_PS1_1_PS101], [L2400_1_PS1_1_PS102], [L2400_1_HCP_1_HCP01], [L2400_1_HCP_1_HCP02], [L2400_1_HCP_1_HCP03], [L2400_1_HCP_1_HCP04], [L2400_1_HCP_1_HCP05], [L2400_1_HCP_1_HCP06], [L2400_1_HCP_1_HCP07], [L2400_1_HCP_1_HCP09], [L2400_1_HCP_1_HCP10], [L2400_1_HCP_1_HCP11], [L2400_1_HCP_1_HCP12], [L2400_1_HCP_1_HCP13], [L2400_1_HCP_1_HCP14], [L2400_1_HCP_1_HCP15], [L2410_1_LIN_1_LIN01], [L2410_1_LIN_1_LIN02], [L2410_1_LIN_1_LIN03], [L2410_1_CTP_1_CTP04], [L2410_1_CTP_1_CTP05], [L2410_1_REF_1_REF01], [L2410_1_REF_1_REF02], [L2410_1_REF_2_REF01], [L2410_1_REF_2_REF02], [L2420A_1_NM1_1_NM101], [L2420A_1_NM1_1_NM102], [L2420A_1_NM1_1_NM103], [L2420A_1_NM1_1_NM104], [L2420A_1_NM1_1_NM105], [L2420A_1_NM1_1_NM107], [L2420A_1_NM1_1_NM108], [L2420A_1_NM1_1_NM109], [L2420A_1_PRV_1_PRV01], [L2420A_1_PRV_1_PRV02], [L2420A_1_PRV_1_PRV03], [L2420A_1_REF_1_REF01], [L2420A_1_REF_1_REF02], [L2420A_1_REF_1_REF04_1], [L2420A_1_REF_1_REF04_2], [L2420A_1_REF_2_REF01], [L2420A_1_REF_2_REF02], [L2420A_1_REF_2_REF04_1], [L2420A_1_REF_2_REF04_2], [L2420A_1_REF_3_REF01], [L2420A_1_REF_3_REF02], [L2420A_1_REF_3_REF04_1], [L2420A_1_REF_3_REF04_2], [L2420A_1_REF_4_REF01], [L2420A_1_REF_4_REF02], [L2420A_1_REF_4_REF04_1], [L2420A_1_REF_4_REF04_2], [L2420B_1_NM1_1_NM101], [L2420B_1_NM1_1_NM102], [L2420B_1_NM1_1_NM108], [L2420B_1_NM1_1_NM109], [L2420B_1_REF_1_REF01], [L2420B_1_REF_1_REF02], [L2420B_1_REF_1_REF04_1], [L2420B_1_REF_1_REF04_2], [L2420B_1_REF_2_REF01], [L2420B_1_REF_2_REF02], [L2420B_1_REF_2_REF04_1], [L2420B_1_REF_2_REF04_2], [L2420B_1_REF_3_REF01], [L2420B_1_REF_3_REF02], [L2420B_1_REF_3_REF04_1], [L2420B_1_REF_3_REF04_2], [L2420C_1_NM1_1_NM101], [L2420C_1_NM1_1_NM102], [L2420C_1_NM1_1_NM103], [L2420C_1_NM1_1_NM108], [L2420C_1_NM1_1_NM109], [L2420C_1_N3_1_N301], [L2420C_1_N3_1_N302], [L2420C_1_N4_1_N401], [L2420C_1_N4_1_N402], [L2420C_1_N4_1_N403], [L2420C_1_N4_1_N404], [L2420C_1_N4_1_N407], [L2420C_1_REF_1_REF01], [L2420C_1_REF_1_REF02], [L2420C_1_REF_1_REF04_1], [L2420C_1_REF_1_REF04_2], [L2420C_1_REF_2_REF01], [L2420C_1_REF_2_REF02], [L2420C_1_REF_2_REF04_1], [L2420C_1_REF_2_REF04_2], [L2420D_1_NM1_1_NM101], [L2420D_1_NM1_1_NM102], [L2420D_1_NM1_1_NM103], [L2420D_1_NM1_1_NM104], [L2420D_1_NM1_1_NM105], [L2420D_1_NM1_1_NM107], [L2420D_1_NM1_1_NM108], [L2420D_1_NM1_1_NM109], [L2420D_1_REF_1_REF01], [L2420D_1_REF_1_REF02], [L2420D_1_REF_1_REF04_1], [L2420D_1_REF_1_REF04_2], [L2420D_1_REF_2_REF01], [L2420D_1_REF_2_REF02], [L2420D_1_REF_2_REF04_1], [L2420D_1_REF_2_REF04_2], [L2420D_1_REF_3_REF01], [L2420D_1_REF_3_REF02], [L2420D_1_REF_3_REF04_1], [L2420D_1_REF_3_REF04_2], [L2420D_1_REF_4_REF01], [L2420D_1_REF_4_REF02], [L2420D_1_REF_4_REF04_1], [L2420D_1_REF_4_REF04_2], [L2420E_1_NM1_1_NM101], [L2420E_1_NM1_1_NM102], [L2420E_1_NM1_1_NM103], [L2420E_1_NM1_1_NM104], [L2420E_1_NM1_1_NM105], [L2420E_1_NM1_1_NM107], [L2420E_1_NM1_1_NM108], [L2420E_1_NM1_1_NM109], [L2420E_1_N3_1_N301], [L2420E_1_N3_1_N302], [L2420E_1_N4_1_N401], [L2420E_1_N4_1_N402], [L2420E_1_N4_1_N403], [L2420E_1_N4_1_N404], [L2420E_1_N4_1_N407], [L2420E_1_REF_1_REF01], [L2420E_1_REF_1_REF02], [L2420E_1_REF_1_REF04_1], [L2420E_1_REF_1_REF04_2], [L2420E_1_REF_2_REF01], [L2420E_1_REF_2_REF02], [L2420E_1_REF_2_REF04_1], [L2420E_1_REF_2_REF04_2], [L2420E_1_REF_3_REF01], [L2420E_1_REF_3_REF02], [L2420E_1_REF_3_REF04_1], [L2420E_1_REF_3_REF04_2], [L2420E_1_PER_1_PER01], [L2420E_1_PER_1_PER02], [L2420E_1_PER_1_PER03], [L2420E_1_PER_1_PER04], [L2420E_1_PER_1_PER05], [L2420E_1_PER_1_PER06], [L2420E_1_PER_1_PER07], [L2420E_1_PER_1_PER08], [L2420F_1_NM1_1_NM101], [L2420F_1_NM1_1_NM102], [L2420F_1_NM1_1_NM103], [L2420F_1_NM1_1_NM104], [L2420F_1_NM1_1_NM105], [L2420F_1_NM1_1_NM107], [L2420F_1_NM1_1_NM108], [L2420F_1_NM1_1_NM109], [L2420F_1_REF_1_REF01], [L2420F_1_REF_1_REF02], [L2420F_1_REF_1_REF04_1], [L2420F_1_REF_1_REF04_2], [L2420F_1_REF_2_REF01], [L2420F_1_REF_2_REF02], [L2420F_1_REF_2_REF04_1], [L2420F_1_REF_2_REF04_2], [L2420F_1_REF_3_REF01], [L2420F_1_REF_3_REF02], [L2420F_1_REF_3_REF04_1], [L2420F_1_REF_3_REF04_2], [L2420F_2_NM1_1_NM101], [L2420F_2_NM1_1_NM102], [L2420F_2_NM1_1_NM103], [L2420F_2_NM1_1_NM104], [L2420F_2_NM1_1_NM105], [L2420F_2_NM1_1_NM107], [L2420F_2_NM1_1_NM108], [L2420F_2_NM1_1_NM109], [L2420F_2_REF_1_REF01], [L2420F_2_REF_1_REF02], [L2420F_2_REF_1_REF04_1], [L2420F_2_REF_1_REF04_2], [L2420F_2_REF_2_REF01], [L2420F_2_REF_2_REF02], [L2420F_2_REF_2_REF04_1], [L2420F_2_REF_2_REF04_2], [L2420F_2_REF_3_REF01], [L2420F_2_REF_3_REF02], [L2420F_2_REF_3_REF04_1], [L2420F_2_REF_3_REF04_2], [L2420G_1_NM1_1_NM101], [L2420G_1_NM1_1_NM102], [L2420G_1_N3_1_N301], [L2420G_1_N3_1_N302], [L2420G_1_N4_1_N401], [L2420G_1_N4_1_N402], [L2420G_1_N4_1_N403], [L2420G_1_N4_1_N404], [L2420G_1_N4_1_N407], [L2420H_1_NM1_1_NM101], [L2420H_1_NM1_1_NM102], [L2420H_1_N3_1_N301], [L2420H_1_N3_1_N302], [L2420H_1_N4_1_N401], [L2420H_1_N4_1_N402], [L2420H_1_N4_1_N403], [L2420H_1_N4_1_N404], [L2420H_1_N4_1_N407], [L2430_1_SVD_1_SVD01], [L2430_1_SVD_1_SVD02], [L2430_1_SVD_1_SVD03_1], [L2430_1_SVD_1_SVD03_2], [L2430_1_SVD_1_SVD03_3], [L2430_1_SVD_1_SVD03_4], [L2430_1_SVD_1_SVD03_5], [L2430_1_SVD_1_SVD03_6], [L2430_1_SVD_1_SVD03_7], [L2430_1_SVD_1_SVD05], [L2430_1_SVD_1_SVD06], [L2430_1_CAS_1_CAS01], [L2430_1_CAS_1_CAS02], [L2430_1_CAS_1_CAS03], [L2430_1_CAS_1_CAS04], [L2430_1_CAS_1_CAS05], [L2430_1_CAS_1_CAS06], [L2430_1_CAS_1_CAS07], [L2430_1_CAS_1_CAS08], [L2430_1_CAS_1_CAS09], [L2430_1_CAS_1_CAS10], [L2430_1_CAS_1_CAS11], [L2430_1_CAS_1_CAS12], [L2430_1_CAS_1_CAS13], [L2430_1_CAS_1_CAS14], [L2430_1_CAS_1_CAS15], [L2430_1_CAS_1_CAS16], [L2430_1_CAS_1_CAS17], [L2430_1_CAS_1_CAS18], [L2430_1_CAS_1_CAS19], [L2430_1_CAS_2_CAS01], [L2430_1_CAS_2_CAS02], [L2430_1_CAS_2_CAS03], [L2430_1_CAS_2_CAS04], [L2430_1_CAS_2_CAS05], [L2430_1_CAS_2_CAS06], [L2430_1_CAS_2_CAS07], [L2430_1_CAS_2_CAS08], [L2430_1_CAS_2_CAS09], [L2430_1_CAS_2_CAS10], [L2430_1_CAS_2_CAS11], [L2430_1_CAS_2_CAS12], [L2430_1_CAS_2_CAS13], [L2430_1_CAS_2_CAS14], [L2430_1_CAS_2_CAS15], [L2430_1_CAS_2_CAS16], [L2430_1_CAS_2_CAS17], [L2430_1_CAS_2_CAS18], [L2430_1_CAS_2_CAS19], [L2430_1_CAS_3_CAS01], [L2430_1_CAS_3_CAS02], [L2430_1_CAS_3_CAS03], [L2430_1_CAS_3_CAS04], [L2430_1_CAS_3_CAS05], [L2430_1_CAS_3_CAS06], [L2430_1_CAS_3_CAS07], [L2430_1_CAS_3_CAS08], [L2430_1_CAS_3_CAS09], [L2430_1_CAS_3_CAS10], [L2430_1_CAS_3_CAS11], [L2430_1_CAS_3_CAS12], [L2430_1_CAS_3_CAS13], [L2430_1_CAS_3_CAS14], [L2430_1_CAS_3_CAS15], [L2430_1_CAS_3_CAS16], [L2430_1_CAS_3_CAS17], [L2430_1_CAS_3_CAS18], [L2430_1_CAS_3_CAS19], [L2430_1_CAS_4_CAS01], [L2430_1_CAS_4_CAS02], [L2430_1_CAS_4_CAS03], [L2430_1_CAS_4_CAS04], [L2430_1_CAS_4_CAS05], [L2430_1_CAS_4_CAS06], [L2430_1_CAS_4_CAS07], [L2430_1_CAS_4_CAS08], [L2430_1_CAS_4_CAS09], [L2430_1_CAS_4_CAS10], [L2430_1_CAS_4_CAS11], [L2430_1_CAS_4_CAS12], [L2430_1_CAS_4_CAS13], [L2430_1_CAS_4_CAS14], [L2430_1_CAS_4_CAS15], [L2430_1_CAS_4_CAS16], [L2430_1_CAS_4_CAS17], [L2430_1_CAS_4_CAS18], [L2430_1_CAS_4_CAS19], [L2430_1_CAS_5_CAS01], [L2430_1_CAS_5_CAS02], [L2430_1_CAS_5_CAS03], [L2430_1_CAS_5_CAS04], [L2430_1_CAS_5_CAS05], [L2430_1_CAS_5_CAS06], [L2430_1_CAS_5_CAS07], [L2430_1_CAS_5_CAS08], [L2430_1_CAS_5_CAS09], [L2430_1_CAS_5_CAS10], [L2430_1_CAS_5_CAS11], [L2430_1_CAS_5_CAS12], [L2430_1_CAS_5_CAS13], [L2430_1_CAS_5_CAS14], [L2430_1_CAS_5_CAS15], [L2430_1_CAS_5_CAS16], [L2430_1_CAS_5_CAS17], [L2430_1_CAS_5_CAS18], [L2430_1_CAS_5_CAS19], [L2430_1_DTP_1_DTP01], [L2430_1_DTP_1_DTP02], [L2430_1_DTP_1_DTP03], [L2430_1_AMT_1_AMT01], [L2430_1_AMT_1_AMT02]) VALUES (20899, 20556, N'178', N'987654', N'5', N'1', N'HC', N'99211', N'25', NULL, NULL, NULL, NULL, N'12.25', N'UN', N'1', N'11', N'1', N'2', N'3', NULL, N'Y', NULL, NULL, NULL, N'HC', N'A4631', N'DA', N'30', N'50', N'5000', N'4', N'03', N'BM', N'AC', N'DMN0012', N'04', N'BM', N'AC', N'DMN0012', N'05', N'BM', N'AC', N'DMN0012', N'06', N'BM', N'AC', N'DMN0012', N'07', N'BM', N'AC', N'DMN0012', N'08', N'BM', N'AC', N'DMN0012', N'09', N'BM', N'AC', N'DMN0012', N'10', N'BM', N'AC', N'DMN0012', N'11', N'BM', N'AC', N'DMN0012', N'12', N'BM', N'AC', N'DMN0012', N'CT', N'AB', NULL, NULL, N'LB', N'140', N'A', N'DH', N'12', N'', N'UNCONSCIOUS', N'I', N'MO', N'6', N'07', N'Y', N'01', NULL, NULL, NULL, NULL, N'70', N'Y', N'65', NULL, NULL, NULL, NULL, N'09', N'N', N'ZV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'472', N'RD8', N'20050314-20050325', N'607', N'D8', N'20050112', N'463', N'D8', N'20050112', N'461', N'D8', N'20050112', N'304', N'D8', N'20050108', N'738', N'D8', N'20050112', N'739', N'D8', N'20050112', N'011', N'D8', N'20050112', N'455', N'D8', N'20050108', N'454', N'D8', N'20050108', N'PT', N'2', N'FL', N'3', N'TR', N'R1', N'113.4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'02', N'550', NULL, NULL, NULL, NULL, N'9B', N'444444', NULL, NULL, N'9D', N'444444', NULL, NULL, N'G1', N'13579', NULL, NULL, N'6R', N'54321', NULL, NULL, N'EW', N'T554', NULL, NULL, N'X4', N'12D4567890', NULL, NULL, N'F4', N'34D1234567', NULL, NULL, N'BT', N'DTP22333444', NULL, NULL, N'9F', N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'T', N'45', N'STATE DATA REQUIREMENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'DCP', N'PATIENT GOAL TO BE OFF OXYGEN BY END OF MONTH', N'PN222222', N'110', N'03', N'100', N'10', N'RPO12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'N4', N'01234567891', N'2', N'UN', NULL, NULL, N'XZ', N'123456', N'82', N'1', N'DOE', N'JANE', N'C', N'', N'XX', N'1234567804', N'PE', N'PXC', N'208D00000X', N'0B', N'12345', NULL, NULL, N'1G', N'12345', NULL, NULL, N'G2', N'12345', NULL, NULL, NULL, NULL, NULL, NULL, N'QB', N'2', N'XX', N'1234567891', N'0B', N'12345', NULL, NULL, N'1G', N'12345', NULL, NULL, N'G2', N'12345', NULL, NULL, N'77', N'2', N'ABC CLINIC', N'XX', N'1234567891', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'G2', N'12345', NULL, NULL, N'LU', N'12345', NULL, NULL, N'DQ', N'1', N'DOE', N'JOHN', N'B', N'', N'XX', N'1234567891', N'0B', N'12345', NULL, NULL, N'1G', N'12345', NULL, NULL, N'G2', N'12345', NULL, NULL, N'LU', N'12345', NULL, NULL, N'DK', N'1', N'RICHARDSON', N'TRENT', N'', N'', N'XX', N'1234567891', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'0B', N'12345', NULL, NULL, N'1G', N'12345', NULL, NULL, N'G2', N'12345', NULL, NULL, N'IC', N'JOHN SMITH', N'TE', N'5555551234', N'EX', N'123', NULL, NULL, N'DN', N'1', N'WELBY', N'MARCUS', N'W', N'JR', N'XX', N'1234567891', N'G2', N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'PW', N'2', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'45', N'2', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'43', N'55', N'HC', N'84550', NULL, NULL, NULL, NULL, NULL, N'3', NULL, N'OA', N'93', N'15.06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'573', N'D8', N'20040203', N'EAF', N'75')
SET IDENTITY_INSERT [dbo].[EDI_837P_ServiceLine] OFF
/****** Object:  Table [dbo].[EDI_837P_Patient]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EDI_837P_Patient](
	[Fileid] [varchar](30) NOT NULL,
	[HeaderID] [varchar](30) NOT NULL,
	[L2000C_1_HL_1_HL01] [varchar](12) NULL,
	[L2000C_1_HL_1_HL02] [varchar](12) NULL,
	[L2000C_1_HL_1_HL03] [varchar](2) NULL,
	[L2000C_1_HL_1_HL04] [varchar](1) NULL,
	[L2000C_1_PAT_1_PAT01] [varchar](2) NULL,
	[L2000C_1_PAT_1_PAT05] [varchar](3) NULL,
	[L2000C_1_PAT_1_PAT06] [varchar](35) NULL,
	[L2000C_1_PAT_1_PAT07] [varchar](2) NULL,
	[L2000C_1_PAT_1_PAT08] [varchar](10) NULL,
	[L2000C_1_PAT_1_PAT09] [varchar](1) NULL,
	[L2010CA_1_NM1_1_NM101] [varchar](3) NULL,
	[L2010CA_1_NM1_1_NM102] [varchar](1) NULL,
	[L2010CA_1_NM1_1_NM103] [varchar](60) NULL,
	[L2010CA_1_NM1_1_NM104] [varchar](35) NULL,
	[L2010CA_1_NM1_1_NM105] [varchar](25) NULL,
	[L2010CA_1_NM1_1_NM107] [varchar](10) NULL,
	[L2010CA_1_N3_1_N301] [varchar](55) NULL,
	[L2010CA_1_N3_1_N302] [varchar](55) NULL,
	[L2010CA_1_N4_1_N401] [varchar](30) NULL,
	[L2010CA_1_N4_1_N402] [varchar](2) NULL,
	[L2010CA_1_N4_1_N403] [varchar](15) NULL,
	[L2010CA_1_N4_1_N404] [varchar](3) NULL,
	[L2010CA_1_N4_1_N407] [varchar](3) NULL,
	[L2010CA_1_DMG_1_DMG01] [varchar](3) NULL,
	[L2010CA_1_DMG_1_DMG02] [varchar](35) NULL,
	[L2010CA_1_DMG_1_DMG03] [varchar](1) NULL,
	[L2010CA_1_REF_1_REF01] [varchar](3) NULL,
	[L2010CA_1_REF_1_REF02] [varchar](50) NULL,
	[L2010CA_1_PER_1_PER01] [varchar](2) NULL,
	[L2010CA_1_PER_1_PER02] [varchar](60) NULL,
	[L2010CA_1_PER_1_PER03] [varchar](2) NULL,
	[L2010CA_1_PER_1_PER04] [varchar](256) NULL,
	[L2010CA_1_PER_1_PER05] [varchar](2) NULL,
	[L2010CA_1_PER_1_PER06] [varchar](256) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[EDI_837P_Patient] ([Fileid], [HeaderID], [L2000C_1_HL_1_HL01], [L2000C_1_HL_1_HL02], [L2000C_1_HL_1_HL03], [L2000C_1_HL_1_HL04], [L2000C_1_PAT_1_PAT01], [L2000C_1_PAT_1_PAT05], [L2000C_1_PAT_1_PAT06], [L2000C_1_PAT_1_PAT07], [L2000C_1_PAT_1_PAT08], [L2000C_1_PAT_1_PAT09], [L2010CA_1_NM1_1_NM101], [L2010CA_1_NM1_1_NM102], [L2010CA_1_NM1_1_NM103], [L2010CA_1_NM1_1_NM104], [L2010CA_1_NM1_1_NM105], [L2010CA_1_NM1_1_NM107], [L2010CA_1_N3_1_N301], [L2010CA_1_N3_1_N302], [L2010CA_1_N4_1_N401], [L2010CA_1_N4_1_N402], [L2010CA_1_N4_1_N403], [L2010CA_1_N4_1_N404], [L2010CA_1_N4_1_N407], [L2010CA_1_DMG_1_DMG01], [L2010CA_1_DMG_1_DMG02], [L2010CA_1_DMG_1_DMG03], [L2010CA_1_REF_1_REF01], [L2010CA_1_REF_1_REF02], [L2010CA_1_PER_1_PER01], [L2010CA_1_PER_1_PER02], [L2010CA_1_PER_1_PER03], [L2010CA_1_PER_1_PER04], [L2010CA_1_PER_1_PER05], [L2010CA_1_PER_1_PER06]) VALUES (N'178', N'987654', N'3', N'2', N'23', N'0', N'01', NULL, NULL, NULL, NULL, NULL, N'QC', N'1', N'DOE', N'SALLY', N'J', NULL, N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'D8', N'19690815', N'M', N'Y4', N'4445555', N'IC', N'JOHN SMITH', N'TE', N'5555551234', N'EX', N'123')
INSERT [dbo].[EDI_837P_Patient] ([Fileid], [HeaderID], [L2000C_1_HL_1_HL01], [L2000C_1_HL_1_HL02], [L2000C_1_HL_1_HL03], [L2000C_1_HL_1_HL04], [L2000C_1_PAT_1_PAT01], [L2000C_1_PAT_1_PAT05], [L2000C_1_PAT_1_PAT06], [L2000C_1_PAT_1_PAT07], [L2000C_1_PAT_1_PAT08], [L2000C_1_PAT_1_PAT09], [L2010CA_1_NM1_1_NM101], [L2010CA_1_NM1_1_NM102], [L2010CA_1_NM1_1_NM103], [L2010CA_1_NM1_1_NM104], [L2010CA_1_NM1_1_NM105], [L2010CA_1_NM1_1_NM107], [L2010CA_1_N3_1_N301], [L2010CA_1_N3_1_N302], [L2010CA_1_N4_1_N401], [L2010CA_1_N4_1_N402], [L2010CA_1_N4_1_N403], [L2010CA_1_N4_1_N404], [L2010CA_1_N4_1_N407], [L2010CA_1_DMG_1_DMG01], [L2010CA_1_DMG_1_DMG02], [L2010CA_1_DMG_1_DMG03], [L2010CA_1_REF_1_REF01], [L2010CA_1_REF_1_REF02], [L2010CA_1_PER_1_PER01], [L2010CA_1_PER_1_PER02], [L2010CA_1_PER_1_PER03], [L2010CA_1_PER_1_PER04], [L2010CA_1_PER_1_PER05], [L2010CA_1_PER_1_PER06]) VALUES (N'178', N'987654', N'5', N'4', N'23', N'0', N'01', NULL, NULL, NULL, NULL, NULL, N'QC', N'1', N'DOE', N'SALLY', N'J', NULL, N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'D8', N'19690815', N'M', N'Y4', N'4445555', N'IC', N'JOHN SMITH', N'TE', N'5555551234', N'EX', N'123')
/****** Object:  Table [dbo].[EDI_837P_Header]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EDI_837P_Header](
	[Fileid] [varchar](30) NOT NULL,
	[HeaderID] [varchar](30) NOT NULL,
	[L837PTS_1_ST_1_ST01] [varchar](3) NULL,
	[L837PTS_1_ST_1_ST02] [varchar](9) NULL,
	[L837PTS_1_ST_1_ST03] [varchar](35) NULL,
	[L837PTS_1_BHT_1_BHT01] [varchar](4) NULL,
	[L837PTS_1_BHT_1_BHT02] [varchar](2) NULL,
	[L837PTS_1_BHT_1_BHT03] [varchar](50) NULL,
	[L837PTS_1_BHT_1_BHT04] [varchar](8) NULL,
	[L837PTS_1_BHT_1_BHT05] [varchar](8) NULL,
	[L837PTS_1_BHT_1_BHT06] [varchar](2) NULL,
	[L1000A_1_NM1_1_NM101] [varchar](3) NULL,
	[L1000A_1_NM1_1_NM102] [char](1) NULL,
	[L1000A_1_NM1_1_NM103] [varchar](60) NULL,
	[L1000A_1_NM1_1_NM104] [varchar](35) NULL,
	[L1000A_1_NM1_1_NM105] [varchar](25) NULL,
	[L1000A_1_NM1_1_NM108] [varchar](2) NULL,
	[L1000A_1_NM1_1_NM109] [varchar](80) NULL,
	[L1000A_1_PER_1_PER01] [varchar](2) NULL,
	[L1000A_1_PER_1_PER02] [varchar](60) NULL,
	[L1000A_1_PER_1_PER03] [varchar](2) NULL,
	[L1000A_1_PER_1_PER04] [varchar](60) NULL,
	[L1000A_1_PER_1_PER05] [varchar](2) NULL,
	[L1000A_1_PER_1_PER06] [varchar](60) NULL,
	[L1000A_1_PER_1_PER07] [varchar](2) NULL,
	[L1000A_1_PER_1_PER08] [varchar](60) NULL,
	[L1000A_1_PER_2_PER01] [varchar](2) NULL,
	[L1000A_1_PER_2_PER02] [varchar](60) NULL,
	[L1000A_1_PER_2_PER03] [varchar](2) NULL,
	[L1000A_1_PER_2_PER04] [varchar](60) NULL,
	[L1000A_1_PER_2_PER05] [varchar](2) NULL,
	[L1000A_1_PER_2_PER06] [varchar](60) NULL,
	[L1000A_1_PER_2_PER07] [varchar](2) NULL,
	[L1000A_1_PER_2_PER08] [varchar](60) NULL,
	[L1000B_1_NM1_1_NM101] [varchar](3) NULL,
	[L1000B_1_NM1_1_NM102] [char](1) NULL,
	[L1000B_1_NM1_1_NM103] [varchar](60) NULL,
	[L1000B_1_NM1_1_NM108] [varchar](2) NULL,
	[L1000B_1_NM1_1_NM109] [varchar](80) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[EDI_837P_Header] ([Fileid], [HeaderID], [L837PTS_1_ST_1_ST01], [L837PTS_1_ST_1_ST02], [L837PTS_1_ST_1_ST03], [L837PTS_1_BHT_1_BHT01], [L837PTS_1_BHT_1_BHT02], [L837PTS_1_BHT_1_BHT03], [L837PTS_1_BHT_1_BHT04], [L837PTS_1_BHT_1_BHT05], [L837PTS_1_BHT_1_BHT06], [L1000A_1_NM1_1_NM101], [L1000A_1_NM1_1_NM102], [L1000A_1_NM1_1_NM103], [L1000A_1_NM1_1_NM104], [L1000A_1_NM1_1_NM105], [L1000A_1_NM1_1_NM108], [L1000A_1_NM1_1_NM109], [L1000A_1_PER_1_PER01], [L1000A_1_PER_1_PER02], [L1000A_1_PER_1_PER03], [L1000A_1_PER_1_PER04], [L1000A_1_PER_1_PER05], [L1000A_1_PER_1_PER06], [L1000A_1_PER_1_PER07], [L1000A_1_PER_1_PER08], [L1000A_1_PER_2_PER01], [L1000A_1_PER_2_PER02], [L1000A_1_PER_2_PER03], [L1000A_1_PER_2_PER04], [L1000A_1_PER_2_PER05], [L1000A_1_PER_2_PER06], [L1000A_1_PER_2_PER07], [L1000A_1_PER_2_PER08], [L1000B_1_NM1_1_NM101], [L1000B_1_NM1_1_NM102], [L1000B_1_NM1_1_NM103], [L1000B_1_NM1_1_NM108], [L1000B_1_NM1_1_NM109]) VALUES (N'178', N'987654', N'837', N'987654', N'005010X222', N'0019', N'00', N'0123', N'20040618', N'0932', N'CH', N'41', N'2', N'ABC SUBMITTER', N'', N'', N'46', N'999999999', N'IC', N'JOHN SMITH', N'TE', N'5555551234', N'EX', N'123', N'FX', N'5555551233', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'40', N'2', N'XYZ RECEIVER', N'46', N'111222333')
/****** Object:  Table [dbo].[EDI_837P_FormIdentification]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EDI_837P_FormIdentification](
	[formidentificationid] [int] IDENTITY(1,1) NOT NULL,
	[servicelidid] [int] NULL,
	[L2440_1_LQ_1_LQ01] [varchar](3) NULL,
	[L2440_1_LQ_1_LQ02] [varchar](30) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[EDI_837P_FormIdentification] ON
INSERT [dbo].[EDI_837P_FormIdentification] ([formidentificationid], [servicelidid], [L2440_1_LQ_1_LQ01], [L2440_1_LQ_1_LQ02]) VALUES (20061, 20898, N'UT', N'01.02')
INSERT [dbo].[EDI_837P_FormIdentification] ([formidentificationid], [servicelidid], [L2440_1_LQ_1_LQ01], [L2440_1_LQ_1_LQ02]) VALUES (20062, 20899, N'UT', N'01.02')
SET IDENTITY_INSERT [dbo].[EDI_837P_FormIdentification] OFF
/****** Object:  Table [dbo].[EDI_837P_Form]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EDI_837P_Form](
	[servicelineid] [int] NULL,
	[L2440_1_FRM_1_FRM01] [varchar](20) NULL,
	[L2440_1_FRM_1_FRM02] [varchar](1) NULL,
	[L2440_1_FRM_1_FRM03] [varchar](50) NULL,
	[L2440_1_FRM_1_FRM04] [varchar](8) NULL,
	[L2440_1_FRM_1_FRM05] [varchar](6) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EDI_837P_claim]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EDI_837P_claim](
	[claimid] [int] IDENTITY(1,1) NOT NULL,
	[Fileid] [varchar](30) NOT NULL,
	[HeaderID] [varchar](30) NOT NULL,
	[subscriber_patientid] [varchar](12) NULL,
	[L2300_1_CLM_1_CLM01] [varchar](38) NULL,
	[L2300_1_CLM_1_CLM02] [varchar](18) NULL,
	[L2300_1_CLM_1_CLM05_1] [varchar](2) NULL,
	[L2300_1_CLM_1_CLM05_2] [varchar](2) NULL,
	[L2300_1_CLM_1_CLM05_3] [varchar](1) NULL,
	[L2300_1_CLM_1_CLM06] [varchar](1) NULL,
	[L2300_1_CLM_1_CLM07] [varchar](1) NULL,
	[L2300_1_CLM_1_CLM08] [varchar](1) NULL,
	[L2300_1_CLM_1_CLM09] [varchar](1) NULL,
	[L2300_1_CLM_1_CLM10] [varchar](1) NULL,
	[L2300_1_CLM_1_CLM11_1] [varchar](3) NULL,
	[L2300_1_CLM_1_CLM11_2] [varchar](3) NULL,
	[L2300_1_CLM_1_CLM11_4] [varchar](3) NULL,
	[L2300_1_CLM_1_CLM11_5] [varchar](3) NULL,
	[L2300_1_CLM_1_CLM12] [varchar](3) NULL,
	[L2300_1_CLM_1_CLM20] [varchar](2) NULL,
	[L2300_1_DTP_1_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_1_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_1_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_2_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_2_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_2_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_3_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_3_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_3_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_4_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_4_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_4_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_5_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_5_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_5_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_6_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_6_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_6_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_7_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_7_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_7_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_8_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_8_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_8_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_9_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_9_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_9_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_10_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_10_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_10_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_11_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_11_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_11_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_12_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_12_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_12_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_13_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_13_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_13_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_14_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_14_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_14_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_15_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_15_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_15_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_16_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_16_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_16_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_17_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_17_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_17_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_18_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_18_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_18_DTP03] [varchar](35) NULL,
	[L2300_1_DTP_19_DTP01] [varchar](3) NULL,
	[L2300_1_DTP_19_DTP02] [varchar](3) NULL,
	[L2300_1_DTP_19_DTP03] [varchar](35) NULL,
	[L2300_1_PWK_1_PWK01] [varchar](2) NULL,
	[L2300_1_PWK_1_PWK02] [varchar](2) NULL,
	[L2300_1_PWK_1_PWK06] [varchar](80) NULL,
	[L2300_1_PWK_2_PWK01] [varchar](2) NULL,
	[L2300_1_PWK_2_PWK02] [varchar](2) NULL,
	[L2300_1_PWK_2_PWK06] [varchar](80) NULL,
	[L2300_1_PWK_3_PWK01] [varchar](2) NULL,
	[L2300_1_PWK_3_PWK02] [varchar](2) NULL,
	[L2300_1_PWK_3_PWK06] [varchar](80) NULL,
	[L2300_1_PWK_4_PWK01] [varchar](2) NULL,
	[L2300_1_PWK_4_PWK02] [varchar](2) NULL,
	[L2300_1_PWK_4_PWK06] [varchar](80) NULL,
	[L2300_1_PWK_5_PWK01] [varchar](2) NULL,
	[L2300_1_PWK_5_PWK02] [varchar](2) NULL,
	[L2300_1_PWK_5_PWK06] [varchar](80) NULL,
	[L2300_1_PWK_6_PWK01] [varchar](2) NULL,
	[L2300_1_PWK_6_PWK02] [varchar](2) NULL,
	[L2300_1_PWK_6_PWK06] [varchar](80) NULL,
	[L2300_1_PWK_7_PWK01] [varchar](2) NULL,
	[L2300_1_PWK_7_PWK02] [varchar](2) NULL,
	[L2300_1_PWK_7_PWK06] [varchar](80) NULL,
	[L2300_1_PWK_8_PWK01] [varchar](2) NULL,
	[L2300_1_PWK_8_PWK02] [varchar](2) NULL,
	[L2300_1_PWK_8_PWK06] [varchar](80) NULL,
	[L2300_1_PWK_9_PWK01] [varchar](2) NULL,
	[L2300_1_PWK_9_PWK02] [varchar](2) NULL,
	[L2300_1_PWK_9_PWK06] [varchar](80) NULL,
	[L2300_1_PWK_10_PWK01] [varchar](2) NULL,
	[L2300_1_PWK_10_PWK02] [varchar](2) NULL,
	[L2300_1_PWK_10_PWK06] [varchar](80) NULL,
	[L2300_1_CN1_1_CN101] [varchar](2) NULL,
	[L2300_1_CN1_1_CN102] [varchar](18) NULL,
	[L2300_1_CN1_1_CN103] [varchar](6) NULL,
	[L2300_1_CN1_1_CN104] [varchar](50) NULL,
	[L2300_1_CN1_1_CN105] [varchar](6) NULL,
	[L2300_1_CN1_1_CN106] [varchar](30) NULL,
	[L2300_1_AMT_1_AMT01] [varchar](3) NULL,
	[L2300_1_AMT_1_AMT02] [varchar](18) NULL,
	[L2300_1_REF_1_REF01] [varchar](3) NULL,
	[L2300_1_REF_1_REF02] [varchar](50) NULL,
	[L2300_1_REF_2_REF01] [varchar](3) NULL,
	[L2300_1_REF_2_REF02] [varchar](50) NULL,
	[L2300_1_REF_3_REF01] [varchar](3) NULL,
	[L2300_1_REF_3_REF02] [varchar](50) NULL,
	[L2300_1_REF_4_REF01] [varchar](3) NULL,
	[L2300_1_REF_4_REF02] [varchar](50) NULL,
	[L2300_1_REF_5_REF01] [varchar](3) NULL,
	[L2300_1_REF_5_REF02] [varchar](50) NULL,
	[L2300_1_REF_6_REF01] [varchar](3) NULL,
	[L2300_1_REF_6_REF02] [varchar](50) NULL,
	[L2300_1_REF_7_REF01] [varchar](3) NULL,
	[L2300_1_REF_7_REF02] [varchar](50) NULL,
	[L2300_1_REF_8_REF01] [varchar](3) NULL,
	[L2300_1_REF_8_REF02] [varchar](50) NULL,
	[L2300_1_REF_9_REF01] [varchar](3) NULL,
	[L2300_1_REF_9_REF02] [varchar](50) NULL,
	[L2300_1_REF_10_REF01] [varchar](3) NULL,
	[L2300_1_REF_10_REF02] [varchar](50) NULL,
	[L2300_1_REF_11_REF01] [varchar](3) NULL,
	[L2300_1_REF_11_REF02] [varchar](50) NULL,
	[L2300_1_REF_12_REF01] [varchar](3) NULL,
	[L2300_1_REF_12_REF02] [varchar](50) NULL,
	[L2300_1_REF_13_REF01] [varchar](3) NULL,
	[L2300_1_REF_13_REF02] [varchar](50) NULL,
	[L2300_1_REF_14_REF01] [varchar](3) NULL,
	[L2300_1_REF_14_REF02] [varchar](50) NULL,
	[L2300_1_K3_1_K301] [varchar](80) NULL,
	[L2300_1_K3_2_K301] [varchar](80) NULL,
	[L2300_1_K3_3_K301] [varchar](80) NULL,
	[L2300_1_K3_4_K301] [varchar](80) NULL,
	[L2300_1_K3_5_K301] [varchar](80) NULL,
	[L2300_1_K3_6_K301] [varchar](80) NULL,
	[L2300_1_K3_7_K301] [varchar](80) NULL,
	[L2300_1_K3_8_K301] [varchar](80) NULL,
	[L2300_1_K3_9_K301] [varchar](80) NULL,
	[L2300_1_K3_10_K301] [varchar](80) NULL,
	[L2300_1_NTE_1_NTE01] [varchar](3) NULL,
	[L2300_1_NTE_1_NTE02] [varchar](80) NULL,
	[L2300_1_CR1_1_CR101] [varchar](2) NULL,
	[L2300_1_CR1_1_CR102] [varchar](10) NULL,
	[L2300_1_CR1_1_CR104] [varchar](1) NULL,
	[L2300_1_CR1_1_CR105] [varchar](2) NULL,
	[L2300_1_CR1_1_CR106] [varchar](15) NULL,
	[L2300_1_CR1_1_CR109] [varchar](80) NULL,
	[L2300_1_CR1_1_CR110] [varchar](80) NULL,
	[L2300_1_CR2_1_CR208] [varchar](1) NULL,
	[L2300_1_CR2_1_CR210] [varchar](80) NULL,
	[L2300_1_CR2_1_CR211] [varchar](80) NULL,
	[L2300_1_CRC_1_CRC01] [varchar](2) NULL,
	[L2300_1_CRC_1_CRC02] [varchar](1) NULL,
	[L2300_1_CRC_1_CRC03] [varchar](3) NULL,
	[L2300_1_CRC_1_CRC04] [varchar](3) NULL,
	[L2300_1_CRC_1_CRC05] [varchar](3) NULL,
	[L2300_1_CRC_1_CRC06] [varchar](3) NULL,
	[L2300_1_CRC_1_CRC07] [varchar](3) NULL,
	[L2300_1_CRC_2_CRC01] [varchar](2) NULL,
	[L2300_1_CRC_2_CRC02] [varchar](1) NULL,
	[L2300_1_CRC_2_CRC03] [varchar](3) NULL,
	[L2300_1_CRC_2_CRC04] [varchar](3) NULL,
	[L2300_1_CRC_2_CRC05] [varchar](3) NULL,
	[L2300_1_CRC_2_CRC06] [varchar](3) NULL,
	[L2300_1_CRC_2_CRC07] [varchar](3) NULL,
	[L2300_1_CRC_3_CRC01] [varchar](2) NULL,
	[L2300_1_CRC_3_CRC02] [varchar](1) NULL,
	[L2300_1_CRC_3_CRC03] [varchar](3) NULL,
	[L2300_1_CRC_3_CRC04] [varchar](3) NULL,
	[L2300_1_CRC_3_CRC05] [varchar](3) NULL,
	[L2300_1_CRC_3_CRC06] [varchar](3) NULL,
	[L2300_1_CRC_3_CRC07] [varchar](3) NULL,
	[L2300_1_CRC_4_CRC01] [varchar](2) NULL,
	[L2300_1_CRC_4_CRC02] [varchar](1) NULL,
	[L2300_1_CRC_4_CRC03] [varchar](3) NULL,
	[L2300_1_CRC_4_CRC04] [varchar](3) NULL,
	[L2300_1_CRC_4_CRC05] [varchar](3) NULL,
	[L2300_1_CRC_4_CRC06] [varchar](3) NULL,
	[L2300_1_CRC_4_CRC07] [varchar](3) NULL,
	[L2300_1_CRC_5_CRC01] [varchar](2) NULL,
	[L2300_1_CRC_5_CRC02] [varchar](1) NULL,
	[L2300_1_CRC_5_CRC03] [varchar](3) NULL,
	[L2300_1_CRC_5_CRC04] [varchar](3) NULL,
	[L2300_1_CRC_5_CRC05] [varchar](3) NULL,
	[L2300_1_CRC_5_CRC06] [varchar](3) NULL,
	[L2300_1_CRC_5_CRC07] [varchar](3) NULL,
	[L2300_1_CRC_6_CRC01] [varchar](2) NULL,
	[L2300_1_CRC_6_CRC02] [varchar](1) NULL,
	[L2300_1_CRC_6_CRC03] [varchar](3) NULL,
	[L2300_1_CRC_6_CRC04] [varchar](3) NULL,
	[L2300_1_CRC_6_CRC05] [varchar](3) NULL,
	[L2300_1_CRC_6_CRC06] [varchar](3) NULL,
	[L2300_1_CRC_6_CRC07] [varchar](3) NULL,
	[L2300_1_CRC_7_CRC01] [varchar](2) NULL,
	[L2300_1_CRC_7_CRC02] [varchar](1) NULL,
	[L2300_1_CRC_7_CRC03] [varchar](3) NULL,
	[L2300_1_CRC_8_CRC01] [varchar](2) NULL,
	[L2300_1_CRC_8_CRC02] [varchar](1) NULL,
	[L2300_1_CRC_8_CRC03] [varchar](3) NULL,
	[L2300_1_CRC_8_CRC04] [varchar](3) NULL,
	[L2300_1_CRC_8_CRC05] [varchar](3) NULL,
	[L2300_1_HI_1_HI01_01] [varchar](3) NULL,
	[L2300_1_HI_1_HI01_02] [varchar](30) NULL,
	[L2300_1_HI_1_HI02_01] [varchar](3) NULL,
	[L2300_1_HI_1_HI02_02] [varchar](30) NULL,
	[L2300_1_HI_1_HI03_01] [varchar](3) NULL,
	[L2300_1_HI_1_HI03_02] [varchar](30) NULL,
	[L2300_1_HI_1_HI04_01] [varchar](3) NULL,
	[L2300_1_HI_1_HI04_02] [varchar](30) NULL,
	[L2300_1_HI_1_HI05_01] [varchar](3) NULL,
	[L2300_1_HI_1_HI05_02] [varchar](30) NULL,
	[L2300_1_HI_1_HI06_01] [varchar](3) NULL,
	[L2300_1_HI_1_HI06_02] [varchar](30) NULL,
	[L2300_1_HI_1_HI07_01] [varchar](3) NULL,
	[L2300_1_HI_1_HI07_02] [varchar](30) NULL,
	[L2300_1_HI_1_HI08_01] [varchar](3) NULL,
	[L2300_1_HI_1_HI08_02] [varchar](30) NULL,
	[L2300_1_HI_1_HI09_01] [varchar](3) NULL,
	[L2300_1_HI_1_HI09_02] [varchar](30) NULL,
	[L2300_1_HI_1_HI10_01] [varchar](3) NULL,
	[L2300_1_HI_1_HI10_02] [varchar](30) NULL,
	[L2300_1_HI_1_HI11_01] [varchar](3) NULL,
	[L2300_1_HI_1_HI11_02] [varchar](30) NULL,
	[L2300_1_HI_1_HI12_01] [varchar](3) NULL,
	[L2300_1_HI_1_HI12_02] [varchar](30) NULL,
	[L2300_1_HI_2_HI01_01] [varchar](3) NULL,
	[L2300_1_HI_2_HI01_02] [varchar](30) NULL,
	[L2300_1_HI_2_HI02_01] [varchar](3) NULL,
	[L2300_1_HI_2_HI02_02] [varchar](30) NULL,
	[L2300_1_HI_2_HI03_01] [varchar](3) NULL,
	[L2300_1_HI_2_HI03_02] [varchar](30) NULL,
	[L2300_1_HI_2_HI04_01] [varchar](3) NULL,
	[L2300_1_HI_2_HI04_02] [varchar](30) NULL,
	[L2300_1_HI_2_HI05_01] [varchar](3) NULL,
	[L2300_1_HI_2_HI05_02] [varchar](30) NULL,
	[L2300_1_HI_2_HI06_01] [varchar](3) NULL,
	[L2300_1_HI_2_HI06_02] [varchar](30) NULL,
	[L2300_1_HI_2_HI07_01] [varchar](3) NULL,
	[L2300_1_HI_2_HI07_02] [varchar](30) NULL,
	[L2300_1_HI_2_HI08_01] [varchar](3) NULL,
	[L2300_1_HI_2_HI08_02] [varchar](30) NULL,
	[L2300_1_HI_2_HI09_01] [varchar](3) NULL,
	[L2300_1_HI_2_HI09_02] [varchar](30) NULL,
	[L2300_1_HI_2_HI10_01] [varchar](3) NULL,
	[L2300_1_HI_2_HI10_02] [varchar](30) NULL,
	[L2300_1_HI_2_HI11_01] [varchar](3) NULL,
	[L2300_1_HI_2_HI11_02] [varchar](30) NULL,
	[L2300_1_HI_2_HI12_01] [varchar](3) NULL,
	[L2300_1_HI_2_HI12_02] [varchar](30) NULL,
	[L2300_1_HI_3_HI01_01] [varchar](3) NULL,
	[L2300_1_HI_3_HI01_02] [varchar](30) NULL,
	[L2300_1_HI_3_HI02_01] [varchar](3) NULL,
	[L2300_1_HI_3_HI02_02] [varchar](30) NULL,
	[L2300_1_HI_3_HI03_01] [varchar](3) NULL,
	[L2300_1_HI_3_HI03_02] [varchar](30) NULL,
	[L2300_1_HI_3_HI04_01] [varchar](3) NULL,
	[L2300_1_HI_3_HI04_02] [varchar](30) NULL,
	[L2300_1_HI_3_HI05_01] [varchar](3) NULL,
	[L2300_1_HI_3_HI05_02] [varchar](30) NULL,
	[L2300_1_HI_3_HI06_01] [varchar](3) NULL,
	[L2300_1_HI_3_HI06_02] [varchar](30) NULL,
	[L2300_1_HI_3_HI07_01] [varchar](3) NULL,
	[L2300_1_HI_3_HI07_02] [varchar](30) NULL,
	[L2300_1_HI_3_HI08_01] [varchar](3) NULL,
	[L2300_1_HI_3_HI08_02] [varchar](30) NULL,
	[L2300_1_HI_3_HI09_01] [varchar](3) NULL,
	[L2300_1_HI_3_HI09_02] [varchar](30) NULL,
	[L2300_1_HI_3_HI10_01] [varchar](3) NULL,
	[L2300_1_HI_3_HI10_02] [varchar](30) NULL,
	[L2300_1_HI_3_HI11_01] [varchar](3) NULL,
	[L2300_1_HI_3_HI11_02] [varchar](30) NULL,
	[L2300_1_HI_3_HI12_01] [varchar](3) NULL,
	[L2300_1_HI_3_HI12_02] [varchar](30) NULL,
	[L2300_1_HI_4_HI01_01] [varchar](3) NULL,
	[L2300_1_HI_4_HI01_02] [varchar](30) NULL,
	[L2300_1_HI_4_HI02_01] [varchar](3) NULL,
	[L2300_1_HI_4_HI02_02] [varchar](30) NULL,
	[L2300_1_HI_4_HI03_01] [varchar](3) NULL,
	[L2300_1_HI_4_HI03_02] [varchar](30) NULL,
	[L2300_1_HI_4_HI04_01] [varchar](3) NULL,
	[L2300_1_HI_4_HI04_02] [varchar](30) NULL,
	[L2300_1_HI_4_HI05_01] [varchar](3) NULL,
	[L2300_1_HI_4_HI05_02] [varchar](30) NULL,
	[L2300_1_HI_4_HI06_01] [varchar](3) NULL,
	[L2300_1_HI_4_HI06_02] [varchar](30) NULL,
	[L2300_1_HI_4_HI07_01] [varchar](3) NULL,
	[L2300_1_HI_4_HI07_02] [varchar](30) NULL,
	[L2300_1_HI_4_HI08_01] [varchar](3) NULL,
	[L2300_1_HI_4_HI08_02] [varchar](30) NULL,
	[L2300_1_HI_4_HI09_01] [varchar](3) NULL,
	[L2300_1_HI_4_HI09_02] [varchar](30) NULL,
	[L2300_1_HI_4_HI10_01] [varchar](3) NULL,
	[L2300_1_HI_4_HI10_02] [varchar](30) NULL,
	[L2300_1_HI_4_HI11_01] [varchar](3) NULL,
	[L2300_1_HI_4_HI11_02] [varchar](30) NULL,
	[L2300_1_HI_4_HI12_01] [varchar](3) NULL,
	[L2300_1_HI_4_HI12_02] [varchar](30) NULL,
	[L2300_1_HCP_1_HCP01] [varchar](2) NULL,
	[L2300_1_HCP_1_HCP02] [varchar](18) NULL,
	[L2300_1_HCP_1_HCP03] [varchar](18) NULL,
	[L2300_1_HCP_1_HCP04] [varchar](50) NULL,
	[L2300_1_HCP_1_HCP05] [varchar](9) NULL,
	[L2300_1_HCP_1_HCP06] [varchar](50) NULL,
	[L2300_1_HCP_1_HCP07] [varchar](18) NULL,
	[L2300_1_HCP_1_HCP13] [varchar](2) NULL,
	[L2300_1_HCP_1_HCP14] [varchar](2) NULL,
	[L2300_1_HCP_1_HCP15] [varchar](2) NULL,
	[L2310A_1_NM1_1_NM101] [varchar](3) NULL,
	[L2310A_1_NM1_1_NM102] [varchar](1) NULL,
	[L2310A_1_NM1_1_NM103] [varchar](60) NULL,
	[L2310A_1_NM1_1_NM104] [varchar](35) NULL,
	[L2310A_1_NM1_1_NM105] [varchar](25) NULL,
	[L2310A_1_NM1_1_NM107] [varchar](10) NULL,
	[L2310A_1_NM1_1_NM108] [varchar](2) NULL,
	[L2310A_1_NM1_1_NM109] [varchar](80) NULL,
	[L2310A_1_REF_1_REF01] [varchar](3) NULL,
	[L2310A_1_REF_1_REF02] [varchar](50) NULL,
	[L2310A_1_REF_2_REF01] [varchar](3) NULL,
	[L2310A_1_REF_2_REF02] [varchar](50) NULL,
	[L2310A_1_REF_3_REF01] [varchar](3) NULL,
	[L2310A_1_REF_3_REF02] [varchar](50) NULL,
	[L2310A_2_NM1_1_NM101] [varchar](3) NULL,
	[L2310A_2_NM1_1_NM102] [varchar](1) NULL,
	[L2310A_2_NM1_1_NM103] [varchar](60) NULL,
	[L2310A_2_NM1_1_NM104] [varchar](35) NULL,
	[L2310A_2_NM1_1_NM105] [varchar](25) NULL,
	[L2310A_2_NM1_1_NM107] [varchar](10) NULL,
	[L2310A_2_NM1_1_NM108] [varchar](2) NULL,
	[L2310A_2_NM1_1_NM109] [varchar](80) NULL,
	[L2310A_2_REF_1_REF01] [varchar](3) NULL,
	[L2310A_2_REF_1_REF02] [varchar](50) NULL,
	[L2310A_2_REF_2_REF01] [varchar](3) NULL,
	[L2310A_2_REF_2_REF02] [varchar](50) NULL,
	[L2310A_2_REF_3_REF01] [varchar](3) NULL,
	[L2310A_2_REF_3_REF02] [varchar](50) NULL,
	[L2310B_1_NM1_1_NM101] [varchar](3) NULL,
	[L2310B_1_NM1_1_NM102] [varchar](1) NULL,
	[L2310B_1_NM1_1_NM103] [varchar](60) NULL,
	[L2310B_1_NM1_1_NM104] [varchar](35) NULL,
	[L2310B_1_NM1_1_NM105] [varchar](25) NULL,
	[L2310B_1_NM1_1_NM107] [varchar](10) NULL,
	[L2310B_1_NM1_1_NM108] [varchar](2) NULL,
	[L2310B_1_NM1_1_NM109] [varchar](80) NULL,
	[L2310B_1_PRV_1_PRV01] [varchar](3) NULL,
	[L2310B_1_PRV_1_PRV02] [varchar](3) NULL,
	[L2310B_1_PRV_1_PRV03] [varchar](50) NULL,
	[L2310B_1_REF_1_REF01] [varchar](3) NULL,
	[L2310B_1_REF_1_REF02] [varchar](50) NULL,
	[L2310B_1_REF_2_REF01] [varchar](3) NULL,
	[L2310B_1_REF_2_REF02] [varchar](50) NULL,
	[L2310B_1_REF_3_REF01] [varchar](3) NULL,
	[L2310B_1_REF_3_REF02] [varchar](50) NULL,
	[L2310B_1_REF_4_REF01] [varchar](3) NULL,
	[L2310B_1_REF_4_REF02] [varchar](50) NULL,
	[L2310C_1_NM1_1_NM101] [varchar](3) NULL,
	[L2310C_1_NM1_1_NM102] [varchar](1) NULL,
	[L2310C_1_NM1_1_NM103] [varchar](60) NULL,
	[L2310C_1_NM1_1_NM108] [varchar](2) NULL,
	[L2310C_1_NM1_1_NM109] [varchar](80) NULL,
	[L2310C_1_N3_1_N301] [varchar](55) NULL,
	[L2310C_1_N3_1_N302] [varchar](55) NULL,
	[L2310C_1_N4_1_N401] [varchar](30) NULL,
	[L2310C_1_N4_1_N402] [varchar](2) NULL,
	[L2310C_1_N4_1_N403] [varchar](15) NULL,
	[L2310C_1_N4_1_N404] [varchar](3) NULL,
	[L2310C_1_N4_1_N407] [varchar](3) NULL,
	[L2310C_1_REF_1_REF01] [varchar](3) NULL,
	[L2310C_1_REF_1_REF02] [varchar](50) NULL,
	[L2310C_1_REF_2_REF01] [varchar](3) NULL,
	[L2310C_1_REF_2_REF02] [varchar](50) NULL,
	[L2310C_1_REF_3_REF01] [varchar](3) NULL,
	[L2310C_1_REF_3_REF02] [varchar](50) NULL,
	[L2310C_1_PER_1_PER01] [varchar](2) NULL,
	[L2310C_1_PER_1_PER02] [varchar](60) NULL,
	[L2310C_1_PER_1_PER03] [varchar](2) NULL,
	[L2310C_1_PER_1_PER04] [varchar](256) NULL,
	[L2310C_1_PER_1_PER05] [varchar](2) NULL,
	[L2310C_1_PER_1_PER06] [varchar](256) NULL,
	[L2310D_1_NM1_1_NM101] [varchar](3) NULL,
	[L2310D_1_NM1_1_NM102] [varchar](1) NULL,
	[L2310D_1_NM1_1_NM103] [varchar](60) NULL,
	[L2310D_1_NM1_1_NM104] [varchar](35) NULL,
	[L2310D_1_NM1_1_NM105] [varchar](25) NULL,
	[L2310D_1_NM1_1_NM107] [varchar](10) NULL,
	[L2310D_1_NM1_1_NM108] [varchar](2) NULL,
	[L2310D_1_NM1_1_NM109] [varchar](80) NULL,
	[L2310D_1_REF_1_REF01] [varchar](3) NULL,
	[L2310D_1_REF_1_REF02] [varchar](50) NULL,
	[L2310D_1_REF_2_REF01] [varchar](3) NULL,
	[L2310D_1_REF_2_REF02] [varchar](50) NULL,
	[L2310D_1_REF_3_REF01] [varchar](3) NULL,
	[L2310D_1_REF_3_REF02] [varchar](50) NULL,
	[L2310D_1_REF_4_REF01] [varchar](3) NULL,
	[L2310D_1_REF_4_REF02] [varchar](50) NULL,
	[L2310E_1_NM1_1_NM101] [varchar](3) NULL,
	[L2310E_1_NM1_1_NM102] [varchar](1) NULL,
	[L2310E_1_N3_1_N301] [varchar](55) NULL,
	[L2310E_1_N3_1_N302] [varchar](55) NULL,
	[L2310E_1_N4_1_N401] [varchar](30) NULL,
	[L2310E_1_N4_1_N402] [varchar](2) NULL,
	[L2310E_1_N4_1_N403] [varchar](15) NULL,
	[L2310E_1_N4_1_N404] [varchar](3) NULL,
	[L2310E_1_N4_1_N407] [varchar](3) NULL,
	[L2310F_1_NM1_1_NM101] [varchar](3) NULL,
	[L2310F_1_NM1_1_NM102] [varchar](1) NULL,
	[L2310F_1_NM1_1_NM103] [varchar](60) NULL,
	[L2310F_1_N3_1_N301] [varchar](55) NULL,
	[L2310F_1_N3_1_N302] [varchar](55) NULL,
	[L2310F_1_N4_1_N401] [varchar](30) NULL,
	[L2310F_1_N4_1_N402] [varchar](2) NULL,
	[L2310F_1_N4_1_N403] [varchar](15) NULL,
	[L2310F_1_N4_1_N404] [varchar](3) NULL,
	[L2310F_1_N4_1_N407] [varchar](3) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[EDI_837P_claim] ON
INSERT [dbo].[EDI_837P_claim] ([claimid], [Fileid], [HeaderID], [subscriber_patientid], [L2300_1_CLM_1_CLM01], [L2300_1_CLM_1_CLM02], [L2300_1_CLM_1_CLM05_1], [L2300_1_CLM_1_CLM05_2], [L2300_1_CLM_1_CLM05_3], [L2300_1_CLM_1_CLM06], [L2300_1_CLM_1_CLM07], [L2300_1_CLM_1_CLM08], [L2300_1_CLM_1_CLM09], [L2300_1_CLM_1_CLM10], [L2300_1_CLM_1_CLM11_1], [L2300_1_CLM_1_CLM11_2], [L2300_1_CLM_1_CLM11_4], [L2300_1_CLM_1_CLM11_5], [L2300_1_CLM_1_CLM12], [L2300_1_CLM_1_CLM20], [L2300_1_DTP_1_DTP01], [L2300_1_DTP_1_DTP02], [L2300_1_DTP_1_DTP03], [L2300_1_DTP_2_DTP01], [L2300_1_DTP_2_DTP02], [L2300_1_DTP_2_DTP03], [L2300_1_DTP_3_DTP01], [L2300_1_DTP_3_DTP02], [L2300_1_DTP_3_DTP03], [L2300_1_DTP_4_DTP01], [L2300_1_DTP_4_DTP02], [L2300_1_DTP_4_DTP03], [L2300_1_DTP_5_DTP01], [L2300_1_DTP_5_DTP02], [L2300_1_DTP_5_DTP03], [L2300_1_DTP_6_DTP01], [L2300_1_DTP_6_DTP02], [L2300_1_DTP_6_DTP03], [L2300_1_DTP_7_DTP01], [L2300_1_DTP_7_DTP02], [L2300_1_DTP_7_DTP03], [L2300_1_DTP_8_DTP01], [L2300_1_DTP_8_DTP02], [L2300_1_DTP_8_DTP03], [L2300_1_DTP_9_DTP01], [L2300_1_DTP_9_DTP02], [L2300_1_DTP_9_DTP03], [L2300_1_DTP_10_DTP01], [L2300_1_DTP_10_DTP02], [L2300_1_DTP_10_DTP03], [L2300_1_DTP_11_DTP01], [L2300_1_DTP_11_DTP02], [L2300_1_DTP_11_DTP03], [L2300_1_DTP_12_DTP01], [L2300_1_DTP_12_DTP02], [L2300_1_DTP_12_DTP03], [L2300_1_DTP_13_DTP01], [L2300_1_DTP_13_DTP02], [L2300_1_DTP_13_DTP03], [L2300_1_DTP_14_DTP01], [L2300_1_DTP_14_DTP02], [L2300_1_DTP_14_DTP03], [L2300_1_DTP_15_DTP01], [L2300_1_DTP_15_DTP02], [L2300_1_DTP_15_DTP03], [L2300_1_DTP_16_DTP01], [L2300_1_DTP_16_DTP02], [L2300_1_DTP_16_DTP03], [L2300_1_DTP_17_DTP01], [L2300_1_DTP_17_DTP02], [L2300_1_DTP_17_DTP03], [L2300_1_DTP_18_DTP01], [L2300_1_DTP_18_DTP02], [L2300_1_DTP_18_DTP03], [L2300_1_DTP_19_DTP01], [L2300_1_DTP_19_DTP02], [L2300_1_DTP_19_DTP03], [L2300_1_PWK_1_PWK01], [L2300_1_PWK_1_PWK02], [L2300_1_PWK_1_PWK06], [L2300_1_PWK_2_PWK01], [L2300_1_PWK_2_PWK02], [L2300_1_PWK_2_PWK06], [L2300_1_PWK_3_PWK01], [L2300_1_PWK_3_PWK02], [L2300_1_PWK_3_PWK06], [L2300_1_PWK_4_PWK01], [L2300_1_PWK_4_PWK02], [L2300_1_PWK_4_PWK06], [L2300_1_PWK_5_PWK01], [L2300_1_PWK_5_PWK02], [L2300_1_PWK_5_PWK06], [L2300_1_PWK_6_PWK01], [L2300_1_PWK_6_PWK02], [L2300_1_PWK_6_PWK06], [L2300_1_PWK_7_PWK01], [L2300_1_PWK_7_PWK02], [L2300_1_PWK_7_PWK06], [L2300_1_PWK_8_PWK01], [L2300_1_PWK_8_PWK02], [L2300_1_PWK_8_PWK06], [L2300_1_PWK_9_PWK01], [L2300_1_PWK_9_PWK02], [L2300_1_PWK_9_PWK06], [L2300_1_PWK_10_PWK01], [L2300_1_PWK_10_PWK02], [L2300_1_PWK_10_PWK06], [L2300_1_CN1_1_CN101], [L2300_1_CN1_1_CN102], [L2300_1_CN1_1_CN103], [L2300_1_CN1_1_CN104], [L2300_1_CN1_1_CN105], [L2300_1_CN1_1_CN106], [L2300_1_AMT_1_AMT01], [L2300_1_AMT_1_AMT02], [L2300_1_REF_1_REF01], [L2300_1_REF_1_REF02], [L2300_1_REF_2_REF01], [L2300_1_REF_2_REF02], [L2300_1_REF_3_REF01], [L2300_1_REF_3_REF02], [L2300_1_REF_4_REF01], [L2300_1_REF_4_REF02], [L2300_1_REF_5_REF01], [L2300_1_REF_5_REF02], [L2300_1_REF_6_REF01], [L2300_1_REF_6_REF02], [L2300_1_REF_7_REF01], [L2300_1_REF_7_REF02], [L2300_1_REF_8_REF01], [L2300_1_REF_8_REF02], [L2300_1_REF_9_REF01], [L2300_1_REF_9_REF02], [L2300_1_REF_10_REF01], [L2300_1_REF_10_REF02], [L2300_1_REF_11_REF01], [L2300_1_REF_11_REF02], [L2300_1_REF_12_REF01], [L2300_1_REF_12_REF02], [L2300_1_REF_13_REF01], [L2300_1_REF_13_REF02], [L2300_1_REF_14_REF01], [L2300_1_REF_14_REF02], [L2300_1_K3_1_K301], [L2300_1_K3_2_K301], [L2300_1_K3_3_K301], [L2300_1_K3_4_K301], [L2300_1_K3_5_K301], [L2300_1_K3_6_K301], [L2300_1_K3_7_K301], [L2300_1_K3_8_K301], [L2300_1_K3_9_K301], [L2300_1_K3_10_K301], [L2300_1_NTE_1_NTE01], [L2300_1_NTE_1_NTE02], [L2300_1_CR1_1_CR101], [L2300_1_CR1_1_CR102], [L2300_1_CR1_1_CR104], [L2300_1_CR1_1_CR105], [L2300_1_CR1_1_CR106], [L2300_1_CR1_1_CR109], [L2300_1_CR1_1_CR110], [L2300_1_CR2_1_CR208], [L2300_1_CR2_1_CR210], [L2300_1_CR2_1_CR211], [L2300_1_CRC_1_CRC01], [L2300_1_CRC_1_CRC02], [L2300_1_CRC_1_CRC03], [L2300_1_CRC_1_CRC04], [L2300_1_CRC_1_CRC05], [L2300_1_CRC_1_CRC06], [L2300_1_CRC_1_CRC07], [L2300_1_CRC_2_CRC01], [L2300_1_CRC_2_CRC02], [L2300_1_CRC_2_CRC03], [L2300_1_CRC_2_CRC04], [L2300_1_CRC_2_CRC05], [L2300_1_CRC_2_CRC06], [L2300_1_CRC_2_CRC07], [L2300_1_CRC_3_CRC01], [L2300_1_CRC_3_CRC02], [L2300_1_CRC_3_CRC03], [L2300_1_CRC_3_CRC04], [L2300_1_CRC_3_CRC05], [L2300_1_CRC_3_CRC06], [L2300_1_CRC_3_CRC07], [L2300_1_CRC_4_CRC01], [L2300_1_CRC_4_CRC02], [L2300_1_CRC_4_CRC03], [L2300_1_CRC_4_CRC04], [L2300_1_CRC_4_CRC05], [L2300_1_CRC_4_CRC06], [L2300_1_CRC_4_CRC07], [L2300_1_CRC_5_CRC01], [L2300_1_CRC_5_CRC02], [L2300_1_CRC_5_CRC03], [L2300_1_CRC_5_CRC04], [L2300_1_CRC_5_CRC05], [L2300_1_CRC_5_CRC06], [L2300_1_CRC_5_CRC07], [L2300_1_CRC_6_CRC01], [L2300_1_CRC_6_CRC02], [L2300_1_CRC_6_CRC03], [L2300_1_CRC_6_CRC04], [L2300_1_CRC_6_CRC05], [L2300_1_CRC_6_CRC06], [L2300_1_CRC_6_CRC07], [L2300_1_CRC_7_CRC01], [L2300_1_CRC_7_CRC02], [L2300_1_CRC_7_CRC03], [L2300_1_CRC_8_CRC01], [L2300_1_CRC_8_CRC02], [L2300_1_CRC_8_CRC03], [L2300_1_CRC_8_CRC04], [L2300_1_CRC_8_CRC05], [L2300_1_HI_1_HI01_01], [L2300_1_HI_1_HI01_02], [L2300_1_HI_1_HI02_01], [L2300_1_HI_1_HI02_02], [L2300_1_HI_1_HI03_01], [L2300_1_HI_1_HI03_02], [L2300_1_HI_1_HI04_01], [L2300_1_HI_1_HI04_02], [L2300_1_HI_1_HI05_01], [L2300_1_HI_1_HI05_02], [L2300_1_HI_1_HI06_01], [L2300_1_HI_1_HI06_02], [L2300_1_HI_1_HI07_01], [L2300_1_HI_1_HI07_02], [L2300_1_HI_1_HI08_01], [L2300_1_HI_1_HI08_02], [L2300_1_HI_1_HI09_01], [L2300_1_HI_1_HI09_02], [L2300_1_HI_1_HI10_01], [L2300_1_HI_1_HI10_02], [L2300_1_HI_1_HI11_01], [L2300_1_HI_1_HI11_02], [L2300_1_HI_1_HI12_01], [L2300_1_HI_1_HI12_02], [L2300_1_HI_2_HI01_01], [L2300_1_HI_2_HI01_02], [L2300_1_HI_2_HI02_01], [L2300_1_HI_2_HI02_02], [L2300_1_HI_2_HI03_01], [L2300_1_HI_2_HI03_02], [L2300_1_HI_2_HI04_01], [L2300_1_HI_2_HI04_02], [L2300_1_HI_2_HI05_01], [L2300_1_HI_2_HI05_02], [L2300_1_HI_2_HI06_01], [L2300_1_HI_2_HI06_02], [L2300_1_HI_2_HI07_01], [L2300_1_HI_2_HI07_02], [L2300_1_HI_2_HI08_01], [L2300_1_HI_2_HI08_02], [L2300_1_HI_2_HI09_01], [L2300_1_HI_2_HI09_02], [L2300_1_HI_2_HI10_01], [L2300_1_HI_2_HI10_02], [L2300_1_HI_2_HI11_01], [L2300_1_HI_2_HI11_02], [L2300_1_HI_2_HI12_01], [L2300_1_HI_2_HI12_02], [L2300_1_HI_3_HI01_01], [L2300_1_HI_3_HI01_02], [L2300_1_HI_3_HI02_01], [L2300_1_HI_3_HI02_02], [L2300_1_HI_3_HI03_01], [L2300_1_HI_3_HI03_02], [L2300_1_HI_3_HI04_01], [L2300_1_HI_3_HI04_02], [L2300_1_HI_3_HI05_01], [L2300_1_HI_3_HI05_02], [L2300_1_HI_3_HI06_01], [L2300_1_HI_3_HI06_02], [L2300_1_HI_3_HI07_01], [L2300_1_HI_3_HI07_02], [L2300_1_HI_3_HI08_01], [L2300_1_HI_3_HI08_02], [L2300_1_HI_3_HI09_01], [L2300_1_HI_3_HI09_02], [L2300_1_HI_3_HI10_01], [L2300_1_HI_3_HI10_02], [L2300_1_HI_3_HI11_01], [L2300_1_HI_3_HI11_02], [L2300_1_HI_3_HI12_01], [L2300_1_HI_3_HI12_02], [L2300_1_HI_4_HI01_01], [L2300_1_HI_4_HI01_02], [L2300_1_HI_4_HI02_01], [L2300_1_HI_4_HI02_02], [L2300_1_HI_4_HI03_01], [L2300_1_HI_4_HI03_02], [L2300_1_HI_4_HI04_01], [L2300_1_HI_4_HI04_02], [L2300_1_HI_4_HI05_01], [L2300_1_HI_4_HI05_02], [L2300_1_HI_4_HI06_01], [L2300_1_HI_4_HI06_02], [L2300_1_HI_4_HI07_01], [L2300_1_HI_4_HI07_02], [L2300_1_HI_4_HI08_01], [L2300_1_HI_4_HI08_02], [L2300_1_HI_4_HI09_01], [L2300_1_HI_4_HI09_02], [L2300_1_HI_4_HI10_01], [L2300_1_HI_4_HI10_02], [L2300_1_HI_4_HI11_01], [L2300_1_HI_4_HI11_02], [L2300_1_HI_4_HI12_01], [L2300_1_HI_4_HI12_02], [L2300_1_HCP_1_HCP01], [L2300_1_HCP_1_HCP02], [L2300_1_HCP_1_HCP03], [L2300_1_HCP_1_HCP04], [L2300_1_HCP_1_HCP05], [L2300_1_HCP_1_HCP06], [L2300_1_HCP_1_HCP07], [L2300_1_HCP_1_HCP13], [L2300_1_HCP_1_HCP14], [L2300_1_HCP_1_HCP15], [L2310A_1_NM1_1_NM101], [L2310A_1_NM1_1_NM102], [L2310A_1_NM1_1_NM103], [L2310A_1_NM1_1_NM104], [L2310A_1_NM1_1_NM105], [L2310A_1_NM1_1_NM107], [L2310A_1_NM1_1_NM108], [L2310A_1_NM1_1_NM109], [L2310A_1_REF_1_REF01], [L2310A_1_REF_1_REF02], [L2310A_1_REF_2_REF01], [L2310A_1_REF_2_REF02], [L2310A_1_REF_3_REF01], [L2310A_1_REF_3_REF02], [L2310A_2_NM1_1_NM101], [L2310A_2_NM1_1_NM102], [L2310A_2_NM1_1_NM103], [L2310A_2_NM1_1_NM104], [L2310A_2_NM1_1_NM105], [L2310A_2_NM1_1_NM107], [L2310A_2_NM1_1_NM108], [L2310A_2_NM1_1_NM109], [L2310A_2_REF_1_REF01], [L2310A_2_REF_1_REF02], [L2310A_2_REF_2_REF01], [L2310A_2_REF_2_REF02], [L2310A_2_REF_3_REF01], [L2310A_2_REF_3_REF02], [L2310B_1_NM1_1_NM101], [L2310B_1_NM1_1_NM102], [L2310B_1_NM1_1_NM103], [L2310B_1_NM1_1_NM104], [L2310B_1_NM1_1_NM105], [L2310B_1_NM1_1_NM107], [L2310B_1_NM1_1_NM108], [L2310B_1_NM1_1_NM109], [L2310B_1_PRV_1_PRV01], [L2310B_1_PRV_1_PRV02], [L2310B_1_PRV_1_PRV03], [L2310B_1_REF_1_REF01], [L2310B_1_REF_1_REF02], [L2310B_1_REF_2_REF01], [L2310B_1_REF_2_REF02], [L2310B_1_REF_3_REF01], [L2310B_1_REF_3_REF02], [L2310B_1_REF_4_REF01], [L2310B_1_REF_4_REF02], [L2310C_1_NM1_1_NM101], [L2310C_1_NM1_1_NM102], [L2310C_1_NM1_1_NM103], [L2310C_1_NM1_1_NM108], [L2310C_1_NM1_1_NM109], [L2310C_1_N3_1_N301], [L2310C_1_N3_1_N302], [L2310C_1_N4_1_N401], [L2310C_1_N4_1_N402], [L2310C_1_N4_1_N403], [L2310C_1_N4_1_N404], [L2310C_1_N4_1_N407], [L2310C_1_REF_1_REF01], [L2310C_1_REF_1_REF02], [L2310C_1_REF_2_REF01], [L2310C_1_REF_2_REF02], [L2310C_1_REF_3_REF01], [L2310C_1_REF_3_REF02], [L2310C_1_PER_1_PER01], [L2310C_1_PER_1_PER02], [L2310C_1_PER_1_PER03], [L2310C_1_PER_1_PER04], [L2310C_1_PER_1_PER05], [L2310C_1_PER_1_PER06], [L2310D_1_NM1_1_NM101], [L2310D_1_NM1_1_NM102], [L2310D_1_NM1_1_NM103], [L2310D_1_NM1_1_NM104], [L2310D_1_NM1_1_NM105], [L2310D_1_NM1_1_NM107], [L2310D_1_NM1_1_NM108], [L2310D_1_NM1_1_NM109], [L2310D_1_REF_1_REF01], [L2310D_1_REF_1_REF02], [L2310D_1_REF_2_REF01], [L2310D_1_REF_2_REF02], [L2310D_1_REF_3_REF01], [L2310D_1_REF_3_REF02], [L2310D_1_REF_4_REF01], [L2310D_1_REF_4_REF02], [L2310E_1_NM1_1_NM101], [L2310E_1_NM1_1_NM102], [L2310E_1_N3_1_N301], [L2310E_1_N3_1_N302], [L2310E_1_N4_1_N401], [L2310E_1_N4_1_N402], [L2310E_1_N4_1_N403], [L2310E_1_N4_1_N404], [L2310E_1_N4_1_N407], [L2310F_1_NM1_1_NM101], [L2310F_1_NM1_1_NM102], [L2310F_1_NM1_1_NM103], [L2310F_1_N3_1_N301], [L2310F_1_N3_1_N302], [L2310F_1_N4_1_N401], [L2310F_1_N4_1_N402], [L2310F_1_N4_1_N403], [L2310F_1_N4_1_N404], [L2310F_1_N4_1_N407]) VALUES (20555, N'178', N'987654', N'3', N'A37YH556', N'500', N'11', N'B', N'1', N'Y', N'A', N'Y', N'I', N'P', NULL, NULL, NULL, NULL, NULL, NULL, N'431', N'D8', N'20050108', N'454', N'D8', N'20050108', N'304', N'D8', N'20050108', N'453', N'D8', N'20050108', N'439', N'D8', N'20060108', N'484', N'D8', N'20050108', N'455', N'D8', N'20050108', N'471', N'D8', N'20050108', NULL, NULL, NULL, N'360', N'D8', N'20050108', NULL, NULL, NULL, N'297', N'D8', N'20050108', N'296', N'D8', N'20050108', N'435', N'D8', N'20030108', N'096', N'D8', N'20050108', N'090', N'D8', N'20050108', N'091', N'D8', N'20050108', N'444', N'D8', N'20041013', N'050', N'D8', N'20051030', N'03', N'BM', N'DMN0012', N'04', N'BM', N'DMN0012', N'05', N'BM', N'DMN0012', N'06', N'BM', N'DMN0012', N'07', N'BM', N'DMN0012', N'08', N'BM', N'DMN0012', N'09', N'BM', N'DMN0012', N'10', N'BM', N'DMN0012', N'11', N'BM', N'DMN0012', N'12', N'BM', N'DMN0012', N'02', N'550', NULL, NULL, NULL, NULL, N'F5', N'152.45', N'4N', N'1', N'F5', N'N', N'EW', N'T554', N'9F', N'12345', N'G1', N'13579', N'F8', N'R555588', N'X4', N'12D4567890', N'9A', N'RJ55555', N'9C', N'RP44444444', N'LX', N'432907', N'D9', N'TJ98UU321', N'EA', N'44444TH56', N'P4', N'THJ1222', N'1J', N'12345678', N'STATE DATA REQUIREMENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'ADD', N'SURGERY WAS UNUSUALLY LONG BECAUSE [FILL IN REASON]', N'LB', N'140', N'A', N'DH', N'12', N'', N'UNCONSCIOUS', N'M', NULL, NULL, N'07', N'Y', N'01', NULL, NULL, NULL, NULL, N'E1', N'Y', N'L1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'75', N'Y', N'IH', N'ZZ', N'Y', N'ST', NULL, NULL, N'BK', N'8901', N'BF', N'87200', N'BF', N'5559', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'BP', N'33414', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'BG', N'17', N'BG', N'67', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'03', N'100', N'10', N'RPO12345', NULL, NULL, NULL, NULL, NULL, NULL, N'DN', N'1', N'WELBY', N'MARCUS', N'W', N'JR', N'XX', N'1234567891', N'0B', N'0B12345', N'1G', N'1G12345', N'G2', N'G212345', N'P3', N'1', N'WELBY', N'MARCUS', N'W', N'JR', N'XX', N'1234567891', N'0B', N'0B12345', N'1G', N'1G12345', N'G2', N'G212345', N'82', N'1', N'DOE', N'JANE', N'C', N'', N'XX', N'1234567804', N'PE', N'PXC', N'1223G0001X', N'0B', N'12345', N'1G', N'12345', N'G2', N'12345', N'LU', N'12345', N'77', N'2', N'ABC CLINIC', N'XX', N'1234567891', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'0B', N'12345', N'G2', N'12345', NULL, NULL, N'IC', N'JOHN SMITH', N'TE', N'5555551234', N'EX', N'123', N'DQ', N'1', N'DOE', N'JOHN', N'B', N'', N'XX', N'1234567891', N'0B', N'12345', N'1G', N'12345', N'G2', N'12345', N'LU', N'12345', N'PW', N'2', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'45', N'2', NULL, N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL)
INSERT [dbo].[EDI_837P_claim] ([claimid], [Fileid], [HeaderID], [subscriber_patientid], [L2300_1_CLM_1_CLM01], [L2300_1_CLM_1_CLM02], [L2300_1_CLM_1_CLM05_1], [L2300_1_CLM_1_CLM05_2], [L2300_1_CLM_1_CLM05_3], [L2300_1_CLM_1_CLM06], [L2300_1_CLM_1_CLM07], [L2300_1_CLM_1_CLM08], [L2300_1_CLM_1_CLM09], [L2300_1_CLM_1_CLM10], [L2300_1_CLM_1_CLM11_1], [L2300_1_CLM_1_CLM11_2], [L2300_1_CLM_1_CLM11_4], [L2300_1_CLM_1_CLM11_5], [L2300_1_CLM_1_CLM12], [L2300_1_CLM_1_CLM20], [L2300_1_DTP_1_DTP01], [L2300_1_DTP_1_DTP02], [L2300_1_DTP_1_DTP03], [L2300_1_DTP_2_DTP01], [L2300_1_DTP_2_DTP02], [L2300_1_DTP_2_DTP03], [L2300_1_DTP_3_DTP01], [L2300_1_DTP_3_DTP02], [L2300_1_DTP_3_DTP03], [L2300_1_DTP_4_DTP01], [L2300_1_DTP_4_DTP02], [L2300_1_DTP_4_DTP03], [L2300_1_DTP_5_DTP01], [L2300_1_DTP_5_DTP02], [L2300_1_DTP_5_DTP03], [L2300_1_DTP_6_DTP01], [L2300_1_DTP_6_DTP02], [L2300_1_DTP_6_DTP03], [L2300_1_DTP_7_DTP01], [L2300_1_DTP_7_DTP02], [L2300_1_DTP_7_DTP03], [L2300_1_DTP_8_DTP01], [L2300_1_DTP_8_DTP02], [L2300_1_DTP_8_DTP03], [L2300_1_DTP_9_DTP01], [L2300_1_DTP_9_DTP02], [L2300_1_DTP_9_DTP03], [L2300_1_DTP_10_DTP01], [L2300_1_DTP_10_DTP02], [L2300_1_DTP_10_DTP03], [L2300_1_DTP_11_DTP01], [L2300_1_DTP_11_DTP02], [L2300_1_DTP_11_DTP03], [L2300_1_DTP_12_DTP01], [L2300_1_DTP_12_DTP02], [L2300_1_DTP_12_DTP03], [L2300_1_DTP_13_DTP01], [L2300_1_DTP_13_DTP02], [L2300_1_DTP_13_DTP03], [L2300_1_DTP_14_DTP01], [L2300_1_DTP_14_DTP02], [L2300_1_DTP_14_DTP03], [L2300_1_DTP_15_DTP01], [L2300_1_DTP_15_DTP02], [L2300_1_DTP_15_DTP03], [L2300_1_DTP_16_DTP01], [L2300_1_DTP_16_DTP02], [L2300_1_DTP_16_DTP03], [L2300_1_DTP_17_DTP01], [L2300_1_DTP_17_DTP02], [L2300_1_DTP_17_DTP03], [L2300_1_DTP_18_DTP01], [L2300_1_DTP_18_DTP02], [L2300_1_DTP_18_DTP03], [L2300_1_DTP_19_DTP01], [L2300_1_DTP_19_DTP02], [L2300_1_DTP_19_DTP03], [L2300_1_PWK_1_PWK01], [L2300_1_PWK_1_PWK02], [L2300_1_PWK_1_PWK06], [L2300_1_PWK_2_PWK01], [L2300_1_PWK_2_PWK02], [L2300_1_PWK_2_PWK06], [L2300_1_PWK_3_PWK01], [L2300_1_PWK_3_PWK02], [L2300_1_PWK_3_PWK06], [L2300_1_PWK_4_PWK01], [L2300_1_PWK_4_PWK02], [L2300_1_PWK_4_PWK06], [L2300_1_PWK_5_PWK01], [L2300_1_PWK_5_PWK02], [L2300_1_PWK_5_PWK06], [L2300_1_PWK_6_PWK01], [L2300_1_PWK_6_PWK02], [L2300_1_PWK_6_PWK06], [L2300_1_PWK_7_PWK01], [L2300_1_PWK_7_PWK02], [L2300_1_PWK_7_PWK06], [L2300_1_PWK_8_PWK01], [L2300_1_PWK_8_PWK02], [L2300_1_PWK_8_PWK06], [L2300_1_PWK_9_PWK01], [L2300_1_PWK_9_PWK02], [L2300_1_PWK_9_PWK06], [L2300_1_PWK_10_PWK01], [L2300_1_PWK_10_PWK02], [L2300_1_PWK_10_PWK06], [L2300_1_CN1_1_CN101], [L2300_1_CN1_1_CN102], [L2300_1_CN1_1_CN103], [L2300_1_CN1_1_CN104], [L2300_1_CN1_1_CN105], [L2300_1_CN1_1_CN106], [L2300_1_AMT_1_AMT01], [L2300_1_AMT_1_AMT02], [L2300_1_REF_1_REF01], [L2300_1_REF_1_REF02], [L2300_1_REF_2_REF01], [L2300_1_REF_2_REF02], [L2300_1_REF_3_REF01], [L2300_1_REF_3_REF02], [L2300_1_REF_4_REF01], [L2300_1_REF_4_REF02], [L2300_1_REF_5_REF01], [L2300_1_REF_5_REF02], [L2300_1_REF_6_REF01], [L2300_1_REF_6_REF02], [L2300_1_REF_7_REF01], [L2300_1_REF_7_REF02], [L2300_1_REF_8_REF01], [L2300_1_REF_8_REF02], [L2300_1_REF_9_REF01], [L2300_1_REF_9_REF02], [L2300_1_REF_10_REF01], [L2300_1_REF_10_REF02], [L2300_1_REF_11_REF01], [L2300_1_REF_11_REF02], [L2300_1_REF_12_REF01], [L2300_1_REF_12_REF02], [L2300_1_REF_13_REF01], [L2300_1_REF_13_REF02], [L2300_1_REF_14_REF01], [L2300_1_REF_14_REF02], [L2300_1_K3_1_K301], [L2300_1_K3_2_K301], [L2300_1_K3_3_K301], [L2300_1_K3_4_K301], [L2300_1_K3_5_K301], [L2300_1_K3_6_K301], [L2300_1_K3_7_K301], [L2300_1_K3_8_K301], [L2300_1_K3_9_K301], [L2300_1_K3_10_K301], [L2300_1_NTE_1_NTE01], [L2300_1_NTE_1_NTE02], [L2300_1_CR1_1_CR101], [L2300_1_CR1_1_CR102], [L2300_1_CR1_1_CR104], [L2300_1_CR1_1_CR105], [L2300_1_CR1_1_CR106], [L2300_1_CR1_1_CR109], [L2300_1_CR1_1_CR110], [L2300_1_CR2_1_CR208], [L2300_1_CR2_1_CR210], [L2300_1_CR2_1_CR211], [L2300_1_CRC_1_CRC01], [L2300_1_CRC_1_CRC02], [L2300_1_CRC_1_CRC03], [L2300_1_CRC_1_CRC04], [L2300_1_CRC_1_CRC05], [L2300_1_CRC_1_CRC06], [L2300_1_CRC_1_CRC07], [L2300_1_CRC_2_CRC01], [L2300_1_CRC_2_CRC02], [L2300_1_CRC_2_CRC03], [L2300_1_CRC_2_CRC04], [L2300_1_CRC_2_CRC05], [L2300_1_CRC_2_CRC06], [L2300_1_CRC_2_CRC07], [L2300_1_CRC_3_CRC01], [L2300_1_CRC_3_CRC02], [L2300_1_CRC_3_CRC03], [L2300_1_CRC_3_CRC04], [L2300_1_CRC_3_CRC05], [L2300_1_CRC_3_CRC06], [L2300_1_CRC_3_CRC07], [L2300_1_CRC_4_CRC01], [L2300_1_CRC_4_CRC02], [L2300_1_CRC_4_CRC03], [L2300_1_CRC_4_CRC04], [L2300_1_CRC_4_CRC05], [L2300_1_CRC_4_CRC06], [L2300_1_CRC_4_CRC07], [L2300_1_CRC_5_CRC01], [L2300_1_CRC_5_CRC02], [L2300_1_CRC_5_CRC03], [L2300_1_CRC_5_CRC04], [L2300_1_CRC_5_CRC05], [L2300_1_CRC_5_CRC06], [L2300_1_CRC_5_CRC07], [L2300_1_CRC_6_CRC01], [L2300_1_CRC_6_CRC02], [L2300_1_CRC_6_CRC03], [L2300_1_CRC_6_CRC04], [L2300_1_CRC_6_CRC05], [L2300_1_CRC_6_CRC06], [L2300_1_CRC_6_CRC07], [L2300_1_CRC_7_CRC01], [L2300_1_CRC_7_CRC02], [L2300_1_CRC_7_CRC03], [L2300_1_CRC_8_CRC01], [L2300_1_CRC_8_CRC02], [L2300_1_CRC_8_CRC03], [L2300_1_CRC_8_CRC04], [L2300_1_CRC_8_CRC05], [L2300_1_HI_1_HI01_01], [L2300_1_HI_1_HI01_02], [L2300_1_HI_1_HI02_01], [L2300_1_HI_1_HI02_02], [L2300_1_HI_1_HI03_01], [L2300_1_HI_1_HI03_02], [L2300_1_HI_1_HI04_01], [L2300_1_HI_1_HI04_02], [L2300_1_HI_1_HI05_01], [L2300_1_HI_1_HI05_02], [L2300_1_HI_1_HI06_01], [L2300_1_HI_1_HI06_02], [L2300_1_HI_1_HI07_01], [L2300_1_HI_1_HI07_02], [L2300_1_HI_1_HI08_01], [L2300_1_HI_1_HI08_02], [L2300_1_HI_1_HI09_01], [L2300_1_HI_1_HI09_02], [L2300_1_HI_1_HI10_01], [L2300_1_HI_1_HI10_02], [L2300_1_HI_1_HI11_01], [L2300_1_HI_1_HI11_02], [L2300_1_HI_1_HI12_01], [L2300_1_HI_1_HI12_02], [L2300_1_HI_2_HI01_01], [L2300_1_HI_2_HI01_02], [L2300_1_HI_2_HI02_01], [L2300_1_HI_2_HI02_02], [L2300_1_HI_2_HI03_01], [L2300_1_HI_2_HI03_02], [L2300_1_HI_2_HI04_01], [L2300_1_HI_2_HI04_02], [L2300_1_HI_2_HI05_01], [L2300_1_HI_2_HI05_02], [L2300_1_HI_2_HI06_01], [L2300_1_HI_2_HI06_02], [L2300_1_HI_2_HI07_01], [L2300_1_HI_2_HI07_02], [L2300_1_HI_2_HI08_01], [L2300_1_HI_2_HI08_02], [L2300_1_HI_2_HI09_01], [L2300_1_HI_2_HI09_02], [L2300_1_HI_2_HI10_01], [L2300_1_HI_2_HI10_02], [L2300_1_HI_2_HI11_01], [L2300_1_HI_2_HI11_02], [L2300_1_HI_2_HI12_01], [L2300_1_HI_2_HI12_02], [L2300_1_HI_3_HI01_01], [L2300_1_HI_3_HI01_02], [L2300_1_HI_3_HI02_01], [L2300_1_HI_3_HI02_02], [L2300_1_HI_3_HI03_01], [L2300_1_HI_3_HI03_02], [L2300_1_HI_3_HI04_01], [L2300_1_HI_3_HI04_02], [L2300_1_HI_3_HI05_01], [L2300_1_HI_3_HI05_02], [L2300_1_HI_3_HI06_01], [L2300_1_HI_3_HI06_02], [L2300_1_HI_3_HI07_01], [L2300_1_HI_3_HI07_02], [L2300_1_HI_3_HI08_01], [L2300_1_HI_3_HI08_02], [L2300_1_HI_3_HI09_01], [L2300_1_HI_3_HI09_02], [L2300_1_HI_3_HI10_01], [L2300_1_HI_3_HI10_02], [L2300_1_HI_3_HI11_01], [L2300_1_HI_3_HI11_02], [L2300_1_HI_3_HI12_01], [L2300_1_HI_3_HI12_02], [L2300_1_HI_4_HI01_01], [L2300_1_HI_4_HI01_02], [L2300_1_HI_4_HI02_01], [L2300_1_HI_4_HI02_02], [L2300_1_HI_4_HI03_01], [L2300_1_HI_4_HI03_02], [L2300_1_HI_4_HI04_01], [L2300_1_HI_4_HI04_02], [L2300_1_HI_4_HI05_01], [L2300_1_HI_4_HI05_02], [L2300_1_HI_4_HI06_01], [L2300_1_HI_4_HI06_02], [L2300_1_HI_4_HI07_01], [L2300_1_HI_4_HI07_02], [L2300_1_HI_4_HI08_01], [L2300_1_HI_4_HI08_02], [L2300_1_HI_4_HI09_01], [L2300_1_HI_4_HI09_02], [L2300_1_HI_4_HI10_01], [L2300_1_HI_4_HI10_02], [L2300_1_HI_4_HI11_01], [L2300_1_HI_4_HI11_02], [L2300_1_HI_4_HI12_01], [L2300_1_HI_4_HI12_02], [L2300_1_HCP_1_HCP01], [L2300_1_HCP_1_HCP02], [L2300_1_HCP_1_HCP03], [L2300_1_HCP_1_HCP04], [L2300_1_HCP_1_HCP05], [L2300_1_HCP_1_HCP06], [L2300_1_HCP_1_HCP07], [L2300_1_HCP_1_HCP13], [L2300_1_HCP_1_HCP14], [L2300_1_HCP_1_HCP15], [L2310A_1_NM1_1_NM101], [L2310A_1_NM1_1_NM102], [L2310A_1_NM1_1_NM103], [L2310A_1_NM1_1_NM104], [L2310A_1_NM1_1_NM105], [L2310A_1_NM1_1_NM107], [L2310A_1_NM1_1_NM108], [L2310A_1_NM1_1_NM109], [L2310A_1_REF_1_REF01], [L2310A_1_REF_1_REF02], [L2310A_1_REF_2_REF01], [L2310A_1_REF_2_REF02], [L2310A_1_REF_3_REF01], [L2310A_1_REF_3_REF02], [L2310A_2_NM1_1_NM101], [L2310A_2_NM1_1_NM102], [L2310A_2_NM1_1_NM103], [L2310A_2_NM1_1_NM104], [L2310A_2_NM1_1_NM105], [L2310A_2_NM1_1_NM107], [L2310A_2_NM1_1_NM108], [L2310A_2_NM1_1_NM109], [L2310A_2_REF_1_REF01], [L2310A_2_REF_1_REF02], [L2310A_2_REF_2_REF01], [L2310A_2_REF_2_REF02], [L2310A_2_REF_3_REF01], [L2310A_2_REF_3_REF02], [L2310B_1_NM1_1_NM101], [L2310B_1_NM1_1_NM102], [L2310B_1_NM1_1_NM103], [L2310B_1_NM1_1_NM104], [L2310B_1_NM1_1_NM105], [L2310B_1_NM1_1_NM107], [L2310B_1_NM1_1_NM108], [L2310B_1_NM1_1_NM109], [L2310B_1_PRV_1_PRV01], [L2310B_1_PRV_1_PRV02], [L2310B_1_PRV_1_PRV03], [L2310B_1_REF_1_REF01], [L2310B_1_REF_1_REF02], [L2310B_1_REF_2_REF01], [L2310B_1_REF_2_REF02], [L2310B_1_REF_3_REF01], [L2310B_1_REF_3_REF02], [L2310B_1_REF_4_REF01], [L2310B_1_REF_4_REF02], [L2310C_1_NM1_1_NM101], [L2310C_1_NM1_1_NM102], [L2310C_1_NM1_1_NM103], [L2310C_1_NM1_1_NM108], [L2310C_1_NM1_1_NM109], [L2310C_1_N3_1_N301], [L2310C_1_N3_1_N302], [L2310C_1_N4_1_N401], [L2310C_1_N4_1_N402], [L2310C_1_N4_1_N403], [L2310C_1_N4_1_N404], [L2310C_1_N4_1_N407], [L2310C_1_REF_1_REF01], [L2310C_1_REF_1_REF02], [L2310C_1_REF_2_REF01], [L2310C_1_REF_2_REF02], [L2310C_1_REF_3_REF01], [L2310C_1_REF_3_REF02], [L2310C_1_PER_1_PER01], [L2310C_1_PER_1_PER02], [L2310C_1_PER_1_PER03], [L2310C_1_PER_1_PER04], [L2310C_1_PER_1_PER05], [L2310C_1_PER_1_PER06], [L2310D_1_NM1_1_NM101], [L2310D_1_NM1_1_NM102], [L2310D_1_NM1_1_NM103], [L2310D_1_NM1_1_NM104], [L2310D_1_NM1_1_NM105], [L2310D_1_NM1_1_NM107], [L2310D_1_NM1_1_NM108], [L2310D_1_NM1_1_NM109], [L2310D_1_REF_1_REF01], [L2310D_1_REF_1_REF02], [L2310D_1_REF_2_REF01], [L2310D_1_REF_2_REF02], [L2310D_1_REF_3_REF01], [L2310D_1_REF_3_REF02], [L2310D_1_REF_4_REF01], [L2310D_1_REF_4_REF02], [L2310E_1_NM1_1_NM101], [L2310E_1_NM1_1_NM102], [L2310E_1_N3_1_N301], [L2310E_1_N3_1_N302], [L2310E_1_N4_1_N401], [L2310E_1_N4_1_N402], [L2310E_1_N4_1_N403], [L2310E_1_N4_1_N404], [L2310E_1_N4_1_N407], [L2310F_1_NM1_1_NM101], [L2310F_1_NM1_1_NM102], [L2310F_1_NM1_1_NM103], [L2310F_1_N3_1_N301], [L2310F_1_N3_1_N302], [L2310F_1_N4_1_N401], [L2310F_1_N4_1_N402], [L2310F_1_N4_1_N403], [L2310F_1_N4_1_N404], [L2310F_1_N4_1_N407]) VALUES (20556, N'178', N'987654', N'5', N'A37YH556', N'500', N'11', N'B', N'1', N'Y', N'A', N'Y', N'I', N'P', NULL, NULL, NULL, NULL, NULL, NULL, N'431', N'D8', N'20050108', N'454', N'D8', N'20050108', N'304', N'D8', N'20050108', N'453', N'D8', N'20050108', N'439', N'D8', N'20060108', N'484', N'D8', N'20050108', N'455', N'D8', N'20050108', N'471', N'D8', N'20050108', NULL, NULL, NULL, N'360', N'D8', N'20050108', NULL, NULL, NULL, N'297', N'D8', N'20050108', N'296', N'D8', N'20050108', N'435', N'D8', N'20030108', N'096', N'D8', N'20050108', N'090', N'D8', N'20050108', N'091', N'D8', N'20050108', N'444', N'D8', N'20041013', N'050', N'D8', N'20051030', N'03', N'BM', N'DMN0012', N'04', N'BM', N'DMN0012', N'05', N'BM', N'DMN0012', N'06', N'BM', N'DMN0012', N'07', N'BM', N'DMN0012', N'08', N'BM', N'DMN0012', N'09', N'BM', N'DMN0012', N'10', N'BM', N'DMN0012', N'11', N'BM', N'DMN0012', N'12', N'BM', N'DMN0012', N'02', N'550', NULL, NULL, NULL, NULL, N'F5', N'152.45', N'4N', N'1', N'F5', N'N', N'EW', N'T554', N'9F', N'12345', N'G1', N'13579', N'F8', N'R555588', N'X4', N'12D4567890', N'9A', N'RJ55555', N'9C', N'RP44444444', N'LX', N'432907', N'D9', N'TJ98UU321', N'EA', N'44444TH56', N'P4', N'THJ1222', N'1J', N'12345678', N'STATE DATA REQUIREMENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'ADD', N'SURGERY WAS UNUSUALLY LONG BECAUSE [FILL IN REASON]', N'LB', N'140', N'A', N'DH', N'12', N'', N'UNCONSCIOUS', N'M', NULL, NULL, N'07', N'Y', N'01', NULL, NULL, NULL, NULL, N'E1', N'Y', N'L1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'75', N'Y', N'IH', N'ZZ', N'Y', N'ST', NULL, NULL, N'BK', N'8901', N'BF', N'87200', N'BF', N'5559', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'BP', N'33414', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'BG', N'17', N'BG', N'67', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'03', N'100', N'10', N'RPO12345', NULL, NULL, NULL, NULL, NULL, NULL, N'DN', N'1', N'WELBY', N'MARCUS', N'W', N'JR', N'XX', N'1234567891', N'0B', N'0B12345', N'1G', N'1G12345', N'G2', N'G212345', N'P3', N'1', N'WELBY', N'MARCUS', N'W', N'JR', N'XX', N'1234567891', N'0B', N'0B12345', N'1G', N'1G12345', N'G2', N'G212345', N'82', N'1', N'DOE', N'JANE', N'C', N'', N'XX', N'1234567804', N'PE', N'PXC', N'1223G0001X', N'0B', N'12345', N'1G', N'12345', N'G2', N'12345', N'LU', N'12345', N'77', N'2', N'ABC CLINIC', N'XX', N'1234567891', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'0B', N'12345', N'G2', N'12345', NULL, NULL, N'IC', N'JOHN SMITH', N'TE', N'5555551234', N'EX', N'123', N'DQ', N'1', N'DOE', N'JOHN', N'B', N'', N'XX', N'1234567891', N'0B', N'12345', N'1G', N'12345', N'G2', N'12345', N'LU', N'12345', N'PW', N'2', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'45', N'2', NULL, N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL)
SET IDENTITY_INSERT [dbo].[EDI_837P_claim] OFF
/****** Object:  Table [dbo].[EDI_837P_BillingProvider]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EDI_837P_BillingProvider](
	[Fileid] [varchar](30) NOT NULL,
	[HeaderID] [varchar](30) NOT NULL,
	[L2000A_1_HL_1_HL01] [varchar](12) NULL,
	[L2000A_1_HL_1_HL03] [varchar](2) NULL,
	[L2000A_1_HL_1_HL04] [varchar](1) NULL,
	[L2000A_1_PRV_1_PRV01] [varchar](3) NULL,
	[L2000A_1_PRV_1_PRV02] [varchar](3) NULL,
	[L2000A_1_PRV_1_PRV03] [varchar](50) NULL,
	[L2000A_1_CUR_1_CUR01] [varchar](3) NULL,
	[L2000A_1_CUR_1_CUR02] [varchar](3) NULL,
	[L2010AA_1_NM1_1_NM101] [varchar](3) NULL,
	[L2010AA_1_NM1_1_NM102] [varchar](1) NULL,
	[L2010AA_1_NM1_1_NM103] [varchar](60) NULL,
	[L2010AA_1_NM1_1_NM104] [varchar](35) NULL,
	[L2010AA_1_NM1_1_NM105] [varchar](25) NULL,
	[L2010AA_1_NM1_1_NM107] [varchar](10) NULL,
	[L2010AA_1_NM1_1_NM108] [varchar](2) NULL,
	[L2010AA_1_NM1_1_NM109] [varchar](80) NULL,
	[L2010AA_1_N3_1_N301] [varchar](55) NULL,
	[L2010AA_1_N3_1_N302] [varchar](55) NULL,
	[L2010AA_1_N4_1_N401] [varchar](30) NULL,
	[L2010AA_1_N4_1_N402] [varchar](2) NULL,
	[L2010AA_1_N4_1_N403] [varchar](15) NULL,
	[L2010AA_1_N4_1_N404] [varchar](3) NULL,
	[L2010AA_1_N4_1_N407] [varchar](3) NULL,
	[L2010AA_1_REF_1_REF01] [varchar](3) NULL,
	[L2010AA_1_REF_1_REF02] [varchar](50) NULL,
	[L2010AA_1_REF_2_REF01] [varchar](3) NULL,
	[L2010AA_1_REF_2_REF02] [varchar](50) NULL,
	[L2010AA_1_REF_3_REF01] [varchar](3) NULL,
	[L2010AA_1_REF_3_REF02] [varchar](50) NULL,
	[L2010AA_1_REF_4_REF01] [varchar](3) NULL,
	[L2010AA_1_REF_4_REF02] [varchar](50) NULL,
	[L2010AA_1_PER_1_PER01] [varchar](2) NULL,
	[L2010AA_1_PER_1_PER02] [varchar](60) NULL,
	[L2010AA_1_PER_1_PER03] [varchar](2) NULL,
	[L2010AA_1_PER_1_PER04] [varchar](256) NULL,
	[L2010AA_1_PER_1_PER05] [varchar](2) NULL,
	[L2010AA_1_PER_1_PER06] [varchar](256) NULL,
	[L2010AA_1_PER_1_PER07] [varchar](2) NULL,
	[L2010AA_1_PER_1_PER08] [varchar](256) NULL,
	[L2010AA_1_PER_2_PER01] [varchar](2) NULL,
	[L2010AA_1_PER_2_PER02] [varchar](60) NULL,
	[L2010AA_1_PER_2_PER03] [varchar](2) NULL,
	[L2010AA_1_PER_2_PER04] [varchar](256) NULL,
	[L2010AA_1_PER_2_PER05] [varchar](2) NULL,
	[L2010AA_1_PER_2_PER06] [varchar](256) NULL,
	[L2010AA_1_PER_2_PER07] [varchar](2) NULL,
	[L2010AA_1_PER_2_PER08] [varchar](256) NULL,
	[L2010AB_1_NM1_1_NM101] [varchar](3) NULL,
	[L2010AB_1_NM1_1_NM102] [varchar](1) NULL,
	[L2010AB_1_N3_1_N301] [varchar](55) NULL,
	[L2010AB_1_N3_1_N302] [varchar](55) NULL,
	[L2010AB_1_N4_1_N401] [varchar](30) NULL,
	[L2010AB_1_N4_1_N402] [varchar](2) NULL,
	[L2010AB_1_N4_1_N403] [varchar](15) NULL,
	[L2010AB_1_N4_1_N404] [varchar](3) NULL,
	[L2010AB_1_N4_1_N407] [varchar](3) NULL,
	[L2010AC_1_NM1_1_NM101] [varchar](3) NULL,
	[L2010AC_1_NM1_1_NM102] [varchar](1) NULL,
	[L2010AC_1_NM1_1_NM103] [varchar](60) NULL,
	[L2010AC_1_NM1_1_NM108] [varchar](2) NULL,
	[L2010AC_1_NM1_1_NM109] [varchar](80) NULL,
	[L2010AC_1_N3_1_N301] [varchar](55) NULL,
	[L2010AC_1_N3_1_N302] [varchar](55) NULL,
	[L2010AC_1_N4_1_N401] [varchar](30) NULL,
	[L2010AC_1_N4_1_N402] [varchar](2) NULL,
	[L2010AC_1_N4_1_N403] [varchar](15) NULL,
	[L2010AC_1_N4_1_N404] [varchar](3) NULL,
	[L2010AC_1_N4_1_N407] [varchar](3) NULL,
	[L2010AC_1_REF_1_REF01] [varchar](3) NULL,
	[L2010AC_1_REF_1_REF02] [varchar](50) NULL,
	[L2010AC_1_REF_2_REF01] [varchar](3) NULL,
	[L2010AC_1_REF_2_REF02] [varchar](50) NULL,
	[L2010AC_1_REF_3_REF01] [varchar](3) NULL,
	[L2010AC_1_REF_3_REF02] [varchar](50) NULL,
	[L2010AC_1_REF_4_REF01] [varchar](3) NULL,
	[L2010AC_1_REF_4_REF02] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[EDI_837P_BillingProvider] ([Fileid], [HeaderID], [L2000A_1_HL_1_HL01], [L2000A_1_HL_1_HL03], [L2000A_1_HL_1_HL04], [L2000A_1_PRV_1_PRV01], [L2000A_1_PRV_1_PRV02], [L2000A_1_PRV_1_PRV03], [L2000A_1_CUR_1_CUR01], [L2000A_1_CUR_1_CUR02], [L2010AA_1_NM1_1_NM101], [L2010AA_1_NM1_1_NM102], [L2010AA_1_NM1_1_NM103], [L2010AA_1_NM1_1_NM104], [L2010AA_1_NM1_1_NM105], [L2010AA_1_NM1_1_NM107], [L2010AA_1_NM1_1_NM108], [L2010AA_1_NM1_1_NM109], [L2010AA_1_N3_1_N301], [L2010AA_1_N3_1_N302], [L2010AA_1_N4_1_N401], [L2010AA_1_N4_1_N402], [L2010AA_1_N4_1_N403], [L2010AA_1_N4_1_N404], [L2010AA_1_N4_1_N407], [L2010AA_1_REF_1_REF01], [L2010AA_1_REF_1_REF02], [L2010AA_1_REF_2_REF01], [L2010AA_1_REF_2_REF02], [L2010AA_1_REF_3_REF01], [L2010AA_1_REF_3_REF02], [L2010AA_1_REF_4_REF01], [L2010AA_1_REF_4_REF02], [L2010AA_1_PER_1_PER01], [L2010AA_1_PER_1_PER02], [L2010AA_1_PER_1_PER03], [L2010AA_1_PER_1_PER04], [L2010AA_1_PER_1_PER05], [L2010AA_1_PER_1_PER06], [L2010AA_1_PER_1_PER07], [L2010AA_1_PER_1_PER08], [L2010AA_1_PER_2_PER01], [L2010AA_1_PER_2_PER02], [L2010AA_1_PER_2_PER03], [L2010AA_1_PER_2_PER04], [L2010AA_1_PER_2_PER05], [L2010AA_1_PER_2_PER06], [L2010AA_1_PER_2_PER07], [L2010AA_1_PER_2_PER08], [L2010AB_1_NM1_1_NM101], [L2010AB_1_NM1_1_NM102], [L2010AB_1_N3_1_N301], [L2010AB_1_N3_1_N302], [L2010AB_1_N4_1_N401], [L2010AB_1_N4_1_N402], [L2010AB_1_N4_1_N403], [L2010AB_1_N4_1_N404], [L2010AB_1_N4_1_N407], [L2010AC_1_NM1_1_NM101], [L2010AC_1_NM1_1_NM102], [L2010AC_1_NM1_1_NM103], [L2010AC_1_NM1_1_NM108], [L2010AC_1_NM1_1_NM109], [L2010AC_1_N3_1_N301], [L2010AC_1_N3_1_N302], [L2010AC_1_N4_1_N401], [L2010AC_1_N4_1_N402], [L2010AC_1_N4_1_N403], [L2010AC_1_N4_1_N404], [L2010AC_1_N4_1_N407], [L2010AC_1_REF_1_REF01], [L2010AC_1_REF_1_REF02], [L2010AC_1_REF_2_REF01], [L2010AC_1_REF_2_REF02], [L2010AC_1_REF_3_REF01], [L2010AC_1_REF_3_REF02], [L2010AC_1_REF_4_REF01], [L2010AC_1_REF_4_REF02]) VALUES (N'178', N'987654', N'1', N'20', N'1', N'BI', N'PXC', N'207Q00000X', N'85', N'CAD', N'85', N'2', N'ABC Group Practice', N'', N'', N'', N'XX', N'1234567890', N'123 MAIN STREET', N'456 SIDE STREET', N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'EI', N'EI123456789', NULL, NULL, N'0B', N'0B654321', N'1G', N'1G654321', N'IC', N'JOHN SMITH', N'TE', N'5555551234', N'EX', N'123', N'FX', N'5555551234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'87', N'2', N'123 MAIN STREET', N'456 SIDE STREET', N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'PE', N'2', N'ANY STATE MEDICAID', N'PI', N'12345', N'123 MAIN STREET', N'456 SIDE STREET', N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'2U', N'98765', NULL, NULL, NULL, NULL, N'EI', N'123456789')
/****** Object:  Table [dbo].[EDI_837P_2320_OtherSubscriber]    Script Date: 03/06/2021 17:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EDI_837P_2320_OtherSubscriber](
	[claimid] [int] NULL,
	[Fileid] [varchar](30) NOT NULL,
	[HeaderID] [varchar](30) NOT NULL,
	[subscriber_patientid] [varchar](12) NULL,
	[L2320_1_SBR_1_SBR01] [varchar](1) NULL,
	[L2320_1_SBR_1_SBR02] [varchar](2) NULL,
	[L2320_1_SBR_1_SBR03] [varchar](50) NULL,
	[L2320_1_SBR_1_SBR04] [varchar](60) NULL,
	[L2320_1_SBR_1_SBR05] [varchar](3) NULL,
	[L2320_1_SBR_1_SBR09] [varchar](2) NULL,
	[L2320_1_CAS_1_CAS01] [varchar](2) NULL,
	[L2320_1_CAS_1_CAS02] [varchar](5) NULL,
	[L2320_1_CAS_1_CAS03] [varchar](18) NULL,
	[L2320_1_CAS_1_CAS04] [varchar](15) NULL,
	[L2320_1_CAS_1_CAS05] [varchar](5) NULL,
	[L2320_1_CAS_1_CAS06] [varchar](18) NULL,
	[L2320_1_CAS_1_CAS07] [varchar](15) NULL,
	[L2320_1_CAS_1_CAS08] [varchar](5) NULL,
	[L2320_1_CAS_1_CAS09] [varchar](18) NULL,
	[L2320_1_CAS_1_CAS10] [varchar](15) NULL,
	[L2320_1_CAS_1_CAS11] [varchar](5) NULL,
	[L2320_1_CAS_1_CAS12] [varchar](18) NULL,
	[L2320_1_CAS_1_CAS13] [varchar](15) NULL,
	[L2320_1_CAS_1_CAS14] [varchar](5) NULL,
	[L2320_1_CAS_1_CAS15] [varchar](18) NULL,
	[L2320_1_CAS_1_CAS16] [varchar](5) NULL,
	[L2320_1_CAS_1_CAS17] [varchar](5) NULL,
	[L2320_1_CAS_1_CAS18] [varchar](18) NULL,
	[L2320_1_CAS_1_CAS19] [varchar](15) NULL,
	[L2320_1_CAS_2_CAS01] [varchar](2) NULL,
	[L2320_1_CAS_2_CAS02] [varchar](5) NULL,
	[L2320_1_CAS_2_CAS03] [varchar](18) NULL,
	[L2320_1_CAS_2_CAS04] [varchar](15) NULL,
	[L2320_1_CAS_2_CAS05] [varchar](5) NULL,
	[L2320_1_CAS_2_CAS06] [varchar](18) NULL,
	[L2320_1_CAS_2_CAS07] [varchar](15) NULL,
	[L2320_1_CAS_2_CAS08] [varchar](5) NULL,
	[L2320_1_CAS_2_CAS09] [varchar](18) NULL,
	[L2320_1_CAS_2_CAS10] [varchar](15) NULL,
	[L2320_1_CAS_2_CAS11] [varchar](5) NULL,
	[L2320_1_CAS_2_CAS12] [varchar](18) NULL,
	[L2320_1_CAS_2_CAS13] [varchar](15) NULL,
	[L2320_1_CAS_2_CAS14] [varchar](5) NULL,
	[L2320_1_CAS_2_CAS15] [varchar](18) NULL,
	[L2320_1_CAS_2_CAS16] [varchar](5) NULL,
	[L2320_1_CAS_2_CAS17] [varchar](5) NULL,
	[L2320_1_CAS_2_CAS18] [varchar](18) NULL,
	[L2320_1_CAS_2_CAS19] [varchar](15) NULL,
	[L2320_1_CAS_3_CAS01] [varchar](2) NULL,
	[L2320_1_CAS_3_CAS02] [varchar](5) NULL,
	[L2320_1_CAS_3_CAS03] [varchar](18) NULL,
	[L2320_1_CAS_3_CAS04] [varchar](15) NULL,
	[L2320_1_CAS_3_CAS05] [varchar](5) NULL,
	[L2320_1_CAS_3_CAS06] [varchar](18) NULL,
	[L2320_1_CAS_3_CAS07] [varchar](15) NULL,
	[L2320_1_CAS_3_CAS08] [varchar](5) NULL,
	[L2320_1_CAS_3_CAS09] [varchar](18) NULL,
	[L2320_1_CAS_3_CAS10] [varchar](15) NULL,
	[L2320_1_CAS_3_CAS11] [varchar](5) NULL,
	[L2320_1_CAS_3_CAS12] [varchar](18) NULL,
	[L2320_1_CAS_3_CAS13] [varchar](15) NULL,
	[L2320_1_CAS_3_CAS14] [varchar](5) NULL,
	[L2320_1_CAS_3_CAS15] [varchar](18) NULL,
	[L2320_1_CAS_3_CAS16] [varchar](5) NULL,
	[L2320_1_CAS_3_CAS17] [varchar](5) NULL,
	[L2320_1_CAS_3_CAS18] [varchar](18) NULL,
	[L2320_1_CAS_3_CAS19] [varchar](15) NULL,
	[L2320_1_CAS_4_CAS01] [varchar](2) NULL,
	[L2320_1_CAS_4_CAS02] [varchar](5) NULL,
	[L2320_1_CAS_4_CAS03] [varchar](18) NULL,
	[L2320_1_CAS_4_CAS04] [varchar](15) NULL,
	[L2320_1_CAS_4_CAS05] [varchar](5) NULL,
	[L2320_1_CAS_4_CAS06] [varchar](18) NULL,
	[L2320_1_CAS_4_CAS07] [varchar](15) NULL,
	[L2320_1_CAS_4_CAS08] [varchar](5) NULL,
	[L2320_1_CAS_4_CAS09] [varchar](18) NULL,
	[L2320_1_CAS_4_CAS10] [varchar](15) NULL,
	[L2320_1_CAS_4_CAS11] [varchar](5) NULL,
	[L2320_1_CAS_4_CAS12] [varchar](18) NULL,
	[L2320_1_CAS_4_CAS13] [varchar](15) NULL,
	[L2320_1_CAS_4_CAS14] [varchar](5) NULL,
	[L2320_1_CAS_4_CAS15] [varchar](18) NULL,
	[L2320_1_CAS_4_CAS16] [varchar](5) NULL,
	[L2320_1_CAS_4_CAS17] [varchar](5) NULL,
	[L2320_1_CAS_4_CAS18] [varchar](18) NULL,
	[L2320_1_CAS_4_CAS19] [varchar](15) NULL,
	[L2320_1_CAS_5_CAS01] [varchar](2) NULL,
	[L2320_1_CAS_5_CAS02] [varchar](5) NULL,
	[L2320_1_CAS_5_CAS03] [varchar](18) NULL,
	[L2320_1_CAS_5_CAS04] [varchar](15) NULL,
	[L2320_1_CAS_5_CAS05] [varchar](5) NULL,
	[L2320_1_CAS_5_CAS06] [varchar](18) NULL,
	[L2320_1_CAS_5_CAS07] [varchar](15) NULL,
	[L2320_1_CAS_5_CAS08] [varchar](5) NULL,
	[L2320_1_CAS_5_CAS09] [varchar](18) NULL,
	[L2320_1_CAS_5_CAS10] [varchar](15) NULL,
	[L2320_1_CAS_5_CAS11] [varchar](5) NULL,
	[L2320_1_CAS_5_CAS12] [varchar](18) NULL,
	[L2320_1_CAS_5_CAS13] [varchar](15) NULL,
	[L2320_1_CAS_5_CAS14] [varchar](5) NULL,
	[L2320_1_CAS_5_CAS15] [varchar](18) NULL,
	[L2320_1_CAS_5_CAS16] [varchar](5) NULL,
	[L2320_1_CAS_5_CAS17] [varchar](5) NULL,
	[L2320_1_CAS_5_CAS18] [varchar](18) NULL,
	[L2320_1_CAS_5_CAS19] [varchar](15) NULL,
	[L2320_1_AMT_1_AMT01] [varchar](3) NULL,
	[L2320_1_AMT_1_AMT02] [varchar](18) NULL,
	[L2320_1_AMT_2_AMT01] [varchar](3) NULL,
	[L2320_1_AMT_2_AMT02] [varchar](18) NULL,
	[L2320_1_AMT_3_AMT01] [varchar](3) NULL,
	[L2320_1_AMT_3_AMT02] [varchar](18) NULL,
	[L2320_1_OI_1_OI03] [varchar](1) NULL,
	[L2320_1_OI_1_OI04] [varchar](1) NULL,
	[L2320_1_OI_1_OI06] [varchar](1) NULL,
	[L2320_1_MOA_1_MOA01] [varchar](10) NULL,
	[L2320_1_MOA_1_MOA02] [varchar](18) NULL,
	[L2320_1_MOA_1_MOA03] [varchar](50) NULL,
	[L2320_1_MOA_1_MOA04] [varchar](50) NULL,
	[L2320_1_MOA_1_MOA05] [varchar](50) NULL,
	[L2320_1_MOA_1_MOA06] [varchar](50) NULL,
	[L2320_1_MOA_1_MOA07] [varchar](50) NULL,
	[L2320_1_MOA_1_MOA08] [varchar](18) NULL,
	[L2320_1_MOA_1_MOA09] [varchar](18) NULL,
	[L2330A_1_NM1_1_NM101] [varchar](3) NULL,
	[L2330A_1_NM1_1_NM102] [varchar](1) NULL,
	[L2330A_1_NM1_1_NM103] [varchar](60) NULL,
	[L2330A_1_NM1_1_NM104] [varchar](35) NULL,
	[L2330A_1_NM1_1_NM105] [varchar](25) NULL,
	[L2330A_1_NM1_1_NM107] [varchar](10) NULL,
	[L2330A_1_NM1_1_NM108] [varchar](2) NULL,
	[L2330A_1_NM1_1_NM109] [varchar](80) NULL,
	[L2330A_1_N3_1_N301] [varchar](55) NULL,
	[L2330A_1_N3_1_N302] [varchar](55) NULL,
	[L2330A_1_N4_1_N401] [varchar](30) NULL,
	[L2330A_1_N4_1_N402] [varchar](2) NULL,
	[L2330A_1_N4_1_N403] [varchar](15) NULL,
	[L2330A_1_N4_1_N404] [varchar](3) NULL,
	[L2330A_1_N4_1_N407] [varchar](3) NULL,
	[L2330A_1_REF_1_REF01] [varchar](3) NULL,
	[L2330A_1_REF_1_REF02] [varchar](50) NULL,
	[L2330B_1_NM1_1_NM101] [varchar](3) NULL,
	[L2330B_1_NM1_1_NM102] [varchar](1) NULL,
	[L2330B_1_NM1_1_NM103] [varchar](60) NULL,
	[L2330B_1_NM1_1_NM108] [varchar](2) NULL,
	[L2330B_1_NM1_1_NM109] [varchar](80) NULL,
	[L2330B_1_N3_1_N301] [varchar](55) NULL,
	[L2330B_1_N3_1_N302] [varchar](55) NULL,
	[L2330B_1_N4_1_N401] [varchar](30) NULL,
	[L2330B_1_N4_1_N402] [varchar](2) NULL,
	[L2330B_1_N4_1_N403] [varchar](15) NULL,
	[L2330B_1_N4_1_N404] [varchar](3) NULL,
	[L2330B_1_N4_1_N407] [varchar](3) NULL,
	[L2330B_1_DTP_1_DTP01] [varchar](3) NULL,
	[L2330B_1_DTP_1_DTP02] [varchar](3) NULL,
	[L2330B_1_DTP_1_DTP03] [varchar](35) NULL,
	[L2330B_1_REF_1_REF01] [varchar](3) NULL,
	[L2330B_1_REF_1_REF02] [varchar](50) NULL,
	[L2330B_1_REF_2_REF01] [varchar](3) NULL,
	[L2330B_1_REF_2_REF02] [varchar](50) NULL,
	[L2330B_1_REF_3_REF01] [varchar](3) NULL,
	[L2330B_1_REF_3_REF02] [varchar](50) NULL,
	[L2330B_1_REF_4_REF01] [varchar](3) NULL,
	[L2330B_1_REF_4_REF02] [varchar](50) NULL,
	[L2330B_1_REF_5_REF01] [varchar](3) NULL,
	[L2330B_1_REF_5_REF02] [varchar](50) NULL,
	[L2330B_1_REF_6_REF01] [varchar](3) NULL,
	[L2330B_1_REF_6_REF02] [varchar](50) NULL,
	[L2330B_1_REF_7_REF01] [varchar](3) NULL,
	[L2330B_1_REF_7_REF02] [varchar](50) NULL,
	[L2330B_1_REF_8_REF01] [varchar](3) NULL,
	[L2330B_1_REF_8_REF02] [varchar](50) NULL,
	[L2330C_1_NM1_1_NM101] [varchar](3) NULL,
	[L2330C_1_NM1_1_NM102] [varchar](1) NULL,
	[L2330C_1_REF_1_REF01] [varchar](3) NULL,
	[L2330C_1_REF_1_REF02] [varchar](50) NULL,
	[L2330C_1_REF_2_REF01] [varchar](3) NULL,
	[L2330C_1_REF_2_REF02] [varchar](50) NULL,
	[L2330C_1_REF_3_REF01] [varchar](3) NULL,
	[L2330C_1_REF_3_REF02] [varchar](50) NULL,
	[L2330D_1_NM1_1_NM101] [varchar](3) NULL,
	[L2330D_1_NM1_1_NM102] [varchar](1) NULL,
	[L2330D_1_REF_1_REF01] [varchar](3) NULL,
	[L2330D_1_REF_1_REF02] [varchar](50) NULL,
	[L2330D_1_REF_2_REF01] [varchar](3) NULL,
	[L2330D_1_REF_2_REF02] [varchar](50) NULL,
	[L2330D_1_REF_3_REF01] [varchar](3) NULL,
	[L2330D_1_REF_3_REF02] [varchar](50) NULL,
	[L2330D_1_REF_4_REF01] [varchar](3) NULL,
	[L2330D_1_REF_4_REF02] [varchar](50) NULL,
	[L2330E_1_NM1_1_NM101] [varchar](3) NULL,
	[L2330E_1_NM1_1_NM102] [varchar](1) NULL,
	[L2330E_1_REF_1_REF01] [varchar](3) NULL,
	[L2330E_1_REF_1_REF02] [varchar](50) NULL,
	[L2330E_1_REF_2_REF01] [varchar](3) NULL,
	[L2330E_1_REF_2_REF02] [varchar](50) NULL,
	[L2330E_1_REF_3_REF01] [varchar](3) NULL,
	[L2330E_1_REF_3_REF02] [varchar](50) NULL,
	[L2330F_1_NM1_1_NM101] [varchar](3) NULL,
	[L2330F_1_NM1_1_NM102] [varchar](1) NULL,
	[L2330F_1_REF_1_REF01] [varchar](3) NULL,
	[L2330F_1_REF_1_REF02] [varchar](50) NULL,
	[L2330F_1_REF_2_REF01] [varchar](3) NULL,
	[L2330F_1_REF_2_REF02] [varchar](50) NULL,
	[L2330F_1_REF_3_REF01] [varchar](3) NULL,
	[L2330F_1_REF_3_REF02] [varchar](50) NULL,
	[L2330F_1_REF_4_REF01] [varchar](3) NULL,
	[L2330F_1_REF_4_REF02] [varchar](50) NULL,
	[L2330G_1_NM1_1_NM101] [varchar](3) NULL,
	[L2330G_1_NM1_1_NM102] [varchar](1) NULL,
	[L2330G_1_REF_1_REF01] [varchar](3) NULL,
	[L2330G_1_REF_1_REF02] [varchar](50) NULL,
	[L2330G_1_REF_2_REF01] [varchar](3) NULL,
	[L2330G_1_REF_2_REF02] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[EDI_837P_2320_OtherSubscriber] ([claimid], [Fileid], [HeaderID], [subscriber_patientid], [L2320_1_SBR_1_SBR01], [L2320_1_SBR_1_SBR02], [L2320_1_SBR_1_SBR03], [L2320_1_SBR_1_SBR04], [L2320_1_SBR_1_SBR05], [L2320_1_SBR_1_SBR09], [L2320_1_CAS_1_CAS01], [L2320_1_CAS_1_CAS02], [L2320_1_CAS_1_CAS03], [L2320_1_CAS_1_CAS04], [L2320_1_CAS_1_CAS05], [L2320_1_CAS_1_CAS06], [L2320_1_CAS_1_CAS07], [L2320_1_CAS_1_CAS08], [L2320_1_CAS_1_CAS09], [L2320_1_CAS_1_CAS10], [L2320_1_CAS_1_CAS11], [L2320_1_CAS_1_CAS12], [L2320_1_CAS_1_CAS13], [L2320_1_CAS_1_CAS14], [L2320_1_CAS_1_CAS15], [L2320_1_CAS_1_CAS16], [L2320_1_CAS_1_CAS17], [L2320_1_CAS_1_CAS18], [L2320_1_CAS_1_CAS19], [L2320_1_CAS_2_CAS01], [L2320_1_CAS_2_CAS02], [L2320_1_CAS_2_CAS03], [L2320_1_CAS_2_CAS04], [L2320_1_CAS_2_CAS05], [L2320_1_CAS_2_CAS06], [L2320_1_CAS_2_CAS07], [L2320_1_CAS_2_CAS08], [L2320_1_CAS_2_CAS09], [L2320_1_CAS_2_CAS10], [L2320_1_CAS_2_CAS11], [L2320_1_CAS_2_CAS12], [L2320_1_CAS_2_CAS13], [L2320_1_CAS_2_CAS14], [L2320_1_CAS_2_CAS15], [L2320_1_CAS_2_CAS16], [L2320_1_CAS_2_CAS17], [L2320_1_CAS_2_CAS18], [L2320_1_CAS_2_CAS19], [L2320_1_CAS_3_CAS01], [L2320_1_CAS_3_CAS02], [L2320_1_CAS_3_CAS03], [L2320_1_CAS_3_CAS04], [L2320_1_CAS_3_CAS05], [L2320_1_CAS_3_CAS06], [L2320_1_CAS_3_CAS07], [L2320_1_CAS_3_CAS08], [L2320_1_CAS_3_CAS09], [L2320_1_CAS_3_CAS10], [L2320_1_CAS_3_CAS11], [L2320_1_CAS_3_CAS12], [L2320_1_CAS_3_CAS13], [L2320_1_CAS_3_CAS14], [L2320_1_CAS_3_CAS15], [L2320_1_CAS_3_CAS16], [L2320_1_CAS_3_CAS17], [L2320_1_CAS_3_CAS18], [L2320_1_CAS_3_CAS19], [L2320_1_CAS_4_CAS01], [L2320_1_CAS_4_CAS02], [L2320_1_CAS_4_CAS03], [L2320_1_CAS_4_CAS04], [L2320_1_CAS_4_CAS05], [L2320_1_CAS_4_CAS06], [L2320_1_CAS_4_CAS07], [L2320_1_CAS_4_CAS08], [L2320_1_CAS_4_CAS09], [L2320_1_CAS_4_CAS10], [L2320_1_CAS_4_CAS11], [L2320_1_CAS_4_CAS12], [L2320_1_CAS_4_CAS13], [L2320_1_CAS_4_CAS14], [L2320_1_CAS_4_CAS15], [L2320_1_CAS_4_CAS16], [L2320_1_CAS_4_CAS17], [L2320_1_CAS_4_CAS18], [L2320_1_CAS_4_CAS19], [L2320_1_CAS_5_CAS01], [L2320_1_CAS_5_CAS02], [L2320_1_CAS_5_CAS03], [L2320_1_CAS_5_CAS04], [L2320_1_CAS_5_CAS05], [L2320_1_CAS_5_CAS06], [L2320_1_CAS_5_CAS07], [L2320_1_CAS_5_CAS08], [L2320_1_CAS_5_CAS09], [L2320_1_CAS_5_CAS10], [L2320_1_CAS_5_CAS11], [L2320_1_CAS_5_CAS12], [L2320_1_CAS_5_CAS13], [L2320_1_CAS_5_CAS14], [L2320_1_CAS_5_CAS15], [L2320_1_CAS_5_CAS16], [L2320_1_CAS_5_CAS17], [L2320_1_CAS_5_CAS18], [L2320_1_CAS_5_CAS19], [L2320_1_AMT_1_AMT01], [L2320_1_AMT_1_AMT02], [L2320_1_AMT_2_AMT01], [L2320_1_AMT_2_AMT02], [L2320_1_AMT_3_AMT01], [L2320_1_AMT_3_AMT02], [L2320_1_OI_1_OI03], [L2320_1_OI_1_OI04], [L2320_1_OI_1_OI06], [L2320_1_MOA_1_MOA01], [L2320_1_MOA_1_MOA02], [L2320_1_MOA_1_MOA03], [L2320_1_MOA_1_MOA04], [L2320_1_MOA_1_MOA05], [L2320_1_MOA_1_MOA06], [L2320_1_MOA_1_MOA07], [L2320_1_MOA_1_MOA08], [L2320_1_MOA_1_MOA09], [L2330A_1_NM1_1_NM101], [L2330A_1_NM1_1_NM102], [L2330A_1_NM1_1_NM103], [L2330A_1_NM1_1_NM104], [L2330A_1_NM1_1_NM105], [L2330A_1_NM1_1_NM107], [L2330A_1_NM1_1_NM108], [L2330A_1_NM1_1_NM109], [L2330A_1_N3_1_N301], [L2330A_1_N3_1_N302], [L2330A_1_N4_1_N401], [L2330A_1_N4_1_N402], [L2330A_1_N4_1_N403], [L2330A_1_N4_1_N404], [L2330A_1_N4_1_N407], [L2330A_1_REF_1_REF01], [L2330A_1_REF_1_REF02], [L2330B_1_NM1_1_NM101], [L2330B_1_NM1_1_NM102], [L2330B_1_NM1_1_NM103], [L2330B_1_NM1_1_NM108], [L2330B_1_NM1_1_NM109], [L2330B_1_N3_1_N301], [L2330B_1_N3_1_N302], [L2330B_1_N4_1_N401], [L2330B_1_N4_1_N402], [L2330B_1_N4_1_N403], [L2330B_1_N4_1_N404], [L2330B_1_N4_1_N407], [L2330B_1_DTP_1_DTP01], [L2330B_1_DTP_1_DTP02], [L2330B_1_DTP_1_DTP03], [L2330B_1_REF_1_REF01], [L2330B_1_REF_1_REF02], [L2330B_1_REF_2_REF01], [L2330B_1_REF_2_REF02], [L2330B_1_REF_3_REF01], [L2330B_1_REF_3_REF02], [L2330B_1_REF_4_REF01], [L2330B_1_REF_4_REF02], [L2330B_1_REF_5_REF01], [L2330B_1_REF_5_REF02], [L2330B_1_REF_6_REF01], [L2330B_1_REF_6_REF02], [L2330B_1_REF_7_REF01], [L2330B_1_REF_7_REF02], [L2330B_1_REF_8_REF01], [L2330B_1_REF_8_REF02], [L2330C_1_NM1_1_NM101], [L2330C_1_NM1_1_NM102], [L2330C_1_REF_1_REF01], [L2330C_1_REF_1_REF02], [L2330C_1_REF_2_REF01], [L2330C_1_REF_2_REF02], [L2330C_1_REF_3_REF01], [L2330C_1_REF_3_REF02], [L2330D_1_NM1_1_NM101], [L2330D_1_NM1_1_NM102], [L2330D_1_REF_1_REF01], [L2330D_1_REF_1_REF02], [L2330D_1_REF_2_REF01], [L2330D_1_REF_2_REF02], [L2330D_1_REF_3_REF01], [L2330D_1_REF_3_REF02], [L2330D_1_REF_4_REF01], [L2330D_1_REF_4_REF02], [L2330E_1_NM1_1_NM101], [L2330E_1_NM1_1_NM102], [L2330E_1_REF_1_REF01], [L2330E_1_REF_1_REF02], [L2330E_1_REF_2_REF01], [L2330E_1_REF_2_REF02], [L2330E_1_REF_3_REF01], [L2330E_1_REF_3_REF02], [L2330F_1_NM1_1_NM101], [L2330F_1_NM1_1_NM102], [L2330F_1_REF_1_REF01], [L2330F_1_REF_1_REF02], [L2330F_1_REF_2_REF01], [L2330F_1_REF_2_REF02], [L2330F_1_REF_3_REF01], [L2330F_1_REF_3_REF02], [L2330F_1_REF_4_REF01], [L2330F_1_REF_4_REF02], [L2330G_1_NM1_1_NM101], [L2330G_1_NM1_1_NM102], [L2330G_1_REF_1_REF01], [L2330G_1_REF_1_REF02], [L2330G_1_REF_2_REF01], [L2330G_1_REF_2_REF02]) VALUES (20555, N'178', N'987654', N'3', N'S', N'01', N'GR00786', N'', N'', N'13', N'CO', N'1', N'7.93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'CR', N'1', N'7.93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'OA', N'1', N'7.93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'PI', N'1', N'7.93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'PR', N'1', N'7.93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', N'411', NULL, NULL, N'EAF', N'75', N'Y', N'B', N'Y', N'', N'', N'A4', NULL, NULL, NULL, NULL, NULL, NULL, N'IL', N'1', N'DOE', N'JOHN', N'T', N'JR', N'MI', N'123456', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'SY', N'123456789', N'PR', N'2', N'ABC INSURANCE CO', N'PI', N'11122333', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'573', N'D8', N'20040203', N'2U', N'98765', N'EI', N'98765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'DN', N'1', N'0B', N'12345', N'1G', N'12345', N'G2', N'12345', N'82', N'1', N'0B', N'12345', N'1G', N'12345', N'G2', N'12345', NULL, NULL, N'77', N'2', N'0B', N'12345', N'G2', N'12345', N'LU', N'12345', N'DQ', N'1', N'0B', N'12345', N'1G', N'12345', N'G2', N'12345', NULL, NULL, N'85', N'2', N'G2', N'12345', N'LU', N'12345')
INSERT [dbo].[EDI_837P_2320_OtherSubscriber] ([claimid], [Fileid], [HeaderID], [subscriber_patientid], [L2320_1_SBR_1_SBR01], [L2320_1_SBR_1_SBR02], [L2320_1_SBR_1_SBR03], [L2320_1_SBR_1_SBR04], [L2320_1_SBR_1_SBR05], [L2320_1_SBR_1_SBR09], [L2320_1_CAS_1_CAS01], [L2320_1_CAS_1_CAS02], [L2320_1_CAS_1_CAS03], [L2320_1_CAS_1_CAS04], [L2320_1_CAS_1_CAS05], [L2320_1_CAS_1_CAS06], [L2320_1_CAS_1_CAS07], [L2320_1_CAS_1_CAS08], [L2320_1_CAS_1_CAS09], [L2320_1_CAS_1_CAS10], [L2320_1_CAS_1_CAS11], [L2320_1_CAS_1_CAS12], [L2320_1_CAS_1_CAS13], [L2320_1_CAS_1_CAS14], [L2320_1_CAS_1_CAS15], [L2320_1_CAS_1_CAS16], [L2320_1_CAS_1_CAS17], [L2320_1_CAS_1_CAS18], [L2320_1_CAS_1_CAS19], [L2320_1_CAS_2_CAS01], [L2320_1_CAS_2_CAS02], [L2320_1_CAS_2_CAS03], [L2320_1_CAS_2_CAS04], [L2320_1_CAS_2_CAS05], [L2320_1_CAS_2_CAS06], [L2320_1_CAS_2_CAS07], [L2320_1_CAS_2_CAS08], [L2320_1_CAS_2_CAS09], [L2320_1_CAS_2_CAS10], [L2320_1_CAS_2_CAS11], [L2320_1_CAS_2_CAS12], [L2320_1_CAS_2_CAS13], [L2320_1_CAS_2_CAS14], [L2320_1_CAS_2_CAS15], [L2320_1_CAS_2_CAS16], [L2320_1_CAS_2_CAS17], [L2320_1_CAS_2_CAS18], [L2320_1_CAS_2_CAS19], [L2320_1_CAS_3_CAS01], [L2320_1_CAS_3_CAS02], [L2320_1_CAS_3_CAS03], [L2320_1_CAS_3_CAS04], [L2320_1_CAS_3_CAS05], [L2320_1_CAS_3_CAS06], [L2320_1_CAS_3_CAS07], [L2320_1_CAS_3_CAS08], [L2320_1_CAS_3_CAS09], [L2320_1_CAS_3_CAS10], [L2320_1_CAS_3_CAS11], [L2320_1_CAS_3_CAS12], [L2320_1_CAS_3_CAS13], [L2320_1_CAS_3_CAS14], [L2320_1_CAS_3_CAS15], [L2320_1_CAS_3_CAS16], [L2320_1_CAS_3_CAS17], [L2320_1_CAS_3_CAS18], [L2320_1_CAS_3_CAS19], [L2320_1_CAS_4_CAS01], [L2320_1_CAS_4_CAS02], [L2320_1_CAS_4_CAS03], [L2320_1_CAS_4_CAS04], [L2320_1_CAS_4_CAS05], [L2320_1_CAS_4_CAS06], [L2320_1_CAS_4_CAS07], [L2320_1_CAS_4_CAS08], [L2320_1_CAS_4_CAS09], [L2320_1_CAS_4_CAS10], [L2320_1_CAS_4_CAS11], [L2320_1_CAS_4_CAS12], [L2320_1_CAS_4_CAS13], [L2320_1_CAS_4_CAS14], [L2320_1_CAS_4_CAS15], [L2320_1_CAS_4_CAS16], [L2320_1_CAS_4_CAS17], [L2320_1_CAS_4_CAS18], [L2320_1_CAS_4_CAS19], [L2320_1_CAS_5_CAS01], [L2320_1_CAS_5_CAS02], [L2320_1_CAS_5_CAS03], [L2320_1_CAS_5_CAS04], [L2320_1_CAS_5_CAS05], [L2320_1_CAS_5_CAS06], [L2320_1_CAS_5_CAS07], [L2320_1_CAS_5_CAS08], [L2320_1_CAS_5_CAS09], [L2320_1_CAS_5_CAS10], [L2320_1_CAS_5_CAS11], [L2320_1_CAS_5_CAS12], [L2320_1_CAS_5_CAS13], [L2320_1_CAS_5_CAS14], [L2320_1_CAS_5_CAS15], [L2320_1_CAS_5_CAS16], [L2320_1_CAS_5_CAS17], [L2320_1_CAS_5_CAS18], [L2320_1_CAS_5_CAS19], [L2320_1_AMT_1_AMT01], [L2320_1_AMT_1_AMT02], [L2320_1_AMT_2_AMT01], [L2320_1_AMT_2_AMT02], [L2320_1_AMT_3_AMT01], [L2320_1_AMT_3_AMT02], [L2320_1_OI_1_OI03], [L2320_1_OI_1_OI04], [L2320_1_OI_1_OI06], [L2320_1_MOA_1_MOA01], [L2320_1_MOA_1_MOA02], [L2320_1_MOA_1_MOA03], [L2320_1_MOA_1_MOA04], [L2320_1_MOA_1_MOA05], [L2320_1_MOA_1_MOA06], [L2320_1_MOA_1_MOA07], [L2320_1_MOA_1_MOA08], [L2320_1_MOA_1_MOA09], [L2330A_1_NM1_1_NM101], [L2330A_1_NM1_1_NM102], [L2330A_1_NM1_1_NM103], [L2330A_1_NM1_1_NM104], [L2330A_1_NM1_1_NM105], [L2330A_1_NM1_1_NM107], [L2330A_1_NM1_1_NM108], [L2330A_1_NM1_1_NM109], [L2330A_1_N3_1_N301], [L2330A_1_N3_1_N302], [L2330A_1_N4_1_N401], [L2330A_1_N4_1_N402], [L2330A_1_N4_1_N403], [L2330A_1_N4_1_N404], [L2330A_1_N4_1_N407], [L2330A_1_REF_1_REF01], [L2330A_1_REF_1_REF02], [L2330B_1_NM1_1_NM101], [L2330B_1_NM1_1_NM102], [L2330B_1_NM1_1_NM103], [L2330B_1_NM1_1_NM108], [L2330B_1_NM1_1_NM109], [L2330B_1_N3_1_N301], [L2330B_1_N3_1_N302], [L2330B_1_N4_1_N401], [L2330B_1_N4_1_N402], [L2330B_1_N4_1_N403], [L2330B_1_N4_1_N404], [L2330B_1_N4_1_N407], [L2330B_1_DTP_1_DTP01], [L2330B_1_DTP_1_DTP02], [L2330B_1_DTP_1_DTP03], [L2330B_1_REF_1_REF01], [L2330B_1_REF_1_REF02], [L2330B_1_REF_2_REF01], [L2330B_1_REF_2_REF02], [L2330B_1_REF_3_REF01], [L2330B_1_REF_3_REF02], [L2330B_1_REF_4_REF01], [L2330B_1_REF_4_REF02], [L2330B_1_REF_5_REF01], [L2330B_1_REF_5_REF02], [L2330B_1_REF_6_REF01], [L2330B_1_REF_6_REF02], [L2330B_1_REF_7_REF01], [L2330B_1_REF_7_REF02], [L2330B_1_REF_8_REF01], [L2330B_1_REF_8_REF02], [L2330C_1_NM1_1_NM101], [L2330C_1_NM1_1_NM102], [L2330C_1_REF_1_REF01], [L2330C_1_REF_1_REF02], [L2330C_1_REF_2_REF01], [L2330C_1_REF_2_REF02], [L2330C_1_REF_3_REF01], [L2330C_1_REF_3_REF02], [L2330D_1_NM1_1_NM101], [L2330D_1_NM1_1_NM102], [L2330D_1_REF_1_REF01], [L2330D_1_REF_1_REF02], [L2330D_1_REF_2_REF01], [L2330D_1_REF_2_REF02], [L2330D_1_REF_3_REF01], [L2330D_1_REF_3_REF02], [L2330D_1_REF_4_REF01], [L2330D_1_REF_4_REF02], [L2330E_1_NM1_1_NM101], [L2330E_1_NM1_1_NM102], [L2330E_1_REF_1_REF01], [L2330E_1_REF_1_REF02], [L2330E_1_REF_2_REF01], [L2330E_1_REF_2_REF02], [L2330E_1_REF_3_REF01], [L2330E_1_REF_3_REF02], [L2330F_1_NM1_1_NM101], [L2330F_1_NM1_1_NM102], [L2330F_1_REF_1_REF01], [L2330F_1_REF_1_REF02], [L2330F_1_REF_2_REF01], [L2330F_1_REF_2_REF02], [L2330F_1_REF_3_REF01], [L2330F_1_REF_3_REF02], [L2330F_1_REF_4_REF01], [L2330F_1_REF_4_REF02], [L2330G_1_NM1_1_NM101], [L2330G_1_NM1_1_NM102], [L2330G_1_REF_1_REF01], [L2330G_1_REF_1_REF02], [L2330G_1_REF_2_REF01], [L2330G_1_REF_2_REF02]) VALUES (20556, N'178', N'987654', N'5', N'S', N'01', N'GR00786', N'', N'', N'13', N'CO', N'1', N'7.93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'CR', N'1', N'7.93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'OA', N'1', N'7.93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'PI', N'1', N'7.93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'PR', N'1', N'7.93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', N'411', NULL, NULL, N'EAF', N'75', N'Y', N'B', N'Y', N'', N'', N'A4', NULL, NULL, NULL, NULL, NULL, NULL, N'IL', N'1', N'DOE', N'JOHN', N'T', N'JR', N'MI', N'123456', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'SY', N'123456789', N'PR', N'2', N'ABC INSURANCE CO', N'PI', N'11122333', N'123 MAIN STREET', NULL, N'KANSAS CITY', N'MO', N'64108', NULL, NULL, N'573', N'D8', N'20040203', N'2U', N'98765', N'EI', N'98765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'DN', N'1', N'0B', N'12345', N'1G', N'12345', N'G2', N'12345', N'82', N'1', N'0B', N'12345', N'1G', N'12345', N'G2', N'12345', NULL, NULL, N'77', N'2', N'0B', N'12345', N'G2', N'12345', N'LU', N'12345', N'DQ', N'1', N'0B', N'12345', N'1G', N'12345', N'G2', N'12345', NULL, NULL, N'85', N'2', N'G2', N'12345', N'LU', N'12345')
/****** Object:  View [dbo].[ClaimView]    Script Date: 03/06/2021 17:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ClaimView] as
select c.claimid,c.subscriberlastname,c.subscriberfirstname,c.subscriberdob,c.subscribergender,c.subscriberid,c.patientlastname,c.patientfirstname,c.pateintdob,c.patientgender,c.patientidd,BillingProvider.billingprovidernpi,BillingProvider.billingproviderlastname,BillingProvider.taxid,c.diagnosiscode1,c.diagnosiscode2,c.diagnosiscode3,c.diagnosiscode4,c.diagnosiscode5,c.diagnosiscode6,c.diagnosiscode7,c.diagnosiscode8,c.diagnosiscode9,c.diagnosiscode10,c.diagnosiscode11,c.diagnosiscode12,renderingprovider.lastname as [renderingproviderlastname],renderingprovider.firstname as [renderingproviderfirstname],renderingprovider.renderprovidernpi as [renderingprovidernpi],ambulancepickup.address1 as [ambulancepickupaddress1],ambulancepickup.address2 as [ambulancepickupaddress2],ambulancepickup.city as [ambulancepickupcity],ambulancepickup.state as [ambulancepickupstate],ambulancepickup.postalcode as [ambulancepickuppostalcode],ambulancedroplocation.organizationname as [ambulancedroporganizationname],ambulancedroplocation.organizationnpi as [ambulancedroporganizationnpi],ambulancedroplocation.address1 as [ambulancedropaddress1],ambulancedroplocation.address2 as [ambulancedropaddress2],ambulancedroplocation.city as [ambulancedroplocationcity],ambulancedroplocation.state as [ambulancedropstate],ambulancedroplocation.postalcode as [ambulancedroppostalcode] from
(select claim.claimid,claim.claimsenderid,claim.diagnosiscode1,claim.diagnosiscode2,claim.diagnosiscode3,claim.diagnosiscode4,claim.diagnosiscode5,claim.diagnosiscode6,claim.diagnosiscode7,claim.diagnosiscode8,claim.diagnosiscode9,claim.diagnosiscode10,claim.diagnosiscode11,claim.diagnosiscode12,subscriber.subscriberid,subscriber.lastname as [subscriberlastname],subscriber.firstname as [subscriberfirstname],subscriber.dob as [subscriberdob],subscriber.gender as [subscribergender],patient.lastname as [patientlastname],patient.firstname as [patientfirstname],patient.patientidd,patient.dob as [pateintdob],patient.gender as [patientgender],subscriber.transactionid as [transactionid],subscriber.billingproviderloopid,subscriber.loopid as [subscriberloopid]
from claim,patient,subscriber
where (claim.transactionid=patient.transactionid and claim.parentloopid=patient.loopid) or ( claim.transactionid=subscriber.transactionid and claim.parentloopid=subscriber.loopid)) as c
join BillingProvider on BillingProvider.transactionid=c.transactionid and BillingProvider.billingproviderloopid=c.billingproviderloopid
left join renderingprovider on renderingprovider.claimid=c.claimid
left join ambulancepickup on ambulancepickup.claimid=c.claimid
left join ambulancedroplocation on ambulancedroplocation.claimid=c.claimid
GO
/****** Object:  Table [dbo].[ProviderOrganization]    Script Date: 03/06/2021 17:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderOrganization](
	[providerId] [nvarchar](20) NULL,
	[organizationId] [nvarchar](20) NULL,
	[organizationType] [nvarchar](20) NULL,
	[orgEffectiveFrom] [nvarchar](100) NULL,
	[orgEffectiveTo] [nvarchar](100) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ProviderOrganization] ([providerId], [organizationId], [organizationType], [orgEffectiveFrom], [orgEffectiveTo]) VALUES (N'1053547174', N'959932241', N'', N'2017-05-31T18:30:00.000Z', N'')
INSERT [dbo].[ProviderOrganization] ([providerId], [organizationId], [organizationType], [orgEffectiveFrom], [orgEffectiveTo]) VALUES (N'1790989226', N'941096919', N'PRIMARY', N'2019-04-30T18:30:00.000Z', N'')
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 03/06/2021 17:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'24e47f43-a76b-4a4d-8d2f-819a5802f0ad', N'1')
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 03/06/2021 17:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 03/06/2021 17:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spsearchmember]    Script Date: 03/06/2021 17:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spsearchmember]
@memberid varchar(80)=null,
@firstName varchar(35)=null,
@lastName varchar(60)=null,
@dob varchar(35)=null,
@hp varchar(5)=null
as
begin
	select memberID,HealthPlanCode from Members where memberID like '%'+@memberid+'%' and lastName like '%'+@lastName+'%' and firstName like '%'+@firstName+'%' and dob like '%'+@dob+'%' and HealthPlanCode like '%'+@hp+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[spsearchbenefitmaster]    Script Date: 03/06/2021 17:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spsearchbenefitmaster]
@hp varchar(5),
@hpCode varchar(15)
as
begin
SELECT [id]
      ,[HealthPlanCode]
      ,[BenefitCode]
      ,[EmployerGroup]
      ,[Description]
      ,[EffectiveFromDate]
      ,[EffectiveToDate]
      ,[AccumilationPeriod]
      ,[LineOfBusiness]
      ,[FinancialResponcibilitySet]
      ,[OOPMaximumMember]
      ,[OOPMaximumSubscriber]
      ,[DeductableForMember]
      ,[DeductableForSubscriber]
      ,[InNetworkOOPMaximumMember]
      ,[InNetworkOOPMaximumSubscriber]
      ,[InNetworkDeductableForMember]
      ,[InNetworkDeductableForSuscriber]
      ,[OutNetworkOOPMaximumMember]
      ,[OutNetworkOOPMaximumSubscriber]
      ,[OutNetworkDeductableForMember]
      ,[OutNetworkDeductableForSusbscriber]
      ,[OOPMaximumCombinedMember]
      ,[OOPMaximumCombinedSuscriber]
      ,[DeductableCombinedMember]
      ,[DeductableCombinedSuscriber]
      ,[note]
  FROM [EDIDatabase].[dbo].[BenefitMaster] where HealthPlanCode like '%'+@hp+'%' and BenefitCode like '%'+@hpCode+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[spsearchbenefitcode]    Script Date: 03/06/2021 17:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spsearchbenefitcode]
@HealthPlanCode varchar(10)=null,
@BenefitCode varchar(20)=null
as
begin
	select [Description] from BenefitMaster where HealthPlanCode=@HealthPlanCode and BenefitCode=@BenefitCode
end
GO
/****** Object:  StoredProcedure [dbo].[spRemovePCPs]    Script Date: 03/06/2021 17:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spRemovePCPs]
@memberid varchar(100),
@hp varchar(10)
as
begin
	DECLARE @memkeyid int;
	select @memkeyid=id from Members where memberID=@memberid and HealthPlanCode=@hp
	delete from MemberPCPtb where Member_Key_ID=@memkeyid
	select @memkeyid as memkeyid
end
GO
/****** Object:  StoredProcedure [dbo].[spRemoveHps]    Script Date: 03/06/2021 17:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spRemoveHps]
@memberid varchar(100),
@hp varchar(10)
as
begin
	DECLARE @memkeyid int;
	select @memkeyid=id from Members where memberID=@memberid and HealthPlanCode=@hp
	delete from MembersHealthPlantb where Member_Key_ID=@memkeyid
	select @memkeyid as memkeyid
end
GO
/****** Object:  StoredProcedure [dbo].[sporgcrud]    Script Date: 03/06/2021 17:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sporgcrud] @organizationId nvarchar(20)=null,
	@category nvarchar(50)=null,
	@organizationName nvarchar(100)=null,
	@organizationLongName nvarchar(200)= null,
	@accountingSystemName nvarchar(50)=null,
	@taxId nvarchar(9)=null,
	@organizationNpi nvarchar(10)=null,
	@ssn nvarchar(10)=null,
	@taxonomyCode nvarchar(10)= null,
	@capitationAccount nvarchar(20)=null,
	@claimsAccount nvarchar(10)=null,
	@ptoAddress1 nvarchar(200)=null,
	@ptoAddress2 nvarchar(200)=null,
	@ptoCity nvarchar(50)= null,
	@ptoState nvarchar(2)= null,
	@ptoZip nvarchar(15)= null,
	@ptoInternationalZip nvarchar(15)=null,
	@ptoCountryDistict nvarchar(15)=null,
	@ptoCountry nvarchar(15)=null,
	@ptoPhone nvarchar(50)=null,
	@ptoFax nvarchar(50)=null,
	@ptoEmail nvarchar(100)=null,
	@ptoContactPerson nvarchar(100)=null,
	@blAddress1 nvarchar(200)=null,
	@blAddress2 nvarchar(200)=null,
	@blCity nvarchar(50)=null,
	@blState nvarchar(2)=null,
	@blZip nvarchar(15)=null,
	@blInternationalZip nvarchar(15)=null,
	@blCountryDistict nvarchar(15)=null,
	@blCountry nvarchar(15)=null,
	@blPhone nvarchar(50)=null,
	@blFax nvarchar(50)=null,
	@blEmail nvarchar(100)=null,
	@blContactPerson nvarchar(100)=null,
	@operation nvarchar,
	@condition nvarchar(1000)=null
	as
	begin
		if(@operation='c')
		begin
			insert into Organization values(@organizationId,@category,@organizationName,@organizationLongName,@accountingSystemName,@taxId,@organizationNpi,@ssn,@taxonomyCode,@capitationAccount,@claimsAccount,@ptoAddress1,@ptoAddress2,@ptoCity,@ptoState,@ptoZip,@ptoInternationalZip,@ptoCountryDistict,@ptoCountry,@ptoPhone,@ptoFax,@ptoEmail,@ptoContactPerson,@blAddress1,@blAddress2,@blCity,@blState,@blZip,@blInternationalZip,@blCountryDistict,@blCountry,@blPhone,@blFax,@blEmail,@blContactPerson);
			select * from Organization where organizationId=@organizationId;
		end
		else if(@operation='r')
		begin
			declare @sqlr nvarchar(1100);
			if(@condition is null)
			begin
				set @sqlr='select * from Organization';
			end
			else
			begin
				set @sqlr='select * from Organization where ' +@condition;
			end
			exec sp_executesql @sqlr;
		end
		else if(@operation='u')
		begin
			declare @sqlu nvarchar(1100);
			set @sqlu='update Organization set '+@condition;
			exec sp_executesql @sqlu;
		end
		else if(@operation='d')
		begin
			delete from Organization where organizationId=@organizationId
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[spmemberselect]    Script Date: 03/06/2021 17:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spmemberselect]
@memberid varchar(80)=null,
@healthplan varchar(5)=null
as
begin
	select memberID,lastName,firstName,middleName,suffixName,address1,address2,city,state,postalCode,countryCode,dob,gender,pcpid,pcptb.fromdate as pcpfromdate,pcptb.todate as pcptodate,pcptb.MaintReason as [pcpMaintRes],organization,HealthPlanCode,BenefitCode,hptb.fromdate as hpfrmdate,hptb.todate as hptodate,hptb.MaintReason as [hpMaintRes] from Members mb join MemberPCPtb pcptb on mb.id=pcptb.member_key_id  and (pcptb.todate= (select max(inqury.todate) from MemberPCPtb as inqury where inqury.Member_Key_ID=mb.id) or pcptb.todate is null) join MembersHealthPlantb hptb on mb.id=hptb.Member_Key_ID and (hptb.todate= (select max(inqury.todate)  from MembersHealthPlantb as inqury where inqury.Member_Key_ID=hptb.Member_Key_ID)or hptb.todate is null)   where mb.memberID=@memberid and mb.HealthPlanCode=@healthplan
end
GO
/****** Object:  StoredProcedure [dbo].[spmemberexist]    Script Date: 03/06/2021 17:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmemberexist]
@memberid varchar(80),
@hp varchar(5)
as
begin
	select * from Members m join MembersHealthPlantb mh on m.memberid=mh.memberid where mh.memberid=@memberid and mh.healthPlan=@hp
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertsupportdoc]    Script Date: 03/06/2021 17:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertsupportdoc]
@formidentification int,
@L2440_FRM_FRM01 varchar(20)=null,
@L2440_FRM_FRM02 varchar(1)=null,
@L2440_FRM_FRM03 varchar(50)=null,
@L2440_FRM_FRM04 varchar(8)=null,
@L2440_FRM_FRM05 varchar(6)=null
as
begin
INSERT INTO [EDIDatabase].[dbo].[EDI_837P_SupportDoc]
           ([formidentification]
           ,[L2440_FRM_FRM01]
           ,[L2440_FRM_FRM02]
           ,[L2440_FRM_FRM03]
           ,[L2440_FRM_FRM04]
           ,[L2440_FRM_FRM05])
     VALUES
           (@formidentification
           ,@L2440_FRM_FRM01
           ,@L2440_FRM_FRM02
           ,@L2440_FRM_FRM03
           ,@L2440_FRM_FRM04
           ,@L2440_FRM_FRM05)
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertsubscriber]    Script Date: 03/06/2021 17:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spinsertsubscriber]
@Fileid varchar(30),
@HeaderID varchar(30),
@L2000B_1_HL_1_HL01    varchar(12)= NULL,
@L2000B_1_HL_1_HL02    varchar(12)= NULL,
@L2000B_1_HL_1_HL03    varchar(2) = NULL,
@L2000B_1_HL_1_HL04    varchar(1) = NULL,
@L2000B_1_SBR_1_SBR01  varchar(1) = NULL,
@L2000B_1_SBR_1_SBR02  varchar(2) = NULL,
@L2000B_1_SBR_1_SBR03  varchar(50)= NULL,
@L2000B_1_SBR_1_SBR04  varchar(60)= NULL,
@L2000B_1_SBR_1_SBR05  varchar(3) = NULL,
@L2000B_1_SBR_1_SBR09  varchar(2) = NULL,
@L2000B_1_PAT_1_PAT05  varchar(3) = NULL,
@L2000B_1_PAT_1_PAT06  varchar(35)= NULL,
@L2000B_1_PAT_1_PAT07  varchar(2) = NULL,
@L2000B_1_PAT_1_PAT08  varchar(10)= NULL,
@L2000B_1_PAT_1_PAT09  varchar(1) = NULL,
@L2010BA_1_NM1_1_NM101 varchar(3)  = NULL,
@L2010BA_1_NM1_1_NM102 varchar(1)  = NULL,
@L2010BA_1_NM1_1_NM103 varchar(60) = NULL,
@L2010BA_1_NM1_1_NM104 varchar(35) = NULL,
@L2010BA_1_NM1_1_NM105 varchar(25) = NULL,
@L2010BA_1_NM1_1_NM107 varchar(10) = NULL,
@L2010BA_1_NM1_1_NM108 varchar(2)  = NULL,
@L2010BA_1_NM1_1_NM109 varchar(80) = NULL,
@L2010BA_1_N3_1_N301   varchar(55) = NULL,
@L2010BA_1_N3_1_N302   varchar(55) = NULL,
@L2010BA_1_N4_1_N401   varchar(30) = NULL,
@L2010BA_1_N4_1_N402   varchar(2)  = NULL,
@L2010BA_1_N4_1_N403   varchar(15) = NULL,
@L2010BA_1_N4_1_N404   varchar(3)  = NULL,
@L2010BA_1_N4_1_N407   varchar(3)  = NULL,
@L2010BA_1_DMG_1_DMG01 varchar(3)  = NULL,
@L2010BA_1_DMG_1_DMG02 varchar(35) = NULL,
@L2010BA_1_DMG_1_DMG03 varchar(1)  = NULL,
@L2010BA_1_REF_1_REF01 varchar(2)  = NULL,
@L2010BA_1_REF_1_REF02 varchar(50) = NULL,
@L2010BA_1_REF_2_REF01 varchar(2)  = NULL,
@L2010BA_1_REF_2_REF02 varchar(50) = NULL,
@L2010BA_1_PER_1_PER01 varchar(2)  = NULL,
@L2010BA_1_PER_1_PER02 varchar(60) = NULL,
@L2010BA_1_PER_1_PER03 varchar(2)  = NULL,
@L2010BA_1_PER_1_PER04 varchar(256)= NULL,
@L2010BA_1_PER_1_PER05 varchar(2)  = NULL,
@L2010BA_1_PER_1_PER06 varchar(256)= NULL,
@L2010BB_1_NM1_1_NM101 varchar(3)  = NULL,
@L2010BB_1_NM1_1_NM102 varchar(1)  = NULL,
@L2010BB_1_NM1_1_NM103 varchar(60) = NULL,
@L2010BB_1_NM1_1_NM108 varchar(2)  = NULL,
@L2010BB_1_NM1_1_NM109 varchar(80) = NULL,
@L2010BB_1_N3_1_N301   varchar(55) = NULL,
@L2010BB_1_N3_1_N302   varchar(55) = NULL,
@L2010BB_1_N4_1_N401   varchar(30) = NULL,
@L2010BB_1_N4_1_N402   varchar(2)  = NULL,
@L2010BB_1_N4_1_N403   varchar(15) = NULL,
@L2010BB_1_N4_1_N404   varchar(3)  = NULL,
@L2010BB_1_N4_1_N407   varchar(3)  = NULL,
@L2010BB_1_REF_1_REF01 varchar(3)  = NULL,
@L2010BB_1_REF_1_REF02 varchar(50) = NULL,
@L2010BB_1_REF_2_REF01 varchar(3)  = NULL,
@L2010BB_1_REF_2_REF02 varchar(50) = NULL,
@L2010BB_1_REF_3_REF01 varchar(3)  = NULL,
@L2010BB_1_REF_3_REF02 varchar(50) = NULL,
@L2010BB_1_REF_4_REF01 varchar(3)  = NULL,
@L2010BB_1_REF_4_REF02 varchar(50) = NULL,
@L2010BB_1_REF_5_REF01 varchar(3)  = NULL,
@L2010BB_1_REF_5_REF02 varchar(50) = NULL,
@L2010BB_1_REF_6_REF01 varchar(3)  = NULL,
@L2010BB_1_REF_6_REF02 varchar(50) = NULL
as
begin
INSERT INTO [EDIDatabase].[dbo].[EDI_837P_subscriber]
           ([Fileid]
           ,[HeaderID]
           ,[L2000B_1_HL_1_HL01]
           ,[L2000B_1_HL_1_HL02]
           ,[L2000B_1_HL_1_HL03]
           ,[L2000B_1_HL_1_HL04]
           ,[L2000B_1_SBR_1_SBR01]
           ,[L2000B_1_SBR_1_SBR02]
           ,[L2000B_1_SBR_1_SBR03]
           ,[L2000B_1_SBR_1_SBR04]
           ,[L2000B_1_SBR_1_SBR05]
           ,[L2000B_1_SBR_1_SBR09]
           ,[L2000B_1_PAT_1_PAT05]
           ,[L2000B_1_PAT_1_PAT06]
           ,[L2000B_1_PAT_1_PAT07]
           ,[L2000B_1_PAT_1_PAT08]
           ,[L2000B_1_PAT_1_PAT09]
           ,[L2010BA_1_NM1_1_NM101]
           ,[L2010BA_1_NM1_1_NM102]
           ,[L2010BA_1_NM1_1_NM103]
           ,[L2010BA_1_NM1_1_NM104]
           ,[L2010BA_1_NM1_1_NM105]
           ,[L2010BA_1_NM1_1_NM107]
           ,[L2010BA_1_NM1_1_NM108]
           ,[L2010BA_1_NM1_1_NM109]
           ,[L2010BA_1_N3_1_N301]
           ,[L2010BA_1_N3_1_N302]
           ,[L2010BA_1_N4_1_N401]
           ,[L2010BA_1_N4_1_N402]
           ,[L2010BA_1_N4_1_N403]
           ,[L2010BA_1_N4_1_N404]
           ,[L2010BA_1_N4_1_N407]
           ,[L2010BA_1_DMG_1_DMG01]
           ,[L2010BA_1_DMG_1_DMG02]
           ,[L2010BA_1_DMG_1_DMG03]
           ,[L2010BA_1_REF_1_REF01]
           ,[L2010BA_1_REF_1_REF02]
           ,[L2010BA_1_REF_2_REF01]
           ,[L2010BA_1_REF_2_REF02]
           ,[L2010BA_1_PER_1_PER01]
           ,[L2010BA_1_PER_1_PER02]
           ,[L2010BA_1_PER_1_PER03]
           ,[L2010BA_1_PER_1_PER04]
           ,[L2010BA_1_PER_1_PER05]
           ,[L2010BA_1_PER_1_PER06]
           ,[L2010BB_1_NM1_1_NM101]
           ,[L2010BB_1_NM1_1_NM102]
           ,[L2010BB_1_NM1_1_NM103]
           ,[L2010BB_1_NM1_1_NM108]
           ,[L2010BB_1_NM1_1_NM109]
           ,[L2010BB_1_N3_1_N301]
           ,[L2010BB_1_N3_1_N302]
           ,[L2010BB_1_N4_1_N401]
           ,[L2010BB_1_N4_1_N402]
           ,[L2010BB_1_N4_1_N403]
           ,[L2010BB_1_N4_1_N404]
           ,[L2010BB_1_N4_1_N407]
           ,[L2010BB_1_REF_1_REF01]
           ,[L2010BB_1_REF_1_REF02]
           ,[L2010BB_1_REF_2_REF01]
           ,[L2010BB_1_REF_2_REF02]
           ,[L2010BB_1_REF_3_REF01]
           ,[L2010BB_1_REF_3_REF02]
           ,[L2010BB_1_REF_4_REF01]
           ,[L2010BB_1_REF_4_REF02]
           ,[L2010BB_1_REF_5_REF01]
           ,[L2010BB_1_REF_5_REF02]
           ,[L2010BB_1_REF_6_REF01]
           ,[L2010BB_1_REF_6_REF02])
     VALUES
           (@Fileid,
@HeaderID,
@L2000B_1_HL_1_HL01,    
@L2000B_1_HL_1_HL02,    
@L2000B_1_HL_1_HL03,    
@L2000B_1_HL_1_HL04,    
@L2000B_1_SBR_1_SBR01,  
@L2000B_1_SBR_1_SBR02,  
@L2000B_1_SBR_1_SBR03,  
@L2000B_1_SBR_1_SBR04,  
@L2000B_1_SBR_1_SBR05,  
@L2000B_1_SBR_1_SBR09,  
@L2000B_1_PAT_1_PAT05,  
@L2000B_1_PAT_1_PAT06,  
@L2000B_1_PAT_1_PAT07,  
@L2000B_1_PAT_1_PAT08,  
@L2000B_1_PAT_1_PAT09,  
@L2010BA_1_NM1_1_NM101 ,
@L2010BA_1_NM1_1_NM102 ,
@L2010BA_1_NM1_1_NM103 ,
@L2010BA_1_NM1_1_NM104 ,
@L2010BA_1_NM1_1_NM105 ,
@L2010BA_1_NM1_1_NM107 ,
@L2010BA_1_NM1_1_NM108 ,
@L2010BA_1_NM1_1_NM109 ,
@L2010BA_1_N3_1_N301   ,
@L2010BA_1_N3_1_N302   ,
@L2010BA_1_N4_1_N401   ,
@L2010BA_1_N4_1_N402   ,
@L2010BA_1_N4_1_N403   ,
@L2010BA_1_N4_1_N404   ,
@L2010BA_1_N4_1_N407   ,
@L2010BA_1_DMG_1_DMG01 ,
@L2010BA_1_DMG_1_DMG02 ,
@L2010BA_1_DMG_1_DMG03 ,
@L2010BA_1_REF_1_REF01 ,
@L2010BA_1_REF_1_REF02 ,
@L2010BA_1_REF_2_REF01 ,
@L2010BA_1_REF_2_REF02 ,
@L2010BA_1_PER_1_PER01 ,
@L2010BA_1_PER_1_PER02 ,
@L2010BA_1_PER_1_PER03 ,
@L2010BA_1_PER_1_PER04 ,
@L2010BA_1_PER_1_PER05 ,
@L2010BA_1_PER_1_PER06 ,
@L2010BB_1_NM1_1_NM101 ,
@L2010BB_1_NM1_1_NM102 ,
@L2010BB_1_NM1_1_NM103 ,
@L2010BB_1_NM1_1_NM108 ,
@L2010BB_1_NM1_1_NM109 ,
@L2010BB_1_N3_1_N301   ,
@L2010BB_1_N3_1_N302   ,
@L2010BB_1_N4_1_N401   ,
@L2010BB_1_N4_1_N402   ,
@L2010BB_1_N4_1_N403   ,
@L2010BB_1_N4_1_N404   ,
@L2010BB_1_N4_1_N407   ,
@L2010BB_1_REF_1_REF01 ,
@L2010BB_1_REF_1_REF02 ,
@L2010BB_1_REF_2_REF01 ,
@L2010BB_1_REF_2_REF02 ,
@L2010BB_1_REF_3_REF01 ,
@L2010BB_1_REF_3_REF02 ,
@L2010BB_1_REF_4_REF01 ,
@L2010BB_1_REF_4_REF02 ,
@L2010BB_1_REF_5_REF01 ,
@L2010BB_1_REF_5_REF02 ,
@L2010BB_1_REF_6_REF01 ,
@L2010BB_1_REF_6_REF02 )
End
GO
/****** Object:  StoredProcedure [dbo].[spinsertserviceline]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spinsertserviceline]
(
@claimid int,
@Fileid varchar(30),
@HeaderID varchar(30),
@subscriber_patientid varchar(12) =NULL,
@L2400_1_LX_1_LX01 varchar(6) =NULL,
@L2400_1_SV1_1_SV101_01 varchar(2) =NULL,
@L2400_1_SV1_1_SV101_02 varchar(48) =NULL,
@L2400_1_SV1_1_SV101_03 varchar(2) =NULL,
@L2400_1_SV1_1_SV101_04 varchar(2) =NULL,
@L2400_1_SV1_1_SV101_05 varchar(2) =NULL,
@L2400_1_SV1_1_SV101_06 varchar(2) =NULL,
@L2400_1_SV1_1_SV101_07 varchar(80) =NULL,
@L2400_1_SV1_1_SV102 varchar(18) =NULL,
@L2400_1_SV1_1_SV103 varchar(2) =NULL,
@L2400_1_SV1_1_SV104 varchar(15) =NULL,
@L2400_1_SV1_1_SV105 varchar(2) =NULL,
@L2400_1_SV1_1_SV107_1 varchar(2) =NULL,
@L2400_1_SV1_1_SV107_2 varchar(2) =NULL,
@L2400_1_SV1_1_SV107_3 varchar(2) =NULL,
@L2400_1_SV1_1_SV107_4 varchar(2) =NULL,
@L2400_1_SV1_1_SV109 varchar(1) =NULL,
@L2400_1_SV1_1_SV111 varchar(1) =NULL,
@L2400_1_SV1_1_SV112 varchar(1) =NULL,
@L2400_1_SV1_1_SV115 varchar(1) =NULL,
@L2400_1_SV5_1_SV501_01 varchar(2) =NULL,
@L2400_1_SV5_1_SV501_02 varchar(48) =NULL,
@L2400_1_SV5_1_SV502 varchar(2) =NULL,
@L2400_1_SV5_1_SV503 varchar(15) =NULL,
@L2400_1_SV5_1_SV504 varchar(18) =NULL,
@L2400_1_SV5_1_SV505 varchar(18) =NULL,
@L2400_1_SV5_1_SV506 varchar(1) =NULL,
@L2400_1_PWK_1_PWK01 varchar(2) =NULL,
@L2400_1_PWK_1_PWK02 varchar(2) =NULL,
@L2400_1_PWK_1_PWK05 varchar(2) =NULL,
@L2400_1_PWK_1_PWK06 varchar(80) =NULL,
@L2400_1_PWK_2_PWK01 varchar(2) =NULL,
@L2400_1_PWK_2_PWK02 varchar(2) =NULL,
@L2400_1_PWK_2_PWK05 varchar(2) =NULL,
@L2400_1_PWK_2_PWK06 varchar(80) =NULL,
@L2400_1_PWK_3_PWK01 varchar(2) =NULL,
@L2400_1_PWK_3_PWK02 varchar(2) =NULL,
@L2400_1_PWK_3_PWK05 varchar(2) =NULL,
@L2400_1_PWK_3_PWK06 varchar(80) =NULL,
@L2400_1_PWK_4_PWK01 varchar(2) =NULL,
@L2400_1_PWK_4_PWK02 varchar(2) =NULL,
@L2400_1_PWK_4_PWK05 varchar(2) =NULL,
@L2400_1_PWK_4_PWK06 varchar(80) =NULL,
@L2400_1_PWK_5_PWK01 varchar(2) =NULL,
@L2400_1_PWK_5_PWK02 varchar(2) =NULL,
@L2400_1_PWK_5_PWK05 varchar(2) =NULL,
@L2400_1_PWK_5_PWK06 varchar(80) =NULL,
@L2400_1_PWK_6_PWK01 varchar(2) =NULL,
@L2400_1_PWK_6_PWK02 varchar(2) =NULL,
@L2400_1_PWK_6_PWK05 varchar(2) =NULL,
@L2400_1_PWK_6_PWK06 varchar(80) =NULL,
@L2400_1_PWK_7_PWK01 varchar(2) =NULL,
@L2400_1_PWK_7_PWK02 varchar(2) =NULL,
@L2400_1_PWK_7_PWK05 varchar(2) =NULL,
@L2400_1_PWK_7_PWK06 varchar(80) =NULL,
@L2400_1_PWK_8_PWK01 varchar(2) =NULL,
@L2400_1_PWK_8_PWK02 varchar(2) =NULL,
@L2400_1_PWK_8_PWK05 varchar(2) =NULL,
@L2400_1_PWK_8_PWK06 varchar(80) =NULL,
@L2400_1_PWK_9_PWK01 varchar(2) =NULL,
@L2400_1_PWK_9_PWK02 varchar(2) =NULL,
@L2400_1_PWK_9_PWK05 varchar(2) =NULL,
@L2400_1_PWK_9_PWK06 varchar(80) =NULL,
@L2400_1_PWK_10_PWK01 varchar(2) =NULL,
@L2400_1_PWK_10_PWK02 varchar(2) =NULL,
@L2400_1_PWK_10_PWK05 varchar(2) =NULL,
@L2400_1_PWK_10_PWK06 varchar(80) =NULL,
@L2400_1_PWK_11_PWK01 varchar(2) =NULL,
@L2400_1_PWK_11_PWK02 varchar(2) =NULL,
@L2400_1_PWK_11_PWK05 varchar(2) =NULL,
@L2400_1_PWK_11_PWK06 varchar(80) =NULL,
@L2400_1_CR1_1_CR101 varchar(2) =NULL,
@L2400_1_CR1_1_CR102 varchar(10) =NULL,
@L2400_1_CR1_1_CR104 varchar(1) =NULL,
@L2400_1_CR1_1_CR105 varchar(2) =NULL,
@L2400_1_CR1_1_CR106 varchar(15) =NULL,
@L2400_1_CR1_1_CR109 varchar(80) =NULL,
@L2400_1_CR1_1_CR110 varchar(80) =NULL,
@L2400_1_CR3_1_CR301 varchar(1) =NULL,
@L2400_1_CR3_1_CR302 varchar(2) =NULL,
@L2400_1_CR3_1_CR303 varchar(15) =NULL,
@L2400_1_CRC_1_CRC01 varchar(2) =NULL,
@L2400_1_CRC_1_CRC02 varchar(1) =NULL,
@L2400_1_CRC_1_CRC03 varchar(3) =NULL,
@L2400_1_CRC_1_CRC04 varchar(3) =NULL,
@L2400_1_CRC_1_CRC05 varchar(3) =NULL,
@L2400_1_CRC_1_CRC06 varchar(3) =NULL,
@L2400_1_CRC_1_CRC07 varchar(3) =NULL,
@L2400_1_CRC_2_CRC01 varchar(2) =NULL,
@L2400_1_CRC_2_CRC02 varchar(1) =NULL,
@L2400_1_CRC_2_CRC03 varchar(3) =NULL,
@L2400_1_CRC_2_CRC04 varchar(3) =NULL,
@L2400_1_CRC_2_CRC05 varchar(3) =NULL,
@L2400_1_CRC_2_CRC06 varchar(3) =NULL,
@L2400_1_CRC_2_CRC07 varchar(3) =NULL,
@L2400_1_CRC_3_CRC01 varchar(2) =NULL,
@L2400_1_CRC_3_CRC02 varchar(1) =NULL,
@L2400_1_CRC_3_CRC03 varchar(3) =NULL,
@L2400_1_CRC_3_CRC04 varchar(3) =NULL,
@L2400_1_CRC_3_CRC05 varchar(3) =NULL,
@L2400_1_CRC_3_CRC06 varchar(3) =NULL,
@L2400_1_CRC_3_CRC07 varchar(3) =NULL,
@L2400_1_CRC_4_CRC01 varchar(2) =NULL,
@L2400_1_CRC_4_CRC02 varchar(1) =NULL,
@L2400_1_CRC_4_CRC03 varchar(3) =NULL,
@L2400_1_CRC_4_CRC04 varchar(3) =NULL,
@L2400_1_CRC_4_CRC05 varchar(3) =NULL,
@L2400_1_CRC_4_CRC06 varchar(3) =NULL,
@L2400_1_CRC_4_CRC07 varchar(3) =NULL,
@L2400_1_CRC_5_CRC01 varchar(2) =NULL,
@L2400_1_CRC_5_CRC02 varchar(1) =NULL,
@L2400_1_CRC_5_CRC03 varchar(3) =NULL,
@L2400_1_CRC_5_CRC04 varchar(3) =NULL,
@L2400_1_CRC_5_CRC05 varchar(3) =NULL,
@L2400_1_CRC_5_CRC06 varchar(3) =NULL,
@L2400_1_CRC_5_CRC07 varchar(3) =NULL,
@L2400_1_DTP_1_DTP01 varchar(3) =NULL,
@L2400_1_DTP_1_DTP02 varchar(3) =NULL,
@L2400_1_DTP_1_DTP03 varchar(35) =NULL,
@L2400_1_DTP_2_DTP01 varchar(3) =NULL,
@L2400_1_DTP_2_DTP02 varchar(3) =NULL,
@L2400_1_DTP_2_DTP03 varchar(35) =NULL,
@L2400_1_DTP_3_DTP01 varchar(3) =NULL,
@L2400_1_DTP_3_DTP02 varchar(3) =NULL,
@L2400_1_DTP_3_DTP03 varchar(35) =NULL,
@L2400_1_DTP_4_DTP01 varchar(3) =NULL,
@L2400_1_DTP_4_DTP02 varchar(3) =NULL,
@L2400_1_DTP_4_DTP03 varchar(35) =NULL,
@L2400_1_DTP_5_DTP01 varchar(3) =NULL,
@L2400_1_DTP_5_DTP02 varchar(3) =NULL,
@L2400_1_DTP_5_DTP03 varchar(35) =NULL,
@L2400_1_DTP_6_DTP01 varchar(3) =NULL,
@L2400_1_DTP_6_DTP02 varchar(3) =NULL,
@L2400_1_DTP_6_DTP03 varchar(35) =NULL,
@L2400_1_DTP_7_DTP01 varchar(3) =NULL,
@L2400_1_DTP_7_DTP02 varchar(3) =NULL,
@L2400_1_DTP_7_DTP03 varchar(35) =NULL,
@L2400_1_DTP_8_DTP01 varchar(3) =NULL,
@L2400_1_DTP_8_DTP02 varchar(3) =NULL,
@L2400_1_DTP_8_DTP03 varchar(35) =NULL,
@L2400_1_DTP_9_DTP01 varchar(3) =NULL,
@L2400_1_DTP_9_DTP02 varchar(3) =NULL,
@L2400_1_DTP_9_DTP03 varchar(35) =NULL,
@L2400_1_DTP_10_DTP01 varchar(3) =NULL,
@L2400_1_DTP_10_DTP02 varchar(3) =NULL,
@L2400_1_DTP_10_DTP03 varchar(35) =NULL,
@L2400_1_QTY_1_QTY01 varchar(2) =NULL,
@L2400_1_QTY_1_QTY02 varchar(15) =NULL,
@L2400_1_QTY_2_QTY01 varchar(2) =NULL,
@L2400_1_QTY_2_QTY02 varchar(15) =NULL,
@L2400_1_MEA_1_MEA01 varchar(2) =NULL,
@L2400_1_MEA_1_MEA02 varchar(3) =NULL,
@L2400_1_MEA_1_MEA03 varchar(20) =NULL,
@L2400_1_MEA_2_MEA01 varchar(2) =NULL,
@L2400_1_MEA_2_MEA02 varchar(3) =NULL,
@L2400_1_MEA_2_MEA03 varchar(20) =NULL,
@L2400_1_MEA_3_MEA01 varchar(2) =NULL,
@L2400_1_MEA_3_MEA02 varchar(3) =NULL,
@L2400_1_MEA_3_MEA03 varchar(20) =NULL,
@L2400_1_MEA_4_MEA01 varchar(2) =NULL,
@L2400_1_MEA_4_MEA02 varchar(3) =NULL,
@L2400_1_MEA_4_MEA03 varchar(20) =NULL,
@L2400_1_MEA_5_MEA01 varchar(2) =NULL,
@L2400_1_MEA_5_MEA02 varchar(3) =NULL,
@L2400_1_MEA_5_MEA03 varchar(20) =NULL,
@L2400_1_CN1_1_CN101 varchar(2) =NULL,
@L2400_1_CN1_1_CN102 varchar(18) =NULL,
@L2400_1_CN1_1_CN103 varchar(6) =NULL,
@L2400_1_CN1_1_CN104 varchar(50) =NULL,
@L2400_1_CN1_1_CN105 varchar(6) =NULL,
@L2400_1_CN1_1_CN106 varchar(30) =NULL,
@L2400_1_REF_1_REF01 varchar(3) =NULL,
@L2400_1_REF_1_REF02 varchar(50) =NULL,
@L2400_1_REF_1_REF04_1 varchar(3) =NULL,
@L2400_1_REF_1_REF04_2 varchar(50) =NULL,
@L2400_1_REF_2_REF01 varchar(3) =NULL,
@L2400_1_REF_2_REF02 varchar(50) =NULL,
@L2400_1_REF_2_REF04_1 varchar(3) =NULL,
@L2400_1_REF_2_REF04_2 varchar(50) =NULL,
@L2400_1_REF_3_REF01 varchar(3) =NULL,
@L2400_1_REF_3_REF02 varchar(50) =NULL,
@L2400_1_REF_3_REF04_1 varchar(3) =NULL,
@L2400_1_REF_3_REF04_2 varchar(50) =NULL,
@L2400_1_REF_4_REF01 varchar(3) =NULL,
@L2400_1_REF_4_REF02 varchar(50) =NULL,
@L2400_1_REF_4_REF04_1 varchar(3) =NULL,
@L2400_1_REF_4_REF04_2 varchar(50) =NULL,
@L2400_1_REF_5_REF01 varchar(3) =NULL,
@L2400_1_REF_5_REF02 varchar(50) =NULL,
@L2400_1_REF_5_REF04_1 varchar(3) =NULL,
@L2400_1_REF_5_REF04_2 varchar(50) =NULL,
@L2400_1_REF_6_REF01 varchar(3) =NULL,
@L2400_1_REF_6_REF02 varchar(50) =NULL,
@L2400_1_REF_6_REF04_1 varchar(3) =NULL,
@L2400_1_REF_6_REF04_2 varchar(50) =NULL,
@L2400_1_REF_7_REF01 varchar(3) =NULL,
@L2400_1_REF_7_REF02 varchar(50) =NULL,
@L2400_1_REF_7_REF04_1 varchar(3) =NULL,
@L2400_1_REF_7_REF04_2 varchar(50) =NULL,
@L2400_1_REF_8_REF01 varchar(3) =NULL,
@L2400_1_REF_8_REF02 varchar(50) =NULL,
@L2400_1_REF_8_REF04_1 varchar(3) =NULL,
@L2400_1_REF_8_REF04_2 varchar(50) =NULL,
@L2400_1_REF_9_REF01 varchar(3) =NULL,
@L2400_1_REF_9_REF02 varchar(50) =NULL,
@L2400_1_REF_9_REF04_1 varchar(3) =NULL,
@L2400_1_REF_9_REF04_2 varchar(50) =NULL,
@L2400_1_REF_11_REF01 varchar(3) =NULL,
@L2400_1_REF_11_REF02 varchar(50) =NULL,
@L2400_1_REF_11_REF04_1 varchar(3) =NULL,
@L2400_1_REF_11_REF04_2 varchar(50) =NULL,
@L2400_1_REF_12_REF01 varchar(3) =NULL,
@L2400_1_REF_12_REF02 varchar(50) =NULL,
@L2400_1_REF_12_REF04_1 varchar(3) =NULL,
@L2400_1_REF_12_REF04_2 varchar(50) =NULL,
@L2400_1_REF_13_REF01 varchar(3) =NULL,
@L2400_1_REF_13_REF02 varchar(50) =NULL,
@L2400_1_REF_13_REF04_1 varchar(3) =NULL,
@L2400_1_REF_13_REF04_2 varchar(50) =NULL,
@L2400_1_REF_14_REF01 varchar(3) =NULL,
@L2400_1_REF_14_REF02 varchar(50) =NULL,
@L2400_1_REF_14_REF04_1 varchar(3) =NULL,
@L2400_1_REF_14_REF04_2 varchar(50) =NULL,
@L2400_1_REF_15_REF01 varchar(3) =NULL,
@L2400_1_REF_15_REF02 varchar(50) =NULL,
@L2400_1_REF_15_REF04_1 varchar(3) =NULL,
@L2400_1_REF_15_REF04_2 varchar(50) =NULL,
@L2400_1_REF_16_REF01 varchar(3) =NULL,
@L2400_1_REF_16_REF02 varchar(50) =NULL,
@L2400_1_REF_16_REF04_1 varchar(3) =NULL,
@L2400_1_REF_16_REF04_2 varchar(50) =NULL,
@L2400_1_REF_17_REF01 varchar(3) =NULL,
@L2400_1_REF_17_REF02 varchar(50) =NULL,
@L2400_1_REF_17_REF04_1 varchar(3) =NULL,
@L2400_1_REF_17_REF04_2 varchar(50) =NULL,
@L2400_1_AMT_1_AMT01 varchar(3) =NULL,
@L2400_1_AMT_1_AMT02 varchar(18) =NULL,
@L2400_1_K3_1_K301 varchar(80) =NULL,
@L2400_1_K3_2_K301 varchar(80) =NULL,
@L2400_1_K3_3_K301 varchar(80) =NULL,
@L2400_1_K3_4_K301 varchar(80) =NULL,
@L2400_1_K3_5_K301 varchar(80) =NULL,
@L2400_1_K3_6_K301 varchar(80) =NULL,
@L2400_1_K3_7_K301 varchar(80) =NULL,
@L2400_1_K3_8_K301 varchar(80) =NULL,
@L2400_1_K3_9_K301 varchar(80) =NULL,
@L2400_1_K3_10_K301 varchar(80) =NULL,
@L2400_1_NTE_1_NTE01 varchar(3) =NULL,
@L2400_1_NTE_1_NTE02 varchar(80) =NULL,
@L2400_1_NTE_2_NTE01 varchar(3) =NULL,
@L2400_1_NTE_2_NTE02 varchar(80) =NULL,
@L2400_1_PS1_1_PS101 varchar(50) =NULL,
@L2400_1_PS1_1_PS102 varchar(18) =NULL,
@L2400_1_HCP_1_HCP01 varchar(2) =NULL,
@L2400_1_HCP_1_HCP02 varchar(18) =NULL,
@L2400_1_HCP_1_HCP03 varchar(18) =NULL,
@L2400_1_HCP_1_HCP04 varchar(50) =NULL,
@L2400_1_HCP_1_HCP05 varchar(9) =NULL,
@L2400_1_HCP_1_HCP06 varchar(50) =NULL,
@L2400_1_HCP_1_HCP07 varchar(18) =NULL,
@L2400_1_HCP_1_HCP09 varchar(2) =NULL,
@L2400_1_HCP_1_HCP10 varchar(48) =NULL,
@L2400_1_HCP_1_HCP11 varchar(2) =NULL,
@L2400_1_HCP_1_HCP12 varchar(15) =NULL,
@L2400_1_HCP_1_HCP13 varchar(2) =NULL,
@L2400_1_HCP_1_HCP14 varchar(2) =NULL,
@L2400_1_HCP_1_HCP15 varchar(2) =NULL,
@L2410_1_LIN_1_LIN01 varchar(20) =NULL,
@L2410_1_LIN_1_LIN02 varchar(2) =NULL,
@L2410_1_LIN_1_LIN03 varchar(48) =NULL,
@L2410_1_CTP_1_CTP04 varchar(15) =NULL,
@L2410_1_CTP_1_CTP05 varchar(2) =NULL,
@L2410_1_REF_1_REF01 varchar(3) =NULL,
@L2410_1_REF_1_REF02 varchar(50) =NULL,
@L2410_1_REF_2_REF01 varchar(3) =NULL,
@L2410_1_REF_2_REF02 varchar(50) =NULL,
@L2420A_1_NM1_1_NM101 varchar(3) =NULL,
@L2420A_1_NM1_1_NM102 varchar(1) =NULL,
@L2420A_1_NM1_1_NM103 varchar(60) =NULL,
@L2420A_1_NM1_1_NM104 varchar(35) =NULL,
@L2420A_1_NM1_1_NM105 varchar(25) =NULL,
@L2420A_1_NM1_1_NM107 varchar(10) =NULL,
@L2420A_1_NM1_1_NM108 varchar(2) =NULL,
@L2420A_1_NM1_1_NM109 varchar(80) =NULL,
@L2420A_1_PRV_1_PRV01 varchar(3) =NULL,
@L2420A_1_PRV_1_PRV02 varchar(3) =NULL,
@L2420A_1_PRV_1_PRV03 varchar(50) =NULL,
@L2420A_1_REF_1_REF01 varchar(3) =NULL,
@L2420A_1_REF_1_REF02 varchar(50) =NULL,
@L2420A_1_REF_1_REF04_1 varchar(3) =NULL,
@L2420A_1_REF_1_REF04_2 varchar(50) =NULL,
@L2420A_1_REF_2_REF01 varchar(3) =NULL,
@L2420A_1_REF_2_REF02 varchar(50) =NULL,
@L2420A_1_REF_2_REF04_1 varchar(3) =NULL,
@L2420A_1_REF_2_REF04_2 varchar(50) =NULL,
@L2420A_1_REF_3_REF01 varchar(3) =NULL,
@L2420A_1_REF_3_REF02 varchar(50) =NULL,
@L2420A_1_REF_3_REF04_1 varchar(3) =NULL,
@L2420A_1_REF_3_REF04_2 varchar(50) =NULL,
@L2420A_1_REF_4_REF01 varchar(3) =NULL,
@L2420A_1_REF_4_REF02 varchar(50) =NULL,
@L2420A_1_REF_4_REF04_1 varchar(3) =NULL,
@L2420A_1_REF_4_REF04_2 varchar(50) =NULL,
@L2420B_1_NM1_1_NM101 varchar(3) =NULL,
@L2420B_1_NM1_1_NM102 varchar(1) =NULL,
@L2420B_1_NM1_1_NM108 varchar(2) =NULL,
@L2420B_1_NM1_1_NM109 varchar(80) =NULL,
@L2420B_1_REF_1_REF01 varchar(3) =NULL,
@L2420B_1_REF_1_REF02 varchar(50) =NULL,
@L2420B_1_REF_1_REF04_1 varchar(3) =NULL,
@L2420B_1_REF_1_REF04_2 varchar(50) =NULL,
@L2420B_1_REF_2_REF01 varchar(3) =NULL,
@L2420B_1_REF_2_REF02 varchar(50) =NULL,
@L2420B_1_REF_2_REF04_1 varchar(3) =NULL,
@L2420B_1_REF_2_REF04_2 varchar(50) =NULL,
@L2420B_1_REF_3_REF01 varchar(3) =NULL,
@L2420B_1_REF_3_REF02 varchar(50) =NULL,
@L2420B_1_REF_3_REF04_1 varchar(3) =NULL,
@L2420B_1_REF_3_REF04_2 varchar(50) =NULL,
@L2420C_1_NM1_1_NM101 varchar(3) =NULL,
@L2420C_1_NM1_1_NM102 varchar(1) =NULL,
@L2420C_1_NM1_1_NM103 varchar(60) =NULL,
@L2420C_1_NM1_1_NM108 varchar(2) =NULL,
@L2420C_1_NM1_1_NM109 varchar(80) =NULL,
@L2420C_1_N3_1_N301 varchar(55) =NULL,
@L2420C_1_N3_1_N302 varchar(55) =NULL,
@L2420C_1_N4_1_N401 varchar(30) =NULL,
@L2420C_1_N4_1_N402 varchar(2) =NULL,
@L2420C_1_N4_1_N403 varchar(15) =NULL,
@L2420C_1_N4_1_N404 varchar(3) =NULL,
@L2420C_1_N4_1_N407 varchar(3) =NULL,
@L2420C_1_REF_1_REF01 varchar(3) =NULL,
@L2420C_1_REF_1_REF02 varchar(50) =NULL,
@L2420C_1_REF_1_REF04_1 varchar(3) =NULL,
@L2420C_1_REF_1_REF04_2 varchar(50) =NULL,
@L2420C_1_REF_2_REF01 varchar(3) =NULL,
@L2420C_1_REF_2_REF02 varchar(50) =NULL,
@L2420C_1_REF_2_REF04_1 varchar(3) =NULL,
@L2420C_1_REF_2_REF04_2 varchar(50) =NULL,
@L2420D_1_NM1_1_NM101 varchar(3) =NULL,
@L2420D_1_NM1_1_NM102 varchar(1) =NULL,
@L2420D_1_NM1_1_NM103 varchar(80) =NULL,
@L2420D_1_NM1_1_NM104 varchar(35) =NULL,
@L2420D_1_NM1_1_NM105 varchar(25) =NULL,
@L2420D_1_NM1_1_NM107 varchar(10) =NULL,
@L2420D_1_NM1_1_NM108 varchar(2) =NULL,
@L2420D_1_NM1_1_NM109 varchar(80) =NULL,
@L2420D_1_REF_1_REF01 varchar(3) =NULL,
@L2420D_1_REF_1_REF02 varchar(50) =NULL,
@L2420D_1_REF_1_REF04_1 varchar(3) =NULL,
@L2420D_1_REF_1_REF04_2 varchar(50) =NULL,
@L2420D_1_REF_2_REF01 varchar(3) =NULL,
@L2420D_1_REF_2_REF02 varchar(50) =NULL,
@L2420D_1_REF_2_REF04_1 varchar(3) =NULL,
@L2420D_1_REF_2_REF04_2 varchar(50) =NULL,
@L2420D_1_REF_3_REF01 varchar(3) =NULL,
@L2420D_1_REF_3_REF02 varchar(50) =NULL,
@L2420D_1_REF_3_REF04_1 varchar(3) =NULL,
@L2420D_1_REF_3_REF04_2 varchar(50) =NULL,
@L2420D_1_REF_4_REF01 varchar(3) =NULL,
@L2420D_1_REF_4_REF02 varchar(50) =NULL,
@L2420D_1_REF_4_REF04_1 varchar(3) =NULL,
@L2420D_1_REF_4_REF04_2 varchar(50) =NULL,
@L2420E_1_NM1_1_NM101 varchar(3) =NULL,
@L2420E_1_NM1_1_NM102 varchar(1) =NULL,
@L2420E_1_NM1_1_NM103 varchar(60) =NULL,
@L2420E_1_NM1_1_NM104 varchar(35) =NULL,
@L2420E_1_NM1_1_NM105 varchar(25) =NULL,
@L2420E_1_NM1_1_NM107 varchar(10) =NULL,
@L2420E_1_NM1_1_NM108 varchar(2) =NULL,
@L2420E_1_NM1_1_NM109 varchar(80) =NULL,
@L2420E_1_N3_1_N301 varchar(55) =NULL,
@L2420E_1_N3_1_N302 varchar(55) =NULL,
@L2420E_1_N4_1_N401 varchar(30) =NULL,
@L2420E_1_N4_1_N402 varchar(2) =NULL,
@L2420E_1_N4_1_N403 varchar(15) =NULL,
@L2420E_1_N4_1_N404 varchar(3) =NULL,
@L2420E_1_N4_1_N407 varchar(3) =NULL,
@L2420E_1_REF_1_REF01 varchar(3) =NULL,
@L2420E_1_REF_1_REF02 varchar(50) =NULL,
@L2420E_1_REF_1_REF04_1 varchar(3) =NULL,
@L2420E_1_REF_1_REF04_2 varchar(50) =NULL,
@L2420E_1_REF_2_REF01 varchar(3) =NULL,
@L2420E_1_REF_2_REF02 varchar(50) =NULL,
@L2420E_1_REF_2_REF04_1 varchar(3) =NULL,
@L2420E_1_REF_2_REF04_2 varchar(50) =NULL,
@L2420E_1_REF_3_REF01 varchar(3) =NULL,
@L2420E_1_REF_3_REF02 varchar(50) =NULL,
@L2420E_1_REF_3_REF04_1 varchar(3) =NULL,
@L2420E_1_REF_3_REF04_2 varchar(50) =NULL,
@L2420E_1_PER_1_PER01 varchar(2) =NULL,
@L2420E_1_PER_1_PER02 varchar(60) =NULL,
@L2420E_1_PER_1_PER03 varchar(2) =NULL,
@L2420E_1_PER_1_PER04 varchar(256) =NULL,
@L2420E_1_PER_1_PER05 varchar(2) =NULL,
@L2420E_1_PER_1_PER06 varchar(256) =NULL,
@L2420E_1_PER_1_PER07 varchar(2) =NULL,
@L2420E_1_PER_1_PER08 varchar(256) =NULL,
@L2420F_1_NM1_1_NM101 varchar(3) =NULL,
@L2420F_1_NM1_1_NM102 varchar(1) =NULL,
@L2420F_1_NM1_1_NM103 varchar(60) =NULL,
@L2420F_1_NM1_1_NM104 varchar(35) =NULL,
@L2420F_1_NM1_1_NM105 varchar(25) =NULL,
@L2420F_1_NM1_1_NM107 varchar(10) =NULL,
@L2420F_1_NM1_1_NM108 varchar(2) =NULL,
@L2420F_1_NM1_1_NM109 varchar(80) =NULL,
@L2420F_1_REF_1_REF01 varchar(3) =NULL,
@L2420F_1_REF_1_REF02 varchar(50) =NULL,
@L2420F_1_REF_1_REF04_1 varchar(3) =NULL,
@L2420F_1_REF_1_REF04_2 varchar(50) =NULL,
@L2420F_1_REF_2_REF01 varchar(3) =NULL,
@L2420F_1_REF_2_REF02 varchar(50) =NULL,
@L2420F_1_REF_2_REF04_1 varchar(3) =NULL,
@L2420F_1_REF_2_REF04_2 varchar(50) =NULL,
@L2420F_1_REF_3_REF01 varchar(3) =NULL,
@L2420F_1_REF_3_REF02 varchar(50) =NULL,
@L2420F_1_REF_3_REF04_1 varchar(3) =NULL,
@L2420F_1_REF_3_REF04_2 varchar(50) =NULL,
@L2420F_2_NM1_1_NM101 varchar(3) =NULL,
@L2420F_2_NM1_1_NM102 varchar(1) =NULL,
@L2420F_2_NM1_1_NM103 varchar(60) =NULL,
@L2420F_2_NM1_1_NM104 varchar(35) =NULL,
@L2420F_2_NM1_1_NM105 varchar(25) =NULL,
@L2420F_2_NM1_1_NM107 varchar(10) =NULL,
@L2420F_2_NM1_1_NM108 varchar(2) =NULL,
@L2420F_2_NM1_1_NM109 varchar(80) =NULL,
@L2420F_2_REF_1_REF01 varchar(3) =NULL,
@L2420F_2_REF_1_REF02 varchar(50) =NULL,
@L2420F_2_REF_1_REF04_1 varchar(3) =NULL,
@L2420F_2_REF_1_REF04_2 varchar(50) =NULL,
@L2420F_2_REF_2_REF01 varchar(3) =NULL,
@L2420F_2_REF_2_REF02 varchar(50) =NULL,
@L2420F_2_REF_2_REF04_1 varchar(3) =NULL,
@L2420F_2_REF_2_REF04_2 varchar(50) =NULL,
@L2420F_2_REF_3_REF01 varchar(3) =NULL,
@L2420F_2_REF_3_REF02 varchar(50) =NULL,
@L2420F_2_REF_3_REF04_1 varchar(3) =NULL,
@L2420F_2_REF_3_REF04_2 varchar(50) =NULL,
@L2420G_1_NM1_1_NM101 varchar(3) =NULL,
@L2420G_1_NM1_1_NM102 varchar(1) =NULL,
@L2420G_1_N3_1_N301 varchar(55) =NULL,
@L2420G_1_N3_1_N302 varchar(55) =NULL,
@L2420G_1_N4_1_N401 varchar(30) =NULL,
@L2420G_1_N4_1_N402 varchar(2) =NULL,
@L2420G_1_N4_1_N403 varchar(15) =NULL,
@L2420G_1_N4_1_N404 varchar(3) =NULL,
@L2420G_1_N4_1_N407 varchar(3) =NULL,
@L2420H_1_NM1_1_NM101 varchar(3) =NULL,
@L2420H_1_NM1_1_NM102 varchar(1) =NULL,
@L2420H_1_N3_1_N301 varchar(55) =NULL,
@L2420H_1_N3_1_N302 varchar(55) =NULL,
@L2420H_1_N4_1_N401 varchar(30) =NULL,
@L2420H_1_N4_1_N402 varchar(2) =NULL,
@L2420H_1_N4_1_N403 varchar(15) =NULL,
@L2420H_1_N4_1_N404 varchar(3) =NULL,
@L2420H_1_N4_1_N407 varchar(3) =NULL,
@L2430_1_SVD_1_SVD01 varchar(80) =NULL,
@L2430_1_SVD_1_SVD02 varchar(18) =NULL,
@L2430_1_SVD_1_SVD03_1 varchar(2) =NULL,
@L2430_1_SVD_1_SVD03_2 varchar(48) =NULL,
@L2430_1_SVD_1_SVD03_3 varchar(2) =NULL,
@L2430_1_SVD_1_SVD03_4 varchar(2) =NULL,
@L2430_1_SVD_1_SVD03_5 varchar(2) =NULL,
@L2430_1_SVD_1_SVD03_6 varchar(2) =NULL,
@L2430_1_SVD_1_SVD03_7 varchar(80) =NULL,
@L2430_1_SVD_1_SVD05 varchar(15) =NULL,
@L2430_1_SVD_1_SVD06 varchar(6) =NULL,
@L2430_1_CAS_1_CAS01 varchar(2) =NULL,
@L2430_1_CAS_1_CAS02 varchar(5) =NULL,
@L2430_1_CAS_1_CAS03 varchar(18) =NULL,
@L2430_1_CAS_1_CAS04 varchar(15) =NULL,
@L2430_1_CAS_1_CAS05 varchar(5) =NULL,
@L2430_1_CAS_1_CAS06 varchar(18) =NULL,
@L2430_1_CAS_1_CAS07 varchar(15) =NULL,
@L2430_1_CAS_1_CAS08 varchar(5) =NULL,
@L2430_1_CAS_1_CAS09 varchar(18) =NULL,
@L2430_1_CAS_1_CAS10 varchar(15) =NULL,
@L2430_1_CAS_1_CAS11 varchar(5) =NULL,
@L2430_1_CAS_1_CAS12 varchar(18) =NULL,
@L2430_1_CAS_1_CAS13 varchar(15) =NULL,
@L2430_1_CAS_1_CAS14 varchar(5) =NULL,
@L2430_1_CAS_1_CAS15 varchar(18) =NULL,
@L2430_1_CAS_1_CAS16 varchar(15) =NULL,
@L2430_1_CAS_1_CAS17 varchar(5) =NULL,
@L2430_1_CAS_1_CAS18 varchar(18) =NULL,
@L2430_1_CAS_1_CAS19 varchar(15) =NULL,
@L2430_1_CAS_2_CAS01 varchar(2) =NULL,
@L2430_1_CAS_2_CAS02 varchar(5) =NULL,
@L2430_1_CAS_2_CAS03 varchar(18) =NULL,
@L2430_1_CAS_2_CAS04 varchar(15) =NULL,
@L2430_1_CAS_2_CAS05 varchar(5) =NULL,
@L2430_1_CAS_2_CAS06 varchar(18) =NULL,
@L2430_1_CAS_2_CAS07 varchar(15) =NULL,
@L2430_1_CAS_2_CAS08 varchar(5) =NULL,
@L2430_1_CAS_2_CAS09 varchar(18) =NULL,
@L2430_1_CAS_2_CAS10 varchar(15) =NULL,
@L2430_1_CAS_2_CAS11 varchar(5) =NULL,
@L2430_1_CAS_2_CAS12 varchar(18) =NULL,
@L2430_1_CAS_2_CAS13 varchar(15) =NULL,
@L2430_1_CAS_2_CAS14 varchar(5) =NULL,
@L2430_1_CAS_2_CAS15 varchar(18) =NULL,
@L2430_1_CAS_2_CAS16 varchar(15) =NULL,
@L2430_1_CAS_2_CAS17 varchar(5) =NULL,
@L2430_1_CAS_2_CAS18 varchar(18) =NULL,
@L2430_1_CAS_2_CAS19 varchar(15) =NULL,
@L2430_1_CAS_3_CAS01 varchar(2) =NULL,
@L2430_1_CAS_3_CAS02 varchar(5) =NULL,
@L2430_1_CAS_3_CAS03 varchar(18) =NULL,
@L2430_1_CAS_3_CAS04 varchar(15) =NULL,
@L2430_1_CAS_3_CAS05 varchar(5) =NULL,
@L2430_1_CAS_3_CAS06 varchar(18) =NULL,
@L2430_1_CAS_3_CAS07 varchar(15) =NULL,
@L2430_1_CAS_3_CAS08 varchar(5) =NULL,
@L2430_1_CAS_3_CAS09 varchar(18) =NULL,
@L2430_1_CAS_3_CAS10 varchar(15) =NULL,
@L2430_1_CAS_3_CAS11 varchar(5) =NULL,
@L2430_1_CAS_3_CAS12 varchar(18) =NULL,
@L2430_1_CAS_3_CAS13 varchar(15) =NULL,
@L2430_1_CAS_3_CAS14 varchar(5) =NULL,
@L2430_1_CAS_3_CAS15 varchar(18) =NULL,
@L2430_1_CAS_3_CAS16 varchar(15) =NULL,
@L2430_1_CAS_3_CAS17 varchar(5) =NULL,
@L2430_1_CAS_3_CAS18 varchar(18) =NULL,
@L2430_1_CAS_3_CAS19 varchar(15) =NULL,
@L2430_1_CAS_4_CAS01 varchar(2) =NULL,
@L2430_1_CAS_4_CAS02 varchar(5) =NULL,
@L2430_1_CAS_4_CAS03 varchar(18) =NULL,
@L2430_1_CAS_4_CAS04 varchar(15) =NULL,
@L2430_1_CAS_4_CAS05 varchar(5) =NULL,
@L2430_1_CAS_4_CAS06 varchar(18) =NULL,
@L2430_1_CAS_4_CAS07 varchar(15) =NULL,
@L2430_1_CAS_4_CAS08 varchar(5) =NULL,
@L2430_1_CAS_4_CAS09 varchar(18) =NULL,
@L2430_1_CAS_4_CAS10 varchar(15) =NULL,
@L2430_1_CAS_4_CAS11 varchar(5) =NULL,
@L2430_1_CAS_4_CAS12 varchar(18) =NULL,
@L2430_1_CAS_4_CAS13 varchar(15) =NULL,
@L2430_1_CAS_4_CAS14 varchar(5) =NULL,
@L2430_1_CAS_4_CAS15 varchar(18) =NULL,
@L2430_1_CAS_4_CAS16 varchar(15) =NULL,
@L2430_1_CAS_4_CAS17 varchar(5) =NULL,
@L2430_1_CAS_4_CAS18 varchar(18) =NULL,
@L2430_1_CAS_4_CAS19 varchar(15) =NULL,
@L2430_1_CAS_5_CAS01 varchar(2) =NULL,
@L2430_1_CAS_5_CAS02 varchar(5) =NULL,
@L2430_1_CAS_5_CAS03 varchar(18) =NULL,
@L2430_1_CAS_5_CAS04 varchar(15) =NULL,
@L2430_1_CAS_5_CAS05 varchar(5) =NULL,
@L2430_1_CAS_5_CAS06 varchar(18) =NULL,
@L2430_1_CAS_5_CAS07 varchar(15) =NULL,
@L2430_1_CAS_5_CAS08 varchar(5) =NULL,
@L2430_1_CAS_5_CAS09 varchar(18) =NULL,
@L2430_1_CAS_5_CAS10 varchar(15) =NULL,
@L2430_1_CAS_5_CAS11 varchar(5) =NULL,
@L2430_1_CAS_5_CAS12 varchar(18) =NULL,
@L2430_1_CAS_5_CAS13 varchar(15) =NULL,
@L2430_1_CAS_5_CAS14 varchar(5) =NULL,
@L2430_1_CAS_5_CAS15 varchar(18) =NULL,
@L2430_1_CAS_5_CAS16 varchar(15) =NULL,
@L2430_1_CAS_5_CAS17 varchar(5) =NULL,
@L2430_1_CAS_5_CAS18 varchar(18) =NULL,
@L2430_1_CAS_5_CAS19 varchar(15) =NULL,
@L2430_1_DTP_1_DTP01 varchar(3) =NULL,
@L2430_1_DTP_1_DTP02 varchar(3) =NULL,
@L2430_1_DTP_1_DTP03 varchar(35) =NULL,
@L2430_1_AMT_1_AMT01 varchar(3) =NULL,
@L2430_1_AMT_1_AMT02 varchar(18) =NULL
)
AS
BEGIN
INSERT INTO [EDIDatabase].[dbo].[EDI_837P_ServiceLine]
           ([claimid]
           ,[Fileid]
           ,[HeaderID]
           ,[subscriber_patientid]
           ,[L2400_1_LX_1_LX01]
           ,[L2400_1_SV1_1_SV101_01]
           ,[L2400_1_SV1_1_SV101_02]
           ,[L2400_1_SV1_1_SV101_03]
           ,[L2400_1_SV1_1_SV101_04]
           ,[L2400_1_SV1_1_SV101_05]
           ,[L2400_1_SV1_1_SV101_06]
           ,[L2400_1_SV1_1_SV101_07]
           ,[L2400_1_SV1_1_SV102]
           ,[L2400_1_SV1_1_SV103]
           ,[L2400_1_SV1_1_SV104]
           ,[L2400_1_SV1_1_SV105]
           ,[L2400_1_SV1_1_SV107_1]
           ,[L2400_1_SV1_1_SV107_2]
           ,[L2400_1_SV1_1_SV107_3]
           ,[L2400_1_SV1_1_SV107_4]
           ,[L2400_1_SV1_1_SV109]
           ,[L2400_1_SV1_1_SV111]
           ,[L2400_1_SV1_1_SV112]
           ,[L2400_1_SV1_1_SV115]
           ,[L2400_1_SV5_1_SV501_01]
           ,[L2400_1_SV5_1_SV501_02]
           ,[L2400_1_SV5_1_SV502]
           ,[L2400_1_SV5_1_SV503]
           ,[L2400_1_SV5_1_SV504]
           ,[L2400_1_SV5_1_SV505]
           ,[L2400_1_SV5_1_SV506]
           ,[L2400_1_PWK_1_PWK01]
           ,[L2400_1_PWK_1_PWK02]
           ,[L2400_1_PWK_1_PWK05]
           ,[L2400_1_PWK_1_PWK06]
           ,[L2400_1_PWK_2_PWK01]
           ,[L2400_1_PWK_2_PWK02]
           ,[L2400_1_PWK_2_PWK05]
           ,[L2400_1_PWK_2_PWK06]
           ,[L2400_1_PWK_3_PWK01]
           ,[L2400_1_PWK_3_PWK02]
           ,[L2400_1_PWK_3_PWK05]
           ,[L2400_1_PWK_3_PWK06]
           ,[L2400_1_PWK_4_PWK01]
           ,[L2400_1_PWK_4_PWK02]
           ,[L2400_1_PWK_4_PWK05]
           ,[L2400_1_PWK_4_PWK06]
           ,[L2400_1_PWK_5_PWK01]
           ,[L2400_1_PWK_5_PWK02]
           ,[L2400_1_PWK_5_PWK05]
           ,[L2400_1_PWK_5_PWK06]
           ,[L2400_1_PWK_6_PWK01]
           ,[L2400_1_PWK_6_PWK02]
           ,[L2400_1_PWK_6_PWK05]
           ,[L2400_1_PWK_6_PWK06]
           ,[L2400_1_PWK_7_PWK01]
           ,[L2400_1_PWK_7_PWK02]
           ,[L2400_1_PWK_7_PWK05]
           ,[L2400_1_PWK_7_PWK06]
           ,[L2400_1_PWK_8_PWK01]
           ,[L2400_1_PWK_8_PWK02]
           ,[L2400_1_PWK_8_PWK05]
           ,[L2400_1_PWK_8_PWK06]
           ,[L2400_1_PWK_9_PWK01]
           ,[L2400_1_PWK_9_PWK02]
           ,[L2400_1_PWK_9_PWK05]
           ,[L2400_1_PWK_9_PWK06]
           ,[L2400_1_PWK_10_PWK01]
           ,[L2400_1_PWK_10_PWK02]
           ,[L2400_1_PWK_10_PWK05]
           ,[L2400_1_PWK_10_PWK06]
           ,[L2400_1_PWK_11_PWK01]
           ,[L2400_1_PWK_11_PWK02]
           ,[L2400_1_PWK_11_PWK05]
           ,[L2400_1_PWK_11_PWK06]
           ,[L2400_1_CR1_1_CR101]
           ,[L2400_1_CR1_1_CR102]
           ,[L2400_1_CR1_1_CR104]
           ,[L2400_1_CR1_1_CR105]
           ,[L2400_1_CR1_1_CR106]
           ,[L2400_1_CR1_1_CR109]
           ,[L2400_1_CR1_1_CR110]
           ,[L2400_1_CR3_1_CR301]
           ,[L2400_1_CR3_1_CR302]
           ,[L2400_1_CR3_1_CR303]
           ,[L2400_1_CRC_1_CRC01]
           ,[L2400_1_CRC_1_CRC02]
           ,[L2400_1_CRC_1_CRC03]
           ,[L2400_1_CRC_1_CRC04]
           ,[L2400_1_CRC_1_CRC05]
           ,[L2400_1_CRC_1_CRC06]
           ,[L2400_1_CRC_1_CRC07]
           ,[L2400_1_CRC_2_CRC01]
           ,[L2400_1_CRC_2_CRC02]
           ,[L2400_1_CRC_2_CRC03]
           ,[L2400_1_CRC_2_CRC04]
           ,[L2400_1_CRC_2_CRC05]
           ,[L2400_1_CRC_2_CRC06]
           ,[L2400_1_CRC_2_CRC07]
           ,[L2400_1_CRC_3_CRC01]
           ,[L2400_1_CRC_3_CRC02]
           ,[L2400_1_CRC_3_CRC03]
           ,[L2400_1_CRC_3_CRC04]
           ,[L2400_1_CRC_3_CRC05]
           ,[L2400_1_CRC_3_CRC06]
           ,[L2400_1_CRC_3_CRC07]
           ,[L2400_1_CRC_4_CRC01]
           ,[L2400_1_CRC_4_CRC02]
           ,[L2400_1_CRC_4_CRC03]
           ,[L2400_1_CRC_4_CRC04]
           ,[L2400_1_CRC_4_CRC05]
           ,[L2400_1_CRC_4_CRC06]
           ,[L2400_1_CRC_4_CRC07]
           ,[L2400_1_CRC_5_CRC01]
           ,[L2400_1_CRC_5_CRC02]
           ,[L2400_1_CRC_5_CRC03]
           ,[L2400_1_CRC_5_CRC04]
           ,[L2400_1_CRC_5_CRC05]
           ,[L2400_1_CRC_5_CRC06]
           ,[L2400_1_CRC_5_CRC07]
           ,[L2400_1_DTP_1_DTP01]
           ,[L2400_1_DTP_1_DTP02]
           ,[L2400_1_DTP_1_DTP03]
           ,[L2400_1_DTP_2_DTP01]
           ,[L2400_1_DTP_2_DTP02]
           ,[L2400_1_DTP_2_DTP03]
           ,[L2400_1_DTP_3_DTP01]
           ,[L2400_1_DTP_3_DTP02]
           ,[L2400_1_DTP_3_DTP03]
           ,[L2400_1_DTP_4_DTP01]
           ,[L2400_1_DTP_4_DTP02]
           ,[L2400_1_DTP_4_DTP03]
           ,[L2400_1_DTP_5_DTP01]
           ,[L2400_1_DTP_5_DTP02]
           ,[L2400_1_DTP_5_DTP03]
           ,[L2400_1_DTP_6_DTP01]
           ,[L2400_1_DTP_6_DTP02]
           ,[L2400_1_DTP_6_DTP03]
           ,[L2400_1_DTP_7_DTP01]
           ,[L2400_1_DTP_7_DTP02]
           ,[L2400_1_DTP_7_DTP03]
           ,[L2400_1_DTP_8_DTP01]
           ,[L2400_1_DTP_8_DTP02]
           ,[L2400_1_DTP_8_DTP03]
           ,[L2400_1_DTP_9_DTP01]
           ,[L2400_1_DTP_9_DTP02]
           ,[L2400_1_DTP_9_DTP03]
           ,[L2400_1_DTP_10_DTP01]
           ,[L2400_1_DTP_10_DTP02]
           ,[L2400_1_DTP_10_DTP03]
           ,[L2400_1_QTY_1_QTY01]
           ,[L2400_1_QTY_1_QTY02]
           ,[L2400_1_QTY_2_QTY01]
           ,[L2400_1_QTY_2_QTY02]
           ,[L2400_1_MEA_1_MEA01]
           ,[L2400_1_MEA_1_MEA02]
           ,[L2400_1_MEA_1_MEA03]
           ,[L2400_1_MEA_2_MEA01]
           ,[L2400_1_MEA_2_MEA02]
           ,[L2400_1_MEA_2_MEA03]
           ,[L2400_1_MEA_3_MEA01]
           ,[L2400_1_MEA_3_MEA02]
           ,[L2400_1_MEA_3_MEA03]
           ,[L2400_1_MEA_4_MEA01]
           ,[L2400_1_MEA_4_MEA02]
           ,[L2400_1_MEA_4_MEA03]
           ,[L2400_1_MEA_5_MEA01]
           ,[L2400_1_MEA_5_MEA02]
           ,[L2400_1_MEA_5_MEA03]
           ,[L2400_1_CN1_1_CN101]
           ,[L2400_1_CN1_1_CN102]
           ,[L2400_1_CN1_1_CN103]
           ,[L2400_1_CN1_1_CN104]
           ,[L2400_1_CN1_1_CN105]
           ,[L2400_1_CN1_1_CN106]
           ,[L2400_1_REF_1_REF01]
           ,[L2400_1_REF_1_REF02]
           ,[L2400_1_REF_1_REF04_1]
           ,[L2400_1_REF_1_REF04_2]
           ,[L2400_1_REF_2_REF01]
           ,[L2400_1_REF_2_REF02]
           ,[L2400_1_REF_2_REF04_1]
           ,[L2400_1_REF_2_REF04_2]
           ,[L2400_1_REF_3_REF01]
           ,[L2400_1_REF_3_REF02]
           ,[L2400_1_REF_3_REF04_1]
           ,[L2400_1_REF_3_REF04_2]
           ,[L2400_1_REF_4_REF01]
           ,[L2400_1_REF_4_REF02]
           ,[L2400_1_REF_4_REF04_1]
           ,[L2400_1_REF_4_REF04_2]
           ,[L2400_1_REF_5_REF01]
           ,[L2400_1_REF_5_REF02]
           ,[L2400_1_REF_5_REF04_1]
           ,[L2400_1_REF_5_REF04_2]
           ,[L2400_1_REF_6_REF01]
           ,[L2400_1_REF_6_REF02]
           ,[L2400_1_REF_6_REF04_1]
           ,[L2400_1_REF_6_REF04_2]
           ,[L2400_1_REF_7_REF01]
           ,[L2400_1_REF_7_REF02]
           ,[L2400_1_REF_7_REF04_1]
           ,[L2400_1_REF_7_REF04_2]
           ,[L2400_1_REF_8_REF01]
           ,[L2400_1_REF_8_REF02]
           ,[L2400_1_REF_8_REF04_1]
           ,[L2400_1_REF_8_REF04_2]
           ,[L2400_1_REF_9_REF01]
           ,[L2400_1_REF_9_REF02]
           ,[L2400_1_REF_9_REF04_1]
           ,[L2400_1_REF_9_REF04_2]
           ,[L2400_1_REF_11_REF01]
           ,[L2400_1_REF_11_REF02]
           ,[L2400_1_REF_11_REF04_1]
           ,[L2400_1_REF_11_REF04_2]
           ,[L2400_1_REF_12_REF01]
           ,[L2400_1_REF_12_REF02]
           ,[L2400_1_REF_12_REF04_1]
           ,[L2400_1_REF_12_REF04_2]
           ,[L2400_1_REF_13_REF01]
           ,[L2400_1_REF_13_REF02]
           ,[L2400_1_REF_13_REF04_1]
           ,[L2400_1_REF_13_REF04_2]
           ,[L2400_1_REF_14_REF01]
           ,[L2400_1_REF_14_REF02]
           ,[L2400_1_REF_14_REF04_1]
           ,[L2400_1_REF_14_REF04_2]
           ,[L2400_1_REF_15_REF01]
           ,[L2400_1_REF_15_REF02]
           ,[L2400_1_REF_15_REF04_1]
           ,[L2400_1_REF_15_REF04_2]
           ,[L2400_1_REF_16_REF01]
           ,[L2400_1_REF_16_REF02]
           ,[L2400_1_REF_16_REF04_1]
           ,[L2400_1_REF_16_REF04_2]
           ,[L2400_1_REF_17_REF01]
           ,[L2400_1_REF_17_REF02]
           ,[L2400_1_REF_17_REF04_1]
           ,[L2400_1_REF_17_REF04_2]
           ,[L2400_1_AMT_1_AMT01]
           ,[L2400_1_AMT_1_AMT02]
           ,[L2400_1_K3_1_K301]
           ,[L2400_1_K3_2_K301]
           ,[L2400_1_K3_3_K301]
           ,[L2400_1_K3_4_K301]
           ,[L2400_1_K3_5_K301]
           ,[L2400_1_K3_6_K301]
           ,[L2400_1_K3_7_K301]
           ,[L2400_1_K3_8_K301]
           ,[L2400_1_K3_9_K301]
           ,[L2400_1_K3_10_K301]
           ,[L2400_1_NTE_1_NTE01]
           ,[L2400_1_NTE_1_NTE02]
           ,[L2400_1_NTE_2_NTE01]
           ,[L2400_1_NTE_2_NTE02]
           ,[L2400_1_PS1_1_PS101]
           ,[L2400_1_PS1_1_PS102]
           ,[L2400_1_HCP_1_HCP01]
           ,[L2400_1_HCP_1_HCP02]
           ,[L2400_1_HCP_1_HCP03]
           ,[L2400_1_HCP_1_HCP04]
           ,[L2400_1_HCP_1_HCP05]
           ,[L2400_1_HCP_1_HCP06]
           ,[L2400_1_HCP_1_HCP07]
           ,[L2400_1_HCP_1_HCP09]
           ,[L2400_1_HCP_1_HCP10]
           ,[L2400_1_HCP_1_HCP11]
           ,[L2400_1_HCP_1_HCP12]
           ,[L2400_1_HCP_1_HCP13]
           ,[L2400_1_HCP_1_HCP14]
           ,[L2400_1_HCP_1_HCP15]
           ,[L2410_1_LIN_1_LIN01]
           ,[L2410_1_LIN_1_LIN02]
           ,[L2410_1_LIN_1_LIN03]
           ,[L2410_1_CTP_1_CTP04]
           ,[L2410_1_CTP_1_CTP05]
           ,[L2410_1_REF_1_REF01]
           ,[L2410_1_REF_1_REF02]
           ,[L2410_1_REF_2_REF01]
           ,[L2410_1_REF_2_REF02]
           ,[L2420A_1_NM1_1_NM101]
           ,[L2420A_1_NM1_1_NM102]
           ,[L2420A_1_NM1_1_NM103]
           ,[L2420A_1_NM1_1_NM104]
           ,[L2420A_1_NM1_1_NM105]
           ,[L2420A_1_NM1_1_NM107]
           ,[L2420A_1_NM1_1_NM108]
           ,[L2420A_1_NM1_1_NM109]
           ,[L2420A_1_PRV_1_PRV01]
           ,[L2420A_1_PRV_1_PRV02]
           ,[L2420A_1_PRV_1_PRV03]
           ,[L2420A_1_REF_1_REF01]
           ,[L2420A_1_REF_1_REF02]
           ,[L2420A_1_REF_1_REF04_1]
           ,[L2420A_1_REF_1_REF04_2]
           ,[L2420A_1_REF_2_REF01]
           ,[L2420A_1_REF_2_REF02]
           ,[L2420A_1_REF_2_REF04_1]
           ,[L2420A_1_REF_2_REF04_2]
           ,[L2420A_1_REF_3_REF01]
           ,[L2420A_1_REF_3_REF02]
           ,[L2420A_1_REF_3_REF04_1]
           ,[L2420A_1_REF_3_REF04_2]
           ,[L2420A_1_REF_4_REF01]
           ,[L2420A_1_REF_4_REF02]
           ,[L2420A_1_REF_4_REF04_1]
           ,[L2420A_1_REF_4_REF04_2]
           ,[L2420B_1_NM1_1_NM101]
           ,[L2420B_1_NM1_1_NM102]
           ,[L2420B_1_NM1_1_NM108]
           ,[L2420B_1_NM1_1_NM109]
           ,[L2420B_1_REF_1_REF01]
           ,[L2420B_1_REF_1_REF02]
           ,[L2420B_1_REF_1_REF04_1]
           ,[L2420B_1_REF_1_REF04_2]
           ,[L2420B_1_REF_2_REF01]
           ,[L2420B_1_REF_2_REF02]
           ,[L2420B_1_REF_2_REF04_1]
           ,[L2420B_1_REF_2_REF04_2]
           ,[L2420B_1_REF_3_REF01]
           ,[L2420B_1_REF_3_REF02]
           ,[L2420B_1_REF_3_REF04_1]
           ,[L2420B_1_REF_3_REF04_2]
           ,[L2420C_1_NM1_1_NM101]
           ,[L2420C_1_NM1_1_NM102]
           ,[L2420C_1_NM1_1_NM103]
           ,[L2420C_1_NM1_1_NM108]
           ,[L2420C_1_NM1_1_NM109]
           ,[L2420C_1_N3_1_N301]
           ,[L2420C_1_N3_1_N302]
           ,[L2420C_1_N4_1_N401]
           ,[L2420C_1_N4_1_N402]
           ,[L2420C_1_N4_1_N403]
           ,[L2420C_1_N4_1_N404]
           ,[L2420C_1_N4_1_N407]
           ,[L2420C_1_REF_1_REF01]
           ,[L2420C_1_REF_1_REF02]
           ,[L2420C_1_REF_1_REF04_1]
           ,[L2420C_1_REF_1_REF04_2]
           ,[L2420C_1_REF_2_REF01]
           ,[L2420C_1_REF_2_REF02]
           ,[L2420C_1_REF_2_REF04_1]
           ,[L2420C_1_REF_2_REF04_2]
           ,[L2420D_1_NM1_1_NM101]
           ,[L2420D_1_NM1_1_NM102]
           ,[L2420D_1_NM1_1_NM103]
           ,[L2420D_1_NM1_1_NM104]
           ,[L2420D_1_NM1_1_NM105]
           ,[L2420D_1_NM1_1_NM107]
           ,[L2420D_1_NM1_1_NM108]
           ,[L2420D_1_NM1_1_NM109]
           ,[L2420D_1_REF_1_REF01]
           ,[L2420D_1_REF_1_REF02]
           ,[L2420D_1_REF_1_REF04_1]
           ,[L2420D_1_REF_1_REF04_2]
           ,[L2420D_1_REF_2_REF01]
           ,[L2420D_1_REF_2_REF02]
           ,[L2420D_1_REF_2_REF04_1]
           ,[L2420D_1_REF_2_REF04_2]
           ,[L2420D_1_REF_3_REF01]
           ,[L2420D_1_REF_3_REF02]
           ,[L2420D_1_REF_3_REF04_1]
           ,[L2420D_1_REF_3_REF04_2]
           ,[L2420D_1_REF_4_REF01]
           ,[L2420D_1_REF_4_REF02]
           ,[L2420D_1_REF_4_REF04_1]
           ,[L2420D_1_REF_4_REF04_2]
           ,[L2420E_1_NM1_1_NM101]
           ,[L2420E_1_NM1_1_NM102]
           ,[L2420E_1_NM1_1_NM103]
           ,[L2420E_1_NM1_1_NM104]
           ,[L2420E_1_NM1_1_NM105]
           ,[L2420E_1_NM1_1_NM107]
           ,[L2420E_1_NM1_1_NM108]
           ,[L2420E_1_NM1_1_NM109]
           ,[L2420E_1_N3_1_N301]
           ,[L2420E_1_N3_1_N302]
           ,[L2420E_1_N4_1_N401]
           ,[L2420E_1_N4_1_N402]
           ,[L2420E_1_N4_1_N403]
           ,[L2420E_1_N4_1_N404]
           ,[L2420E_1_N4_1_N407]
           ,[L2420E_1_REF_1_REF01]
           ,[L2420E_1_REF_1_REF02]
           ,[L2420E_1_REF_1_REF04_1]
           ,[L2420E_1_REF_1_REF04_2]
           ,[L2420E_1_REF_2_REF01]
           ,[L2420E_1_REF_2_REF02]
           ,[L2420E_1_REF_2_REF04_1]
           ,[L2420E_1_REF_2_REF04_2]
           ,[L2420E_1_REF_3_REF01]
           ,[L2420E_1_REF_3_REF02]
           ,[L2420E_1_REF_3_REF04_1]
           ,[L2420E_1_REF_3_REF04_2]
           ,[L2420E_1_PER_1_PER01]
           ,[L2420E_1_PER_1_PER02]
           ,[L2420E_1_PER_1_PER03]
           ,[L2420E_1_PER_1_PER04]
           ,[L2420E_1_PER_1_PER05]
           ,[L2420E_1_PER_1_PER06]
           ,[L2420E_1_PER_1_PER07]
           ,[L2420E_1_PER_1_PER08]
           ,[L2420F_1_NM1_1_NM101]
           ,[L2420F_1_NM1_1_NM102]
           ,[L2420F_1_NM1_1_NM103]
           ,[L2420F_1_NM1_1_NM104]
           ,[L2420F_1_NM1_1_NM105]
           ,[L2420F_1_NM1_1_NM107]
           ,[L2420F_1_NM1_1_NM108]
           ,[L2420F_1_NM1_1_NM109]
           ,[L2420F_1_REF_1_REF01]
           ,[L2420F_1_REF_1_REF02]
           ,[L2420F_1_REF_1_REF04_1]
           ,[L2420F_1_REF_1_REF04_2]
           ,[L2420F_1_REF_2_REF01]
           ,[L2420F_1_REF_2_REF02]
           ,[L2420F_1_REF_2_REF04_1]
           ,[L2420F_1_REF_2_REF04_2]
           ,[L2420F_1_REF_3_REF01]
           ,[L2420F_1_REF_3_REF02]
           ,[L2420F_1_REF_3_REF04_1]
           ,[L2420F_1_REF_3_REF04_2]
           ,[L2420F_2_NM1_1_NM101]
           ,[L2420F_2_NM1_1_NM102]
           ,[L2420F_2_NM1_1_NM103]
           ,[L2420F_2_NM1_1_NM104]
           ,[L2420F_2_NM1_1_NM105]
           ,[L2420F_2_NM1_1_NM107]
           ,[L2420F_2_NM1_1_NM108]
           ,[L2420F_2_NM1_1_NM109]
           ,[L2420F_2_REF_1_REF01]
           ,[L2420F_2_REF_1_REF02]
           ,[L2420F_2_REF_1_REF04_1]
           ,[L2420F_2_REF_1_REF04_2]
           ,[L2420F_2_REF_2_REF01]
           ,[L2420F_2_REF_2_REF02]
           ,[L2420F_2_REF_2_REF04_1]
           ,[L2420F_2_REF_2_REF04_2]
           ,[L2420F_2_REF_3_REF01]
           ,[L2420F_2_REF_3_REF02]
           ,[L2420F_2_REF_3_REF04_1]
           ,[L2420F_2_REF_3_REF04_2]
           ,[L2420G_1_NM1_1_NM101]
           ,[L2420G_1_NM1_1_NM102]
           ,[L2420G_1_N3_1_N301]
           ,[L2420G_1_N3_1_N302]
           ,[L2420G_1_N4_1_N401]
           ,[L2420G_1_N4_1_N402]
           ,[L2420G_1_N4_1_N403]
           ,[L2420G_1_N4_1_N404]
           ,[L2420G_1_N4_1_N407]
           ,[L2420H_1_NM1_1_NM101]
           ,[L2420H_1_NM1_1_NM102]
           ,[L2420H_1_N3_1_N301]
           ,[L2420H_1_N3_1_N302]
           ,[L2420H_1_N4_1_N401]
           ,[L2420H_1_N4_1_N402]
           ,[L2420H_1_N4_1_N403]
           ,[L2420H_1_N4_1_N404]
           ,[L2420H_1_N4_1_N407]
           ,[L2430_1_SVD_1_SVD01]
           ,[L2430_1_SVD_1_SVD02]
           ,[L2430_1_SVD_1_SVD03_1]
           ,[L2430_1_SVD_1_SVD03_2]
           ,[L2430_1_SVD_1_SVD03_3]
           ,[L2430_1_SVD_1_SVD03_4]
           ,[L2430_1_SVD_1_SVD03_5]
           ,[L2430_1_SVD_1_SVD03_6]
           ,[L2430_1_SVD_1_SVD03_7]
           ,[L2430_1_SVD_1_SVD05]
           ,[L2430_1_SVD_1_SVD06]
           ,[L2430_1_CAS_1_CAS01]
           ,[L2430_1_CAS_1_CAS02]
           ,[L2430_1_CAS_1_CAS03]
           ,[L2430_1_CAS_1_CAS04]
           ,[L2430_1_CAS_1_CAS05]
           ,[L2430_1_CAS_1_CAS06]
           ,[L2430_1_CAS_1_CAS07]
           ,[L2430_1_CAS_1_CAS08]
           ,[L2430_1_CAS_1_CAS09]
           ,[L2430_1_CAS_1_CAS10]
           ,[L2430_1_CAS_1_CAS11]
           ,[L2430_1_CAS_1_CAS12]
           ,[L2430_1_CAS_1_CAS13]
           ,[L2430_1_CAS_1_CAS14]
           ,[L2430_1_CAS_1_CAS15]
           ,[L2430_1_CAS_1_CAS16]
           ,[L2430_1_CAS_1_CAS17]
           ,[L2430_1_CAS_1_CAS18]
           ,[L2430_1_CAS_1_CAS19]
           ,[L2430_1_CAS_2_CAS01]
           ,[L2430_1_CAS_2_CAS02]
           ,[L2430_1_CAS_2_CAS03]
           ,[L2430_1_CAS_2_CAS04]
           ,[L2430_1_CAS_2_CAS05]
           ,[L2430_1_CAS_2_CAS06]
           ,[L2430_1_CAS_2_CAS07]
           ,[L2430_1_CAS_2_CAS08]
           ,[L2430_1_CAS_2_CAS09]
           ,[L2430_1_CAS_2_CAS10]
           ,[L2430_1_CAS_2_CAS11]
           ,[L2430_1_CAS_2_CAS12]
           ,[L2430_1_CAS_2_CAS13]
           ,[L2430_1_CAS_2_CAS14]
           ,[L2430_1_CAS_2_CAS15]
           ,[L2430_1_CAS_2_CAS16]
           ,[L2430_1_CAS_2_CAS17]
           ,[L2430_1_CAS_2_CAS18]
           ,[L2430_1_CAS_2_CAS19]
           ,[L2430_1_CAS_3_CAS01]
           ,[L2430_1_CAS_3_CAS02]
           ,[L2430_1_CAS_3_CAS03]
           ,[L2430_1_CAS_3_CAS04]
           ,[L2430_1_CAS_3_CAS05]
           ,[L2430_1_CAS_3_CAS06]
           ,[L2430_1_CAS_3_CAS07]
           ,[L2430_1_CAS_3_CAS08]
           ,[L2430_1_CAS_3_CAS09]
           ,[L2430_1_CAS_3_CAS10]
           ,[L2430_1_CAS_3_CAS11]
           ,[L2430_1_CAS_3_CAS12]
           ,[L2430_1_CAS_3_CAS13]
           ,[L2430_1_CAS_3_CAS14]
           ,[L2430_1_CAS_3_CAS15]
           ,[L2430_1_CAS_3_CAS16]
           ,[L2430_1_CAS_3_CAS17]
           ,[L2430_1_CAS_3_CAS18]
           ,[L2430_1_CAS_3_CAS19]
           ,[L2430_1_CAS_4_CAS01]
           ,[L2430_1_CAS_4_CAS02]
           ,[L2430_1_CAS_4_CAS03]
           ,[L2430_1_CAS_4_CAS04]
           ,[L2430_1_CAS_4_CAS05]
           ,[L2430_1_CAS_4_CAS06]
           ,[L2430_1_CAS_4_CAS07]
           ,[L2430_1_CAS_4_CAS08]
           ,[L2430_1_CAS_4_CAS09]
           ,[L2430_1_CAS_4_CAS10]
           ,[L2430_1_CAS_4_CAS11]
           ,[L2430_1_CAS_4_CAS12]
           ,[L2430_1_CAS_4_CAS13]
           ,[L2430_1_CAS_4_CAS14]
           ,[L2430_1_CAS_4_CAS15]
           ,[L2430_1_CAS_4_CAS16]
           ,[L2430_1_CAS_4_CAS17]
           ,[L2430_1_CAS_4_CAS18]
           ,[L2430_1_CAS_4_CAS19]
           ,[L2430_1_CAS_5_CAS01]
           ,[L2430_1_CAS_5_CAS02]
           ,[L2430_1_CAS_5_CAS03]
           ,[L2430_1_CAS_5_CAS04]
           ,[L2430_1_CAS_5_CAS05]
           ,[L2430_1_CAS_5_CAS06]
           ,[L2430_1_CAS_5_CAS07]
           ,[L2430_1_CAS_5_CAS08]
           ,[L2430_1_CAS_5_CAS09]
           ,[L2430_1_CAS_5_CAS10]
           ,[L2430_1_CAS_5_CAS11]
           ,[L2430_1_CAS_5_CAS12]
           ,[L2430_1_CAS_5_CAS13]
           ,[L2430_1_CAS_5_CAS14]
           ,[L2430_1_CAS_5_CAS15]
           ,[L2430_1_CAS_5_CAS16]
           ,[L2430_1_CAS_5_CAS17]
           ,[L2430_1_CAS_5_CAS18]
           ,[L2430_1_CAS_5_CAS19]
           ,[L2430_1_DTP_1_DTP01]
           ,[L2430_1_DTP_1_DTP02]
           ,[L2430_1_DTP_1_DTP03]
           ,[L2430_1_AMT_1_AMT01]
           ,[L2430_1_AMT_1_AMT02])
     VALUES
           (@claimid
           ,@Fileid
           ,@HeaderID
           ,@subscriber_patientid
           ,@L2400_1_LX_1_LX01
           ,@L2400_1_SV1_1_SV101_01
           ,@L2400_1_SV1_1_SV101_02
           ,@L2400_1_SV1_1_SV101_03
           ,@L2400_1_SV1_1_SV101_04
           ,@L2400_1_SV1_1_SV101_05
           ,@L2400_1_SV1_1_SV101_06
           ,@L2400_1_SV1_1_SV101_07
           ,@L2400_1_SV1_1_SV102
           ,@L2400_1_SV1_1_SV103
           ,@L2400_1_SV1_1_SV104
           ,@L2400_1_SV1_1_SV105
           ,@L2400_1_SV1_1_SV107_1
           ,@L2400_1_SV1_1_SV107_2
           ,@L2400_1_SV1_1_SV107_3
           ,@L2400_1_SV1_1_SV107_4
           ,@L2400_1_SV1_1_SV109
           ,@L2400_1_SV1_1_SV111
           ,@L2400_1_SV1_1_SV112
           ,@L2400_1_SV1_1_SV115
           ,@L2400_1_SV5_1_SV501_01
           ,@L2400_1_SV5_1_SV501_02
           ,@L2400_1_SV5_1_SV502
           ,@L2400_1_SV5_1_SV503
           ,@L2400_1_SV5_1_SV504
           ,@L2400_1_SV5_1_SV505
           ,@L2400_1_SV5_1_SV506
           ,@L2400_1_PWK_1_PWK01
           ,@L2400_1_PWK_1_PWK02
           ,@L2400_1_PWK_1_PWK05
           ,@L2400_1_PWK_1_PWK06
           ,@L2400_1_PWK_2_PWK01
           ,@L2400_1_PWK_2_PWK02
           ,@L2400_1_PWK_2_PWK05
           ,@L2400_1_PWK_2_PWK06
           ,@L2400_1_PWK_3_PWK01
           ,@L2400_1_PWK_3_PWK02
           ,@L2400_1_PWK_3_PWK05
           ,@L2400_1_PWK_3_PWK06
           ,@L2400_1_PWK_4_PWK01
           ,@L2400_1_PWK_4_PWK02
           ,@L2400_1_PWK_4_PWK05
           ,@L2400_1_PWK_4_PWK06
           ,@L2400_1_PWK_5_PWK01
           ,@L2400_1_PWK_5_PWK02
           ,@L2400_1_PWK_5_PWK05
           ,@L2400_1_PWK_5_PWK06
           ,@L2400_1_PWK_6_PWK01
           ,@L2400_1_PWK_6_PWK02
           ,@L2400_1_PWK_6_PWK05
           ,@L2400_1_PWK_6_PWK06
           ,@L2400_1_PWK_7_PWK01
           ,@L2400_1_PWK_7_PWK02
           ,@L2400_1_PWK_7_PWK05
           ,@L2400_1_PWK_7_PWK06
           ,@L2400_1_PWK_8_PWK01
           ,@L2400_1_PWK_8_PWK02
           ,@L2400_1_PWK_8_PWK05
           ,@L2400_1_PWK_8_PWK06
           ,@L2400_1_PWK_9_PWK01
           ,@L2400_1_PWK_9_PWK02
           ,@L2400_1_PWK_9_PWK05
           ,@L2400_1_PWK_9_PWK06
           ,@L2400_1_PWK_10_PWK01
           ,@L2400_1_PWK_10_PWK02
           ,@L2400_1_PWK_10_PWK05
           ,@L2400_1_PWK_10_PWK06
           ,@L2400_1_PWK_11_PWK01
           ,@L2400_1_PWK_11_PWK02
           ,@L2400_1_PWK_11_PWK05
           ,@L2400_1_PWK_11_PWK06
           ,@L2400_1_CR1_1_CR101
           ,@L2400_1_CR1_1_CR102
           ,@L2400_1_CR1_1_CR104
           ,@L2400_1_CR1_1_CR105
           ,@L2400_1_CR1_1_CR106
           ,@L2400_1_CR1_1_CR109
           ,@L2400_1_CR1_1_CR110
           ,@L2400_1_CR3_1_CR301
           ,@L2400_1_CR3_1_CR302
           ,@L2400_1_CR3_1_CR303
           ,@L2400_1_CRC_1_CRC01
           ,@L2400_1_CRC_1_CRC02
           ,@L2400_1_CRC_1_CRC03
           ,@L2400_1_CRC_1_CRC04
           ,@L2400_1_CRC_1_CRC05
           ,@L2400_1_CRC_1_CRC06
           ,@L2400_1_CRC_1_CRC07
           ,@L2400_1_CRC_2_CRC01
           ,@L2400_1_CRC_2_CRC02
           ,@L2400_1_CRC_2_CRC03
           ,@L2400_1_CRC_2_CRC04
           ,@L2400_1_CRC_2_CRC05
           ,@L2400_1_CRC_2_CRC06
           ,@L2400_1_CRC_2_CRC07
           ,@L2400_1_CRC_3_CRC01
           ,@L2400_1_CRC_3_CRC02
           ,@L2400_1_CRC_3_CRC03
           ,@L2400_1_CRC_3_CRC04
           ,@L2400_1_CRC_3_CRC05
           ,@L2400_1_CRC_3_CRC06
           ,@L2400_1_CRC_3_CRC07
           ,@L2400_1_CRC_4_CRC01
           ,@L2400_1_CRC_4_CRC02
           ,@L2400_1_CRC_4_CRC03
           ,@L2400_1_CRC_4_CRC04
           ,@L2400_1_CRC_4_CRC05
           ,@L2400_1_CRC_4_CRC06
           ,@L2400_1_CRC_4_CRC07
           ,@L2400_1_CRC_5_CRC01
           ,@L2400_1_CRC_5_CRC02
           ,@L2400_1_CRC_5_CRC03
           ,@L2400_1_CRC_5_CRC04
           ,@L2400_1_CRC_5_CRC05
           ,@L2400_1_CRC_5_CRC06
           ,@L2400_1_CRC_5_CRC07
           ,@L2400_1_DTP_1_DTP01
           ,@L2400_1_DTP_1_DTP02
           ,@L2400_1_DTP_1_DTP03
           ,@L2400_1_DTP_2_DTP01
           ,@L2400_1_DTP_2_DTP02
           ,@L2400_1_DTP_2_DTP03
           ,@L2400_1_DTP_3_DTP01
           ,@L2400_1_DTP_3_DTP02
           ,@L2400_1_DTP_3_DTP03
           ,@L2400_1_DTP_4_DTP01
           ,@L2400_1_DTP_4_DTP02
           ,@L2400_1_DTP_4_DTP03
           ,@L2400_1_DTP_5_DTP01
           ,@L2400_1_DTP_5_DTP02
           ,@L2400_1_DTP_5_DTP03
           ,@L2400_1_DTP_6_DTP01
           ,@L2400_1_DTP_6_DTP02
           ,@L2400_1_DTP_6_DTP03
           ,@L2400_1_DTP_7_DTP01
           ,@L2400_1_DTP_7_DTP02
           ,@L2400_1_DTP_7_DTP03
           ,@L2400_1_DTP_8_DTP01
           ,@L2400_1_DTP_8_DTP02
           ,@L2400_1_DTP_8_DTP03
           ,@L2400_1_DTP_9_DTP01
           ,@L2400_1_DTP_9_DTP02
           ,@L2400_1_DTP_9_DTP03
           ,@L2400_1_DTP_10_DTP01
           ,@L2400_1_DTP_10_DTP02
           ,@L2400_1_DTP_10_DTP03
           ,@L2400_1_QTY_1_QTY01
           ,@L2400_1_QTY_1_QTY02
           ,@L2400_1_QTY_2_QTY01
           ,@L2400_1_QTY_2_QTY02
           ,@L2400_1_MEA_1_MEA01
           ,@L2400_1_MEA_1_MEA02
           ,@L2400_1_MEA_1_MEA03
           ,@L2400_1_MEA_2_MEA01
           ,@L2400_1_MEA_2_MEA02
           ,@L2400_1_MEA_2_MEA03
           ,@L2400_1_MEA_3_MEA01
           ,@L2400_1_MEA_3_MEA02
           ,@L2400_1_MEA_3_MEA03
           ,@L2400_1_MEA_4_MEA01
           ,@L2400_1_MEA_4_MEA02
           ,@L2400_1_MEA_4_MEA03
           ,@L2400_1_MEA_5_MEA01
           ,@L2400_1_MEA_5_MEA02
           ,@L2400_1_MEA_5_MEA03
           ,@L2400_1_CN1_1_CN101
           ,@L2400_1_CN1_1_CN102
           ,@L2400_1_CN1_1_CN103
           ,@L2400_1_CN1_1_CN104
           ,@L2400_1_CN1_1_CN105
           ,@L2400_1_CN1_1_CN106
           ,@L2400_1_REF_1_REF01
           ,@L2400_1_REF_1_REF02
           ,@L2400_1_REF_1_REF04_1
           ,@L2400_1_REF_1_REF04_2
           ,@L2400_1_REF_2_REF01
           ,@L2400_1_REF_2_REF02
           ,@L2400_1_REF_2_REF04_1
           ,@L2400_1_REF_2_REF04_2
           ,@L2400_1_REF_3_REF01
           ,@L2400_1_REF_3_REF02
           ,@L2400_1_REF_3_REF04_1
           ,@L2400_1_REF_3_REF04_2
           ,@L2400_1_REF_4_REF01
           ,@L2400_1_REF_4_REF02
           ,@L2400_1_REF_4_REF04_1
           ,@L2400_1_REF_4_REF04_2
           ,@L2400_1_REF_5_REF01
           ,@L2400_1_REF_5_REF02
           ,@L2400_1_REF_5_REF04_1
           ,@L2400_1_REF_5_REF04_2
           ,@L2400_1_REF_6_REF01
           ,@L2400_1_REF_6_REF02
           ,@L2400_1_REF_6_REF04_1
           ,@L2400_1_REF_6_REF04_2
           ,@L2400_1_REF_7_REF01
           ,@L2400_1_REF_7_REF02
           ,@L2400_1_REF_7_REF04_1
           ,@L2400_1_REF_7_REF04_2
           ,@L2400_1_REF_8_REF01
           ,@L2400_1_REF_8_REF02
           ,@L2400_1_REF_8_REF04_1
           ,@L2400_1_REF_8_REF04_2
           ,@L2400_1_REF_9_REF01
           ,@L2400_1_REF_9_REF02
           ,@L2400_1_REF_9_REF04_1
           ,@L2400_1_REF_9_REF04_2
           ,@L2400_1_REF_11_REF01
           ,@L2400_1_REF_11_REF02
           ,@L2400_1_REF_11_REF04_1
           ,@L2400_1_REF_11_REF04_2
           ,@L2400_1_REF_12_REF01
           ,@L2400_1_REF_12_REF02
           ,@L2400_1_REF_12_REF04_1
           ,@L2400_1_REF_12_REF04_2
           ,@L2400_1_REF_13_REF01
           ,@L2400_1_REF_13_REF02
           ,@L2400_1_REF_13_REF04_1
           ,@L2400_1_REF_13_REF04_2
           ,@L2400_1_REF_14_REF01
           ,@L2400_1_REF_14_REF02
           ,@L2400_1_REF_14_REF04_1
           ,@L2400_1_REF_14_REF04_2
           ,@L2400_1_REF_15_REF01
           ,@L2400_1_REF_15_REF02
           ,@L2400_1_REF_15_REF04_1
           ,@L2400_1_REF_15_REF04_2
           ,@L2400_1_REF_16_REF01
           ,@L2400_1_REF_16_REF02
           ,@L2400_1_REF_16_REF04_1
           ,@L2400_1_REF_16_REF04_2
           ,@L2400_1_REF_17_REF01
           ,@L2400_1_REF_17_REF02
           ,@L2400_1_REF_17_REF04_1
           ,@L2400_1_REF_17_REF04_2
           ,@L2400_1_AMT_1_AMT01
           ,@L2400_1_AMT_1_AMT02
           ,@L2400_1_K3_1_K301
           ,@L2400_1_K3_2_K301
           ,@L2400_1_K3_3_K301
           ,@L2400_1_K3_4_K301
           ,@L2400_1_K3_5_K301
           ,@L2400_1_K3_6_K301
           ,@L2400_1_K3_7_K301
           ,@L2400_1_K3_8_K301
           ,@L2400_1_K3_9_K301
           ,@L2400_1_K3_10_K301
           ,@L2400_1_NTE_1_NTE01
           ,@L2400_1_NTE_1_NTE02
           ,@L2400_1_NTE_2_NTE01
           ,@L2400_1_NTE_2_NTE02
           ,@L2400_1_PS1_1_PS101
           ,@L2400_1_PS1_1_PS102
           ,@L2400_1_HCP_1_HCP01
           ,@L2400_1_HCP_1_HCP02
           ,@L2400_1_HCP_1_HCP03
           ,@L2400_1_HCP_1_HCP04
           ,@L2400_1_HCP_1_HCP05
           ,@L2400_1_HCP_1_HCP06
           ,@L2400_1_HCP_1_HCP07
           ,@L2400_1_HCP_1_HCP09
           ,@L2400_1_HCP_1_HCP10
           ,@L2400_1_HCP_1_HCP11
           ,@L2400_1_HCP_1_HCP12
           ,@L2400_1_HCP_1_HCP13
           ,@L2400_1_HCP_1_HCP14
           ,@L2400_1_HCP_1_HCP15
           ,@L2410_1_LIN_1_LIN01
           ,@L2410_1_LIN_1_LIN02
           ,@L2410_1_LIN_1_LIN03
           ,@L2410_1_CTP_1_CTP04
           ,@L2410_1_CTP_1_CTP05
           ,@L2410_1_REF_1_REF01
           ,@L2410_1_REF_1_REF02
           ,@L2410_1_REF_2_REF01
           ,@L2410_1_REF_2_REF02
           ,@L2420A_1_NM1_1_NM101
           ,@L2420A_1_NM1_1_NM102
           ,@L2420A_1_NM1_1_NM103
           ,@L2420A_1_NM1_1_NM104
           ,@L2420A_1_NM1_1_NM105
           ,@L2420A_1_NM1_1_NM107
           ,@L2420A_1_NM1_1_NM108
           ,@L2420A_1_NM1_1_NM109
           ,@L2420A_1_PRV_1_PRV01
           ,@L2420A_1_PRV_1_PRV02
           ,@L2420A_1_PRV_1_PRV03
           ,@L2420A_1_REF_1_REF01
           ,@L2420A_1_REF_1_REF02
           ,@L2420A_1_REF_1_REF04_1
           ,@L2420A_1_REF_1_REF04_2
           ,@L2420A_1_REF_2_REF01
           ,@L2420A_1_REF_2_REF02
           ,@L2420A_1_REF_2_REF04_1
           ,@L2420A_1_REF_2_REF04_2
           ,@L2420A_1_REF_3_REF01
           ,@L2420A_1_REF_3_REF02
           ,@L2420A_1_REF_3_REF04_1
           ,@L2420A_1_REF_3_REF04_2
           ,@L2420A_1_REF_4_REF01
           ,@L2420A_1_REF_4_REF02
           ,@L2420A_1_REF_4_REF04_1
           ,@L2420A_1_REF_4_REF04_2
           ,@L2420B_1_NM1_1_NM101
           ,@L2420B_1_NM1_1_NM102
           ,@L2420B_1_NM1_1_NM108
           ,@L2420B_1_NM1_1_NM109
           ,@L2420B_1_REF_1_REF01
           ,@L2420B_1_REF_1_REF02
           ,@L2420B_1_REF_1_REF04_1
           ,@L2420B_1_REF_1_REF04_2
           ,@L2420B_1_REF_2_REF01
           ,@L2420B_1_REF_2_REF02
           ,@L2420B_1_REF_2_REF04_1
           ,@L2420B_1_REF_2_REF04_2
           ,@L2420B_1_REF_3_REF01
           ,@L2420B_1_REF_3_REF02
           ,@L2420B_1_REF_3_REF04_1
           ,@L2420B_1_REF_3_REF04_2
           ,@L2420C_1_NM1_1_NM101
           ,@L2420C_1_NM1_1_NM102
           ,@L2420C_1_NM1_1_NM103
           ,@L2420C_1_NM1_1_NM108
           ,@L2420C_1_NM1_1_NM109
           ,@L2420C_1_N3_1_N301
           ,@L2420C_1_N3_1_N302
           ,@L2420C_1_N4_1_N401
           ,@L2420C_1_N4_1_N402
           ,@L2420C_1_N4_1_N403
           ,@L2420C_1_N4_1_N404
           ,@L2420C_1_N4_1_N407
           ,@L2420C_1_REF_1_REF01
           ,@L2420C_1_REF_1_REF02
           ,@L2420C_1_REF_1_REF04_1
           ,@L2420C_1_REF_1_REF04_2
           ,@L2420C_1_REF_2_REF01
           ,@L2420C_1_REF_2_REF02
           ,@L2420C_1_REF_2_REF04_1
           ,@L2420C_1_REF_2_REF04_2
           ,@L2420D_1_NM1_1_NM101
           ,@L2420D_1_NM1_1_NM102
           ,@L2420D_1_NM1_1_NM103
           ,@L2420D_1_NM1_1_NM104
           ,@L2420D_1_NM1_1_NM105
           ,@L2420D_1_NM1_1_NM107
           ,@L2420D_1_NM1_1_NM108
           ,@L2420D_1_NM1_1_NM109
           ,@L2420D_1_REF_1_REF01
           ,@L2420D_1_REF_1_REF02
           ,@L2420D_1_REF_1_REF04_1
           ,@L2420D_1_REF_1_REF04_2
           ,@L2420D_1_REF_2_REF01
           ,@L2420D_1_REF_2_REF02
           ,@L2420D_1_REF_2_REF04_1
           ,@L2420D_1_REF_2_REF04_2
           ,@L2420D_1_REF_3_REF01
           ,@L2420D_1_REF_3_REF02
           ,@L2420D_1_REF_3_REF04_1
           ,@L2420D_1_REF_3_REF04_2
           ,@L2420D_1_REF_4_REF01
           ,@L2420D_1_REF_4_REF02
           ,@L2420D_1_REF_4_REF04_1
           ,@L2420D_1_REF_4_REF04_2
           ,@L2420E_1_NM1_1_NM101
           ,@L2420E_1_NM1_1_NM102
           ,@L2420E_1_NM1_1_NM103
           ,@L2420E_1_NM1_1_NM104
           ,@L2420E_1_NM1_1_NM105
           ,@L2420E_1_NM1_1_NM107
           ,@L2420E_1_NM1_1_NM108
           ,@L2420E_1_NM1_1_NM109
           ,@L2420E_1_N3_1_N301
           ,@L2420E_1_N3_1_N302
           ,@L2420E_1_N4_1_N401
           ,@L2420E_1_N4_1_N402
           ,@L2420E_1_N4_1_N403
           ,@L2420E_1_N4_1_N404
           ,@L2420E_1_N4_1_N407
           ,@L2420E_1_REF_1_REF01
           ,@L2420E_1_REF_1_REF02
           ,@L2420E_1_REF_1_REF04_1
           ,@L2420E_1_REF_1_REF04_2
           ,@L2420E_1_REF_2_REF01
           ,@L2420E_1_REF_2_REF02
           ,@L2420E_1_REF_2_REF04_1
           ,@L2420E_1_REF_2_REF04_2
           ,@L2420E_1_REF_3_REF01
           ,@L2420E_1_REF_3_REF02
           ,@L2420E_1_REF_3_REF04_1
           ,@L2420E_1_REF_3_REF04_2
           ,@L2420E_1_PER_1_PER01
           ,@L2420E_1_PER_1_PER02
           ,@L2420E_1_PER_1_PER03
           ,@L2420E_1_PER_1_PER04
           ,@L2420E_1_PER_1_PER05
           ,@L2420E_1_PER_1_PER06
           ,@L2420E_1_PER_1_PER07
           ,@L2420E_1_PER_1_PER08
           ,@L2420F_1_NM1_1_NM101
           ,@L2420F_1_NM1_1_NM102
           ,@L2420F_1_NM1_1_NM103
           ,@L2420F_1_NM1_1_NM104
           ,@L2420F_1_NM1_1_NM105
           ,@L2420F_1_NM1_1_NM107
           ,@L2420F_1_NM1_1_NM108
           ,@L2420F_1_NM1_1_NM109
           ,@L2420F_1_REF_1_REF01
           ,@L2420F_1_REF_1_REF02
           ,@L2420F_1_REF_1_REF04_1
           ,@L2420F_1_REF_1_REF04_2
           ,@L2420F_1_REF_2_REF01
           ,@L2420F_1_REF_2_REF02
           ,@L2420F_1_REF_2_REF04_1
           ,@L2420F_1_REF_2_REF04_2
           ,@L2420F_1_REF_3_REF01
           ,@L2420F_1_REF_3_REF02
           ,@L2420F_1_REF_3_REF04_1
           ,@L2420F_1_REF_3_REF04_2
           ,@L2420F_2_NM1_1_NM101
           ,@L2420F_2_NM1_1_NM102
           ,@L2420F_2_NM1_1_NM103
           ,@L2420F_2_NM1_1_NM104
           ,@L2420F_2_NM1_1_NM105
           ,@L2420F_2_NM1_1_NM107
           ,@L2420F_2_NM1_1_NM108
           ,@L2420F_2_NM1_1_NM109
           ,@L2420F_2_REF_1_REF01
           ,@L2420F_2_REF_1_REF02
           ,@L2420F_2_REF_1_REF04_1
           ,@L2420F_2_REF_1_REF04_2
           ,@L2420F_2_REF_2_REF01
           ,@L2420F_2_REF_2_REF02
           ,@L2420F_2_REF_2_REF04_1
           ,@L2420F_2_REF_2_REF04_2
           ,@L2420F_2_REF_3_REF01
           ,@L2420F_2_REF_3_REF02
           ,@L2420F_2_REF_3_REF04_1
           ,@L2420F_2_REF_3_REF04_2
           ,@L2420G_1_NM1_1_NM101
           ,@L2420G_1_NM1_1_NM102
           ,@L2420G_1_N3_1_N301
           ,@L2420G_1_N3_1_N302
           ,@L2420G_1_N4_1_N401
           ,@L2420G_1_N4_1_N402
           ,@L2420G_1_N4_1_N403
           ,@L2420G_1_N4_1_N404
           ,@L2420G_1_N4_1_N407
           ,@L2420H_1_NM1_1_NM101
           ,@L2420H_1_NM1_1_NM102
           ,@L2420H_1_N3_1_N301
           ,@L2420H_1_N3_1_N302
           ,@L2420H_1_N4_1_N401
           ,@L2420H_1_N4_1_N402
           ,@L2420H_1_N4_1_N403
           ,@L2420H_1_N4_1_N404
           ,@L2420H_1_N4_1_N407
           ,@L2430_1_SVD_1_SVD01
           ,@L2430_1_SVD_1_SVD02
           ,@L2430_1_SVD_1_SVD03_1
           ,@L2430_1_SVD_1_SVD03_2
           ,@L2430_1_SVD_1_SVD03_3
           ,@L2430_1_SVD_1_SVD03_4
           ,@L2430_1_SVD_1_SVD03_5
           ,@L2430_1_SVD_1_SVD03_6
           ,@L2430_1_SVD_1_SVD03_7
           ,@L2430_1_SVD_1_SVD05
           ,@L2430_1_SVD_1_SVD06
           ,@L2430_1_CAS_1_CAS01
           ,@L2430_1_CAS_1_CAS02
           ,@L2430_1_CAS_1_CAS03
           ,@L2430_1_CAS_1_CAS04
           ,@L2430_1_CAS_1_CAS05
           ,@L2430_1_CAS_1_CAS06
           ,@L2430_1_CAS_1_CAS07
           ,@L2430_1_CAS_1_CAS08
           ,@L2430_1_CAS_1_CAS09
           ,@L2430_1_CAS_1_CAS10
           ,@L2430_1_CAS_1_CAS11
           ,@L2430_1_CAS_1_CAS12
           ,@L2430_1_CAS_1_CAS13
           ,@L2430_1_CAS_1_CAS14
           ,@L2430_1_CAS_1_CAS15
           ,@L2430_1_CAS_1_CAS16
           ,@L2430_1_CAS_1_CAS17
           ,@L2430_1_CAS_1_CAS18
           ,@L2430_1_CAS_1_CAS19
           ,@L2430_1_CAS_2_CAS01
           ,@L2430_1_CAS_2_CAS02
           ,@L2430_1_CAS_2_CAS03
           ,@L2430_1_CAS_2_CAS04
           ,@L2430_1_CAS_2_CAS05
           ,@L2430_1_CAS_2_CAS06
           ,@L2430_1_CAS_2_CAS07
           ,@L2430_1_CAS_2_CAS08
           ,@L2430_1_CAS_2_CAS09
           ,@L2430_1_CAS_2_CAS10
           ,@L2430_1_CAS_2_CAS11
           ,@L2430_1_CAS_2_CAS12
           ,@L2430_1_CAS_2_CAS13
           ,@L2430_1_CAS_2_CAS14
           ,@L2430_1_CAS_2_CAS15
           ,@L2430_1_CAS_2_CAS16
           ,@L2430_1_CAS_2_CAS17
           ,@L2430_1_CAS_2_CAS18
           ,@L2430_1_CAS_2_CAS19
           ,@L2430_1_CAS_3_CAS01
           ,@L2430_1_CAS_3_CAS02
           ,@L2430_1_CAS_3_CAS03
           ,@L2430_1_CAS_3_CAS04
           ,@L2430_1_CAS_3_CAS05
           ,@L2430_1_CAS_3_CAS06
           ,@L2430_1_CAS_3_CAS07
           ,@L2430_1_CAS_3_CAS08
           ,@L2430_1_CAS_3_CAS09
           ,@L2430_1_CAS_3_CAS10
           ,@L2430_1_CAS_3_CAS11
           ,@L2430_1_CAS_3_CAS12
           ,@L2430_1_CAS_3_CAS13
           ,@L2430_1_CAS_3_CAS14
           ,@L2430_1_CAS_3_CAS15
           ,@L2430_1_CAS_3_CAS16
           ,@L2430_1_CAS_3_CAS17
           ,@L2430_1_CAS_3_CAS18
           ,@L2430_1_CAS_3_CAS19
           ,@L2430_1_CAS_4_CAS01
           ,@L2430_1_CAS_4_CAS02
           ,@L2430_1_CAS_4_CAS03
           ,@L2430_1_CAS_4_CAS04
           ,@L2430_1_CAS_4_CAS05
           ,@L2430_1_CAS_4_CAS06
           ,@L2430_1_CAS_4_CAS07
           ,@L2430_1_CAS_4_CAS08
           ,@L2430_1_CAS_4_CAS09
           ,@L2430_1_CAS_4_CAS10
           ,@L2430_1_CAS_4_CAS11
           ,@L2430_1_CAS_4_CAS12
           ,@L2430_1_CAS_4_CAS13
           ,@L2430_1_CAS_4_CAS14
           ,@L2430_1_CAS_4_CAS15
           ,@L2430_1_CAS_4_CAS16
           ,@L2430_1_CAS_4_CAS17
           ,@L2430_1_CAS_4_CAS18
           ,@L2430_1_CAS_4_CAS19
           ,@L2430_1_CAS_5_CAS01
           ,@L2430_1_CAS_5_CAS02
           ,@L2430_1_CAS_5_CAS03
           ,@L2430_1_CAS_5_CAS04
           ,@L2430_1_CAS_5_CAS05
           ,@L2430_1_CAS_5_CAS06
           ,@L2430_1_CAS_5_CAS07
           ,@L2430_1_CAS_5_CAS08
           ,@L2430_1_CAS_5_CAS09
           ,@L2430_1_CAS_5_CAS10
           ,@L2430_1_CAS_5_CAS11
           ,@L2430_1_CAS_5_CAS12
           ,@L2430_1_CAS_5_CAS13
           ,@L2430_1_CAS_5_CAS14
           ,@L2430_1_CAS_5_CAS15
           ,@L2430_1_CAS_5_CAS16
           ,@L2430_1_CAS_5_CAS17
           ,@L2430_1_CAS_5_CAS18
           ,@L2430_1_CAS_5_CAS19
           ,@L2430_1_DTP_1_DTP01
           ,@L2430_1_DTP_1_DTP02
           ,@L2430_1_DTP_1_DTP03
           ,@L2430_1_AMT_1_AMT01
           ,@L2430_1_AMT_1_AMT02)
           select @@identity as servicelineid
           end
GO
/****** Object:  StoredProcedure [dbo].[spinsertservicefacilitylocation]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spinsertservicefacilitylocation](
@claimid int=null,
@lastname varchar(60)=null,
@firstname varchar(35)=null,
@organizationnpi varchar(60)=null,
@address1 varchar(55)=null,
@address2 varchar(55)=null,
@city varchar(30)=null,
@state varchar(2)=null,
@postalcode varchar(15)=null
)
as
begin
	insert into servicefacilitylocation values(@claimid,@lastname,@firstname,@organizationnpi,@address1,@address2,@city,@state,@postalcode);
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertrenderingprovider]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertrenderingprovider](
@claimid int=null,
@lastname varchar(60)=null,
@firstname varchar(35)=null,
@renderprovidernpi varchar(60)=null
)
as
begin
	insert into renderingprovider values(@claimid,@lastname,@firstname,@renderprovidernpi)
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertreferingprovider]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertreferingprovider](
@claimid int=null,
@lastname varchar(60)=null,
@firstname varchar(35)=null,
@referingprovidernpi varchar(60)=null
)
as
begin
	insert into referingprovider values(@claimid,@lastname,@firstname,@referingprovidernpi);
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertpatient]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertpatient]
@Fileid varchar(30) ,
@HeaderID varchar(30) ,
@L2000C_1_HL_1_HL01    varchar(12)= NULL,
@L2000C_1_HL_1_HL02    varchar(12)= NULL,
@L2000C_1_HL_1_HL03    varchar(2)= NULL,
@L2000C_1_HL_1_HL04    varchar(1)= NULL,
@L2000C_1_PAT_1_PAT01  varchar(2)= NULL,
@L2000C_1_PAT_1_PAT05  varchar(3)= NULL,
@L2000C_1_PAT_1_PAT06  varchar(35)= NULL,
@L2000C_1_PAT_1_PAT07  varchar(2)= NULL,
@L2000C_1_PAT_1_PAT08  varchar(10)= NULL,
@L2000C_1_PAT_1_PAT09  varchar(1)= NULL,
@L2010CA_1_NM1_1_NM101 varchar(3)= NULL,
@L2010CA_1_NM1_1_NM102 varchar(1)= NULL,
@L2010CA_1_NM1_1_NM103 varchar(60)= NULL,
@L2010CA_1_NM1_1_NM104 varchar(35)= NULL,
@L2010CA_1_NM1_1_NM105 varchar(25)= NULL,
@L2010CA_1_NM1_1_NM107 varchar(10)= NULL,
@L2010CA_1_N3_1_N301   varchar(55)= NULL,
@L2010CA_1_N3_1_N302   varchar(55)= NULL,
@L2010CA_1_N4_1_N401   varchar(30)= NULL,
@L2010CA_1_N4_1_N402   varchar(2)= NULL,
@L2010CA_1_N4_1_N403   varchar(15)= NULL,
@L2010CA_1_N4_1_N404   varchar(3)= NULL,
@L2010CA_1_N4_1_N407   varchar(3)= NULL,
@L2010CA_1_DMG_1_DMG01 varchar(3)= NULL,
@L2010CA_1_DMG_1_DMG02 varchar(35)= NULL,
@L2010CA_1_DMG_1_DMG03 varchar(1)= NULL,
@L2010CA_1_REF_1_REF01 varchar(3)= NULL,
@L2010CA_1_REF_1_REF02 varchar(50)= NULL,
@L2010CA_1_PER_1_PER01 varchar(2)= NULL,
@L2010CA_1_PER_1_PER02 varchar(60)= NULL,
@L2010CA_1_PER_1_PER03 varchar(2)= NULL,
@L2010CA_1_PER_1_PER04 varchar(256)= NULL,
@L2010CA_1_PER_1_PER05 varchar(2)= NULL,
@L2010CA_1_PER_1_PER06 varchar(256)= NULL
as
begin
INSERT INTO [EDIDatabase].[dbo].[EDI_837P_Patient]
           ([Fileid]
           ,[HeaderID]
           ,[L2000C_1_HL_1_HL01]
           ,[L2000C_1_HL_1_HL02]
           ,[L2000C_1_HL_1_HL03]
           ,[L2000C_1_HL_1_HL04]
           ,[L2000C_1_PAT_1_PAT01]
           ,[L2000C_1_PAT_1_PAT05]
           ,[L2000C_1_PAT_1_PAT06]
           ,[L2000C_1_PAT_1_PAT07]
           ,[L2000C_1_PAT_1_PAT08]
           ,[L2000C_1_PAT_1_PAT09]
           ,[L2010CA_1_NM1_1_NM101]
           ,[L2010CA_1_NM1_1_NM102]
           ,[L2010CA_1_NM1_1_NM103]
           ,[L2010CA_1_NM1_1_NM104]
           ,[L2010CA_1_NM1_1_NM105]
           ,[L2010CA_1_NM1_1_NM107]
           ,[L2010CA_1_N3_1_N301]
           ,[L2010CA_1_N3_1_N302]
           ,[L2010CA_1_N4_1_N401]
           ,[L2010CA_1_N4_1_N402]
           ,[L2010CA_1_N4_1_N403]
           ,[L2010CA_1_N4_1_N404]
           ,[L2010CA_1_N4_1_N407]
           ,[L2010CA_1_DMG_1_DMG01]
           ,[L2010CA_1_DMG_1_DMG02]
           ,[L2010CA_1_DMG_1_DMG03]
           ,[L2010CA_1_REF_1_REF01]
           ,[L2010CA_1_REF_1_REF02]
           ,[L2010CA_1_PER_1_PER01]
           ,[L2010CA_1_PER_1_PER02]
           ,[L2010CA_1_PER_1_PER03]
           ,[L2010CA_1_PER_1_PER04]
           ,[L2010CA_1_PER_1_PER05]
           ,[L2010CA_1_PER_1_PER06])
     VALUES
           (@Fileid ,
@HeaderID  ,
@L2000C_1_HL_1_HL01    ,
@L2000C_1_HL_1_HL02    ,
@L2000C_1_HL_1_HL03    ,
@L2000C_1_HL_1_HL04    ,
@L2000C_1_PAT_1_PAT01  ,
@L2000C_1_PAT_1_PAT05  ,
@L2000C_1_PAT_1_PAT06  ,
@L2000C_1_PAT_1_PAT07  ,
@L2000C_1_PAT_1_PAT08  ,
@L2000C_1_PAT_1_PAT09  ,
@L2010CA_1_NM1_1_NM101 ,
@L2010CA_1_NM1_1_NM102 ,
@L2010CA_1_NM1_1_NM103 ,
@L2010CA_1_NM1_1_NM104 ,
@L2010CA_1_NM1_1_NM105 ,
@L2010CA_1_NM1_1_NM107 ,
@L2010CA_1_N3_1_N301   ,
@L2010CA_1_N3_1_N302   ,
@L2010CA_1_N4_1_N401   ,
@L2010CA_1_N4_1_N402   ,
@L2010CA_1_N4_1_N403   ,
@L2010CA_1_N4_1_N404   ,
@L2010CA_1_N4_1_N407   ,
@L2010CA_1_DMG_1_DMG01 ,
@L2010CA_1_DMG_1_DMG02 ,
@L2010CA_1_DMG_1_DMG03 ,
@L2010CA_1_REF_1_REF01 ,
@L2010CA_1_REF_1_REF02 ,
@L2010CA_1_PER_1_PER01 ,
@L2010CA_1_PER_1_PER02 ,
@L2010CA_1_PER_1_PER03 ,
@L2010CA_1_PER_1_PER04 ,
@L2010CA_1_PER_1_PER05 ,
@L2010CA_1_PER_1_PER06 )
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertothersubscriber]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spinsertothersubscriber]
@claimid int,
@Fileid [varchar](30) ,
@HeaderID [varchar](30),
@subscriber_patientid varchar(12),
@L2320_1_SBR_1_SBR01       varchar(1)= NULL,
@L2320_1_SBR_1_SBR02       varchar(2)= NULL,
@L2320_1_SBR_1_SBR03       varchar(50)= NULL,
@L2320_1_SBR_1_SBR04       varchar(60)= NULL,
@L2320_1_SBR_1_SBR05       varchar(3)= NULL,
@L2320_1_SBR_1_SBR09       varchar(2)= NULL,
@L2320_1_CAS_1_CAS01       varchar(2)= NULL,
@L2320_1_CAS_1_CAS02       varchar(5)= NULL,
@L2320_1_CAS_1_CAS03       varchar(18)= NULL,
@L2320_1_CAS_1_CAS04       varchar(15)= NULL,
@L2320_1_CAS_1_CAS05       varchar(5)= NULL,
@L2320_1_CAS_1_CAS06       varchar(18)= NULL,
@L2320_1_CAS_1_CAS07       varchar(15)= NULL,
@L2320_1_CAS_1_CAS08       varchar(5)= NULL,
@L2320_1_CAS_1_CAS09       varchar(18)= NULL,
@L2320_1_CAS_1_CAS10       varchar(15)= NULL,
@L2320_1_CAS_1_CAS11       varchar(5)= NULL,
@L2320_1_CAS_1_CAS12       varchar(18)= NULL,
@L2320_1_CAS_1_CAS13       varchar(15)= NULL,
@L2320_1_CAS_1_CAS14       varchar(5)= NULL,
@L2320_1_CAS_1_CAS15       varchar(18)= NULL,
@L2320_1_CAS_1_CAS16       varchar(5)= NULL,
@L2320_1_CAS_1_CAS17       varchar(5)= NULL,
@L2320_1_CAS_1_CAS18       varchar(18)= NULL,
@L2320_1_CAS_1_CAS19       varchar(15)= NULL,
@L2320_1_CAS_2_CAS01       varchar(2)= NULL,
@L2320_1_CAS_2_CAS02       varchar(5)= NULL,
@L2320_1_CAS_2_CAS03       varchar(18)= NULL,
@L2320_1_CAS_2_CAS04       varchar(15)= NULL,
@L2320_1_CAS_2_CAS05       varchar(5)= NULL,
@L2320_1_CAS_2_CAS06       varchar(18)= NULL,
@L2320_1_CAS_2_CAS07       varchar(15)= NULL,
@L2320_1_CAS_2_CAS08       varchar(5)= NULL,
@L2320_1_CAS_2_CAS09       varchar(18)= NULL,
@L2320_1_CAS_2_CAS10       varchar(15)= NULL,
@L2320_1_CAS_2_CAS11       varchar(5)= NULL,
@L2320_1_CAS_2_CAS12       varchar(18)= NULL,
@L2320_1_CAS_2_CAS13       varchar(15)= NULL,
@L2320_1_CAS_2_CAS14       varchar(5)= NULL,
@L2320_1_CAS_2_CAS15       varchar(18)= NULL,
@L2320_1_CAS_2_CAS16       varchar(5)= NULL,
@L2320_1_CAS_2_CAS17       varchar(5)= NULL,
@L2320_1_CAS_2_CAS18       varchar(18)= NULL,
@L2320_1_CAS_2_CAS19       varchar(15)= NULL,
@L2320_1_CAS_3_CAS01       varchar(2)= NULL,
@L2320_1_CAS_3_CAS02       varchar(5)= NULL,
@L2320_1_CAS_3_CAS03       varchar(18)= NULL,
@L2320_1_CAS_3_CAS04       varchar(15)= NULL,
@L2320_1_CAS_3_CAS05       varchar(5)= NULL,
@L2320_1_CAS_3_CAS06       varchar(18)= NULL,
@L2320_1_CAS_3_CAS07       varchar(15)= NULL,
@L2320_1_CAS_3_CAS08       varchar(5)= NULL,
@L2320_1_CAS_3_CAS09       varchar(18)= NULL,
@L2320_1_CAS_3_CAS10       varchar(15)= NULL,
@L2320_1_CAS_3_CAS11       varchar(5)= NULL,
@L2320_1_CAS_3_CAS12       varchar(18)= NULL,
@L2320_1_CAS_3_CAS13       varchar(15)= NULL,
@L2320_1_CAS_3_CAS14       varchar(5)= NULL,
@L2320_1_CAS_3_CAS15       varchar(18)= NULL,
@L2320_1_CAS_3_CAS16       varchar(5)= NULL,
@L2320_1_CAS_3_CAS17       varchar(5)= NULL,
@L2320_1_CAS_3_CAS18       varchar(18)= NULL,
@L2320_1_CAS_3_CAS19       varchar(15)= NULL,
@L2320_1_CAS_4_CAS01       varchar(2)= NULL,
@L2320_1_CAS_4_CAS02       varchar(5)= NULL,
@L2320_1_CAS_4_CAS03       varchar(18)= NULL,
@L2320_1_CAS_4_CAS04       varchar(15)= NULL,
@L2320_1_CAS_4_CAS05       varchar(5)= NULL,
@L2320_1_CAS_4_CAS06       varchar(18)= NULL,
@L2320_1_CAS_4_CAS07       varchar(15)= NULL,
@L2320_1_CAS_4_CAS08       varchar(5)= NULL,
@L2320_1_CAS_4_CAS09       varchar(18)= NULL,
@L2320_1_CAS_4_CAS10       varchar(15)= NULL,
@L2320_1_CAS_4_CAS11       varchar(5)= NULL,
@L2320_1_CAS_4_CAS12       varchar(18)= NULL,
@L2320_1_CAS_4_CAS13       varchar(15)= NULL,
@L2320_1_CAS_4_CAS14       varchar(5)= NULL,
@L2320_1_CAS_4_CAS15       varchar(18)= NULL,
@L2320_1_CAS_4_CAS16       varchar(5)= NULL,
@L2320_1_CAS_4_CAS17       varchar(5)= NULL,
@L2320_1_CAS_4_CAS18       varchar(18)= NULL,
@L2320_1_CAS_4_CAS19       varchar(15)= NULL,
@L2320_1_CAS_5_CAS01       varchar(2)= NULL,
@L2320_1_CAS_5_CAS02       varchar(5)= NULL,
@L2320_1_CAS_5_CAS03       varchar(18)= NULL,
@L2320_1_CAS_5_CAS04       varchar(15)= NULL,
@L2320_1_CAS_5_CAS05       varchar(5)= NULL,
@L2320_1_CAS_5_CAS06       varchar(18)= NULL,
@L2320_1_CAS_5_CAS07       varchar(15)= NULL,
@L2320_1_CAS_5_CAS08       varchar(5)= NULL,
@L2320_1_CAS_5_CAS09       varchar(18)= NULL,
@L2320_1_CAS_5_CAS10       varchar(15)= NULL,
@L2320_1_CAS_5_CAS11       varchar(5)= NULL,
@L2320_1_CAS_5_CAS12       varchar(18)= NULL,
@L2320_1_CAS_5_CAS13       varchar(15)= NULL,
@L2320_1_CAS_5_CAS14       varchar(5)= NULL,
@L2320_1_CAS_5_CAS15       varchar(18)= NULL,
@L2320_1_CAS_5_CAS16       varchar(5)= NULL,
@L2320_1_CAS_5_CAS17       varchar(5)= NULL,
@L2320_1_CAS_5_CAS18       varchar(18)= NULL,
@L2320_1_CAS_5_CAS19       varchar(15)= NULL,
@L2320_1_AMT_1_AMT01       varchar(3)= NULL,
@L2320_1_AMT_1_AMT02       varchar(18)= NULL,
@L2320_1_AMT_2_AMT01       varchar(3)= NULL,
@L2320_1_AMT_2_AMT02       varchar(18)= NULL,
@L2320_1_AMT_3_AMT01       varchar(3)= NULL,
@L2320_1_AMT_3_AMT02       varchar(18)= NULL,
@L2320_1_OI_1_OI03         varchar(1)= NULL,
@L2320_1_OI_1_OI04         varchar(1)= NULL,
@L2320_1_OI_1_OI06         varchar(1)= NULL,
@L2320_1_MOA_1_MOA01       varchar(10)= NULL,
@L2320_1_MOA_1_MOA02       varchar(18)= NULL,
@L2320_1_MOA_1_MOA03       varchar(50)= NULL,
@L2320_1_MOA_1_MOA04       varchar(50)= NULL,
@L2320_1_MOA_1_MOA05       varchar(50)= NULL,
@L2320_1_MOA_1_MOA06       varchar(50)= NULL,
@L2320_1_MOA_1_MOA07       varchar(50)= NULL,
@L2320_1_MOA_1_MOA08       varchar(18)= NULL,
@L2320_1_MOA_1_MOA09       varchar(18)= NULL,
@L2330A_1_NM1_1_NM101      varchar(3)= NULL,
@L2330A_1_NM1_1_NM102      varchar(1)= NULL,
@L2330A_1_NM1_1_NM103      varchar(60)= NULL,
@L2330A_1_NM1_1_NM104      varchar(35)= NULL,
@L2330A_1_NM1_1_NM105      varchar(25)= NULL,
@L2330A_1_NM1_1_NM107      varchar(10)= NULL,
@L2330A_1_NM1_1_NM108      varchar(2)= NULL,
@L2330A_1_NM1_1_NM109      varchar(80)= NULL,
@L2330A_1_N3_1_N301        varchar(55)= NULL,
@L2330A_1_N3_1_N302        varchar(55)= NULL,
@L2330A_1_N4_1_N401        varchar(30)= NULL,
@L2330A_1_N4_1_N402        varchar(2)= NULL,
@L2330A_1_N4_1_N403        varchar(15)= NULL,
@L2330A_1_N4_1_N404        varchar(3)= NULL,
@L2330A_1_N4_1_N407        varchar(3)= NULL,
@L2330A_1_REF_1_REF01      varchar(3)= NULL,
@L2330A_1_REF_1_REF02      varchar(50)= NULL,
@L2330B_1_NM1_1_NM101      varchar(3)= NULL,
@L2330B_1_NM1_1_NM102      varchar(1)= NULL,
@L2330B_1_NM1_1_NM103      varchar(60)= NULL,
@L2330B_1_NM1_1_NM108      varchar(2)= NULL,
@L2330B_1_NM1_1_NM109      varchar(80)= NULL,
@L2330B_1_N3_1_N301        varchar(55)= NULL,
@L2330B_1_N3_1_N302        varchar(55)= NULL,
@L2330B_1_N4_1_N401        varchar(30)= NULL,
@L2330B_1_N4_1_N402        varchar(2)= NULL,
@L2330B_1_N4_1_N403        varchar(15)= NULL,
@L2330B_1_N4_1_N404        varchar(3)= NULL,
@L2330B_1_N4_1_N407        varchar(3)= NULL,
@L2330B_1_DTP_1_DTP01      varchar(3)= NULL,
@L2330B_1_DTP_1_DTP02      varchar(3)= NULL,
@L2330B_1_DTP_1_DTP03      varchar(35)= NULL,
@L2330B_1_REF_1_REF01      varchar(3)= NULL,
@L2330B_1_REF_1_REF02      varchar(50)= NULL,
@L2330B_1_REF_2_REF01      varchar(3)= NULL,
@L2330B_1_REF_2_REF02      varchar(50)= NULL,
@L2330B_1_REF_3_REF01      varchar(3)= NULL,
@L2330B_1_REF_3_REF02      varchar(50)= NULL,
@L2330B_1_REF_4_REF01      varchar(3)= NULL,
@L2330B_1_REF_4_REF02      varchar(50)= NULL,
@L2330B_1_REF_5_REF01      varchar(3)= NULL,
@L2330B_1_REF_5_REF02      varchar(50)= NULL,
@L2330B_1_REF_6_REF01      varchar(3)= NULL,
@L2330B_1_REF_6_REF02      varchar(50)= NULL,
@L2330B_1_REF_7_REF01      varchar(3)= NULL,
@L2330B_1_REF_7_REF02      varchar(50)= NULL,
@L2330B_1_REF_8_REF01      varchar(3)= NULL,
@L2330B_1_REF_8_REF02      varchar(50)= NULL,
@L2330C_1_NM1_1_NM101      varchar(3)= NULL,
@L2330C_1_NM1_1_NM102      varchar(1)= NULL,
@L2330C_1_REF_1_REF01      varchar(3)= NULL,
@L2330C_1_REF_1_REF02      varchar(50)= NULL,
@L2330C_1_REF_2_REF01      varchar(3)= NULL,
@L2330C_1_REF_2_REF02      varchar(50)= NULL,
@L2330C_1_REF_3_REF01      varchar(3)= NULL,
@L2330C_1_REF_3_REF02      varchar(50)= NULL,
@L2330D_1_NM1_1_NM101      varchar(3)= NULL,
@L2330D_1_NM1_1_NM102      varchar(1)= NULL,
@L2330D_1_REF_1_REF01      varchar(3)= NULL,
@L2330D_1_REF_1_REF02      varchar(50)= NULL,
@L2330D_1_REF_2_REF01      varchar(3)= NULL,
@L2330D_1_REF_2_REF02      varchar(50)= NULL,
@L2330D_1_REF_3_REF01      varchar(3)= NULL,
@L2330D_1_REF_3_REF02      varchar(50)= NULL,
@L2330D_1_REF_4_REF01      varchar(3)= NULL,
@L2330D_1_REF_4_REF02      varchar(50)= NULL,
@L2330E_1_NM1_1_NM101      varchar(3)= NULL,
@L2330E_1_NM1_1_NM102      varchar(1)= NULL,
@L2330E_1_REF_1_REF01      varchar(3)= NULL,
@L2330E_1_REF_1_REF02      varchar(50)= NULL,
@L2330E_1_REF_2_REF01      varchar(3)= NULL,
@L2330E_1_REF_2_REF02      varchar(50)= NULL,
@L2330E_1_REF_3_REF01      varchar(3)= NULL,
@L2330E_1_REF_3_REF02      varchar(50)= NULL,
@L2330F_1_NM1_1_NM101      varchar(3)= NULL,
@L2330F_1_NM1_1_NM102      varchar(1)= NULL,
@L2330F_1_REF_1_REF01      varchar(3)= NULL,
@L2330F_1_REF_1_REF02      varchar(50)= NULL,
@L2330F_1_REF_2_REF01      varchar(3)= NULL,
@L2330F_1_REF_2_REF02      varchar(50)= NULL,
@L2330F_1_REF_3_REF01      varchar(3)= NULL,
@L2330F_1_REF_3_REF02      varchar(50)= NULL,
@L2330F_1_REF_4_REF01      varchar(3)= NULL,
@L2330F_1_REF_4_REF02      varchar(50)= NULL,
@L2330G_1_NM1_1_NM101      varchar(3)= NULL,
@L2330G_1_NM1_1_NM102      varchar(1)= NULL,
@L2330G_1_REF_1_REF01      varchar(3)= NULL,
@L2330G_1_REF_1_REF02      varchar(50)= NULL,
@L2330G_1_REF_2_REF01      varchar(3)= NULL,
@L2330G_1_REF_2_REF02      varchar(50)=NULL
as
begin
INSERT INTO [EDIDatabase].[dbo].[EDI_837P_2320_OtherSubscriber]
           ([claimid]
           ,[Fileid]
           ,[HeaderID]
           ,[subscriber_patientid]
           ,[L2320_1_SBR_1_SBR01]
           ,[L2320_1_SBR_1_SBR02]
           ,[L2320_1_SBR_1_SBR03]
           ,[L2320_1_SBR_1_SBR04]
           ,[L2320_1_SBR_1_SBR05]
           ,[L2320_1_SBR_1_SBR09]
           ,[L2320_1_CAS_1_CAS01]
           ,[L2320_1_CAS_1_CAS02]
           ,[L2320_1_CAS_1_CAS03]
           ,[L2320_1_CAS_1_CAS04]
           ,[L2320_1_CAS_1_CAS05]
           ,[L2320_1_CAS_1_CAS06]
           ,[L2320_1_CAS_1_CAS07]
           ,[L2320_1_CAS_1_CAS08]
           ,[L2320_1_CAS_1_CAS09]
           ,[L2320_1_CAS_1_CAS10]
           ,[L2320_1_CAS_1_CAS11]
           ,[L2320_1_CAS_1_CAS12]
           ,[L2320_1_CAS_1_CAS13]
           ,[L2320_1_CAS_1_CAS14]
           ,[L2320_1_CAS_1_CAS15]
           ,[L2320_1_CAS_1_CAS16]
           ,[L2320_1_CAS_1_CAS17]
           ,[L2320_1_CAS_1_CAS18]
           ,[L2320_1_CAS_1_CAS19]
           ,[L2320_1_CAS_2_CAS01]
           ,[L2320_1_CAS_2_CAS02]
           ,[L2320_1_CAS_2_CAS03]
           ,[L2320_1_CAS_2_CAS04]
           ,[L2320_1_CAS_2_CAS05]
           ,[L2320_1_CAS_2_CAS06]
           ,[L2320_1_CAS_2_CAS07]
           ,[L2320_1_CAS_2_CAS08]
           ,[L2320_1_CAS_2_CAS09]
           ,[L2320_1_CAS_2_CAS10]
           ,[L2320_1_CAS_2_CAS11]
           ,[L2320_1_CAS_2_CAS12]
           ,[L2320_1_CAS_2_CAS13]
           ,[L2320_1_CAS_2_CAS14]
           ,[L2320_1_CAS_2_CAS15]
           ,[L2320_1_CAS_2_CAS16]
           ,[L2320_1_CAS_2_CAS17]
           ,[L2320_1_CAS_2_CAS18]
           ,[L2320_1_CAS_2_CAS19]
           ,[L2320_1_CAS_3_CAS01]
           ,[L2320_1_CAS_3_CAS02]
           ,[L2320_1_CAS_3_CAS03]
           ,[L2320_1_CAS_3_CAS04]
           ,[L2320_1_CAS_3_CAS05]
           ,[L2320_1_CAS_3_CAS06]
           ,[L2320_1_CAS_3_CAS07]
           ,[L2320_1_CAS_3_CAS08]
           ,[L2320_1_CAS_3_CAS09]
           ,[L2320_1_CAS_3_CAS10]
           ,[L2320_1_CAS_3_CAS11]
           ,[L2320_1_CAS_3_CAS12]
           ,[L2320_1_CAS_3_CAS13]
           ,[L2320_1_CAS_3_CAS14]
           ,[L2320_1_CAS_3_CAS15]
           ,[L2320_1_CAS_3_CAS16]
           ,[L2320_1_CAS_3_CAS17]
           ,[L2320_1_CAS_3_CAS18]
           ,[L2320_1_CAS_3_CAS19]
           ,[L2320_1_CAS_4_CAS01]
           ,[L2320_1_CAS_4_CAS02]
           ,[L2320_1_CAS_4_CAS03]
           ,[L2320_1_CAS_4_CAS04]
           ,[L2320_1_CAS_4_CAS05]
           ,[L2320_1_CAS_4_CAS06]
           ,[L2320_1_CAS_4_CAS07]
           ,[L2320_1_CAS_4_CAS08]
           ,[L2320_1_CAS_4_CAS09]
           ,[L2320_1_CAS_4_CAS10]
           ,[L2320_1_CAS_4_CAS11]
           ,[L2320_1_CAS_4_CAS12]
           ,[L2320_1_CAS_4_CAS13]
           ,[L2320_1_CAS_4_CAS14]
           ,[L2320_1_CAS_4_CAS15]
           ,[L2320_1_CAS_4_CAS16]
           ,[L2320_1_CAS_4_CAS17]
           ,[L2320_1_CAS_4_CAS18]
           ,[L2320_1_CAS_4_CAS19]
           ,[L2320_1_CAS_5_CAS01]
           ,[L2320_1_CAS_5_CAS02]
           ,[L2320_1_CAS_5_CAS03]
           ,[L2320_1_CAS_5_CAS04]
           ,[L2320_1_CAS_5_CAS05]
           ,[L2320_1_CAS_5_CAS06]
           ,[L2320_1_CAS_5_CAS07]
           ,[L2320_1_CAS_5_CAS08]
           ,[L2320_1_CAS_5_CAS09]
           ,[L2320_1_CAS_5_CAS10]
           ,[L2320_1_CAS_5_CAS11]
           ,[L2320_1_CAS_5_CAS12]
           ,[L2320_1_CAS_5_CAS13]
           ,[L2320_1_CAS_5_CAS14]
           ,[L2320_1_CAS_5_CAS15]
           ,[L2320_1_CAS_5_CAS16]
           ,[L2320_1_CAS_5_CAS17]
           ,[L2320_1_CAS_5_CAS18]
           ,[L2320_1_CAS_5_CAS19]
           ,[L2320_1_AMT_1_AMT01]
           ,[L2320_1_AMT_1_AMT02]
           ,[L2320_1_AMT_2_AMT01]
           ,[L2320_1_AMT_2_AMT02]
           ,[L2320_1_AMT_3_AMT01]
           ,[L2320_1_AMT_3_AMT02]
           ,[L2320_1_OI_1_OI03]
           ,[L2320_1_OI_1_OI04]
           ,[L2320_1_OI_1_OI06]
           ,[L2320_1_MOA_1_MOA01]
           ,[L2320_1_MOA_1_MOA02]
           ,[L2320_1_MOA_1_MOA03]
           ,[L2320_1_MOA_1_MOA04]
           ,[L2320_1_MOA_1_MOA05]
           ,[L2320_1_MOA_1_MOA06]
           ,[L2320_1_MOA_1_MOA07]
           ,[L2320_1_MOA_1_MOA08]
           ,[L2320_1_MOA_1_MOA09]
           ,[L2330A_1_NM1_1_NM101]
           ,[L2330A_1_NM1_1_NM102]
           ,[L2330A_1_NM1_1_NM103]
           ,[L2330A_1_NM1_1_NM104]
           ,[L2330A_1_NM1_1_NM105]
           ,[L2330A_1_NM1_1_NM107]
           ,[L2330A_1_NM1_1_NM108]
           ,[L2330A_1_NM1_1_NM109]
           ,[L2330A_1_N3_1_N301]
           ,[L2330A_1_N3_1_N302]
           ,[L2330A_1_N4_1_N401]
           ,[L2330A_1_N4_1_N402]
           ,[L2330A_1_N4_1_N403]
           ,[L2330A_1_N4_1_N404]
           ,[L2330A_1_N4_1_N407]
           ,[L2330A_1_REF_1_REF01]
           ,[L2330A_1_REF_1_REF02]
           ,[L2330B_1_NM1_1_NM101]
           ,[L2330B_1_NM1_1_NM102]
           ,[L2330B_1_NM1_1_NM103]
           ,[L2330B_1_NM1_1_NM108]
           ,[L2330B_1_NM1_1_NM109]
           ,[L2330B_1_N3_1_N301]
           ,[L2330B_1_N3_1_N302]
           ,[L2330B_1_N4_1_N401]
           ,[L2330B_1_N4_1_N402]
           ,[L2330B_1_N4_1_N403]
           ,[L2330B_1_N4_1_N404]
           ,[L2330B_1_N4_1_N407]
           ,[L2330B_1_DTP_1_DTP01]
           ,[L2330B_1_DTP_1_DTP02]
           ,[L2330B_1_DTP_1_DTP03]
           ,[L2330B_1_REF_1_REF01]
           ,[L2330B_1_REF_1_REF02]
           ,[L2330B_1_REF_2_REF01]
           ,[L2330B_1_REF_2_REF02]
           ,[L2330B_1_REF_3_REF01]
           ,[L2330B_1_REF_3_REF02]
           ,[L2330B_1_REF_4_REF01]
           ,[L2330B_1_REF_4_REF02]
           ,[L2330B_1_REF_5_REF01]
           ,[L2330B_1_REF_5_REF02]
           ,[L2330B_1_REF_6_REF01]
           ,[L2330B_1_REF_6_REF02]
           ,[L2330B_1_REF_7_REF01]
           ,[L2330B_1_REF_7_REF02]
           ,[L2330B_1_REF_8_REF01]
           ,[L2330B_1_REF_8_REF02]
           ,[L2330C_1_NM1_1_NM101]
           ,[L2330C_1_NM1_1_NM102]
           ,[L2330C_1_REF_1_REF01]
           ,[L2330C_1_REF_1_REF02]
           ,[L2330C_1_REF_2_REF01]
           ,[L2330C_1_REF_2_REF02]
           ,[L2330C_1_REF_3_REF01]
           ,[L2330C_1_REF_3_REF02]
           ,[L2330D_1_NM1_1_NM101]
           ,[L2330D_1_NM1_1_NM102]
           ,[L2330D_1_REF_1_REF01]
           ,[L2330D_1_REF_1_REF02]
           ,[L2330D_1_REF_2_REF01]
           ,[L2330D_1_REF_2_REF02]
           ,[L2330D_1_REF_3_REF01]
           ,[L2330D_1_REF_3_REF02]
           ,[L2330D_1_REF_4_REF01]
           ,[L2330D_1_REF_4_REF02]
           ,[L2330E_1_NM1_1_NM101]
           ,[L2330E_1_NM1_1_NM102]
           ,[L2330E_1_REF_1_REF01]
           ,[L2330E_1_REF_1_REF02]
           ,[L2330E_1_REF_2_REF01]
           ,[L2330E_1_REF_2_REF02]
           ,[L2330E_1_REF_3_REF01]
           ,[L2330E_1_REF_3_REF02]
           ,[L2330F_1_NM1_1_NM101]
           ,[L2330F_1_NM1_1_NM102]
           ,[L2330F_1_REF_1_REF01]
           ,[L2330F_1_REF_1_REF02]
           ,[L2330F_1_REF_2_REF01]
           ,[L2330F_1_REF_2_REF02]
           ,[L2330F_1_REF_3_REF01]
           ,[L2330F_1_REF_3_REF02]
           ,[L2330F_1_REF_4_REF01]
           ,[L2330F_1_REF_4_REF02]
           ,[L2330G_1_NM1_1_NM101]
           ,[L2330G_1_NM1_1_NM102]
           ,[L2330G_1_REF_1_REF01]
           ,[L2330G_1_REF_1_REF02]
           ,[L2330G_1_REF_2_REF01]
           ,[L2330G_1_REF_2_REF02])
     VALUES
           (@claimid,
@Fileid ,
@HeaderID,
@subscriber_patientid,
@L2320_1_SBR_1_SBR01       ,
@L2320_1_SBR_1_SBR02       ,
@L2320_1_SBR_1_SBR03       ,
@L2320_1_SBR_1_SBR04       ,
@L2320_1_SBR_1_SBR05       ,
@L2320_1_SBR_1_SBR09       ,
@L2320_1_CAS_1_CAS01       ,
@L2320_1_CAS_1_CAS02       ,
@L2320_1_CAS_1_CAS03       ,
@L2320_1_CAS_1_CAS04       ,
@L2320_1_CAS_1_CAS05       ,
@L2320_1_CAS_1_CAS06       ,
@L2320_1_CAS_1_CAS07       ,
@L2320_1_CAS_1_CAS08       ,
@L2320_1_CAS_1_CAS09       ,
@L2320_1_CAS_1_CAS10       ,
@L2320_1_CAS_1_CAS11       ,
@L2320_1_CAS_1_CAS12       ,
@L2320_1_CAS_1_CAS13       ,
@L2320_1_CAS_1_CAS14       ,
@L2320_1_CAS_1_CAS15       ,
@L2320_1_CAS_1_CAS16       ,
@L2320_1_CAS_1_CAS17       ,
@L2320_1_CAS_1_CAS18       ,
@L2320_1_CAS_1_CAS19       ,
@L2320_1_CAS_2_CAS01       ,
@L2320_1_CAS_2_CAS02       ,
@L2320_1_CAS_2_CAS03       ,
@L2320_1_CAS_2_CAS04       ,
@L2320_1_CAS_2_CAS05       ,
@L2320_1_CAS_2_CAS06       ,
@L2320_1_CAS_2_CAS07       ,
@L2320_1_CAS_2_CAS08       ,
@L2320_1_CAS_2_CAS09       ,
@L2320_1_CAS_2_CAS10       ,
@L2320_1_CAS_2_CAS11       ,
@L2320_1_CAS_2_CAS12       ,
@L2320_1_CAS_2_CAS13       ,
@L2320_1_CAS_2_CAS14       ,
@L2320_1_CAS_2_CAS15       ,
@L2320_1_CAS_2_CAS16       ,
@L2320_1_CAS_2_CAS17       ,
@L2320_1_CAS_2_CAS18       ,
@L2320_1_CAS_2_CAS19       ,
@L2320_1_CAS_3_CAS01       ,
@L2320_1_CAS_3_CAS02       ,
@L2320_1_CAS_3_CAS03       ,
@L2320_1_CAS_3_CAS04       ,
@L2320_1_CAS_3_CAS05       ,
@L2320_1_CAS_3_CAS06       ,
@L2320_1_CAS_3_CAS07       ,
@L2320_1_CAS_3_CAS08       ,
@L2320_1_CAS_3_CAS09       ,
@L2320_1_CAS_3_CAS10       ,
@L2320_1_CAS_3_CAS11       ,
@L2320_1_CAS_3_CAS12       ,
@L2320_1_CAS_3_CAS13       ,
@L2320_1_CAS_3_CAS14       ,
@L2320_1_CAS_3_CAS15       ,
@L2320_1_CAS_3_CAS16       ,
@L2320_1_CAS_3_CAS17       ,
@L2320_1_CAS_3_CAS18       ,
@L2320_1_CAS_3_CAS19       ,
@L2320_1_CAS_4_CAS01       ,
@L2320_1_CAS_4_CAS02       ,
@L2320_1_CAS_4_CAS03       ,
@L2320_1_CAS_4_CAS04       ,
@L2320_1_CAS_4_CAS05       ,
@L2320_1_CAS_4_CAS06       ,
@L2320_1_CAS_4_CAS07       ,
@L2320_1_CAS_4_CAS08       ,
@L2320_1_CAS_4_CAS09       ,
@L2320_1_CAS_4_CAS10       ,
@L2320_1_CAS_4_CAS11       ,
@L2320_1_CAS_4_CAS12       ,
@L2320_1_CAS_4_CAS13       ,
@L2320_1_CAS_4_CAS14       ,
@L2320_1_CAS_4_CAS15       ,
@L2320_1_CAS_4_CAS16       ,
@L2320_1_CAS_4_CAS17       ,
@L2320_1_CAS_4_CAS18       ,
@L2320_1_CAS_4_CAS19       ,
@L2320_1_CAS_5_CAS01       ,
@L2320_1_CAS_5_CAS02       ,
@L2320_1_CAS_5_CAS03       ,
@L2320_1_CAS_5_CAS04       ,
@L2320_1_CAS_5_CAS05       ,
@L2320_1_CAS_5_CAS06       ,
@L2320_1_CAS_5_CAS07       ,
@L2320_1_CAS_5_CAS08       ,
@L2320_1_CAS_5_CAS09       ,
@L2320_1_CAS_5_CAS10       ,
@L2320_1_CAS_5_CAS11       ,
@L2320_1_CAS_5_CAS12       ,
@L2320_1_CAS_5_CAS13       ,
@L2320_1_CAS_5_CAS14       ,
@L2320_1_CAS_5_CAS15       ,
@L2320_1_CAS_5_CAS16       ,
@L2320_1_CAS_5_CAS17       ,
@L2320_1_CAS_5_CAS18       ,
@L2320_1_CAS_5_CAS19       ,
@L2320_1_AMT_1_AMT01       ,
@L2320_1_AMT_1_AMT02       ,
@L2320_1_AMT_2_AMT01       ,
@L2320_1_AMT_2_AMT02       ,
@L2320_1_AMT_3_AMT01       ,
@L2320_1_AMT_3_AMT02       ,
@L2320_1_OI_1_OI03         ,
@L2320_1_OI_1_OI04         ,
@L2320_1_OI_1_OI06         ,
@L2320_1_MOA_1_MOA01       ,
@L2320_1_MOA_1_MOA02       ,
@L2320_1_MOA_1_MOA03       ,
@L2320_1_MOA_1_MOA04       ,
@L2320_1_MOA_1_MOA05       ,
@L2320_1_MOA_1_MOA06       ,
@L2320_1_MOA_1_MOA07       ,
@L2320_1_MOA_1_MOA08       ,
@L2320_1_MOA_1_MOA09       ,
@L2330A_1_NM1_1_NM101      ,
@L2330A_1_NM1_1_NM102      ,
@L2330A_1_NM1_1_NM103      ,
@L2330A_1_NM1_1_NM104      ,
@L2330A_1_NM1_1_NM105      ,
@L2330A_1_NM1_1_NM107      ,
@L2330A_1_NM1_1_NM108      ,
@L2330A_1_NM1_1_NM109      ,
@L2330A_1_N3_1_N301        ,
@L2330A_1_N3_1_N302        ,
@L2330A_1_N4_1_N401        ,
@L2330A_1_N4_1_N402        ,
@L2330A_1_N4_1_N403        ,
@L2330A_1_N4_1_N404        ,
@L2330A_1_N4_1_N407        ,
@L2330A_1_REF_1_REF01      ,
@L2330A_1_REF_1_REF02      ,
@L2330B_1_NM1_1_NM101      ,
@L2330B_1_NM1_1_NM102      ,
@L2330B_1_NM1_1_NM103      ,
@L2330B_1_NM1_1_NM108      ,
@L2330B_1_NM1_1_NM109      ,
@L2330B_1_N3_1_N301        ,
@L2330B_1_N3_1_N302        ,
@L2330B_1_N4_1_N401        ,
@L2330B_1_N4_1_N402        ,
@L2330B_1_N4_1_N403        ,
@L2330B_1_N4_1_N404        ,
@L2330B_1_N4_1_N407        ,
@L2330B_1_DTP_1_DTP01      ,
@L2330B_1_DTP_1_DTP02      ,
@L2330B_1_DTP_1_DTP03      ,
@L2330B_1_REF_1_REF01      ,
@L2330B_1_REF_1_REF02      ,
@L2330B_1_REF_2_REF01      ,
@L2330B_1_REF_2_REF02      ,
@L2330B_1_REF_3_REF01      ,
@L2330B_1_REF_3_REF02      ,
@L2330B_1_REF_4_REF01      ,
@L2330B_1_REF_4_REF02      ,
@L2330B_1_REF_5_REF01      ,
@L2330B_1_REF_5_REF02      ,
@L2330B_1_REF_6_REF01      ,
@L2330B_1_REF_6_REF02      ,
@L2330B_1_REF_7_REF01      ,
@L2330B_1_REF_7_REF02      ,
@L2330B_1_REF_8_REF01      ,
@L2330B_1_REF_8_REF02      ,
@L2330C_1_NM1_1_NM101      ,
@L2330C_1_NM1_1_NM102      ,
@L2330C_1_REF_1_REF01      ,
@L2330C_1_REF_1_REF02      ,
@L2330C_1_REF_2_REF01      ,
@L2330C_1_REF_2_REF02      ,
@L2330C_1_REF_3_REF01      ,
@L2330C_1_REF_3_REF02      ,
@L2330D_1_NM1_1_NM101      ,
@L2330D_1_NM1_1_NM102      ,
@L2330D_1_REF_1_REF01      ,
@L2330D_1_REF_1_REF02      ,
@L2330D_1_REF_2_REF01      ,
@L2330D_1_REF_2_REF02      ,
@L2330D_1_REF_3_REF01      ,
@L2330D_1_REF_3_REF02      ,
@L2330D_1_REF_4_REF01      ,
@L2330D_1_REF_4_REF02      ,
@L2330E_1_NM1_1_NM101      ,
@L2330E_1_NM1_1_NM102      ,
@L2330E_1_REF_1_REF01      ,
@L2330E_1_REF_1_REF02      ,
@L2330E_1_REF_2_REF01      ,
@L2330E_1_REF_2_REF02      ,
@L2330E_1_REF_3_REF01      ,
@L2330E_1_REF_3_REF02      ,
@L2330F_1_NM1_1_NM101      ,
@L2330F_1_NM1_1_NM102      ,
@L2330F_1_REF_1_REF01      ,
@L2330F_1_REF_1_REF02      ,
@L2330F_1_REF_2_REF01      ,
@L2330F_1_REF_2_REF02      ,
@L2330F_1_REF_3_REF01      ,
@L2330F_1_REF_3_REF02      ,
@L2330F_1_REF_4_REF01      ,
@L2330F_1_REF_4_REF02      ,
@L2330G_1_NM1_1_NM101      ,
@L2330G_1_NM1_1_NM102      ,
@L2330G_1_REF_1_REF01      ,
@L2330G_1_REF_1_REF02      ,
@L2330G_1_REF_2_REF01      ,
@L2330G_1_REF_2_REF02      )
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertMembersHealthPlantb]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spinsertMembersHealthPlantb]
@memberkeyid int=null,
@BenefitCode varchar(30)=null,
@fromdate varchar(35)=null,
@todate varchar(35)=null,
@EmpGrp varchar(100)=null,
@MaintRes int=1
as
begin
INSERT INTO [EDIDatabase].[dbo].[MembersHealthPlantb]
           ([Member_Key_ID]
           ,[BenefitCode]
           ,[fromdate]
           ,[todate]
           ,EmpGrp
           ,MaintReason)
     VALUES
           (@memberkeyid,@BenefitCode,@fromdate,@todate,@EmpGrp,@MaintRes)
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertMemberPCPtb]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spinsertMemberPCPtb]
@member_key_id int=null,
@pcpid varchar(80)=null,
@fromdate varchar(30)=null,
@todate varchar(30)=null,
@MaintRes int=null,
@Org varchar(60)=null
as
begin
INSERT INTO [EDIDatabase].[dbo].[MemberPCPtb]
           ([member_key_id]
           ,[pcpid]
           ,[MaintReason]
           ,[organization]
           ,[fromdate]
           ,[todate])
     VALUES
           (@member_key_id
           ,@pcpid
           ,@MaintRes
           ,@Org
           ,@fromdate
           ,@todate)
end
GO
/****** Object:  StoredProcedure [dbo].[spinserthealthealthplan]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinserthealthealthplan]
@memberId varchar(80)=null
,@healthPlan varchar(5)=null
,@healthPlanCode varchar(30)=null
,@fromtable varchar(35)=null
,@totable varchar(35)=null
as
begin
INSERT INTO [EDIDatabase].[dbo].[MembersHealthPlantb]
           (
           [memberId]
           ,[healthPlan]
           ,[healthPlanCode]
           ,[fromtable]
           ,[totable]
           )
     VALUES
           (@memberId
,@healthPlan
,@healthPlanCode
,@fromtable
,@totable)
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertformidentification]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spinsertformidentification]
@servicelidid int,
@L2440_1_LQ_1_LQ01              varchar(3)=null,
@L2440_1_LQ_1_LQ02              varchar(30)=null
as
begin
INSERT INTO [EDIDatabase].[dbo].[EDI_837P_FormIdentification]
     VALUES
           (@servicelidid
           ,@L2440_1_LQ_1_LQ01
           ,@L2440_1_LQ_1_LQ02)
           select @@IDENTITY formidentificationid
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertform]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertform]
@servicelineid int=null,
@L2440_1_FRM_1_FRM01            varchar(20)=null,
@L2440_1_FRM_1_FRM02            varchar(1)=null,
@L2440_1_FRM_1_FRM03            varchar(50)=null,
@L2440_1_FRM_1_FRM04            varchar(8)=null,
@L2440_1_FRM_1_FRM05            varchar(6)=null
as
begin
INSERT INTO [EDIDatabase].[dbo].[EDI_837P_Form]
           
     VALUES
           (@servicelineid,@L2440_1_FRM_1_FRM01,
			@L2440_1_FRM_1_FRM02,
			@L2440_1_FRM_1_FRM03,
			@L2440_1_FRM_1_FRM04,
			@L2440_1_FRM_1_FRM05)
			end
GO
/****** Object:  StoredProcedure [dbo].[spinsertEDIHeader]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spinsertEDIHeader]
			@Fileid                varchar(30),
@HeaderID              varchar(30),
@L837PTS_1_ST_1_ST01   varchar(3) = NULL,
@L837PTS_1_ST_1_ST02   varchar(9) = NULL,
@L837PTS_1_ST_1_ST03   varchar(35) = NULL,
@L837PTS_1_BHT_1_BHT01 varchar(4) = NULL,
@L837PTS_1_BHT_1_BHT02 varchar(2) = NULL,
@L837PTS_1_BHT_1_BHT03 varchar(50) = NULL,
@L837PTS_1_BHT_1_BHT04 varchar(8) ,
@L837PTS_1_BHT_1_BHT05 varchar(8) ,
@L837PTS_1_BHT_1_BHT06 varchar(2) = NULL,
@L1000A_1_NM1_1_NM101 varchar(3) = NULL,
@L1000A_1_NM1_1_NM102 char = NULL,
@L1000A_1_NM1_1_NM103 varchar(60) = NULL,
@L1000A_1_NM1_1_NM104 varchar(35) = NULL,
@L1000A_1_NM1_1_NM105 varchar(25) = NULL,
@L1000A_1_NM1_1_NM108 varchar(2) = NULL,
@L1000A_1_NM1_1_NM109 varchar(80) = NULL,
@L1000A_1_PER_1_PER01 varchar(2) = NULL,
@L1000A_1_PER_1_PER02 varchar(60) = NULL,
@L1000A_1_PER_1_PER03 varchar(2) = NULL,
@L1000A_1_PER_1_PER04 varchar(60) = NULL,
@L1000A_1_PER_1_PER05 varchar(2) = NULL,
@L1000A_1_PER_1_PER06 varchar(60) = NULL,
@L1000A_1_PER_1_PER07 varchar(2) = NULL,
@L1000A_1_PER_1_PER08 varchar(60) = NULL,
@L1000A_1_PER_2_PER01 varchar(2) = NULL,
@L1000A_1_PER_2_PER02 varchar(60) = NULL,
@L1000A_1_PER_2_PER03 varchar(2) = NULL,
@L1000A_1_PER_2_PER04 varchar(60) = NULL,
@L1000A_1_PER_2_PER05 varchar(2) = NULL,
@L1000A_1_PER_2_PER06 varchar(60) = NULL,
@L1000A_1_PER_2_PER07 varchar(2) = NULL,
@L1000A_1_PER_2_PER08 varchar(60) = NULL,
@L1000B_1_NM1_1_NM101 varchar(3) = NULL,
@L1000B_1_NM1_1_NM102 char = NULL,
@L1000B_1_NM1_1_NM103 varchar(60) = NULL,
@L1000B_1_NM1_1_NM108 varchar(2) = NULL,
@L1000B_1_NM1_1_NM109 varchar(80) = NULL
           as
           begin
INSERT INTO [EDIDatabase].[dbo].[EDI_837P_Header]
           ( [Fileid]
           ,[HeaderID]
           ,[L837PTS_1_ST_1_ST01]
           ,[L837PTS_1_ST_1_ST02]
           ,[L837PTS_1_ST_1_ST03]
           ,[L837PTS_1_BHT_1_BHT01]
           ,[L837PTS_1_BHT_1_BHT02]
           ,[L837PTS_1_BHT_1_BHT03]
           ,[L837PTS_1_BHT_1_BHT04]
           ,[L837PTS_1_BHT_1_BHT05]
           ,[L837PTS_1_BHT_1_BHT06]
           ,[L1000A_1_NM1_1_NM101]
           ,[L1000A_1_NM1_1_NM102]
           ,[L1000A_1_NM1_1_NM103]
           ,[L1000A_1_NM1_1_NM104]
           ,[L1000A_1_NM1_1_NM105]
           ,[L1000A_1_NM1_1_NM108]
           ,[L1000A_1_NM1_1_NM109]
           ,[L1000A_1_PER_1_PER01]
           ,[L1000A_1_PER_1_PER02]
           ,[L1000A_1_PER_1_PER03]
           ,[L1000A_1_PER_1_PER04]
           ,[L1000A_1_PER_1_PER05]
           ,[L1000A_1_PER_1_PER06]
           ,[L1000A_1_PER_1_PER07]
           ,[L1000A_1_PER_1_PER08]
           ,[L1000A_1_PER_2_PER01]
           ,[L1000A_1_PER_2_PER02]
           ,[L1000A_1_PER_2_PER03]
           ,[L1000A_1_PER_2_PER04]
           ,[L1000A_1_PER_2_PER05]
           ,[L1000A_1_PER_2_PER06]
           ,[L1000A_1_PER_2_PER07]
           ,[L1000A_1_PER_2_PER08]
           ,[L1000B_1_NM1_1_NM101]
           ,[L1000B_1_NM1_1_NM102]
           ,[L1000B_1_NM1_1_NM103]
           ,[L1000B_1_NM1_1_NM108]
           ,[L1000B_1_NM1_1_NM109])
     VALUES
           (	@Fileid                           
   ,@HeaderID                         
   ,@L837PTS_1_ST_1_ST01              
   ,@L837PTS_1_ST_1_ST02              
   ,@L837PTS_1_ST_1_ST03              
   ,@L837PTS_1_BHT_1_BHT01            
   ,@L837PTS_1_BHT_1_BHT02            
   ,@L837PTS_1_BHT_1_BHT03            
   ,@L837PTS_1_BHT_1_BHT04            
   ,@L837PTS_1_BHT_1_BHT05            
   ,@L837PTS_1_BHT_1_BHT06            
   ,@L1000A_1_NM1_1_NM101             
   ,@L1000A_1_NM1_1_NM102             
   ,@L1000A_1_NM1_1_NM103             
   ,@L1000A_1_NM1_1_NM104             
   ,@L1000A_1_NM1_1_NM105             
   ,@L1000A_1_NM1_1_NM108             
   ,@L1000A_1_NM1_1_NM109             
   ,@L1000A_1_PER_1_PER01             
   ,@L1000A_1_PER_1_PER02             
   ,@L1000A_1_PER_1_PER03             
   ,@L1000A_1_PER_1_PER04             
   ,@L1000A_1_PER_1_PER05             
   ,@L1000A_1_PER_1_PER06             
   ,@L1000A_1_PER_1_PER07             
   ,@L1000A_1_PER_1_PER08             
   ,@L1000A_1_PER_2_PER01             
   ,@L1000A_1_PER_2_PER02             
   ,@L1000A_1_PER_2_PER03             
   ,@L1000A_1_PER_2_PER04             
   ,@L1000A_1_PER_2_PER05             
   ,@L1000A_1_PER_2_PER06             
   ,@L1000A_1_PER_2_PER07             
   ,@L1000A_1_PER_2_PER08             
   ,@L1000B_1_NM1_1_NM101             
   ,@L1000B_1_NM1_1_NM102             
   ,@L1000B_1_NM1_1_NM103             
   ,@L1000B_1_NM1_1_NM108             
   ,@L1000B_1_NM1_1_NM109)
   end
GO
/****** Object:  StoredProcedure [dbo].[spinsertclaim]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spinsertclaim](
@Fileid varchar(30) ,
@HeaderID varchar(30),
@subscriber_patientid varchar(12),
@L2300_1_CLM_1_CLM01                 varchar(38)= NULL,
@L2300_1_CLM_1_CLM02                 varchar(18)= NULL,
@L2300_1_CLM_1_CLM05_1               varchar(2)= NULL,
@L2300_1_CLM_1_CLM05_2               varchar(2)= NULL,
@L2300_1_CLM_1_CLM05_3               varchar(1)= NULL,
@L2300_1_CLM_1_CLM06                 varchar(1)= NULL,
@L2300_1_CLM_1_CLM07                 varchar(1)= NULL,
@L2300_1_CLM_1_CLM08                 varchar(1)= NULL,
@L2300_1_CLM_1_CLM09                 varchar(1)= NULL,
@L2300_1_CLM_1_CLM10                 varchar(1)= NULL,
@L2300_1_CLM_1_CLM11_1               varchar(3)= NULL,
@L2300_1_CLM_1_CLM11_2               varchar(3)= NULL,
@L2300_1_CLM_1_CLM11_4               varchar(3)= NULL,
@L2300_1_CLM_1_CLM11_5               varchar(3)= NULL,
@L2300_1_CLM_1_CLM12                 varchar(3)= NULL,
@L2300_1_CLM_1_CLM20                 varchar(2)= NULL,
@L2300_1_DTP_1_DTP01                 varchar(3)= NULL,
@L2300_1_DTP_1_DTP02                 varchar(3)= NULL,
@L2300_1_DTP_1_DTP03                 varchar(35)= NULL,
@L2300_1_DTP_2_DTP01                 varchar(3)= NULL,
@L2300_1_DTP_2_DTP02                 varchar(3)= NULL,
@L2300_1_DTP_2_DTP03                 varchar(35)= NULL,
@L2300_1_DTP_3_DTP01                 varchar(3)= NULL,
@L2300_1_DTP_3_DTP02                 varchar(3)= NULL,
@L2300_1_DTP_3_DTP03                 varchar(35)= NULL,
@L2300_1_DTP_4_DTP01                 varchar(3)= NULL,
@L2300_1_DTP_4_DTP02                 varchar(3)= NULL,
@L2300_1_DTP_4_DTP03                 varchar(35)= NULL,
@L2300_1_DTP_5_DTP01                 varchar(3)= NULL,
@L2300_1_DTP_5_DTP02                 varchar(3)= NULL,
@L2300_1_DTP_5_DTP03                 varchar(35)= NULL,
@L2300_1_DTP_6_DTP01                 varchar(3)= NULL,
@L2300_1_DTP_6_DTP02                 varchar(3)= NULL,
@L2300_1_DTP_6_DTP03                 varchar(35)= NULL,
@L2300_1_DTP_7_DTP01                 varchar(3)= NULL,
@L2300_1_DTP_7_DTP02                 varchar(3)= NULL,
@L2300_1_DTP_7_DTP03                 varchar(35)= NULL,
@L2300_1_DTP_8_DTP01                 varchar(3)= NULL,
@L2300_1_DTP_8_DTP02                 varchar(3)= NULL,
@L2300_1_DTP_8_DTP03                 varchar(35)= NULL,
@L2300_1_DTP_9_DTP01                 varchar(3)= NULL,
@L2300_1_DTP_9_DTP02                 varchar(3)= NULL,
@L2300_1_DTP_9_DTP03                 varchar(35)= NULL,
@L2300_1_DTP_10_DTP01                varchar(3)= NULL,
@L2300_1_DTP_10_DTP02                varchar(3)= NULL,
@L2300_1_DTP_10_DTP03                varchar(35)= NULL,
@L2300_1_DTP_11_DTP01                varchar(3)= NULL,
@L2300_1_DTP_11_DTP02                varchar(3)= NULL,
@L2300_1_DTP_11_DTP03                varchar(35)= NULL,
@L2300_1_DTP_12_DTP01                varchar(3)= NULL,
@L2300_1_DTP_12_DTP02                varchar(3)= NULL,
@L2300_1_DTP_12_DTP03                varchar(35)= NULL,
@L2300_1_DTP_13_DTP01                varchar(3)= NULL,
@L2300_1_DTP_13_DTP02                varchar(3)= NULL,
@L2300_1_DTP_13_DTP03                varchar(35)= NULL,
@L2300_1_DTP_14_DTP01                varchar(3)= NULL,
@L2300_1_DTP_14_DTP02                varchar(3)= NULL,
@L2300_1_DTP_14_DTP03                varchar(35)= NULL,
@L2300_1_DTP_15_DTP01                varchar(3)= NULL,
@L2300_1_DTP_15_DTP02                varchar(3)= NULL,
@L2300_1_DTP_15_DTP03                varchar(35)= NULL,
@L2300_1_DTP_16_DTP01                varchar(3)= NULL,
@L2300_1_DTP_16_DTP02                varchar(3)= NULL,
@L2300_1_DTP_16_DTP03                varchar(35)= NULL,
@L2300_1_DTP_17_DTP01                varchar(3)= NULL,
@L2300_1_DTP_17_DTP02                varchar(3)= NULL,
@L2300_1_DTP_17_DTP03                varchar(35)= NULL,
@L2300_1_DTP_18_DTP01                varchar(3)= NULL,
@L2300_1_DTP_18_DTP02                varchar(3)= NULL,
@L2300_1_DTP_18_DTP03                varchar(35)= NULL,
@L2300_1_DTP_19_DTP01                varchar(3)= NULL,
@L2300_1_DTP_19_DTP02                varchar(3)= NULL,
@L2300_1_DTP_19_DTP03                varchar(35)= NULL,
@L2300_1_PWK_1_PWK01                 varchar(2)= NULL,
@L2300_1_PWK_1_PWK02                 varchar(2)= NULL,
@L2300_1_PWK_1_PWK06                 varchar(80)= NULL,
@L2300_1_PWK_2_PWK01                 varchar(2)= NULL,
@L2300_1_PWK_2_PWK02                 varchar(2)= NULL,
@L2300_1_PWK_2_PWK06                 varchar(80)= NULL,
@L2300_1_PWK_3_PWK01                 varchar(2)= NULL,
@L2300_1_PWK_3_PWK02                 varchar(2)= NULL,
@L2300_1_PWK_3_PWK06                 varchar(80)= NULL,
@L2300_1_PWK_4_PWK01                 varchar(2)= NULL,
@L2300_1_PWK_4_PWK02                 varchar(2)= NULL,
@L2300_1_PWK_4_PWK06                 varchar(80)= NULL,
@L2300_1_PWK_5_PWK01                 varchar(2)= NULL,
@L2300_1_PWK_5_PWK02                 varchar(2)= NULL,
@L2300_1_PWK_5_PWK06                 varchar(80)= NULL,
@L2300_1_PWK_6_PWK01                 varchar(2)= NULL,
@L2300_1_PWK_6_PWK02                 varchar(2)= NULL,
@L2300_1_PWK_6_PWK06                 varchar(80)= NULL,
@L2300_1_PWK_7_PWK01                 varchar(2)= NULL,
@L2300_1_PWK_7_PWK02                 varchar(2)= NULL,
@L2300_1_PWK_7_PWK06                 varchar(80)= NULL,
@L2300_1_PWK_8_PWK01                 varchar(2)= NULL,
@L2300_1_PWK_8_PWK02                 varchar(2)= NULL,
@L2300_1_PWK_8_PWK06                 varchar(80)= NULL,
@L2300_1_PWK_9_PWK01                 varchar(2)= NULL,
@L2300_1_PWK_9_PWK02                 varchar(2)= NULL,
@L2300_1_PWK_9_PWK06                 varchar(80)= NULL,
@L2300_1_PWK_10_PWK01                varchar(2)= NULL,
@L2300_1_PWK_10_PWK02                varchar(2)= NULL,
@L2300_1_PWK_10_PWK06                varchar(80)= NULL,
@L2300_1_CN1_1_CN101                 varchar(2)= NULL,
@L2300_1_CN1_1_CN102                 varchar(18)= NULL,
@L2300_1_CN1_1_CN103                 varchar(6)= NULL,
@L2300_1_CN1_1_CN104                 varchar(50)= NULL,
@L2300_1_CN1_1_CN105                 varchar(6)= NULL,
@L2300_1_CN1_1_CN106                 varchar(30)= NULL,
@L2300_1_AMT_1_AMT01                 varchar(3)= NULL,
@L2300_1_AMT_1_AMT02                 varchar(18)= NULL,
@L2300_1_REF_1_REF01                 varchar(3)= NULL,
@L2300_1_REF_1_REF02                 varchar(50)= NULL,
@L2300_1_REF_2_REF01                 varchar(3)= NULL,
@L2300_1_REF_2_REF02                 varchar(50)= NULL,
@L2300_1_REF_3_REF01                 varchar(3)= NULL,
@L2300_1_REF_3_REF02                 varchar(50)= NULL,
@L2300_1_REF_4_REF01                 varchar(3)= NULL,
@L2300_1_REF_4_REF02                 varchar(50)= NULL,
@L2300_1_REF_5_REF01                 varchar(3)= NULL,
@L2300_1_REF_5_REF02                 varchar(50)= NULL,
@L2300_1_REF_6_REF01                 varchar(3)= NULL,
@L2300_1_REF_6_REF02                 varchar(50)= NULL,
@L2300_1_REF_7_REF01                 varchar(3)= NULL,
@L2300_1_REF_7_REF02                 varchar(50)= NULL,
@L2300_1_REF_8_REF01                 varchar(3)= NULL,
@L2300_1_REF_8_REF02                 varchar(50)= NULL,
@L2300_1_REF_9_REF01                 varchar(3)= NULL,
@L2300_1_REF_9_REF02                 varchar(50)= NULL,
@L2300_1_REF_10_REF01                varchar(3)= NULL,
@L2300_1_REF_10_REF02                varchar(50)= NULL,
@L2300_1_REF_11_REF01                varchar(3)= NULL,
@L2300_1_REF_11_REF02                varchar(50)= NULL,
@L2300_1_REF_12_REF01                varchar(3)= NULL,
@L2300_1_REF_12_REF02                varchar(50)= NULL,
@L2300_1_REF_13_REF01                varchar(3)= NULL,
@L2300_1_REF_13_REF02                varchar(50)= NULL,
@L2300_1_REF_14_REF01                varchar(3)= NULL,
@L2300_1_REF_14_REF02                varchar(50)= NULL,
@L2300_1_K3_1_K301                   varchar(80)= NULL,
@L2300_1_K3_2_K301                   varchar(80)= NULL,
@L2300_1_K3_3_K301                   varchar(80)= NULL,
@L2300_1_K3_4_K301                   varchar(80)= NULL,
@L2300_1_K3_5_K301                   varchar(80)= NULL,
@L2300_1_K3_6_K301                   varchar(80)= NULL,
@L2300_1_K3_7_K301                   varchar(80)= NULL,
@L2300_1_K3_8_K301                   varchar(80)= NULL,
@L2300_1_K3_9_K301                   varchar(80)= NULL,
@L2300_1_K3_10_K301                  varchar(80)= NULL,
@L2300_1_NTE_1_NTE01                 varchar(3)= NULL,
@L2300_1_NTE_1_NTE02                 varchar(80)= NULL,
@L2300_1_CR1_1_CR101                 varchar(2)= NULL,
@L2300_1_CR1_1_CR102                 varchar(10)= NULL,
@L2300_1_CR1_1_CR104                 varchar(1)= NULL,
@L2300_1_CR1_1_CR105                 varchar(2)= NULL,
@L2300_1_CR1_1_CR106                 varchar(15)= NULL,
@L2300_1_CR1_1_CR109                 varchar(80)= NULL,
@L2300_1_CR1_1_CR110                 varchar(80)= NULL,
@L2300_1_CR2_1_CR208                 varchar(1)= NULL,
@L2300_1_CR2_1_CR210                 varchar(80)= NULL,
@L2300_1_CR2_1_CR211                 varchar(80)= NULL,
@L2300_1_CRC_1_CRC01                 varchar(2)= NULL,
@L2300_1_CRC_1_CRC02                 varchar(1)= NULL,
@L2300_1_CRC_1_CRC03                 varchar(3)= NULL,
@L2300_1_CRC_1_CRC04                 varchar(3)= NULL,
@L2300_1_CRC_1_CRC05                 varchar(3)= NULL,
@L2300_1_CRC_1_CRC06                 varchar(3)= NULL,
@L2300_1_CRC_1_CRC07                 varchar(3)= NULL,
@L2300_1_CRC_2_CRC01                 varchar(2)= NULL,
@L2300_1_CRC_2_CRC02                 varchar(1)= NULL,
@L2300_1_CRC_2_CRC03                 varchar(3)= NULL,
@L2300_1_CRC_2_CRC04                 varchar(3)= NULL,
@L2300_1_CRC_2_CRC05                 varchar(3)= NULL,
@L2300_1_CRC_2_CRC06                 varchar(3)= NULL,
@L2300_1_CRC_2_CRC07                 varchar(3)= NULL,
@L2300_1_CRC_3_CRC01                 varchar(2)= NULL,
@L2300_1_CRC_3_CRC02                 varchar(1)= NULL,
@L2300_1_CRC_3_CRC03                 varchar(3)= NULL,
@L2300_1_CRC_3_CRC04                 varchar(3)= NULL,
@L2300_1_CRC_3_CRC05                 varchar(3)= NULL,
@L2300_1_CRC_3_CRC06                 varchar(3)= NULL,
@L2300_1_CRC_3_CRC07                 varchar(3)= NULL,
@L2300_1_CRC_4_CRC01                 varchar(2)= NULL,
@L2300_1_CRC_4_CRC02                 varchar(1)= NULL,
@L2300_1_CRC_4_CRC03                 varchar(3)= NULL,
@L2300_1_CRC_4_CRC04                 varchar(3)= NULL,
@L2300_1_CRC_4_CRC05                 varchar(3)= NULL,
@L2300_1_CRC_4_CRC06                 varchar(3)= NULL,
@L2300_1_CRC_4_CRC07                 varchar(3)= NULL,
@L2300_1_CRC_5_CRC01                 varchar(2)= NULL,
@L2300_1_CRC_5_CRC02                 varchar(1)= NULL,
@L2300_1_CRC_5_CRC03                 varchar(3)= NULL,
@L2300_1_CRC_5_CRC04                 varchar(3)= NULL,
@L2300_1_CRC_5_CRC05                 varchar(3)= NULL,
@L2300_1_CRC_5_CRC06                 varchar(3)= NULL,
@L2300_1_CRC_5_CRC07                 varchar(3)= NULL,
@L2300_1_CRC_6_CRC01                 varchar(2)= NULL,
@L2300_1_CRC_6_CRC02                 varchar(1)= NULL,
@L2300_1_CRC_6_CRC03                 varchar(3)= NULL,
@L2300_1_CRC_6_CRC04                 varchar(3)= NULL,
@L2300_1_CRC_6_CRC05                 varchar(3)= NULL,
@L2300_1_CRC_6_CRC06                 varchar(3)= NULL,
@L2300_1_CRC_6_CRC07                 varchar(3)= NULL,
@L2300_1_CRC_7_CRC01                 varchar(2)= NULL,
@L2300_1_CRC_7_CRC02                 varchar(1)= NULL,
@L2300_1_CRC_7_CRC03                 varchar(3)= NULL,
@L2300_1_CRC_8_CRC01                 varchar(2)= NULL,
@L2300_1_CRC_8_CRC02                 varchar(1)= NULL,
@L2300_1_CRC_8_CRC03                 varchar(3)= NULL,
@L2300_1_CRC_8_CRC04                 varchar(3)= NULL,
@L2300_1_CRC_8_CRC05                 varchar(3)= NULL,
@L2300_1_HI_1_HI01_01                varchar(3)= NULL,
@L2300_1_HI_1_HI01_02                varchar(30)= NULL,
@L2300_1_HI_1_HI02_01                varchar(3)= NULL,
@L2300_1_HI_1_HI02_02                varchar(30)= NULL,
@L2300_1_HI_1_HI03_01                varchar(3)= NULL,
@L2300_1_HI_1_HI03_02                varchar(30)= NULL,
@L2300_1_HI_1_HI04_01                varchar(3)= NULL,
@L2300_1_HI_1_HI04_02                varchar(30)= NULL,
@L2300_1_HI_1_HI05_01                varchar(3)= NULL,
@L2300_1_HI_1_HI05_02                varchar(30)= NULL,
@L2300_1_HI_1_HI06_01                varchar(3)= NULL,
@L2300_1_HI_1_HI06_02                varchar(30)= NULL,
@L2300_1_HI_1_HI07_01                varchar(3)= NULL,
@L2300_1_HI_1_HI07_02                varchar(30)= NULL,
@L2300_1_HI_1_HI08_01                varchar(3)= NULL,
@L2300_1_HI_1_HI08_02                varchar(30)= NULL,
@L2300_1_HI_1_HI09_01                varchar(3)= NULL,
@L2300_1_HI_1_HI09_02                varchar(30)= NULL,
@L2300_1_HI_1_HI10_01                varchar(3)= NULL,
@L2300_1_HI_1_HI10_02                varchar(30)= NULL,
@L2300_1_HI_1_HI11_01                varchar(3)= NULL,
@L2300_1_HI_1_HI11_02                varchar(30)= NULL,
@L2300_1_HI_1_HI12_01                varchar(3)= NULL,
@L2300_1_HI_1_HI12_02                varchar(30)= NULL,
@L2300_1_HI_2_HI01_01                varchar(3)= NULL,
@L2300_1_HI_2_HI01_02                varchar(30)= NULL,
@L2300_1_HI_2_HI02_01                varchar(3)= NULL,
@L2300_1_HI_2_HI02_02                varchar(30)= NULL,
@L2300_1_HI_2_HI03_01                varchar(3)= NULL,
@L2300_1_HI_2_HI03_02                varchar(30)= NULL,
@L2300_1_HI_2_HI04_01                varchar(3)= NULL,
@L2300_1_HI_2_HI04_02                varchar(30)= NULL,
@L2300_1_HI_2_HI05_01                varchar(3)= NULL,
@L2300_1_HI_2_HI05_02                varchar(30)= NULL,
@L2300_1_HI_2_HI06_01                varchar(3)= NULL,
@L2300_1_HI_2_HI06_02                varchar(30)= NULL,
@L2300_1_HI_2_HI07_01                varchar(3)= NULL,
@L2300_1_HI_2_HI07_02                varchar(30)= NULL,
@L2300_1_HI_2_HI08_01                varchar(3)= NULL,
@L2300_1_HI_2_HI08_02                varchar(30)= NULL,
@L2300_1_HI_2_HI09_01                varchar(3)= NULL,
@L2300_1_HI_2_HI09_02                varchar(30)= NULL,
@L2300_1_HI_2_HI10_01                varchar(3)= NULL,
@L2300_1_HI_2_HI10_02                varchar(30)= NULL,
@L2300_1_HI_2_HI11_01                varchar(3)= NULL,
@L2300_1_HI_2_HI11_02                varchar(30)= NULL,
@L2300_1_HI_2_HI12_01                varchar(3)= NULL,
@L2300_1_HI_2_HI12_02                varchar(30)= NULL,
@L2300_1_HI_3_HI01_01                varchar(3)= NULL,
@L2300_1_HI_3_HI01_02                varchar(30)= NULL,
@L2300_1_HI_3_HI02_01                varchar(3)= NULL,
@L2300_1_HI_3_HI02_02                varchar(30)= NULL,
@L2300_1_HI_3_HI03_01                varchar(3)= NULL,
@L2300_1_HI_3_HI03_02                varchar(30)= NULL,
@L2300_1_HI_3_HI04_01                varchar(3)= NULL,
@L2300_1_HI_3_HI04_02                varchar(30)= NULL,
@L2300_1_HI_3_HI05_01                varchar(3)= NULL,
@L2300_1_HI_3_HI05_02                varchar(30)= NULL,
@L2300_1_HI_3_HI06_01                varchar(3)= NULL,
@L2300_1_HI_3_HI06_02                varchar(30)= NULL,
@L2300_1_HI_3_HI07_01                varchar(3)= NULL,
@L2300_1_HI_3_HI07_02                varchar(30)= NULL,
@L2300_1_HI_3_HI08_01                varchar(3)= NULL,
@L2300_1_HI_3_HI08_02                varchar(30)= NULL,
@L2300_1_HI_3_HI09_01                varchar(3)= NULL,
@L2300_1_HI_3_HI09_02                varchar(30)= NULL,
@L2300_1_HI_3_HI10_01                varchar(3)= NULL,
@L2300_1_HI_3_HI10_02                varchar(30)= NULL,
@L2300_1_HI_3_HI11_01                varchar(3)= NULL,
@L2300_1_HI_3_HI11_02                varchar(30)= NULL,
@L2300_1_HI_3_HI12_01                varchar(3)= NULL,
@L2300_1_HI_3_HI12_02                varchar(30)= NULL,
@L2300_1_HI_4_HI01_01                varchar(3)= NULL,
@L2300_1_HI_4_HI01_02                varchar(30)= NULL,
@L2300_1_HI_4_HI02_01                varchar(3)= NULL,
@L2300_1_HI_4_HI02_02                varchar(30)= NULL,
@L2300_1_HI_4_HI03_01                varchar(3)= NULL,
@L2300_1_HI_4_HI03_02                varchar(30)= NULL,
@L2300_1_HI_4_HI04_01                varchar(3)= NULL,
@L2300_1_HI_4_HI04_02                varchar(30)= NULL,
@L2300_1_HI_4_HI05_01                varchar(3)= NULL,
@L2300_1_HI_4_HI05_02                varchar(30)= NULL,
@L2300_1_HI_4_HI06_01                varchar(3)= NULL,
@L2300_1_HI_4_HI06_02                varchar(30)= NULL,
@L2300_1_HI_4_HI07_01                varchar(3)= NULL,
@L2300_1_HI_4_HI07_02                varchar(30)= NULL,
@L2300_1_HI_4_HI08_01                varchar(3)= NULL,
@L2300_1_HI_4_HI08_02                varchar(30)= NULL,
@L2300_1_HI_4_HI09_01                varchar(3)= NULL,
@L2300_1_HI_4_HI09_02                varchar(30)= NULL,
@L2300_1_HI_4_HI10_01                varchar(3)= NULL,
@L2300_1_HI_4_HI10_02                varchar(30)= NULL,
@L2300_1_HI_4_HI11_01                varchar(3)= NULL,
@L2300_1_HI_4_HI11_02                varchar(30)= NULL,
@L2300_1_HI_4_HI12_01                varchar(3)= NULL,
@L2300_1_HI_4_HI12_02                varchar(30)= NULL,
@L2300_1_HCP_1_HCP01                 varchar(2)= NULL,
@L2300_1_HCP_1_HCP02                 varchar(18)= NULL,
@L2300_1_HCP_1_HCP03                 varchar(18)= NULL,
@L2300_1_HCP_1_HCP04                 varchar(50)= NULL,
@L2300_1_HCP_1_HCP05                 varchar(9)= NULL,
@L2300_1_HCP_1_HCP06                 varchar(50)= NULL,
@L2300_1_HCP_1_HCP07                 varchar(18)= NULL,
@L2300_1_HCP_1_HCP13                 varchar(2)= NULL,
@L2300_1_HCP_1_HCP14                 varchar(2)= NULL,
@L2300_1_HCP_1_HCP15                 varchar(2)= NULL,
@L2310A_1_NM1_1_NM101                varchar(3)= NULL,
@L2310A_1_NM1_1_NM102                varchar(1)= NULL,
@L2310A_1_NM1_1_NM103                varchar(60)= NULL,
@L2310A_1_NM1_1_NM104                varchar(35)= NULL,
@L2310A_1_NM1_1_NM105                varchar(25)= NULL,
@L2310A_1_NM1_1_NM107                varchar(10)= NULL,
@L2310A_1_NM1_1_NM108                varchar(2)= NULL,
@L2310A_1_NM1_1_NM109                varchar(80)= NULL,
@L2310A_1_REF_1_REF01                varchar(3)= NULL,
@L2310A_1_REF_1_REF02                varchar(50)= NULL,
@L2310A_1_REF_2_REF01                varchar(3)= NULL,
@L2310A_1_REF_2_REF02                varchar(50)= NULL,
@L2310A_1_REF_3_REF01                varchar(3)= NULL,
@L2310A_1_REF_3_REF02                varchar(50)= NULL,
@L2310A_2_NM1_1_NM101                varchar(3)= NULL,
@L2310A_2_NM1_1_NM102                varchar(1)= NULL,
@L2310A_2_NM1_1_NM103                varchar(60)= NULL,
@L2310A_2_NM1_1_NM104                varchar(35)= NULL,
@L2310A_2_NM1_1_NM105                varchar(25)= NULL,
@L2310A_2_NM1_1_NM107                varchar(10)= NULL,
@L2310A_2_NM1_1_NM108                varchar(2)= NULL,
@L2310A_2_NM1_1_NM109                varchar(80)= NULL,
@L2310A_2_REF_1_REF01                varchar(3)= NULL,
@L2310A_2_REF_1_REF02                varchar(50)= NULL,
@L2310A_2_REF_2_REF01                varchar(3)= NULL,
@L2310A_2_REF_2_REF02                varchar(50)= NULL,
@L2310A_2_REF_3_REF01                varchar(3)= NULL,
@L2310A_2_REF_3_REF02                varchar(50)= NULL,
@L2310B_1_NM1_1_NM101                varchar(3)= NULL,
@L2310B_1_NM1_1_NM102                varchar(1)= NULL,
@L2310B_1_NM1_1_NM103                varchar(60)= NULL,
@L2310B_1_NM1_1_NM104                varchar(35)= NULL,
@L2310B_1_NM1_1_NM105                varchar(25)= NULL,
@L2310B_1_NM1_1_NM107                varchar(10)= NULL,
@L2310B_1_NM1_1_NM108                varchar(2)= NULL,
@L2310B_1_NM1_1_NM109                varchar(80)= NULL,
@L2310B_1_PRV_1_PRV01                varchar(3)= NULL,
@L2310B_1_PRV_1_PRV02                varchar(3)= NULL,
@L2310B_1_PRV_1_PRV03                varchar(50)= NULL,
@L2310B_1_REF_1_REF01                varchar(3)= NULL,
@L2310B_1_REF_1_REF02                varchar(50)= NULL,
@L2310B_1_REF_2_REF01                varchar(3)= NULL,
@L2310B_1_REF_2_REF02                varchar(50)= NULL,
@L2310B_1_REF_3_REF01                varchar(3)= NULL,
@L2310B_1_REF_3_REF02                varchar(50)= NULL,
@L2310B_1_REF_4_REF01                varchar(3)= NULL,
@L2310B_1_REF_4_REF02                varchar(50)= NULL,
@L2310C_1_NM1_1_NM101                varchar(3)= NULL,
@L2310C_1_NM1_1_NM102                varchar(1)= NULL,
@L2310C_1_NM1_1_NM103                varchar(60)= NULL,
@L2310C_1_NM1_1_NM108                varchar(2)= NULL,
@L2310C_1_NM1_1_NM109                varchar(80)= NULL,
@L2310C_1_N3_1_N301                  varchar(55)= NULL,
@L2310C_1_N3_1_N302                  varchar(55)= NULL,
@L2310C_1_N4_1_N401                  varchar(30)= NULL,
@L2310C_1_N4_1_N402                  varchar(2)= NULL,
@L2310C_1_N4_1_N403                  varchar(15)= NULL,
@L2310C_1_N4_1_N404                  varchar(3)= NULL,
@L2310C_1_N4_1_N407                  varchar(3)= NULL,
@L2310C_1_REF_1_REF01                varchar(3)= NULL,
@L2310C_1_REF_1_REF02                varchar(50)= NULL,
@L2310C_1_REF_2_REF01                varchar(3)= NULL,
@L2310C_1_REF_2_REF02                varchar(50)= NULL,
@L2310C_1_REF_3_REF01                varchar(3)= NULL,
@L2310C_1_REF_3_REF02                varchar(50)= NULL,
@L2310C_1_PER_1_PER01                varchar(2)= NULL,
@L2310C_1_PER_1_PER02                varchar(60)= NULL,
@L2310C_1_PER_1_PER03                varchar(2)= NULL,
@L2310C_1_PER_1_PER04                varchar(256)= NULL,
@L2310C_1_PER_1_PER05                varchar(2)= NULL,
@L2310C_1_PER_1_PER06                varchar(256)= NULL,
@L2310D_1_NM1_1_NM101                varchar(3)= NULL,
@L2310D_1_NM1_1_NM102                varchar(1)= NULL,
@L2310D_1_NM1_1_NM103                varchar(60)= NULL,
@L2310D_1_NM1_1_NM104                varchar(35)= NULL,
@L2310D_1_NM1_1_NM105                varchar(25)= NULL,
@L2310D_1_NM1_1_NM107                varchar(10)= NULL,
@L2310D_1_NM1_1_NM108                varchar(2)= NULL,
@L2310D_1_NM1_1_NM109                varchar(80)= NULL,
@L2310D_1_REF_1_REF01                varchar(3)= NULL,
@L2310D_1_REF_1_REF02                varchar(50)= NULL,
@L2310D_1_REF_2_REF01                varchar(3)= NULL,
@L2310D_1_REF_2_REF02                varchar(50)= NULL,
@L2310D_1_REF_3_REF01                varchar(3)= NULL,
@L2310D_1_REF_3_REF02                varchar(50)= NULL,
@L2310D_1_REF_4_REF01                varchar(3)= NULL,
@L2310D_1_REF_4_REF02                varchar(50)= NULL,
@L2310E_1_NM1_1_NM101                varchar(3)= NULL,
@L2310E_1_NM1_1_NM102                varchar(1)= NULL,
@L2310E_1_N3_1_N301                  varchar(55)= NULL,
@L2310E_1_N3_1_N302                  varchar(55)= NULL,
@L2310E_1_N4_1_N401                  varchar(30)= NULL,
@L2310E_1_N4_1_N402                  varchar(2)= NULL,
@L2310E_1_N4_1_N403                  varchar(15)= NULL,
@L2310E_1_N4_1_N404                  varchar(3)= NULL,
@L2310E_1_N4_1_N407                  varchar(3)= NULL,
@L2310F_1_NM1_1_NM101                varchar(3)= NULL,
@L2310F_1_NM1_1_NM102                varchar(1)= NULL,
@L2310F_1_NM1_1_NM103                varchar(60)= NULL,
@L2310F_1_N3_1_N301                  varchar(55)= NULL,
@L2310F_1_N3_1_N302                  varchar(55)= NULL,
@L2310F_1_N4_1_N401                  varchar(30)= NULL,
@L2310F_1_N4_1_N402                  varchar(2)= NULL,
@L2310F_1_N4_1_N403                  varchar(15)= NULL,
@L2310F_1_N4_1_N404                  varchar(3)= NULL,
@L2310F_1_N4_1_N407                  varchar(3)=NULL)
as
begin
INSERT INTO EDI_837P_claim
           ([Fileid]
           ,[HeaderID]
           ,[subscriber_patientid]
           ,[L2300_1_CLM_1_CLM01]
           ,[L2300_1_CLM_1_CLM02]
           ,[L2300_1_CLM_1_CLM05_1]
           ,[L2300_1_CLM_1_CLM05_2]
           ,[L2300_1_CLM_1_CLM05_3]
           ,[L2300_1_CLM_1_CLM06]
           ,[L2300_1_CLM_1_CLM07]
           ,[L2300_1_CLM_1_CLM08]
           ,[L2300_1_CLM_1_CLM09]
           ,[L2300_1_CLM_1_CLM10]
           ,[L2300_1_CLM_1_CLM11_1]
           ,[L2300_1_CLM_1_CLM11_2]
           ,[L2300_1_CLM_1_CLM11_4]
           ,[L2300_1_CLM_1_CLM11_5]
           ,[L2300_1_CLM_1_CLM12]
           ,[L2300_1_CLM_1_CLM20]
           ,[L2300_1_DTP_1_DTP01]
           ,[L2300_1_DTP_1_DTP02]
           ,[L2300_1_DTP_1_DTP03]
           ,[L2300_1_DTP_2_DTP01]
           ,[L2300_1_DTP_2_DTP02]
           ,[L2300_1_DTP_2_DTP03]
           ,[L2300_1_DTP_3_DTP01]
           ,[L2300_1_DTP_3_DTP02]
           ,[L2300_1_DTP_3_DTP03]
           ,[L2300_1_DTP_4_DTP01]
           ,[L2300_1_DTP_4_DTP02]
           ,[L2300_1_DTP_4_DTP03]
           ,[L2300_1_DTP_5_DTP01]
           ,[L2300_1_DTP_5_DTP02]
           ,[L2300_1_DTP_5_DTP03]
           ,[L2300_1_DTP_6_DTP01]
           ,[L2300_1_DTP_6_DTP02]
           ,[L2300_1_DTP_6_DTP03]
           ,[L2300_1_DTP_7_DTP01]
           ,[L2300_1_DTP_7_DTP02]
           ,[L2300_1_DTP_7_DTP03]
           ,[L2300_1_DTP_8_DTP01]
           ,[L2300_1_DTP_8_DTP02]
           ,[L2300_1_DTP_8_DTP03]
           ,[L2300_1_DTP_9_DTP01]
           ,[L2300_1_DTP_9_DTP02]
           ,[L2300_1_DTP_9_DTP03]
           ,[L2300_1_DTP_10_DTP01]
           ,[L2300_1_DTP_10_DTP02]
           ,[L2300_1_DTP_10_DTP03]
           ,[L2300_1_DTP_11_DTP01]
           ,[L2300_1_DTP_11_DTP02]
           ,[L2300_1_DTP_11_DTP03]
           ,[L2300_1_DTP_12_DTP01]
           ,[L2300_1_DTP_12_DTP02]
           ,[L2300_1_DTP_12_DTP03]
           ,[L2300_1_DTP_13_DTP01]
           ,[L2300_1_DTP_13_DTP02]
           ,[L2300_1_DTP_13_DTP03]
           ,[L2300_1_DTP_14_DTP01]
           ,[L2300_1_DTP_14_DTP02]
           ,[L2300_1_DTP_14_DTP03]
           ,[L2300_1_DTP_15_DTP01]
           ,[L2300_1_DTP_15_DTP02]
           ,[L2300_1_DTP_15_DTP03]
           ,[L2300_1_DTP_16_DTP01]
           ,[L2300_1_DTP_16_DTP02]
           ,[L2300_1_DTP_16_DTP03]
           ,[L2300_1_DTP_17_DTP01]
           ,[L2300_1_DTP_17_DTP02]
           ,[L2300_1_DTP_17_DTP03]
           ,[L2300_1_DTP_18_DTP01]
           ,[L2300_1_DTP_18_DTP02]
           ,[L2300_1_DTP_18_DTP03]
           ,[L2300_1_DTP_19_DTP01]
           ,[L2300_1_DTP_19_DTP02]
           ,[L2300_1_DTP_19_DTP03]
           ,[L2300_1_PWK_1_PWK01]
           ,[L2300_1_PWK_1_PWK02]
           ,[L2300_1_PWK_1_PWK06]
           ,[L2300_1_PWK_2_PWK01]
           ,[L2300_1_PWK_2_PWK02]
           ,[L2300_1_PWK_2_PWK06]
           ,[L2300_1_PWK_3_PWK01]
           ,[L2300_1_PWK_3_PWK02]
           ,[L2300_1_PWK_3_PWK06]
           ,[L2300_1_PWK_4_PWK01]
           ,[L2300_1_PWK_4_PWK02]
           ,[L2300_1_PWK_4_PWK06]
           ,[L2300_1_PWK_5_PWK01]
           ,[L2300_1_PWK_5_PWK02]
           ,[L2300_1_PWK_5_PWK06]
           ,[L2300_1_PWK_6_PWK01]
           ,[L2300_1_PWK_6_PWK02]
           ,[L2300_1_PWK_6_PWK06]
           ,[L2300_1_PWK_7_PWK01]
           ,[L2300_1_PWK_7_PWK02]
           ,[L2300_1_PWK_7_PWK06]
           ,[L2300_1_PWK_8_PWK01]
           ,[L2300_1_PWK_8_PWK02]
           ,[L2300_1_PWK_8_PWK06]
           ,[L2300_1_PWK_9_PWK01]
           ,[L2300_1_PWK_9_PWK02]
           ,[L2300_1_PWK_9_PWK06]
           ,[L2300_1_PWK_10_PWK01]
           ,[L2300_1_PWK_10_PWK02]
           ,[L2300_1_PWK_10_PWK06]
           ,[L2300_1_CN1_1_CN101]
           ,[L2300_1_CN1_1_CN102]
           ,[L2300_1_CN1_1_CN103]
           ,[L2300_1_CN1_1_CN104]
           ,[L2300_1_CN1_1_CN105]
           ,[L2300_1_CN1_1_CN106]
           ,[L2300_1_AMT_1_AMT01]
           ,[L2300_1_AMT_1_AMT02]
           ,[L2300_1_REF_1_REF01]
           ,[L2300_1_REF_1_REF02]
           ,[L2300_1_REF_2_REF01]
           ,[L2300_1_REF_2_REF02]
           ,[L2300_1_REF_3_REF01]
           ,[L2300_1_REF_3_REF02]
           ,[L2300_1_REF_4_REF01]
           ,[L2300_1_REF_4_REF02]
           ,[L2300_1_REF_5_REF01]
           ,[L2300_1_REF_5_REF02]
           ,[L2300_1_REF_6_REF01]
           ,[L2300_1_REF_6_REF02]
           ,[L2300_1_REF_7_REF01]
           ,[L2300_1_REF_7_REF02]
           ,[L2300_1_REF_8_REF01]
           ,[L2300_1_REF_8_REF02]
           ,[L2300_1_REF_9_REF01]
           ,[L2300_1_REF_9_REF02]
           ,[L2300_1_REF_10_REF01]
           ,[L2300_1_REF_10_REF02]
           ,[L2300_1_REF_11_REF01]
           ,[L2300_1_REF_11_REF02]
           ,[L2300_1_REF_12_REF01]
           ,[L2300_1_REF_12_REF02]
           ,[L2300_1_REF_13_REF01]
           ,[L2300_1_REF_13_REF02]
           ,[L2300_1_REF_14_REF01]
           ,[L2300_1_REF_14_REF02]
           ,[L2300_1_K3_1_K301]
           ,[L2300_1_K3_2_K301]
           ,[L2300_1_K3_3_K301]
           ,[L2300_1_K3_4_K301]
           ,[L2300_1_K3_5_K301]
           ,[L2300_1_K3_6_K301]
           ,[L2300_1_K3_7_K301]
           ,[L2300_1_K3_8_K301]
           ,[L2300_1_K3_9_K301]
           ,[L2300_1_K3_10_K301]
           ,[L2300_1_NTE_1_NTE01]
           ,[L2300_1_NTE_1_NTE02]
           ,[L2300_1_CR1_1_CR101]
           ,[L2300_1_CR1_1_CR102]
           ,[L2300_1_CR1_1_CR104]
           ,[L2300_1_CR1_1_CR105]
           ,[L2300_1_CR1_1_CR106]
           ,[L2300_1_CR1_1_CR109]
           ,[L2300_1_CR1_1_CR110]
           ,[L2300_1_CR2_1_CR208]
           ,[L2300_1_CR2_1_CR210]
           ,[L2300_1_CR2_1_CR211]
           ,[L2300_1_CRC_1_CRC01]
           ,[L2300_1_CRC_1_CRC02]
           ,[L2300_1_CRC_1_CRC03]
           ,[L2300_1_CRC_1_CRC04]
           ,[L2300_1_CRC_1_CRC05]
           ,[L2300_1_CRC_1_CRC06]
           ,[L2300_1_CRC_1_CRC07]
           ,[L2300_1_CRC_2_CRC01]
           ,[L2300_1_CRC_2_CRC02]
           ,[L2300_1_CRC_2_CRC03]
           ,[L2300_1_CRC_2_CRC04]
           ,[L2300_1_CRC_2_CRC05]
           ,[L2300_1_CRC_2_CRC06]
           ,[L2300_1_CRC_2_CRC07]
           ,[L2300_1_CRC_3_CRC01]
           ,[L2300_1_CRC_3_CRC02]
           ,[L2300_1_CRC_3_CRC03]
           ,[L2300_1_CRC_3_CRC04]
           ,[L2300_1_CRC_3_CRC05]
           ,[L2300_1_CRC_3_CRC06]
           ,[L2300_1_CRC_3_CRC07]
           ,[L2300_1_CRC_4_CRC01]
           ,[L2300_1_CRC_4_CRC02]
           ,[L2300_1_CRC_4_CRC03]
           ,[L2300_1_CRC_4_CRC04]
           ,[L2300_1_CRC_4_CRC05]
           ,[L2300_1_CRC_4_CRC06]
           ,[L2300_1_CRC_4_CRC07]
           ,[L2300_1_CRC_5_CRC01]
           ,[L2300_1_CRC_5_CRC02]
           ,[L2300_1_CRC_5_CRC03]
           ,[L2300_1_CRC_5_CRC04]
           ,[L2300_1_CRC_5_CRC05]
           ,[L2300_1_CRC_5_CRC06]
           ,[L2300_1_CRC_5_CRC07]
           ,[L2300_1_CRC_6_CRC01]
           ,[L2300_1_CRC_6_CRC02]
           ,[L2300_1_CRC_6_CRC03]
           ,[L2300_1_CRC_6_CRC04]
           ,[L2300_1_CRC_6_CRC05]
           ,[L2300_1_CRC_6_CRC06]
           ,[L2300_1_CRC_6_CRC07]
           ,[L2300_1_CRC_7_CRC01]
           ,[L2300_1_CRC_7_CRC02]
           ,[L2300_1_CRC_7_CRC03]
           ,[L2300_1_CRC_8_CRC01]
           ,[L2300_1_CRC_8_CRC02]
           ,[L2300_1_CRC_8_CRC03]
           ,[L2300_1_CRC_8_CRC04]
           ,[L2300_1_CRC_8_CRC05]
           ,[L2300_1_HI_1_HI01_01]
           ,[L2300_1_HI_1_HI01_02]
           ,[L2300_1_HI_1_HI02_01]
           ,[L2300_1_HI_1_HI02_02]
           ,[L2300_1_HI_1_HI03_01]
           ,[L2300_1_HI_1_HI03_02]
           ,[L2300_1_HI_1_HI04_01]
           ,[L2300_1_HI_1_HI04_02]
           ,[L2300_1_HI_1_HI05_01]
           ,[L2300_1_HI_1_HI05_02]
           ,[L2300_1_HI_1_HI06_01]
           ,[L2300_1_HI_1_HI06_02]
           ,[L2300_1_HI_1_HI07_01]
           ,[L2300_1_HI_1_HI07_02]
           ,[L2300_1_HI_1_HI08_01]
           ,[L2300_1_HI_1_HI08_02]
           ,[L2300_1_HI_1_HI09_01]
           ,[L2300_1_HI_1_HI09_02]
           ,[L2300_1_HI_1_HI10_01]
           ,[L2300_1_HI_1_HI10_02]
           ,[L2300_1_HI_1_HI11_01]
           ,[L2300_1_HI_1_HI11_02]
           ,[L2300_1_HI_1_HI12_01]
           ,[L2300_1_HI_1_HI12_02]
           ,[L2300_1_HI_2_HI01_01]
           ,[L2300_1_HI_2_HI01_02]
           ,[L2300_1_HI_2_HI02_01]
           ,[L2300_1_HI_2_HI02_02]
           ,[L2300_1_HI_2_HI03_01]
           ,[L2300_1_HI_2_HI03_02]
           ,[L2300_1_HI_2_HI04_01]
           ,[L2300_1_HI_2_HI04_02]
           ,[L2300_1_HI_2_HI05_01]
           ,[L2300_1_HI_2_HI05_02]
           ,[L2300_1_HI_2_HI06_01]
           ,[L2300_1_HI_2_HI06_02]
           ,[L2300_1_HI_2_HI07_01]
           ,[L2300_1_HI_2_HI07_02]
           ,[L2300_1_HI_2_HI08_01]
           ,[L2300_1_HI_2_HI08_02]
           ,[L2300_1_HI_2_HI09_01]
           ,[L2300_1_HI_2_HI09_02]
           ,[L2300_1_HI_2_HI10_01]
           ,[L2300_1_HI_2_HI10_02]
           ,[L2300_1_HI_2_HI11_01]
           ,[L2300_1_HI_2_HI11_02]
           ,[L2300_1_HI_2_HI12_01]
           ,[L2300_1_HI_2_HI12_02]
           ,[L2300_1_HI_3_HI01_01]
           ,[L2300_1_HI_3_HI01_02]
           ,[L2300_1_HI_3_HI02_01]
           ,[L2300_1_HI_3_HI02_02]
           ,[L2300_1_HI_3_HI03_01]
           ,[L2300_1_HI_3_HI03_02]
           ,[L2300_1_HI_3_HI04_01]
           ,[L2300_1_HI_3_HI04_02]
           ,[L2300_1_HI_3_HI05_01]
           ,[L2300_1_HI_3_HI05_02]
           ,[L2300_1_HI_3_HI06_01]
           ,[L2300_1_HI_3_HI06_02]
           ,[L2300_1_HI_3_HI07_01]
           ,[L2300_1_HI_3_HI07_02]
           ,[L2300_1_HI_3_HI08_01]
           ,[L2300_1_HI_3_HI08_02]
           ,[L2300_1_HI_3_HI09_01]
           ,[L2300_1_HI_3_HI09_02]
           ,[L2300_1_HI_3_HI10_01]
           ,[L2300_1_HI_3_HI10_02]
           ,[L2300_1_HI_3_HI11_01]
           ,[L2300_1_HI_3_HI11_02]
           ,[L2300_1_HI_3_HI12_01]
           ,[L2300_1_HI_3_HI12_02]
           ,[L2300_1_HI_4_HI01_01]
           ,[L2300_1_HI_4_HI01_02]
           ,[L2300_1_HI_4_HI02_01]
           ,[L2300_1_HI_4_HI02_02]
           ,[L2300_1_HI_4_HI03_01]
           ,[L2300_1_HI_4_HI03_02]
           ,[L2300_1_HI_4_HI04_01]
           ,[L2300_1_HI_4_HI04_02]
           ,[L2300_1_HI_4_HI05_01]
           ,[L2300_1_HI_4_HI05_02]
           ,[L2300_1_HI_4_HI06_01]
           ,[L2300_1_HI_4_HI06_02]
           ,[L2300_1_HI_4_HI07_01]
           ,[L2300_1_HI_4_HI07_02]
           ,[L2300_1_HI_4_HI08_01]
           ,[L2300_1_HI_4_HI08_02]
           ,[L2300_1_HI_4_HI09_01]
           ,[L2300_1_HI_4_HI09_02]
           ,[L2300_1_HI_4_HI10_01]
           ,[L2300_1_HI_4_HI10_02]
           ,[L2300_1_HI_4_HI11_01]
           ,[L2300_1_HI_4_HI11_02]
           ,[L2300_1_HI_4_HI12_01]
           ,[L2300_1_HI_4_HI12_02]
           ,[L2300_1_HCP_1_HCP01]
           ,[L2300_1_HCP_1_HCP02]
           ,[L2300_1_HCP_1_HCP03]
           ,[L2300_1_HCP_1_HCP04]
           ,[L2300_1_HCP_1_HCP05]
           ,[L2300_1_HCP_1_HCP06]
           ,[L2300_1_HCP_1_HCP07]
           ,[L2300_1_HCP_1_HCP13]
           ,[L2300_1_HCP_1_HCP14]
           ,[L2300_1_HCP_1_HCP15]
           ,[L2310A_1_NM1_1_NM101]
           ,[L2310A_1_NM1_1_NM102]
           ,[L2310A_1_NM1_1_NM103]
           ,[L2310A_1_NM1_1_NM104]
           ,[L2310A_1_NM1_1_NM105]
           ,[L2310A_1_NM1_1_NM107]
           ,[L2310A_1_NM1_1_NM108]
           ,[L2310A_1_NM1_1_NM109]
           ,[L2310A_1_REF_1_REF01]
           ,[L2310A_1_REF_1_REF02]
           ,[L2310A_1_REF_2_REF01]
           ,[L2310A_1_REF_2_REF02]
           ,[L2310A_1_REF_3_REF01]
           ,[L2310A_1_REF_3_REF02]
           ,[L2310A_2_NM1_1_NM101]
           ,[L2310A_2_NM1_1_NM102]
           ,[L2310A_2_NM1_1_NM103]
           ,[L2310A_2_NM1_1_NM104]
           ,[L2310A_2_NM1_1_NM105]
           ,[L2310A_2_NM1_1_NM107]
           ,[L2310A_2_NM1_1_NM108]
           ,[L2310A_2_NM1_1_NM109]
           ,[L2310A_2_REF_1_REF01]
           ,[L2310A_2_REF_1_REF02]
           ,[L2310A_2_REF_2_REF01]
           ,[L2310A_2_REF_2_REF02]
           ,[L2310A_2_REF_3_REF01]
           ,[L2310A_2_REF_3_REF02]
           ,[L2310B_1_NM1_1_NM101]
           ,[L2310B_1_NM1_1_NM102]
           ,[L2310B_1_NM1_1_NM103]
           ,[L2310B_1_NM1_1_NM104]
           ,[L2310B_1_NM1_1_NM105]
           ,[L2310B_1_NM1_1_NM107]
           ,[L2310B_1_NM1_1_NM108]
           ,[L2310B_1_NM1_1_NM109]
           ,[L2310B_1_PRV_1_PRV01]
           ,[L2310B_1_PRV_1_PRV02]
           ,[L2310B_1_PRV_1_PRV03]
           ,[L2310B_1_REF_1_REF01]
           ,[L2310B_1_REF_1_REF02]
           ,[L2310B_1_REF_2_REF01]
           ,[L2310B_1_REF_2_REF02]
           ,[L2310B_1_REF_3_REF01]
           ,[L2310B_1_REF_3_REF02]
           ,[L2310B_1_REF_4_REF01]
           ,[L2310B_1_REF_4_REF02]
           ,[L2310C_1_NM1_1_NM101]
           ,[L2310C_1_NM1_1_NM102]
           ,[L2310C_1_NM1_1_NM103]
           ,[L2310C_1_NM1_1_NM108]
           ,[L2310C_1_NM1_1_NM109]
           ,[L2310C_1_N3_1_N301]
           ,[L2310C_1_N3_1_N302]
           ,[L2310C_1_N4_1_N401]
           ,[L2310C_1_N4_1_N402]
           ,[L2310C_1_N4_1_N403]
           ,[L2310C_1_N4_1_N404]
           ,[L2310C_1_N4_1_N407]
           ,[L2310C_1_REF_1_REF01]
           ,[L2310C_1_REF_1_REF02]
           ,[L2310C_1_REF_2_REF01]
           ,[L2310C_1_REF_2_REF02]
           ,[L2310C_1_REF_3_REF01]
           ,[L2310C_1_REF_3_REF02]
           ,[L2310C_1_PER_1_PER01]
           ,[L2310C_1_PER_1_PER02]
           ,[L2310C_1_PER_1_PER03]
           ,[L2310C_1_PER_1_PER04]
           ,[L2310C_1_PER_1_PER05]
           ,[L2310C_1_PER_1_PER06]
           ,[L2310D_1_NM1_1_NM101]
           ,[L2310D_1_NM1_1_NM102]
           ,[L2310D_1_NM1_1_NM103]
           ,[L2310D_1_NM1_1_NM104]
           ,[L2310D_1_NM1_1_NM105]
           ,[L2310D_1_NM1_1_NM107]
           ,[L2310D_1_NM1_1_NM108]
           ,[L2310D_1_NM1_1_NM109]
           ,[L2310D_1_REF_1_REF01]
           ,[L2310D_1_REF_1_REF02]
           ,[L2310D_1_REF_2_REF01]
           ,[L2310D_1_REF_2_REF02]
           ,[L2310D_1_REF_3_REF01]
           ,[L2310D_1_REF_3_REF02]
           ,[L2310D_1_REF_4_REF01]
           ,[L2310D_1_REF_4_REF02]
           ,[L2310E_1_NM1_1_NM101]
           ,[L2310E_1_NM1_1_NM102]
           ,[L2310E_1_N3_1_N301]
           ,[L2310E_1_N3_1_N302]
           ,[L2310E_1_N4_1_N401]
           ,[L2310E_1_N4_1_N402]
           ,[L2310E_1_N4_1_N403]
           ,[L2310E_1_N4_1_N404]
           ,[L2310E_1_N4_1_N407]
           ,[L2310F_1_NM1_1_NM101]
           ,[L2310F_1_NM1_1_NM102]
           ,[L2310F_1_NM1_1_NM103]
           ,[L2310F_1_N3_1_N301]
           ,[L2310F_1_N3_1_N302]
           ,[L2310F_1_N4_1_N401]
           ,[L2310F_1_N4_1_N402]
           ,[L2310F_1_N4_1_N403]
           ,[L2310F_1_N4_1_N404]
           ,[L2310F_1_N4_1_N407])
     VALUES
           (@Fileid ,
@HeaderID ,
@subscriber_patientid ,
@L2300_1_CLM_1_CLM01                 ,
@L2300_1_CLM_1_CLM02                 ,
@L2300_1_CLM_1_CLM05_1               ,
@L2300_1_CLM_1_CLM05_2               ,
@L2300_1_CLM_1_CLM05_3               ,
@L2300_1_CLM_1_CLM06                 ,
@L2300_1_CLM_1_CLM07                 ,
@L2300_1_CLM_1_CLM08                 ,
@L2300_1_CLM_1_CLM09                 ,
@L2300_1_CLM_1_CLM10                 ,
@L2300_1_CLM_1_CLM11_1               ,
@L2300_1_CLM_1_CLM11_2               ,
@L2300_1_CLM_1_CLM11_4               ,
@L2300_1_CLM_1_CLM11_5               ,
@L2300_1_CLM_1_CLM12                 ,
@L2300_1_CLM_1_CLM20                 ,
@L2300_1_DTP_1_DTP01                 ,
@L2300_1_DTP_1_DTP02                 ,
@L2300_1_DTP_1_DTP03                 ,
@L2300_1_DTP_2_DTP01                 ,
@L2300_1_DTP_2_DTP02                 ,
@L2300_1_DTP_2_DTP03                 ,
@L2300_1_DTP_3_DTP01                 ,
@L2300_1_DTP_3_DTP02                 ,
@L2300_1_DTP_3_DTP03                 ,
@L2300_1_DTP_4_DTP01                 ,
@L2300_1_DTP_4_DTP02                 ,
@L2300_1_DTP_4_DTP03                 ,
@L2300_1_DTP_5_DTP01                 ,
@L2300_1_DTP_5_DTP02                 ,
@L2300_1_DTP_5_DTP03                 ,
@L2300_1_DTP_6_DTP01                 ,
@L2300_1_DTP_6_DTP02                 ,
@L2300_1_DTP_6_DTP03                 ,
@L2300_1_DTP_7_DTP01                 ,
@L2300_1_DTP_7_DTP02                 ,
@L2300_1_DTP_7_DTP03                 ,
@L2300_1_DTP_8_DTP01                 ,
@L2300_1_DTP_8_DTP02                 ,
@L2300_1_DTP_8_DTP03                 ,
@L2300_1_DTP_9_DTP01                 ,
@L2300_1_DTP_9_DTP02                 ,
@L2300_1_DTP_9_DTP03                 ,
@L2300_1_DTP_10_DTP01                ,
@L2300_1_DTP_10_DTP02                ,
@L2300_1_DTP_10_DTP03                ,
@L2300_1_DTP_11_DTP01                ,
@L2300_1_DTP_11_DTP02                ,
@L2300_1_DTP_11_DTP03                ,
@L2300_1_DTP_12_DTP01                ,
@L2300_1_DTP_12_DTP02                ,
@L2300_1_DTP_12_DTP03                ,
@L2300_1_DTP_13_DTP01                ,
@L2300_1_DTP_13_DTP02                ,
@L2300_1_DTP_13_DTP03                ,
@L2300_1_DTP_14_DTP01                ,
@L2300_1_DTP_14_DTP02                ,
@L2300_1_DTP_14_DTP03                ,
@L2300_1_DTP_15_DTP01                ,
@L2300_1_DTP_15_DTP02                ,
@L2300_1_DTP_15_DTP03                ,
@L2300_1_DTP_16_DTP01                ,
@L2300_1_DTP_16_DTP02                ,
@L2300_1_DTP_16_DTP03                ,
@L2300_1_DTP_17_DTP01                ,
@L2300_1_DTP_17_DTP02                ,
@L2300_1_DTP_17_DTP03                ,
@L2300_1_DTP_18_DTP01                ,
@L2300_1_DTP_18_DTP02                ,
@L2300_1_DTP_18_DTP03                ,
@L2300_1_DTP_19_DTP01                ,
@L2300_1_DTP_19_DTP02                ,
@L2300_1_DTP_19_DTP03                ,
@L2300_1_PWK_1_PWK01                 ,
@L2300_1_PWK_1_PWK02                 ,
@L2300_1_PWK_1_PWK06                 ,
@L2300_1_PWK_2_PWK01                 ,
@L2300_1_PWK_2_PWK02                 ,
@L2300_1_PWK_2_PWK06                 ,
@L2300_1_PWK_3_PWK01                 ,
@L2300_1_PWK_3_PWK02                 ,
@L2300_1_PWK_3_PWK06                 ,
@L2300_1_PWK_4_PWK01                 ,
@L2300_1_PWK_4_PWK02                 ,
@L2300_1_PWK_4_PWK06                 ,
@L2300_1_PWK_5_PWK01                 ,
@L2300_1_PWK_5_PWK02                 ,
@L2300_1_PWK_5_PWK06                 ,
@L2300_1_PWK_6_PWK01                 ,
@L2300_1_PWK_6_PWK02                 ,
@L2300_1_PWK_6_PWK06                 ,
@L2300_1_PWK_7_PWK01                 ,
@L2300_1_PWK_7_PWK02                 ,
@L2300_1_PWK_7_PWK06                 ,
@L2300_1_PWK_8_PWK01                 ,
@L2300_1_PWK_8_PWK02                 ,
@L2300_1_PWK_8_PWK06                 ,
@L2300_1_PWK_9_PWK01                 ,
@L2300_1_PWK_9_PWK02                 ,
@L2300_1_PWK_9_PWK06                 ,
@L2300_1_PWK_10_PWK01                ,
@L2300_1_PWK_10_PWK02                ,
@L2300_1_PWK_10_PWK06                ,
@L2300_1_CN1_1_CN101                 ,
@L2300_1_CN1_1_CN102                 ,
@L2300_1_CN1_1_CN103                 ,
@L2300_1_CN1_1_CN104                 ,
@L2300_1_CN1_1_CN105                 ,
@L2300_1_CN1_1_CN106                 ,
@L2300_1_AMT_1_AMT01                 ,
@L2300_1_AMT_1_AMT02                 ,
@L2300_1_REF_1_REF01                 ,
@L2300_1_REF_1_REF02                 ,
@L2300_1_REF_2_REF01                 ,
@L2300_1_REF_2_REF02                 ,
@L2300_1_REF_3_REF01                 ,
@L2300_1_REF_3_REF02                 ,
@L2300_1_REF_4_REF01                 ,
@L2300_1_REF_4_REF02                 ,
@L2300_1_REF_5_REF01                 ,
@L2300_1_REF_5_REF02                 ,
@L2300_1_REF_6_REF01                 ,
@L2300_1_REF_6_REF02                 ,
@L2300_1_REF_7_REF01                 ,
@L2300_1_REF_7_REF02                 ,
@L2300_1_REF_8_REF01                 ,
@L2300_1_REF_8_REF02                 ,
@L2300_1_REF_9_REF01                 ,
@L2300_1_REF_9_REF02                 ,
@L2300_1_REF_10_REF01                ,
@L2300_1_REF_10_REF02                ,
@L2300_1_REF_11_REF01                ,
@L2300_1_REF_11_REF02                ,
@L2300_1_REF_12_REF01                ,
@L2300_1_REF_12_REF02                ,
@L2300_1_REF_13_REF01                ,
@L2300_1_REF_13_REF02                ,
@L2300_1_REF_14_REF01                ,
@L2300_1_REF_14_REF02                ,
@L2300_1_K3_1_K301                   ,
@L2300_1_K3_2_K301                   ,
@L2300_1_K3_3_K301                   ,
@L2300_1_K3_4_K301                   ,
@L2300_1_K3_5_K301                   ,
@L2300_1_K3_6_K301                   ,
@L2300_1_K3_7_K301                   ,
@L2300_1_K3_8_K301                   ,
@L2300_1_K3_9_K301                   ,
@L2300_1_K3_10_K301                  ,
@L2300_1_NTE_1_NTE01                 ,
@L2300_1_NTE_1_NTE02                 ,
@L2300_1_CR1_1_CR101                 ,
@L2300_1_CR1_1_CR102                 ,
@L2300_1_CR1_1_CR104                 ,
@L2300_1_CR1_1_CR105                 ,
@L2300_1_CR1_1_CR106                 ,
@L2300_1_CR1_1_CR109                 ,
@L2300_1_CR1_1_CR110                 ,
@L2300_1_CR2_1_CR208                 ,
@L2300_1_CR2_1_CR210                 ,
@L2300_1_CR2_1_CR211                 ,
@L2300_1_CRC_1_CRC01                 ,
@L2300_1_CRC_1_CRC02                 ,
@L2300_1_CRC_1_CRC03                 ,
@L2300_1_CRC_1_CRC04                 ,
@L2300_1_CRC_1_CRC05                 ,
@L2300_1_CRC_1_CRC06                 ,
@L2300_1_CRC_1_CRC07                 ,
@L2300_1_CRC_2_CRC01                 ,
@L2300_1_CRC_2_CRC02                 ,
@L2300_1_CRC_2_CRC03                 ,
@L2300_1_CRC_2_CRC04                 ,
@L2300_1_CRC_2_CRC05                 ,
@L2300_1_CRC_2_CRC06                 ,
@L2300_1_CRC_2_CRC07                 ,
@L2300_1_CRC_3_CRC01                 ,
@L2300_1_CRC_3_CRC02                 ,
@L2300_1_CRC_3_CRC03                 ,
@L2300_1_CRC_3_CRC04                 ,
@L2300_1_CRC_3_CRC05                 ,
@L2300_1_CRC_3_CRC06                 ,
@L2300_1_CRC_3_CRC07                 ,
@L2300_1_CRC_4_CRC01                 ,
@L2300_1_CRC_4_CRC02                 ,
@L2300_1_CRC_4_CRC03                 ,
@L2300_1_CRC_4_CRC04                 ,
@L2300_1_CRC_4_CRC05                 ,
@L2300_1_CRC_4_CRC06                 ,
@L2300_1_CRC_4_CRC07                 ,
@L2300_1_CRC_5_CRC01                 ,
@L2300_1_CRC_5_CRC02                 ,
@L2300_1_CRC_5_CRC03                 ,
@L2300_1_CRC_5_CRC04                 ,
@L2300_1_CRC_5_CRC05                 ,
@L2300_1_CRC_5_CRC06                 ,
@L2300_1_CRC_5_CRC07                 ,
@L2300_1_CRC_6_CRC01                 ,
@L2300_1_CRC_6_CRC02                 ,
@L2300_1_CRC_6_CRC03                 ,
@L2300_1_CRC_6_CRC04                 ,
@L2300_1_CRC_6_CRC05                 ,
@L2300_1_CRC_6_CRC06                 ,
@L2300_1_CRC_6_CRC07                 ,
@L2300_1_CRC_7_CRC01                 ,
@L2300_1_CRC_7_CRC02                 ,
@L2300_1_CRC_7_CRC03                 ,
@L2300_1_CRC_8_CRC01                 ,
@L2300_1_CRC_8_CRC02                 ,
@L2300_1_CRC_8_CRC03                 ,
@L2300_1_CRC_8_CRC04                 ,
@L2300_1_CRC_8_CRC05                 ,
@L2300_1_HI_1_HI01_01                ,
@L2300_1_HI_1_HI01_02                ,
@L2300_1_HI_1_HI02_01                ,
@L2300_1_HI_1_HI02_02                ,
@L2300_1_HI_1_HI03_01                ,
@L2300_1_HI_1_HI03_02                ,
@L2300_1_HI_1_HI04_01                ,
@L2300_1_HI_1_HI04_02                ,
@L2300_1_HI_1_HI05_01                ,
@L2300_1_HI_1_HI05_02                ,
@L2300_1_HI_1_HI06_01                ,
@L2300_1_HI_1_HI06_02                ,
@L2300_1_HI_1_HI07_01                ,
@L2300_1_HI_1_HI07_02                ,
@L2300_1_HI_1_HI08_01                ,
@L2300_1_HI_1_HI08_02                ,
@L2300_1_HI_1_HI09_01                ,
@L2300_1_HI_1_HI09_02                ,
@L2300_1_HI_1_HI10_01                ,
@L2300_1_HI_1_HI10_02                ,
@L2300_1_HI_1_HI11_01                ,
@L2300_1_HI_1_HI11_02                ,
@L2300_1_HI_1_HI12_01                ,
@L2300_1_HI_1_HI12_02                ,
@L2300_1_HI_2_HI01_01                ,
@L2300_1_HI_2_HI01_02                ,
@L2300_1_HI_2_HI02_01                ,
@L2300_1_HI_2_HI02_02                ,
@L2300_1_HI_2_HI03_01                ,
@L2300_1_HI_2_HI03_02                ,
@L2300_1_HI_2_HI04_01                ,
@L2300_1_HI_2_HI04_02                ,
@L2300_1_HI_2_HI05_01                ,
@L2300_1_HI_2_HI05_02                ,
@L2300_1_HI_2_HI06_01                ,
@L2300_1_HI_2_HI06_02                ,
@L2300_1_HI_2_HI07_01                ,
@L2300_1_HI_2_HI07_02                ,
@L2300_1_HI_2_HI08_01                ,
@L2300_1_HI_2_HI08_02                ,
@L2300_1_HI_2_HI09_01                ,
@L2300_1_HI_2_HI09_02                ,
@L2300_1_HI_2_HI10_01                ,
@L2300_1_HI_2_HI10_02                ,
@L2300_1_HI_2_HI11_01                ,
@L2300_1_HI_2_HI11_02                ,
@L2300_1_HI_2_HI12_01                ,
@L2300_1_HI_2_HI12_02                ,
@L2300_1_HI_3_HI01_01                ,
@L2300_1_HI_3_HI01_02                ,
@L2300_1_HI_3_HI02_01                ,
@L2300_1_HI_3_HI02_02                ,
@L2300_1_HI_3_HI03_01                ,
@L2300_1_HI_3_HI03_02                ,
@L2300_1_HI_3_HI04_01                ,
@L2300_1_HI_3_HI04_02                ,
@L2300_1_HI_3_HI05_01                ,
@L2300_1_HI_3_HI05_02                ,
@L2300_1_HI_3_HI06_01                ,
@L2300_1_HI_3_HI06_02                ,
@L2300_1_HI_3_HI07_01                ,
@L2300_1_HI_3_HI07_02                ,
@L2300_1_HI_3_HI08_01                ,
@L2300_1_HI_3_HI08_02                ,
@L2300_1_HI_3_HI09_01                ,
@L2300_1_HI_3_HI09_02                ,
@L2300_1_HI_3_HI10_01                ,
@L2300_1_HI_3_HI10_02                ,
@L2300_1_HI_3_HI11_01                ,
@L2300_1_HI_3_HI11_02                ,
@L2300_1_HI_3_HI12_01                ,
@L2300_1_HI_3_HI12_02                ,
@L2300_1_HI_4_HI01_01                ,
@L2300_1_HI_4_HI01_02                ,
@L2300_1_HI_4_HI02_01                ,
@L2300_1_HI_4_HI02_02                ,
@L2300_1_HI_4_HI03_01                ,
@L2300_1_HI_4_HI03_02                ,
@L2300_1_HI_4_HI04_01                ,
@L2300_1_HI_4_HI04_02                ,
@L2300_1_HI_4_HI05_01                ,
@L2300_1_HI_4_HI05_02                ,
@L2300_1_HI_4_HI06_01                ,
@L2300_1_HI_4_HI06_02                ,
@L2300_1_HI_4_HI07_01                ,
@L2300_1_HI_4_HI07_02                ,
@L2300_1_HI_4_HI08_01                ,
@L2300_1_HI_4_HI08_02                ,
@L2300_1_HI_4_HI09_01                ,
@L2300_1_HI_4_HI09_02                ,
@L2300_1_HI_4_HI10_01                ,
@L2300_1_HI_4_HI10_02                ,
@L2300_1_HI_4_HI11_01                ,
@L2300_1_HI_4_HI11_02                ,
@L2300_1_HI_4_HI12_01                ,
@L2300_1_HI_4_HI12_02                ,
@L2300_1_HCP_1_HCP01                 ,
@L2300_1_HCP_1_HCP02                 ,
@L2300_1_HCP_1_HCP03                 ,
@L2300_1_HCP_1_HCP04                 ,
@L2300_1_HCP_1_HCP05                 ,
@L2300_1_HCP_1_HCP06                 ,
@L2300_1_HCP_1_HCP07                 ,
@L2300_1_HCP_1_HCP13                 ,
@L2300_1_HCP_1_HCP14                 ,
@L2300_1_HCP_1_HCP15                 ,
@L2310A_1_NM1_1_NM101                ,
@L2310A_1_NM1_1_NM102                ,
@L2310A_1_NM1_1_NM103                ,
@L2310A_1_NM1_1_NM104                ,
@L2310A_1_NM1_1_NM105                ,
@L2310A_1_NM1_1_NM107                ,
@L2310A_1_NM1_1_NM108                ,
@L2310A_1_NM1_1_NM109                ,
@L2310A_1_REF_1_REF01                ,
@L2310A_1_REF_1_REF02                ,
@L2310A_1_REF_2_REF01                ,
@L2310A_1_REF_2_REF02                ,
@L2310A_1_REF_3_REF01                ,
@L2310A_1_REF_3_REF02                ,
@L2310A_2_NM1_1_NM101                ,
@L2310A_2_NM1_1_NM102                ,
@L2310A_2_NM1_1_NM103                ,
@L2310A_2_NM1_1_NM104                ,
@L2310A_2_NM1_1_NM105                ,
@L2310A_2_NM1_1_NM107                ,
@L2310A_2_NM1_1_NM108                ,
@L2310A_2_NM1_1_NM109                ,
@L2310A_2_REF_1_REF01                ,
@L2310A_2_REF_1_REF02                ,
@L2310A_2_REF_2_REF01                ,
@L2310A_2_REF_2_REF02                ,
@L2310A_2_REF_3_REF01                ,
@L2310A_2_REF_3_REF02                ,
@L2310B_1_NM1_1_NM101                ,
@L2310B_1_NM1_1_NM102                ,
@L2310B_1_NM1_1_NM103                ,
@L2310B_1_NM1_1_NM104                ,
@L2310B_1_NM1_1_NM105                ,
@L2310B_1_NM1_1_NM107                ,
@L2310B_1_NM1_1_NM108                ,
@L2310B_1_NM1_1_NM109                ,
@L2310B_1_PRV_1_PRV01                ,
@L2310B_1_PRV_1_PRV02                ,
@L2310B_1_PRV_1_PRV03                ,
@L2310B_1_REF_1_REF01                ,
@L2310B_1_REF_1_REF02                ,
@L2310B_1_REF_2_REF01                ,
@L2310B_1_REF_2_REF02                ,
@L2310B_1_REF_3_REF01                ,
@L2310B_1_REF_3_REF02                ,
@L2310B_1_REF_4_REF01                ,
@L2310B_1_REF_4_REF02                ,
@L2310C_1_NM1_1_NM101                ,
@L2310C_1_NM1_1_NM102                ,
@L2310C_1_NM1_1_NM103                ,
@L2310C_1_NM1_1_NM108                ,
@L2310C_1_NM1_1_NM109                ,
@L2310C_1_N3_1_N301                  ,
@L2310C_1_N3_1_N302                  ,
@L2310C_1_N4_1_N401                  ,
@L2310C_1_N4_1_N402                  ,
@L2310C_1_N4_1_N403                  ,
@L2310C_1_N4_1_N404                  ,
@L2310C_1_N4_1_N407                  ,
@L2310C_1_REF_1_REF01                ,
@L2310C_1_REF_1_REF02                ,
@L2310C_1_REF_2_REF01                ,
@L2310C_1_REF_2_REF02                ,
@L2310C_1_REF_3_REF01                ,
@L2310C_1_REF_3_REF02                ,
@L2310C_1_PER_1_PER01                ,
@L2310C_1_PER_1_PER02                ,
@L2310C_1_PER_1_PER03                ,
@L2310C_1_PER_1_PER04                ,
@L2310C_1_PER_1_PER05                ,
@L2310C_1_PER_1_PER06                ,
@L2310D_1_NM1_1_NM101                ,
@L2310D_1_NM1_1_NM102                ,
@L2310D_1_NM1_1_NM103                ,
@L2310D_1_NM1_1_NM104                ,
@L2310D_1_NM1_1_NM105                ,
@L2310D_1_NM1_1_NM107                ,
@L2310D_1_NM1_1_NM108                ,
@L2310D_1_NM1_1_NM109                ,
@L2310D_1_REF_1_REF01                ,
@L2310D_1_REF_1_REF02                ,
@L2310D_1_REF_2_REF01                ,
@L2310D_1_REF_2_REF02                ,
@L2310D_1_REF_3_REF01                ,
@L2310D_1_REF_3_REF02                ,
@L2310D_1_REF_4_REF01                ,
@L2310D_1_REF_4_REF02                ,
@L2310E_1_NM1_1_NM101                ,
@L2310E_1_NM1_1_NM102                ,
@L2310E_1_N3_1_N301                  ,
@L2310E_1_N3_1_N302                  ,
@L2310E_1_N4_1_N401                  ,
@L2310E_1_N4_1_N402                  ,
@L2310E_1_N4_1_N403                  ,
@L2310E_1_N4_1_N404                  ,
@L2310E_1_N4_1_N407                  ,
@L2310F_1_NM1_1_NM101                ,
@L2310F_1_NM1_1_NM102                ,
@L2310F_1_NM1_1_NM103                ,
@L2310F_1_N3_1_N301                  ,
@L2310F_1_N3_1_N302                  ,
@L2310F_1_N4_1_N401                  ,
@L2310F_1_N4_1_N402                  ,
@L2310F_1_N4_1_N403                  ,
@L2310F_1_N4_1_N404                  ,
@L2310F_1_N4_1_N407                 );
select @@identity as claimid
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertBillingprovider]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertBillingprovider](
@Fileid varchar(30),
@HeaderID varchar(30),
@L2000A_1_HL_1_HL01    varchar(12)= NULL,
@L2000A_1_HL_1_HL03    varchar(2)= NULL,
@L2000A_1_HL_1_HL04    varchar(1)= NULL,
@L2000A_1_PRV_1_PRV01  varchar(3)= NULL,
@L2000A_1_PRV_1_PRV02  varchar(3)= NULL,
@L2000A_1_PRV_1_PRV03  varchar(50)= NULL,
@L2000A_1_CUR_1_CUR01  varchar(3)= NULL,
@L2000A_1_CUR_1_CUR02  varchar(3)= NULL,
@L2010AA_1_NM1_1_NM101 varchar(3)= NULL,
@L2010AA_1_NM1_1_NM102 varchar(1)= NULL,
@L2010AA_1_NM1_1_NM103 varchar(60)= NULL,
@L2010AA_1_NM1_1_NM104 varchar(35)= NULL,
@L2010AA_1_NM1_1_NM105 varchar(25)= NULL,
@L2010AA_1_NM1_1_NM107 varchar(10)= NULL,
@L2010AA_1_NM1_1_NM108 varchar(2)= NULL,
@L2010AA_1_NM1_1_NM109 varchar(80)= NULL,
@L2010AA_1_N3_1_N301   varchar(55)= NULL,
@L2010AA_1_N3_1_N302   varchar(55)= NULL,
@L2010AA_1_N4_1_N401   varchar(30)= NULL,
@L2010AA_1_N4_1_N402   varchar(2)= NULL,
@L2010AA_1_N4_1_N403   varchar(15)= NULL,
@L2010AA_1_N4_1_N404   varchar(3)= NULL,
@L2010AA_1_N4_1_N407   varchar(3)= NULL,
@L2010AA_1_REF_1_REF01 varchar(3)= NULL,
@L2010AA_1_REF_1_REF02 varchar(50)= NULL,
@L2010AA_1_REF_2_REF01 varchar(3 )= NULL,
@L2010AA_1_REF_2_REF02 varchar(50 )= NULL,
@L2010AA_1_REF_3_REF01 varchar(3 )= NULL,
@L2010AA_1_REF_3_REF02 varchar(50)= NULL,
@L2010AA_1_REF_4_REF01 varchar(3 )= NULL,
@L2010AA_1_REF_4_REF02 varchar(50)= NULL,
@L2010AA_1_PER_1_PER01 varchar(2)= NULL,
@L2010AA_1_PER_1_PER02 varchar(60)= NULL,
@L2010AA_1_PER_1_PER03 varchar(2)= NULL,
@L2010AA_1_PER_1_PER04 varchar(256)= NULL,
@L2010AA_1_PER_1_PER05 varchar(2)= NULL,
@L2010AA_1_PER_1_PER06 varchar(256)= NULL,
@L2010AA_1_PER_1_PER07 varchar(2)= NULL,
@L2010AA_1_PER_1_PER08 varchar(256)= NULL,
@L2010AA_1_PER_2_PER01 varchar(2)= NULL,
@L2010AA_1_PER_2_PER02 varchar(60)= NULL,
@L2010AA_1_PER_2_PER03 varchar(2)= NULL,
@L2010AA_1_PER_2_PER04 varchar(256)= NULL,
@L2010AA_1_PER_2_PER05 varchar(2)= NULL,
@L2010AA_1_PER_2_PER06 varchar(256)= NULL,
@L2010AA_1_PER_2_PER07 varchar(2)= NULL,
@L2010AA_1_PER_2_PER08 varchar(256)= NULL,
@L2010AB_1_NM1_1_NM101 varchar(3)= NULL,
@L2010AB_1_NM1_1_NM102 varchar(1)= NULL,
@L2010AB_1_N3_1_N301   varchar(55)= NULL,
@L2010AB_1_N3_1_N302   varchar(55)= NULL,
@L2010AB_1_N4_1_N401   varchar(30)= NULL,
@L2010AB_1_N4_1_N402   varchar(2)= NULL,
@L2010AB_1_N4_1_N403   varchar(15)= NULL,
@L2010AB_1_N4_1_N404   varchar(3)= NULL,
@L2010AB_1_N4_1_N407   varchar(3)= NULL,
@L2010AC_1_NM1_1_NM101 varchar(3)= NULL,
@L2010AC_1_NM1_1_NM102 varchar(1)= NULL,
@L2010AC_1_NM1_1_NM103 varchar(60)= NULL,
@L2010AC_1_NM1_1_NM108 varchar(2)= NULL,
@L2010AC_1_NM1_1_NM109 varchar(80)= NULL,
@L2010AC_1_N3_1_N301   varchar(55)= NULL,
@L2010AC_1_N3_1_N302   varchar(55)= NULL,
@L2010AC_1_N4_1_N401   varchar(30)= NULL,
@L2010AC_1_N4_1_N402   varchar(2)= NULL,
@L2010AC_1_N4_1_N403   varchar(15)= NULL,
@L2010AC_1_N4_1_N404   varchar(3)= NULL,
@L2010AC_1_N4_1_N407   varchar(3)= NULL,
@L2010AC_1_REF_1_REF01 varchar(3)= NULL,
@L2010AC_1_REF_1_REF02 varchar(50)= NULL,
@L2010AC_1_REF_2_REF01 varchar(3)= NULL,
@L2010AC_1_REF_2_REF02 varchar(50)= NULL,
@L2010AC_1_REF_3_REF01 varchar(3)= NULL,
@L2010AC_1_REF_3_REF02 varchar(50)= NULL,
@L2010AC_1_REF_4_REF01 varchar(3)= NULL,
@L2010AC_1_REF_4_REF02 varchar(50)=null
)
as
begin
INSERT INTO [EDIDatabase].[dbo].[EDI_837P_BillingProvider]
           ([Fileid]
           ,[HeaderID]
           ,[L2000A_1_HL_1_HL01]
           ,[L2000A_1_HL_1_HL03]
           ,[L2000A_1_HL_1_HL04]
           ,[L2000A_1_PRV_1_PRV01]
           ,[L2000A_1_PRV_1_PRV02]
           ,[L2000A_1_PRV_1_PRV03]
           ,[L2000A_1_CUR_1_CUR01]
           ,[L2000A_1_CUR_1_CUR02]
           ,[L2010AA_1_NM1_1_NM101]
           ,[L2010AA_1_NM1_1_NM102]
           ,[L2010AA_1_NM1_1_NM103]
           ,[L2010AA_1_NM1_1_NM104]
           ,[L2010AA_1_NM1_1_NM105]
           ,[L2010AA_1_NM1_1_NM107]
           ,[L2010AA_1_NM1_1_NM108]
           ,[L2010AA_1_NM1_1_NM109]
           ,[L2010AA_1_N3_1_N301]
           ,[L2010AA_1_N3_1_N302]
           ,[L2010AA_1_N4_1_N401]
           ,[L2010AA_1_N4_1_N402]
           ,[L2010AA_1_N4_1_N403]
           ,[L2010AA_1_N4_1_N404]
           ,[L2010AA_1_N4_1_N407]
           ,[L2010AA_1_REF_1_REF01]
           ,[L2010AA_1_REF_1_REF02]
           ,[L2010AA_1_REF_2_REF01]
           ,[L2010AA_1_REF_2_REF02]
           ,[L2010AA_1_REF_3_REF01]
           ,[L2010AA_1_REF_3_REF02]
           ,[L2010AA_1_REF_4_REF01]
           ,[L2010AA_1_REF_4_REF02]
           ,[L2010AA_1_PER_1_PER01]
           ,[L2010AA_1_PER_1_PER02]
           ,[L2010AA_1_PER_1_PER03]
           ,[L2010AA_1_PER_1_PER04]
           ,[L2010AA_1_PER_1_PER05]
           ,[L2010AA_1_PER_1_PER06]
           ,[L2010AA_1_PER_1_PER07]
           ,[L2010AA_1_PER_1_PER08]
           ,[L2010AA_1_PER_2_PER01]
           ,[L2010AA_1_PER_2_PER02]
           ,[L2010AA_1_PER_2_PER03]
           ,[L2010AA_1_PER_2_PER04]
           ,[L2010AA_1_PER_2_PER05]
           ,[L2010AA_1_PER_2_PER06]
           ,[L2010AA_1_PER_2_PER07]
           ,[L2010AA_1_PER_2_PER08]
           ,[L2010AB_1_NM1_1_NM101]
           ,[L2010AB_1_NM1_1_NM102]
           ,[L2010AB_1_N3_1_N301]
           ,[L2010AB_1_N3_1_N302]
           ,[L2010AB_1_N4_1_N401]
           ,[L2010AB_1_N4_1_N402]
           ,[L2010AB_1_N4_1_N403]
           ,[L2010AB_1_N4_1_N404]
           ,[L2010AB_1_N4_1_N407]
           ,[L2010AC_1_NM1_1_NM101]
           ,[L2010AC_1_NM1_1_NM102]
           ,[L2010AC_1_NM1_1_NM103]
           ,[L2010AC_1_NM1_1_NM108]
           ,[L2010AC_1_NM1_1_NM109]
           ,[L2010AC_1_N3_1_N301]
           ,[L2010AC_1_N3_1_N302]
           ,[L2010AC_1_N4_1_N401]
           ,[L2010AC_1_N4_1_N402]
           ,[L2010AC_1_N4_1_N403]
           ,[L2010AC_1_N4_1_N404]
           ,[L2010AC_1_N4_1_N407]
           ,[L2010AC_1_REF_1_REF01]
           ,[L2010AC_1_REF_1_REF02]
           ,[L2010AC_1_REF_2_REF01]
           ,[L2010AC_1_REF_2_REF02]
           ,[L2010AC_1_REF_3_REF01]
           ,[L2010AC_1_REF_3_REF02]
           ,[L2010AC_1_REF_4_REF01]
           ,[L2010AC_1_REF_4_REF02])
     VALUES
           (@Fileid ,
@HeaderID,
@L2000A_1_HL_1_HL01    ,
@L2000A_1_HL_1_HL03    ,
@L2000A_1_HL_1_HL04    ,
@L2000A_1_PRV_1_PRV01  ,
@L2000A_1_PRV_1_PRV02  ,
@L2000A_1_PRV_1_PRV03  ,
@L2000A_1_CUR_1_CUR01  ,
@L2000A_1_CUR_1_CUR02  ,
@L2010AA_1_NM1_1_NM101 ,
@L2010AA_1_NM1_1_NM102 ,
@L2010AA_1_NM1_1_NM103 ,
@L2010AA_1_NM1_1_NM104 ,
@L2010AA_1_NM1_1_NM105 ,
@L2010AA_1_NM1_1_NM107 ,
@L2010AA_1_NM1_1_NM108 ,
@L2010AA_1_NM1_1_NM109 ,
@L2010AA_1_N3_1_N301   ,
@L2010AA_1_N3_1_N302   ,
@L2010AA_1_N4_1_N401   ,
@L2010AA_1_N4_1_N402   ,
@L2010AA_1_N4_1_N403   ,
@L2010AA_1_N4_1_N404   ,
@L2010AA_1_N4_1_N407   ,
@L2010AA_1_REF_1_REF01 ,
@L2010AA_1_REF_1_REF02 ,
@L2010AA_1_REF_2_REF01 ,
@L2010AA_1_REF_2_REF02 ,
@L2010AA_1_REF_3_REF01 ,
@L2010AA_1_REF_3_REF02 ,
@L2010AA_1_REF_4_REF01 ,
@L2010AA_1_REF_4_REF02 ,
@L2010AA_1_PER_1_PER01 ,
@L2010AA_1_PER_1_PER02 ,
@L2010AA_1_PER_1_PER03 ,
@L2010AA_1_PER_1_PER04 ,
@L2010AA_1_PER_1_PER05 ,
@L2010AA_1_PER_1_PER06 ,
@L2010AA_1_PER_1_PER07 ,
@L2010AA_1_PER_1_PER08 ,
@L2010AA_1_PER_2_PER01 ,
@L2010AA_1_PER_2_PER02 ,
@L2010AA_1_PER_2_PER03 ,
@L2010AA_1_PER_2_PER04 ,
@L2010AA_1_PER_2_PER05 ,
@L2010AA_1_PER_2_PER06 ,
@L2010AA_1_PER_2_PER07 ,
@L2010AA_1_PER_2_PER08 ,
@L2010AB_1_NM1_1_NM101 ,
@L2010AB_1_NM1_1_NM102 ,
@L2010AB_1_N3_1_N301   ,
@L2010AB_1_N3_1_N302   ,
@L2010AB_1_N4_1_N401   ,
@L2010AB_1_N4_1_N402   ,
@L2010AB_1_N4_1_N403   ,
@L2010AB_1_N4_1_N404   ,
@L2010AB_1_N4_1_N407   ,
@L2010AC_1_NM1_1_NM101 ,
@L2010AC_1_NM1_1_NM102 ,
@L2010AC_1_NM1_1_NM103 ,
@L2010AC_1_NM1_1_NM108 ,
@L2010AC_1_NM1_1_NM109 ,
@L2010AC_1_N3_1_N301   ,
@L2010AC_1_N3_1_N302   ,
@L2010AC_1_N4_1_N401   ,
@L2010AC_1_N4_1_N402   ,
@L2010AC_1_N4_1_N403   ,
@L2010AC_1_N4_1_N404   ,
@L2010AC_1_N4_1_N407   ,
@L2010AC_1_REF_1_REF01 ,
@L2010AC_1_REF_1_REF02 ,
@L2010AC_1_REF_2_REF01 ,
@L2010AC_1_REF_2_REF02 ,
@L2010AC_1_REF_3_REF01 ,
@L2010AC_1_REF_3_REF02 ,
@L2010AC_1_REF_4_REF01 ,
@L2010AC_1_REF_4_REF02 )
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertambulancepickup]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertambulancepickup](
	@claimid int=null,
	@address1 varchar(55)=null,
	@address2 varchar(55)=null,
	@city varchar(30)=null,
	@state varchar(2)=null,
	@postalcode varchar(15)=null
)
as
begin
	insert into ambulancepickup values(@claimid,@address1,@address2,@city,@state,@postalcode);
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertambulancedroplocation]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertambulancedroplocation](
	@claimid int=null,
	@organizationname varchar(60)=null,
	@organizationnpi varchar(60)=null,
	@address1 varchar(55)=null,
	@address2 varchar(55)=null,
	@city varchar(30)=null,
	@state varchar(2)=null,
	@postalcode varchar(15)=null
)
as
begin
	insert into ambulancedroplocation values(@claimid,@organizationname,@organizationnpi,@address1,@address2,@city,@state,@postalcode);
end
GO
/****** Object:  StoredProcedure [dbo].[spinertserviceline]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spinertserviceline]
@claimid int,
@Fileid [varchar](30),
@HeaderID [varchar](30),
@subscriber_patientid varchar(12),
@L2400_1_LX_1_LX01              varchar(6)= NULL,        
@L2400_1_SV1_1_SV101_01         varchar(2)= NULL,        
@L2400_1_SV1_1_SV101_02         varchar(48)= NULL,
@L2400_1_SV1_1_SV101_03         varchar(2)= NULL,
@L2400_1_SV1_1_SV101_04         varchar(2)= NULL,
@L2400_1_SV1_1_SV101_05         varchar(2)= NULL,
@L2400_1_SV1_1_SV101_06         varchar(2)= NULL,
@L2400_1_SV1_1_SV101_07         varchar(80)= NULL,
@L2400_1_SV1_1_SV102            varchar(18)= NULL,
@L2400_1_SV1_1_SV103            varchar(2)= NULL,
@L2400_1_SV1_1_SV104            varchar(15)= NULL,
@L2400_1_SV1_1_SV105            varchar(2)= NULL,
@L2400_1_SV1_1_SV107_1          varchar(2)= NULL,
@L2400_1_SV1_1_SV107_2          varchar(2)= NULL,
@L2400_1_SV1_1_SV107_3          varchar(2)= NULL,
@L2400_1_SV1_1_SV107_4          varchar(2)= NULL,
@L2400_1_SV1_1_SV109            varchar(1)= NULL,
@L2400_1_SV1_1_SV111            varchar(1)= NULL,
@L2400_1_SV1_1_SV112            varchar(1)= NULL,
@L2400_1_SV1_1_SV115            varchar(1)= NULL,
@L2400_1_SV5_1_SV501_01         varchar(2)= NULL,
@L2400_1_SV5_1_SV501_02         varchar(48)= NULL,
@L2400_1_SV5_1_SV502            varchar(2)= NULL,
@L2400_1_SV5_1_SV503            varchar(15)= NULL,
@L2400_1_SV5_1_SV504            varchar(18)= NULL,
@L2400_1_SV5_1_SV505            varchar(18)= NULL,
@L2400_1_SV5_1_SV506            varchar(1)= NULL,
@L2400_1_PWK_1_PWK01           varchar(2)= NULL,
@L2400_1_PWK_1_PWK02           varchar(2)= NULL,
@L2400_1_PWK_1_PWK05           varchar(2)= NULL,
@L2400_1_PWK_1_PWK06           varchar(80)= NULL,
@L2400_1_PWK_2_PWK01           varchar(2)= NULL,
@L2400_1_PWK_2_PWK02           varchar(2)= NULL,
@L2400_1_PWK_2_PWK05           varchar(2)= NULL,
@L2400_1_PWK_2_PWK06           varchar(80)= NULL,
@L2400_1_PWK_3_PWK01           varchar(2)= NULL,
@L2400_1_PWK_3_PWK02           varchar(2)= NULL,
@L2400_1_PWK_3_PWK05           varchar(2)= NULL,
@L2400_1_PWK_3_PWK06           varchar(80)= NULL,
@L2400_1_PWK_4_PWK01           varchar(2)= NULL,
@L2400_1_PWK_4_PWK02           varchar(2)= NULL,
@L2400_1_PWK_4_PWK05           varchar(2)= NULL,
@L2400_1_PWK_4_PWK06           varchar(80)= NULL,
@L2400_1_PWK_5_PWK01           varchar(2)= NULL,
@L2400_1_PWK_5_PWK02           varchar(2)= NULL,
@L2400_1_PWK_5_PWK05           varchar(2)= NULL,
@L2400_1_PWK_5_PWK06           varchar(80)= NULL,
@L2400_1_PWK_6_PWK01           varchar(2)= NULL,
@L2400_1_PWK_6_PWK02           varchar(2)= NULL,
@L2400_1_PWK_6_PWK05           varchar(2)= NULL,
@L2400_1_PWK_6_PWK06           varchar(80)= NULL,
@L2400_1_PWK_7_PWK01           varchar(2)= NULL,
@L2400_1_PWK_7_PWK02           varchar(2)= NULL,
@L2400_1_PWK_7_PWK05           varchar(2)= NULL,
@L2400_1_PWK_7_PWK06           varchar(80)= NULL,
@L2400_1_PWK_8_PWK01           varchar(2)= NULL,
@L2400_1_PWK_8_PWK02           varchar(2)= NULL,
@L2400_1_PWK_8_PWK05           varchar(2)= NULL,
@L2400_1_PWK_8_PWK06           varchar(80)= NULL,
@L2400_1_PWK_9_PWK01           varchar(2)= NULL,
@L2400_1_PWK_9_PWK02           varchar(2)= NULL,
@L2400_1_PWK_9_PWK05           varchar(2)= NULL,
@L2400_1_PWK_9_PWK06           varchar(80)= NULL,
@L2400_1_PWK_10_PWK01           varchar(2)= NULL,
@L2400_1_PWK_10_PWK02           varchar(2)= NULL,
@L2400_1_PWK_10_PWK05           varchar(2)= NULL,
@L2400_1_PWK_10_PWK06           varchar(80)= NULL,
@L2400_1_PWK_11_PWK01           varchar(2)= NULL,
@L2400_1_PWK_11_PWK02           varchar(2)= NULL,
@L2400_1_PWK_11_PWK05           varchar(2)= NULL,
@L2400_1_PWK_11_PWK06           varchar(80)= NULL,
@L2400_1_CR1_1_CR101            varchar(2)= NULL,
@L2400_1_CR1_1_CR102            varchar(10)= NULL,
@L2400_1_CR1_1_CR104            varchar(1)= NULL,
@L2400_1_CR1_1_CR105            varchar(2)= NULL,
@L2400_1_CR1_1_CR106            varchar(15)= NULL,
@L2400_1_CR1_1_CR109            varchar(80)= NULL,
@L2400_1_CR1_1_CR110            varchar(80)= NULL,
@L2400_1_CR3_1_CR301            varchar(1)= NULL,
@L2400_1_CR3_1_CR302            varchar(2)= NULL,
@L2400_1_CR3_1_CR303            varchar(15)= NULL,
@L2400_1_CRC_1_CRC01            varchar(2)= NULL,
@L2400_1_CRC_1_CRC02            varchar(1)= NULL,
@L2400_1_CRC_1_CRC03            varchar(3)= NULL,
@L2400_1_CRC_1_CRC04            varchar(3)= NULL,
@L2400_1_CRC_1_CRC05            varchar(3)= NULL,
@L2400_1_CRC_1_CRC06            varchar(3)= NULL,
@L2400_1_CRC_1_CRC07            varchar(3)= NULL,
@L2400_1_CRC_2_CRC01            varchar(2)= NULL,
@L2400_1_CRC_2_CRC02            varchar(1)= NULL,
@L2400_1_CRC_2_CRC03            varchar(3)= NULL,
@L2400_1_CRC_2_CRC04            varchar(3)= NULL,
@L2400_1_CRC_2_CRC05            varchar(3)= NULL,
@L2400_1_CRC_2_CRC06            varchar(3)= NULL,
@L2400_1_CRC_2_CRC07            varchar(3)= NULL,
@L2400_1_CRC_3_CRC01            varchar(2)= NULL,
@L2400_1_CRC_3_CRC02            varchar(1)= NULL,
@L2400_1_CRC_3_CRC03            varchar(3)= NULL,
@L2400_1_CRC_3_CRC04            varchar(3)= NULL,
@L2400_1_CRC_3_CRC05            varchar(3)= NULL,
@L2400_1_CRC_3_CRC06            varchar(3)= NULL,
@L2400_1_CRC_3_CRC07            varchar(3)= NULL,
@L2400_1_CRC_4_CRC01            varchar(2)= NULL,
@L2400_1_CRC_4_CRC02            varchar(1)= NULL,
@L2400_1_CRC_4_CRC03            varchar(3)= NULL,
@L2400_1_CRC_4_CRC04            varchar(3)= NULL,
@L2400_1_CRC_4_CRC05            varchar(3)= NULL,
@L2400_1_CRC_4_CRC06            varchar(3)= NULL,
@L2400_1_CRC_4_CRC07            varchar(3)= NULL,
@L2400_1_CRC_5_CRC01            varchar(2)= NULL,
@L2400_1_CRC_5_CRC02            varchar(1)= NULL,
@L2400_1_CRC_5_CRC03            varchar(3)= NULL,
@L2400_1_CRC_5_CRC04            varchar(3)= NULL,
@L2400_1_CRC_5_CRC05            varchar(3)= NULL,
@L2400_1_CRC_5_CRC06            varchar(3)= NULL,
@L2400_1_CRC_5_CRC07            varchar(3)= NULL,
@L2400_1_DTP_1_DTP01           varchar(3)= NULL,
@L2400_1_DTP_1_DTP02           varchar(3)= NULL,
@L2400_1_DTP_1_DTP03           varchar(35)= NULL,
@L2400_1_DTP_2_DTP01           varchar(3)= NULL,
@L2400_1_DTP_2_DTP02           varchar(3)= NULL,
@L2400_1_DTP_2_DTP03           varchar(35)= NULL,
@L2400_1_DTP_3_DTP01           varchar(3)= NULL,
@L2400_1_DTP_3_DTP02           varchar(3)= NULL,
@L2400_1_DTP_3_DTP03           varchar(35)= NULL,
@L2400_1_DTP_4_DTP01           varchar(3)= NULL,
@L2400_1_DTP_4_DTP02           varchar(3)= NULL,
@L2400_1_DTP_4_DTP03           varchar(35)= NULL,
@L2400_1_DTP_5_DTP01           varchar(3)= NULL,
@L2400_1_DTP_5_DTP02           varchar(3)= NULL,
@L2400_1_DTP_5_DTP03           varchar(35)= NULL,
@L2400_1_DTP_6_DTP01           varchar(3)= NULL,
@L2400_1_DTP_6_DTP02           varchar(3)= NULL,
@L2400_1_DTP_6_DTP03           varchar(35)= NULL,
@L2400_1_DTP_7_DTP01           varchar(3)= NULL,
@L2400_1_DTP_7_DTP02           varchar(3)= NULL,
@L2400_1_DTP_7_DTP03           varchar(35)= NULL,
@L2400_1_DTP_8_DTP01           varchar(3)= NULL,
@L2400_1_DTP_8_DTP02           varchar(3)= NULL,
@L2400_1_DTP_8_DTP03           varchar(35)= NULL,
@L2400_1_DTP_9_DTP01           varchar(3)= NULL,
@L2400_1_DTP_9_DTP02           varchar(3)= NULL,
@L2400_1_DTP_9_DTP03           varchar(35)= NULL,
@L2400_1_DTP_10_DTP01           varchar(3)= NULL,
@L2400_1_DTP_10_DTP02           varchar(3)= NULL,
@L2400_1_DTP_10_DTP03           varchar(35)= NULL,
@L2400_1_QTY_1_QTY01            varchar(2)= NULL,
@L2400_1_QTY_1_QTY02            varchar(15)= NULL,
@L2400_1_QTY_2_QTY01            varchar(2)= NULL,
@L2400_1_QTY_2_QTY02            varchar(15)= NULL,
@L2400_1_MEA_1_MEA01            varchar(2)= NULL,
@L2400_1_MEA_1_MEA02            varchar(3)= NULL,
@L2400_1_MEA_1_MEA03            varchar(20)= NULL,
@L2400_1_MEA_2_MEA01            varchar(2)= NULL,
@L2400_1_MEA_2_MEA02            varchar(3)= NULL,
@L2400_1_MEA_2_MEA03            varchar(20)= NULL,
@L2400_1_MEA_3_MEA01            varchar(2)= NULL,
@L2400_1_MEA_3_MEA02            varchar(3)= NULL,
@L2400_1_MEA_3_MEA03            varchar(20)= NULL,
@L2400_1_MEA_4_MEA01            varchar(2)= NULL,
@L2400_1_MEA_4_MEA02            varchar(3)= NULL,
@L2400_1_MEA_4_MEA03            varchar(20)= NULL,
@L2400_1_MEA_5_MEA01            varchar(2)= NULL,
@L2400_1_MEA_5_MEA02            varchar(3)= NULL,
@L2400_1_MEA_5_MEA03            varchar(20)= NULL,
@L2400_1_CN1_1_CN101            varchar(2)= NULL,
@L2400_1_CN1_1_CN102            varchar(18)= NULL,
@L2400_1_CN1_1_CN103            varchar(6)= NULL,
@L2400_1_CN1_1_CN104            varchar(50)= NULL,
@L2400_1_CN1_1_CN105            varchar(6)= NULL,
@L2400_1_CN1_1_CN106            varchar(30)= NULL,
@L2400_1_REF_1_REF01            varchar(3)= NULL,
@L2400_1_REF_1_REF02            varchar(50)= NULL,
@L2400_1_REF_1_REF04_1            varchar(3)= NULL,
@L2400_1_REF_1_REF04_2            varchar(50)= NULL,
@L2400_1_REF_2_REF01            varchar(3)= NULL,
@L2400_1_REF_2_REF02            varchar(50)= NULL,
@L2400_1_REF_2_REF04_1            varchar(3)= NULL,
@L2400_1_REF_2_REF04_2            varchar(50)= NULL,
@L2400_1_REF_3_REF01            varchar(3)= NULL,
@L2400_1_REF_3_REF02            varchar(50)= NULL,
@L2400_1_REF_3_REF04_1            varchar(3)= NULL,
@L2400_1_REF_3_REF04_2            varchar(50)= NULL,
@L2400_1_REF_4_REF01            varchar(3)= NULL,
@L2400_1_REF_4_REF02            varchar(50)= NULL,
@L2400_1_REF_4_REF04_1            varchar(3)= NULL,
@L2400_1_REF_4_REF04_2            varchar(50)= NULL,
@L2400_1_REF_5_REF01            varchar(3)= NULL,
@L2400_1_REF_5_REF02            varchar(50)= NULL,
@L2400_1_REF_5_REF04_1            varchar(3)= NULL,
@L2400_1_REF_5_REF04_2            varchar(50)= NULL,
@L2400_1_REF_6_REF01            varchar(3)= NULL,
@L2400_1_REF_6_REF02            varchar(50)= NULL,
@L2400_1_REF_6_REF04_1            varchar(3)= NULL,
@L2400_1_REF_6_REF04_2            varchar(50)= NULL,
@L2400_1_REF_7_REF01            varchar(3)= NULL,
@L2400_1_REF_7_REF02            varchar(50)= NULL,
@L2400_1_REF_7_REF04_1            varchar(3)= NULL,
@L2400_1_REF_7_REF04_2            varchar(50)= NULL,
@L2400_1_REF_8_REF01            varchar(3)= NULL,
@L2400_1_REF_8_REF02            varchar(50)= NULL,
@L2400_1_REF_8_REF04_1            varchar(3)= NULL,
@L2400_1_REF_8_REF04_2            varchar(50)= NULL,
@L2400_1_REF_9_REF01            varchar(3)= NULL,
@L2400_1_REF_9_REF02            varchar(50)= NULL,
@L2400_1_REF_9_REF04_1            varchar(3)= NULL,
@L2400_1_REF_9_REF04_2            varchar(50)= NULL,
@L2400_1_REF_11_REF01            varchar(3)= NULL,
@L2400_1_REF_11_REF02            varchar(50)= NULL,
@L2400_1_REF_11_REF04_1            varchar(3)= NULL,
@L2400_1_REF_11_REF04_2            varchar(50)= NULL,
@L2400_1_REF_12_REF01            varchar(3)= NULL,
@L2400_1_REF_12_REF02            varchar(50)= NULL,
@L2400_1_REF_12_REF04_1            varchar(3)= NULL,
@L2400_1_REF_12_REF04_2            varchar(50)= NULL,
@L2400_1_REF_13_REF01            varchar(3)= NULL,
@L2400_1_REF_13_REF02            varchar(50)= NULL,
@L2400_1_REF_13_REF04_1            varchar(3)= NULL,
@L2400_1_REF_13_REF04_2            varchar(50)= NULL,
@L2400_1_REF_14_REF01            varchar(3)= NULL,
@L2400_1_REF_14_REF02            varchar(50)= NULL,
@L2400_1_REF_14_REF04_1            varchar(3)= NULL,
@L2400_1_REF_14_REF04_2            varchar(50)= NULL,
@L2400_1_REF_15_REF01            varchar(3)= NULL,
@L2400_1_REF_15_REF02            varchar(50)= NULL,
@L2400_1_REF_15_REF04_1            varchar(3)= NULL,
@L2400_1_REF_15_REF04_2            varchar(50)= NULL,
@L2400_1_REF_16_REF01            varchar(3)= NULL,
@L2400_1_REF_16_REF02            varchar(50)= NULL,
@L2400_1_REF_16_REF04_1            varchar(3)= NULL,
@L2400_1_REF_16_REF04_2            varchar(50)= NULL,
@L2400_1_REF_17_REF01            varchar(3)= NULL,
@L2400_1_REF_17_REF02            varchar(50)= NULL,
@L2400_1_REF_17_REF04_1            varchar(3)= NULL,
@L2400_1_REF_17_REF04_2            varchar(50)= NULL,
@L2400_1_AMT_1_AMT01            varchar(3)= NULL,
@L2400_1_AMT_1_AMT02            varchar(18)= NULL,
@L2400_1_K3_1_K301             varchar(80)= NULL,
@L2400_1_K3_2_K301             varchar(80)= NULL,
@L2400_1_K3_3_K301             varchar(80)= NULL,
@L2400_1_K3_4_K301             varchar(80)= NULL,
@L2400_1_K3_5_K301             varchar(80)= NULL,
@L2400_1_K3_6_K301             varchar(80)= NULL,
@L2400_1_K3_7_K301             varchar(80)= NULL,
@L2400_1_K3_8_K301             varchar(80)= NULL,
@L2400_1_K3_9_K301             varchar(80)= NULL,
@L2400_1_K3_10_K301             varchar(80)= NULL,
@L2400_1_NTE_1_NTE01            varchar(3)= NULL,
@L2400_1_NTE_1_NTE02            varchar(80)= NULL,
@L2400_1_NTE_2_NTE01            varchar(3)= NULL,
@L2400_1_NTE_2_NTE02            varchar(80)= NULL,
@L2400_1_PS1_1_PS101            varchar(50)= NULL,
@L2400_1_PS1_1_PS102            varchar(18)= NULL,
@L2400_1_HCP_1_HCP01            varchar(2)= NULL,
@L2400_1_HCP_1_HCP02            varchar(18)= NULL,
@L2400_1_HCP_1_HCP03            varchar(18)= NULL,
@L2400_1_HCP_1_HCP04            varchar(50)= NULL,
@L2400_1_HCP_1_HCP05            varchar(9)= NULL,
@L2400_1_HCP_1_HCP06            varchar(50)= NULL,
@L2400_1_HCP_1_HCP07            varchar(18)= NULL,
@L2400_1_HCP_1_HCP09            varchar(2)= NULL,
@L2400_1_HCP_1_HCP10            varchar(48)= NULL,
@L2400_1_HCP_1_HCP11            varchar(2)= NULL,
@L2400_1_HCP_1_HCP12            varchar(15)= NULL,
@L2400_1_HCP_1_HCP13            varchar(2)= NULL,
@L2400_1_HCP_1_HCP14            varchar(2)= NULL,
@L2400_1_HCP_1_HCP15            varchar(2)= NULL,
@L2410_1_LIN_1_LIN01            varchar(20)= NULL,
@L2410_1_LIN_1_LIN02            varchar(2)= NULL,
@L2410_1_LIN_1_LIN03            varchar(48)= NULL,
@L2410_1_CTP_1_CTP04            varchar(15)= NULL,
@L2410_1_CTP_1_CTP05            varchar(2)= NULL,
@L2410_1_REF_1_REF01            varchar(3)= NULL,
@L2410_1_REF_1_REF02            varchar(50)= NULL,
@L2410_1_REF_2_REF01            varchar(3)= NULL,
@L2410_1_REF_2_REF02            varchar(50)= NULL,
@L2420A_1_NM1_1_NM101           varchar(3)= NULL,
@L2420A_1_NM1_1_NM102           varchar(1)= NULL,
@L2420A_1_NM1_1_NM103           varchar(60)= NULL,
@L2420A_1_NM1_1_NM104           varchar(35)= NULL,
@L2420A_1_NM1_1_NM105           varchar(25)= NULL,
@L2420A_1_NM1_1_NM107           varchar(10)= NULL,
@L2420A_1_NM1_1_NM108           varchar(2)= NULL,
@L2420A_1_NM1_1_NM109           varchar(80)= NULL,
@L2420A_1_PRV_1_PRV01           varchar(3)= NULL,
@L2420A_1_PRV_1_PRV02           varchar(3)= NULL,
@L2420A_1_PRV_1_PRV03           varchar(50)= NULL,
@L2420A_1_REF_1_REF01           varchar(3)= NULL,
@L2420A_1_REF_1_REF02           varchar(50)= NULL,
@L2420A_1_REF_1_REF04_1           varchar(3)= NULL,
@L2420A_1_REF_1_REF04_2           varchar(50)= NULL,
@L2420A_1_REF_2_REF01           varchar(3)= NULL,
@L2420A_1_REF_2_REF02           varchar(50)= NULL,
@L2420A_1_REF_2_REF04_1           varchar(3)= NULL,
@L2420A_1_REF_2_REF04_2           varchar(50)= NULL,
@L2420A_1_REF_3_REF01           varchar(3)= NULL,
@L2420A_1_REF_3_REF02           varchar(50)= NULL,
@L2420A_1_REF_3_REF04_1           varchar(3)= NULL,
@L2420A_1_REF_3_REF04_2           varchar(50)= NULL,
@L2420A_1_REF_4_REF01           varchar(3)= NULL,
@L2420A_1_REF_4_REF02           varchar(50)= NULL,
@L2420A_1_REF_4_REF04_1           varchar(3)= NULL,
@L2420A_1_REF_4_REF04_2           varchar(50)= NULL,
@L2420B_1_NM1_1_NM101           varchar(3)= NULL,
@L2420B_1_NM1_1_NM102           varchar(1)= NULL,
@L2420B_1_NM1_1_NM108           varchar(2)= NULL,
@L2420B_1_NM1_1_NM109           varchar(80)= NULL,
@L2420B_1_REF_1_REF01           varchar(3)= NULL,
@L2420B_1_REF_1_REF02           varchar(50)= NULL,
@L2420B_1_REF_1_REF04_1           varchar(3)= NULL,
@L2420B_1_REF_1_REF04_2           varchar(50)= NULL,
@L2420B_1_REF_2_REF01           varchar(3)= NULL,
@L2420B_1_REF_2_REF02           varchar(50)= NULL,
@L2420B_1_REF_2_REF04_1           varchar(3)= NULL,
@L2420B_1_REF_2_REF04_2           varchar(50)= NULL,
@L2420B_1_REF_3_REF01           varchar(3)= NULL,
@L2420B_1_REF_3_REF02           varchar(50)= NULL,
@L2420B_1_REF_3_REF04_1           varchar(3)= NULL,
@L2420B_1_REF_3_REF04_2           varchar(50)= NULL,
@L2420C_1_NM1_1_NM101           varchar(3)= NULL,
@L2420C_1_NM1_1_NM102           varchar(1)= NULL,
@L2420C_1_NM1_1_NM103           varchar(60)= NULL,
@L2420C_1_NM1_1_NM108           varchar(2)= NULL,
@L2420C_1_NM1_1_NM109           varchar(80)= NULL,
@L2420C_1_N3_1_N301             varchar(55)= NULL,
@L2420C_1_N3_1_N302             varchar(55)= NULL,
@L2420C_1_N4_1_N401             varchar(30)= NULL,
@L2420C_1_N4_1_N402             varchar(2)= NULL,
@L2420C_1_N4_1_N403             varchar(15)= NULL,
@L2420C_1_N4_1_N404             varchar(3)= NULL,
@L2420C_1_N4_1_N407             varchar(3)= NULL,
@L2420C_1_REF_1_REF01           varchar(3)= NULL,
@L2420C_1_REF_1_REF02           varchar(50)= NULL,
@L2420C_1_REF_1_REF04_1           varchar(3)= NULL,
@L2420C_1_REF_1_REF04_2           varchar(50)= NULL,
@L2420C_1_REF_2_REF01           varchar(3)= NULL,
@L2420C_1_REF_2_REF02           varchar(50)= NULL,
@L2420C_1_REF_2_REF04_1           varchar(3)= NULL,
@L2420C_1_REF_2_REF04_2           varchar(50)= NULL,
@L2420D_1_NM1_1_NM101           varchar(3)= NULL,
@L2420D_1_NM1_1_NM102           varchar(1)= NULL,
@L2420D_1_NM1_1_NM103           varchar(80)= NULL,
@L2420D_1_NM1_1_NM104           varchar(35)= NULL,
@L2420D_1_NM1_1_NM105           varchar(25)= NULL,
@L2420D_1_NM1_1_NM107           varchar(10)= NULL,
@L2420D_1_NM1_1_NM108           varchar(2)= NULL,
@L2420D_1_NM1_1_NM109           varchar(80)= NULL,
@L2420D_1_REF_1_REF01           varchar(3)= NULL,
@L2420D_1_REF_1_REF02           varchar(50)= NULL,
@L2420D_1_REF_1_REF04_1           varchar(3)= NULL,
@L2420D_1_REF_1_REF04_2           varchar(50)= NULL,
@L2420D_1_REF_2_REF01           varchar(3)= NULL,
@L2420D_1_REF_2_REF02           varchar(50)= NULL,
@L2420D_1_REF_2_REF04_1           varchar(3)= NULL,
@L2420D_1_REF_2_REF04_2           varchar(50)= NULL,
@L2420D_1_REF_3_REF01           varchar(3)= NULL,
@L2420D_1_REF_3_REF02           varchar(50)= NULL,
@L2420D_1_REF_3_REF04_1           varchar(3)= NULL,
@L2420D_1_REF_3_REF04_2           varchar(50)= NULL,
@L2420D_1_REF_4_REF01           varchar(3)= NULL,
@L2420D_1_REF_4_REF02           varchar(50)= NULL,
@L2420D_1_REF_4_REF04_1           varchar(3)= NULL,
@L2420D_1_REF_4_REF04_2           varchar(50)= NULL,
@L2420E_1_NM1_1_NM101           varchar(3)= NULL,
@L2420E_1_NM1_1_NM102           varchar(1)= NULL,
@L2420E_1_NM1_1_NM103           varchar(60)= NULL,
@L2420E_1_NM1_1_NM104           varchar(35)= NULL,
@L2420E_1_NM1_1_NM105           varchar(25)= NULL,
@L2420E_1_NM1_1_NM107           varchar(10)= NULL,
@L2420E_1_NM1_1_NM108           varchar(2)= NULL,
@L2420E_1_NM1_1_NM109           varchar(80)= NULL,
@L2420E_1_N3_1_N301             varchar(55)= NULL,
@L2420E_1_N3_1_N302             varchar(55)= NULL,
@L2420E_1_N4_1_N401             varchar(30)= NULL,
@L2420E_1_N4_1_N402             varchar(2)= NULL,
@L2420E_1_N4_1_N403             varchar(15)= NULL,
@L2420E_1_N4_1_N404             varchar(3)= NULL,
@L2420E_1_N4_1_N407             varchar(3)= NULL,
@L2420E_1_REF_1_REF01           varchar(3)= NULL,
@L2420E_1_REF_1_REF02           varchar(50)= NULL,
@L2420E_1_REF_1_REF04_1          varchar(3)= NULL,
@L2420E_1_REF_1_REF04_2          varchar(50)= NULL,
@L2420E_1_REF_2_REF01           varchar(3)= NULL,
@L2420E_1_REF_2_REF02           varchar(50)= NULL,
@L2420E_1_REF_2_REF04_1           varchar(3)= NULL,
@L2420E_1_REF_2_REF04_2           varchar(50)= NULL,
@L2420E_1_REF_3_REF01           varchar(3)= NULL,
@L2420E_1_REF_3_REF02           varchar(50)= NULL,
@L2420E_1_REF_3_REF04_1           varchar(3)= NULL,
@L2420E_1_REF_3_REF04_2           varchar(50)= NULL,
@L2420E_1_PER_1_PER01           varchar(2)= NULL,
@L2420E_1_PER_1_PER02           varchar(60)= NULL,
@L2420E_1_PER_1_PER03           varchar(2)= NULL,
@L2420E_1_PER_1_PER04           varchar(256)= NULL,
@L2420E_1_PER_1_PER05           varchar(2)= NULL,
@L2420E_1_PER_1_PER06           varchar(256)= NULL,
@L2420E_1_PER_1_PER07           varchar(2)= NULL,
@L2420E_1_PER_1_PER08           varchar(256)= NULL,
@L2420F_1_NM1_1_NM101           varchar(3)= NULL,
@L2420F_1_NM1_1_NM102           varchar(1)= NULL,
@L2420F_1_NM1_1_NM103           varchar(60)= NULL,
@L2420F_1_NM1_1_NM104           varchar(35)= NULL,
@L2420F_1_NM1_1_NM105           varchar(25)= NULL,
@L2420F_1_NM1_1_NM107           varchar(10)= NULL,
@L2420F_1_NM1_1_NM108           varchar(2)= NULL,
@L2420F_1_NM1_1_NM109           varchar(80)= NULL,
@L2420F_1_REF_1_REF01           varchar(3)= NULL,
@L2420F_1_REF_1_REF02           varchar(50)= NULL,
@L2420F_1_REF_1_REF04_1           varchar(3)= NULL,
@L2420F_1_REF_1_REF04_2           varchar(50)= NULL,
@L2420F_1_REF_2_REF01           varchar(3)= NULL,
@L2420F_1_REF_2_REF02           varchar(50)= NULL,
@L2420F_1_REF_2_REF04_1           varchar(3)= NULL,
@L2420F_1_REF_2_REF04_2           varchar(50)= NULL,
@L2420F_1_REF_3_REF01           varchar(3)= NULL,
@L2420F_1_REF_3_REF02           varchar(50)= NULL,
@L2420F_1_REF_3_REF04_1           varchar(3)= NULL,
@L2420F_1_REF_3_REF04_2           varchar(50)= NULL,
@L2420F_2_NM1_1_NM101           varchar(3)= NULL,
@L2420F_2_NM1_1_NM102           varchar(1)= NULL,
@L2420F_2_NM1_1_NM103           varchar(60)= NULL,
@L2420F_2_NM1_1_NM104           varchar(35)= NULL,
@L2420F_2_NM1_1_NM105           varchar(25)= NULL,
@L2420F_2_NM1_1_NM107           varchar(10)= NULL,
@L2420F_2_NM1_1_NM108           varchar(2)= NULL,
@L2420F_2_NM1_1_NM109           varchar(80)= NULL,
@L2420F_2_REF_1_REF01           varchar(3)= NULL,
@L2420F_2_REF_1_REF02           varchar(50)= NULL,
@L2420F_2_REF_1_REF04_1           varchar(3)= NULL,
@L2420F_2_REF_1_REF04_2           varchar(50)= NULL,
@L2420F_2_REF_2_REF01           varchar(3)= NULL,
@L2420F_2_REF_2_REF02           varchar(50)= NULL,
@L2420F_2_REF_2_REF04_1           varchar(3)= NULL,
@L2420F_2_REF_2_REF04_2           varchar(50)= NULL,
@L2420F_2_REF_3_REF01           varchar(3)= NULL,
@L2420F_2_REF_3_REF02           varchar(50)= NULL,
@L2420F_2_REF_3_REF04_1           varchar(3)= NULL,
@L2420F_2_REF_3_REF04_2           varchar(50)= NULL,
@L2420G_1_NM1_1_NM101           varchar(3)= NULL,
@L2420G_1_NM1_1_NM102           varchar(1)= NULL,
@L2420G_1_N3_1_N301             varchar(55)= NULL,
@L2420G_1_N3_1_N302             varchar(55)= NULL,
@L2420G_1_N4_1_N401             varchar(30)= NULL,
@L2420G_1_N4_1_N402             varchar(2)= NULL,
@L2420G_1_N4_1_N403             varchar(15)= NULL,
@L2420G_1_N4_1_N404             varchar(3)= NULL,
@L2420G_1_N4_1_N407             varchar(3)= NULL,
@L2420H_1_NM1_1_NM101           varchar(3)= NULL,
@L2420H_1_NM1_1_NM102           varchar(1)= NULL,
@L2420H_1_N3_1_N301             varchar(55)= NULL,
@L2420H_1_N3_1_N302             varchar(55)= NULL,
@L2420H_1_N4_1_N401             varchar(30)= NULL,
@L2420H_1_N4_1_N402             varchar(2)= NULL,
@L2420H_1_N4_1_N403             varchar(15)= NULL,
@L2420H_1_N4_1_N404             varchar(3)= NULL,
@L2420H_1_N4_1_N407             varchar(3)= NULL,
@L2430_1_SVD_1_SVD01            varchar(80)= NULL,
@L2430_1_SVD_1_SVD02            varchar(18)= NULL,
@L2430_1_SVD_1_SVD03_1          varchar(2)= NULL,
@L2430_1_SVD_1_SVD03_2          varchar(48)= NULL,
@L2430_1_SVD_1_SVD03_3          varchar(2)= NULL,
@L2430_1_SVD_1_SVD03_4          varchar(2)= NULL,
@L2430_1_SVD_1_SVD03_5          varchar(2)= NULL,
@L2430_1_SVD_1_SVD03_6          varchar(2)= NULL,
@L2430_1_SVD_1_SVD03_7          varchar(80)= NULL,
@L2430_1_SVD_1_SVD05            varchar(15)= NULL,
@L2430_1_SVD_1_SVD06            varchar(6)= NULL,
@L2430_1_CAS_1_CAS01            varchar(2)= NULL,
@L2430_1_CAS_1_CAS02            varchar(5)= NULL,
@L2430_1_CAS_1_CAS03            varchar(18)= NULL,
@L2430_1_CAS_1_CAS04            varchar(15)= NULL,
@L2430_1_CAS_1_CAS05            varchar(5)= NULL,
@L2430_1_CAS_1_CAS06            varchar(18)= NULL,
@L2430_1_CAS_1_CAS07            varchar(15)= NULL,
@L2430_1_CAS_1_CAS08            varchar(5)= NULL,
@L2430_1_CAS_1_CAS09            varchar(18)= NULL,
@L2430_1_CAS_1_CAS10            varchar(15)= NULL,
@L2430_1_CAS_1_CAS11            varchar(5)= NULL,
@L2430_1_CAS_1_CAS12            varchar(18)= NULL,
@L2430_1_CAS_1_CAS13            varchar(15)= NULL,
@L2430_1_CAS_1_CAS14            varchar(5)= NULL,
@L2430_1_CAS_1_CAS15            varchar(18)= NULL,
@L2430_1_CAS_1_CAS16            varchar(15)= NULL,
@L2430_1_CAS_1_CAS17            varchar(5)= NULL,
@L2430_1_CAS_1_CAS18            varchar(18)= NULL,
@L2430_1_CAS_1_CAS19            varchar(15)= NULL,
@L2430_1_CAS_2_CAS01            varchar(2)= NULL,
@L2430_1_CAS_2_CAS02            varchar(5)= NULL,
@L2430_1_CAS_2_CAS03            varchar(18)= NULL,
@L2430_1_CAS_2_CAS04            varchar(15)= NULL,
@L2430_1_CAS_2_CAS05            varchar(5)= NULL,
@L2430_1_CAS_2_CAS06            varchar(18)= NULL,
@L2430_1_CAS_2_CAS07            varchar(15)= NULL,
@L2430_1_CAS_2_CAS08            varchar(5)= NULL,
@L2430_1_CAS_2_CAS09            varchar(18)= NULL,
@L2430_1_CAS_2_CAS10            varchar(15)= NULL,
@L2430_1_CAS_2_CAS11            varchar(5)= NULL,
@L2430_1_CAS_2_CAS12            varchar(18)= NULL,
@L2430_1_CAS_2_CAS13            varchar(15)= NULL,
@L2430_1_CAS_2_CAS14            varchar(5)= NULL,
@L2430_1_CAS_2_CAS15            varchar(18)= NULL,
@L2430_1_CAS_2_CAS16            varchar(15)= NULL,
@L2430_1_CAS_2_CAS17            varchar(5)= NULL,
@L2430_1_CAS_2_CAS18            varchar(18)= NULL,
@L2430_1_CAS_2_CAS19            varchar(15)= NULL,
@L2430_1_CAS_3_CAS01            varchar(2)= NULL,
@L2430_1_CAS_3_CAS02            varchar(5)= NULL,
@L2430_1_CAS_3_CAS03            varchar(18)= NULL,
@L2430_1_CAS_3_CAS04            varchar(15)= NULL,
@L2430_1_CAS_3_CAS05            varchar(5)= NULL,
@L2430_1_CAS_3_CAS06            varchar(18)= NULL,
@L2430_1_CAS_3_CAS07            varchar(15)= NULL,
@L2430_1_CAS_3_CAS08            varchar(5)= NULL,
@L2430_1_CAS_3_CAS09            varchar(18)= NULL,
@L2430_1_CAS_3_CAS10            varchar(15)= NULL,
@L2430_1_CAS_3_CAS11            varchar(5)= NULL,
@L2430_1_CAS_3_CAS12            varchar(18)= NULL,
@L2430_1_CAS_3_CAS13            varchar(15)= NULL,
@L2430_1_CAS_3_CAS14            varchar(5)= NULL,
@L2430_1_CAS_3_CAS15            varchar(18)= NULL,
@L2430_1_CAS_3_CAS16            varchar(15)= NULL,
@L2430_1_CAS_3_CAS17            varchar(5)= NULL,
@L2430_1_CAS_3_CAS18            varchar(18)= NULL,
@L2430_1_CAS_3_CAS19            varchar(15)= NULL,
@L2430_1_CAS_4_CAS01            varchar(2)= NULL,
@L2430_1_CAS_4_CAS02            varchar(5)= NULL,
@L2430_1_CAS_4_CAS03            varchar(18)= NULL,
@L2430_1_CAS_4_CAS04            varchar(15)= NULL,
@L2430_1_CAS_4_CAS05            varchar(5)= NULL,
@L2430_1_CAS_4_CAS06            varchar(18)= NULL,
@L2430_1_CAS_4_CAS07            varchar(15)= NULL,
@L2430_1_CAS_4_CAS08            varchar(5)= NULL,
@L2430_1_CAS_4_CAS09            varchar(18)= NULL,
@L2430_1_CAS_4_CAS10            varchar(15)= NULL,
@L2430_1_CAS_4_CAS11            varchar(5)= NULL,
@L2430_1_CAS_4_CAS12            varchar(18)= NULL,
@L2430_1_CAS_4_CAS13            varchar(15)= NULL,
@L2430_1_CAS_4_CAS14            varchar(5)= NULL,
@L2430_1_CAS_4_CAS15            varchar(18)= NULL,
@L2430_1_CAS_4_CAS16            varchar(15)= NULL,
@L2430_1_CAS_4_CAS17            varchar(5)= NULL,
@L2430_1_CAS_4_CAS18            varchar(18)= NULL,
@L2430_1_CAS_4_CAS19            varchar(15)= NULL,
@L2430_1_CAS_5_CAS01            varchar(2)= NULL,
@L2430_1_CAS_5_CAS02            varchar(5)= NULL,
@L2430_1_CAS_5_CAS03            varchar(18)= NULL,
@L2430_1_CAS_5_CAS04            varchar(15)= NULL,
@L2430_1_CAS_5_CAS05            varchar(5)= NULL,
@L2430_1_CAS_5_CAS06            varchar(18)= NULL,
@L2430_1_CAS_5_CAS07            varchar(15)= NULL,
@L2430_1_CAS_5_CAS08            varchar(5)= NULL,
@L2430_1_CAS_5_CAS09            varchar(18)= NULL,
@L2430_1_CAS_5_CAS10            varchar(15)= NULL,
@L2430_1_CAS_5_CAS11            varchar(5)= NULL,
@L2430_1_CAS_5_CAS12            varchar(18)= NULL,
@L2430_1_CAS_5_CAS13            varchar(15)= NULL,
@L2430_1_CAS_5_CAS14            varchar(5)= NULL,
@L2430_1_CAS_5_CAS15            varchar(18)= NULL,
@L2430_1_CAS_5_CAS16            varchar(15)= NULL,
@L2430_1_CAS_5_CAS17            varchar(5)= NULL,
@L2430_1_CAS_5_CAS18            varchar(18)= NULL,
@L2430_1_CAS_5_CAS19            varchar(15)= NULL,
@L2430_1_DTP_1_DTP01            varchar(3)= NULL,
@L2430_1_DTP_1_DTP02            varchar(3)= NULL,
@L2430_1_DTP_1_DTP03            varchar(35)= NULL,
@L2430_1_AMT_1_AMT01            varchar(3)= NULL,
@L2430_1_AMT_1_AMT02            varchar(18)=NULL
as
begin
INSERT INTO [EDIDatabase].[dbo].[EDI_837P_ServiceLine]
           ([claimid]
           ,[Fileid]
           ,[HeaderID]
           ,[subscriber_patientid]
           ,[L2400_1_LX_1_LX01]
           ,[L2400_1_SV1_1_SV101_01]
           ,[L2400_1_SV1_1_SV101_02]
           ,[L2400_1_SV1_1_SV101_03]
           ,[L2400_1_SV1_1_SV101_04]
           ,[L2400_1_SV1_1_SV101_05]
           ,[L2400_1_SV1_1_SV101_06]
           ,[L2400_1_SV1_1_SV101_07]
           ,[L2400_1_SV1_1_SV102]
           ,[L2400_1_SV1_1_SV103]
           ,[L2400_1_SV1_1_SV104]
           ,[L2400_1_SV1_1_SV105]
           ,[L2400_1_SV1_1_SV107_1]
           ,[L2400_1_SV1_1_SV107_2]
           ,[L2400_1_SV1_1_SV107_3]
           ,[L2400_1_SV1_1_SV107_4]
           ,[L2400_1_SV1_1_SV109]
           ,[L2400_1_SV1_1_SV111]
           ,[L2400_1_SV1_1_SV112]
           ,[L2400_1_SV1_1_SV115]
           ,[L2400_1_SV5_1_SV501_01]
           ,[L2400_1_SV5_1_SV501_02]
           ,[L2400_1_SV5_1_SV502]
           ,[L2400_1_SV5_1_SV503]
           ,[L2400_1_SV5_1_SV504]
           ,[L2400_1_SV5_1_SV505]
           ,[L2400_1_SV5_1_SV506]
           ,[L2400_1_PWK_1_PWK01]
           ,[L2400_1_PWK_1_PWK02]
           ,[L2400_1_PWK_1_PWK05]
           ,[L2400_1_PWK_1_PWK06]
           ,[L2400_1_PWK_2_PWK01]
           ,[L2400_1_PWK_2_PWK02]
           ,[L2400_1_PWK_2_PWK05]
           ,[L2400_1_PWK_2_PWK06]
           ,[L2400_1_PWK_3_PWK01]
           ,[L2400_1_PWK_3_PWK02]
           ,[L2400_1_PWK_3_PWK05]
           ,[L2400_1_PWK_3_PWK06]
           ,[L2400_1_PWK_4_PWK01]
           ,[L2400_1_PWK_4_PWK02]
           ,[L2400_1_PWK_4_PWK05]
           ,[L2400_1_PWK_4_PWK06]
           ,[L2400_1_PWK_5_PWK01]
           ,[L2400_1_PWK_5_PWK02]
           ,[L2400_1_PWK_5_PWK05]
           ,[L2400_1_PWK_5_PWK06]
           ,[L2400_1_PWK_6_PWK01]
           ,[L2400_1_PWK_6_PWK02]
           ,[L2400_1_PWK_6_PWK05]
           ,[L2400_1_PWK_6_PWK06]
           ,[L2400_1_PWK_7_PWK01]
           ,[L2400_1_PWK_7_PWK02]
           ,[L2400_1_PWK_7_PWK05]
           ,[L2400_1_PWK_7_PWK06]
           ,[L2400_1_PWK_8_PWK01]
           ,[L2400_1_PWK_8_PWK02]
           ,[L2400_1_PWK_8_PWK05]
           ,[L2400_1_PWK_8_PWK06]
           ,[L2400_1_PWK_9_PWK01]
           ,[L2400_1_PWK_9_PWK02]
           ,[L2400_1_PWK_9_PWK05]
           ,[L2400_1_PWK_9_PWK06]
           ,[L2400_1_PWK_10_PWK01]
           ,[L2400_1_PWK_10_PWK02]
           ,[L2400_1_PWK_10_PWK05]
           ,[L2400_1_PWK_10_PWK06]
           ,[L2400_1_PWK_11_PWK01]
           ,[L2400_1_PWK_11_PWK02]
           ,[L2400_1_PWK_11_PWK05]
           ,[L2400_1_PWK_11_PWK06]
           ,[L2400_1_CR1_1_CR101]
           ,[L2400_1_CR1_1_CR102]
           ,[L2400_1_CR1_1_CR104]
           ,[L2400_1_CR1_1_CR105]
           ,[L2400_1_CR1_1_CR106]
           ,[L2400_1_CR1_1_CR109]
           ,[L2400_1_CR1_1_CR110]
           ,[L2400_1_CR3_1_CR301]
           ,[L2400_1_CR3_1_CR302]
           ,[L2400_1_CR3_1_CR303]
           ,[L2400_1_CRC_1_CRC01]
           ,[L2400_1_CRC_1_CRC02]
           ,[L2400_1_CRC_1_CRC03]
           ,[L2400_1_CRC_1_CRC04]
           ,[L2400_1_CRC_1_CRC05]
           ,[L2400_1_CRC_1_CRC06]
           ,[L2400_1_CRC_1_CRC07]
           ,[L2400_1_CRC_2_CRC01]
           ,[L2400_1_CRC_2_CRC02]
           ,[L2400_1_CRC_2_CRC03]
           ,[L2400_1_CRC_2_CRC04]
           ,[L2400_1_CRC_2_CRC05]
           ,[L2400_1_CRC_2_CRC06]
           ,[L2400_1_CRC_2_CRC07]
           ,[L2400_1_CRC_3_CRC01]
           ,[L2400_1_CRC_3_CRC02]
           ,[L2400_1_CRC_3_CRC03]
           ,[L2400_1_CRC_3_CRC04]
           ,[L2400_1_CRC_3_CRC05]
           ,[L2400_1_CRC_3_CRC06]
           ,[L2400_1_CRC_3_CRC07]
           ,[L2400_1_CRC_4_CRC01]
           ,[L2400_1_CRC_4_CRC02]
           ,[L2400_1_CRC_4_CRC03]
           ,[L2400_1_CRC_4_CRC04]
           ,[L2400_1_CRC_4_CRC05]
           ,[L2400_1_CRC_4_CRC06]
           ,[L2400_1_CRC_4_CRC07]
           ,[L2400_1_CRC_5_CRC01]
           ,[L2400_1_CRC_5_CRC02]
           ,[L2400_1_CRC_5_CRC03]
           ,[L2400_1_CRC_5_CRC04]
           ,[L2400_1_CRC_5_CRC05]
           ,[L2400_1_CRC_5_CRC06]
           ,[L2400_1_CRC_5_CRC07]
           ,[L2400_1_DTP_1_DTP01]
           ,[L2400_1_DTP_1_DTP02]
           ,[L2400_1_DTP_1_DTP03]
           ,[L2400_1_DTP_2_DTP01]
           ,[L2400_1_DTP_2_DTP02]
           ,[L2400_1_DTP_2_DTP03]
           ,[L2400_1_DTP_3_DTP01]
           ,[L2400_1_DTP_3_DTP02]
           ,[L2400_1_DTP_3_DTP03]
           ,[L2400_1_DTP_4_DTP01]
           ,[L2400_1_DTP_4_DTP02]
           ,[L2400_1_DTP_4_DTP03]
           ,[L2400_1_DTP_5_DTP01]
           ,[L2400_1_DTP_5_DTP02]
           ,[L2400_1_DTP_5_DTP03]
           ,[L2400_1_DTP_6_DTP01]
           ,[L2400_1_DTP_6_DTP02]
           ,[L2400_1_DTP_6_DTP03]
           ,[L2400_1_DTP_7_DTP01]
           ,[L2400_1_DTP_7_DTP02]
           ,[L2400_1_DTP_7_DTP03]
           ,[L2400_1_DTP_8_DTP01]
           ,[L2400_1_DTP_8_DTP02]
           ,[L2400_1_DTP_8_DTP03]
           ,[L2400_1_DTP_9_DTP01]
           ,[L2400_1_DTP_9_DTP02]
           ,[L2400_1_DTP_9_DTP03]
           ,[L2400_1_DTP_10_DTP01]
           ,[L2400_1_DTP_10_DTP02]
           ,[L2400_1_DTP_10_DTP03]
           ,[L2400_1_QTY_1_QTY01]
           ,[L2400_1_QTY_1_QTY02]
           ,[L2400_1_QTY_2_QTY01]
           ,[L2400_1_QTY_2_QTY02]
           ,[L2400_1_MEA_1_MEA01]
           ,[L2400_1_MEA_1_MEA02]
           ,[L2400_1_MEA_1_MEA03]
           ,[L2400_1_MEA_2_MEA01]
           ,[L2400_1_MEA_2_MEA02]
           ,[L2400_1_MEA_2_MEA03]
           ,[L2400_1_MEA_3_MEA01]
           ,[L2400_1_MEA_3_MEA02]
           ,[L2400_1_MEA_3_MEA03]
           ,[L2400_1_MEA_4_MEA01]
           ,[L2400_1_MEA_4_MEA02]
           ,[L2400_1_MEA_4_MEA03]
           ,[L2400_1_MEA_5_MEA01]
           ,[L2400_1_MEA_5_MEA02]
           ,[L2400_1_MEA_5_MEA03]
           ,[L2400_1_CN1_1_CN101]
           ,[L2400_1_CN1_1_CN102]
           ,[L2400_1_CN1_1_CN103]
           ,[L2400_1_CN1_1_CN104]
           ,[L2400_1_CN1_1_CN105]
           ,[L2400_1_CN1_1_CN106]
           ,[L2400_1_REF_1_REF01]
           ,[L2400_1_REF_1_REF02]
           ,[L2400_1_REF_1_REF04_1]
           ,[L2400_1_REF_1_REF04_2]
           ,[L2400_1_REF_2_REF01]
           ,[L2400_1_REF_2_REF02]
           ,[L2400_1_REF_2_REF04_1]
           ,[L2400_1_REF_2_REF04_2]
           ,[L2400_1_REF_3_REF01]
           ,[L2400_1_REF_3_REF02]
           ,[L2400_1_REF_3_REF04_1]
           ,[L2400_1_REF_3_REF04_2]
           ,[L2400_1_REF_4_REF01]
           ,[L2400_1_REF_4_REF02]
           ,[L2400_1_REF_4_REF04_1]
           ,[L2400_1_REF_4_REF04_2]
           ,[L2400_1_REF_5_REF01]
           ,[L2400_1_REF_5_REF02]
           ,[L2400_1_REF_5_REF04_1]
           ,[L2400_1_REF_5_REF04_2]
           ,[L2400_1_REF_6_REF01]
           ,[L2400_1_REF_6_REF02]
           ,[L2400_1_REF_6_REF04_1]
           ,[L2400_1_REF_6_REF04_2]
           ,[L2400_1_REF_7_REF01]
           ,[L2400_1_REF_7_REF02]
           ,[L2400_1_REF_7_REF04_1]
           ,[L2400_1_REF_7_REF04_2]
           ,[L2400_1_REF_8_REF01]
           ,[L2400_1_REF_8_REF02]
           ,[L2400_1_REF_8_REF04_1]
           ,[L2400_1_REF_8_REF04_2]
           ,[L2400_1_REF_9_REF01]
           ,[L2400_1_REF_9_REF02]
           ,[L2400_1_REF_9_REF04_1]
           ,[L2400_1_REF_9_REF04_2]
           ,[L2400_1_REF_11_REF01]
           ,[L2400_1_REF_11_REF02]
           ,[L2400_1_REF_11_REF04_1]
           ,[L2400_1_REF_11_REF04_2]
           ,[L2400_1_REF_12_REF01]
           ,[L2400_1_REF_12_REF02]
           ,[L2400_1_REF_12_REF04_1]
           ,[L2400_1_REF_12_REF04_2]
           ,[L2400_1_REF_13_REF01]
           ,[L2400_1_REF_13_REF02]
           ,[L2400_1_REF_13_REF04_1]
           ,[L2400_1_REF_13_REF04_2]
           ,[L2400_1_REF_14_REF01]
           ,[L2400_1_REF_14_REF02]
           ,[L2400_1_REF_14_REF04_1]
           ,[L2400_1_REF_14_REF04_2]
           ,[L2400_1_REF_15_REF01]
           ,[L2400_1_REF_15_REF02]
           ,[L2400_1_REF_15_REF04_1]
           ,[L2400_1_REF_15_REF04_2]
           ,[L2400_1_REF_16_REF01]
           ,[L2400_1_REF_16_REF02]
           ,[L2400_1_REF_16_REF04_1]
           ,[L2400_1_REF_16_REF04_2]
           ,[L2400_1_REF_17_REF01]
           ,[L2400_1_REF_17_REF02]
           ,[L2400_1_REF_17_REF04_1]
           ,[L2400_1_REF_17_REF04_2]
           ,[L2400_1_AMT_1_AMT01]
           ,[L2400_1_AMT_1_AMT02]
           ,[L2400_1_K3_1_K301]
           ,[L2400_1_K3_2_K301]
           ,[L2400_1_K3_3_K301]
           ,[L2400_1_K3_4_K301]
           ,[L2400_1_K3_5_K301]
           ,[L2400_1_K3_6_K301]
           ,[L2400_1_K3_7_K301]
           ,[L2400_1_K3_8_K301]
           ,[L2400_1_K3_9_K301]
           ,[L2400_1_K3_10_K301]
           ,[L2400_1_NTE_1_NTE01]
           ,[L2400_1_NTE_1_NTE02]
           ,[L2400_1_NTE_2_NTE01]
           ,[L2400_1_NTE_2_NTE02]
           ,[L2400_1_PS1_1_PS101]
           ,[L2400_1_PS1_1_PS102]
           ,[L2400_1_HCP_1_HCP01]
           ,[L2400_1_HCP_1_HCP02]
           ,[L2400_1_HCP_1_HCP03]
           ,[L2400_1_HCP_1_HCP04]
           ,[L2400_1_HCP_1_HCP05]
           ,[L2400_1_HCP_1_HCP06]
           ,[L2400_1_HCP_1_HCP07]
           ,[L2400_1_HCP_1_HCP09]
           ,[L2400_1_HCP_1_HCP10]
           ,[L2400_1_HCP_1_HCP11]
           ,[L2400_1_HCP_1_HCP12]
           ,[L2400_1_HCP_1_HCP13]
           ,[L2400_1_HCP_1_HCP14]
           ,[L2400_1_HCP_1_HCP15]
           ,[L2410_1_LIN_1_LIN01]
           ,[L2410_1_LIN_1_LIN02]
           ,[L2410_1_LIN_1_LIN03]
           ,[L2410_1_CTP_1_CTP04]
           ,[L2410_1_CTP_1_CTP05]
           ,[L2410_1_REF_1_REF01]
           ,[L2410_1_REF_1_REF02]
           ,[L2410_1_REF_2_REF01]
           ,[L2410_1_REF_2_REF02]
           ,[L2420A_1_NM1_1_NM101]
           ,[L2420A_1_NM1_1_NM102]
           ,[L2420A_1_NM1_1_NM103]
           ,[L2420A_1_NM1_1_NM104]
           ,[L2420A_1_NM1_1_NM105]
           ,[L2420A_1_NM1_1_NM107]
           ,[L2420A_1_NM1_1_NM108]
           ,[L2420A_1_NM1_1_NM109]
           ,[L2420A_1_PRV_1_PRV01]
           ,[L2420A_1_PRV_1_PRV02]
           ,[L2420A_1_PRV_1_PRV03]
           ,[L2420A_1_REF_1_REF01]
           ,[L2420A_1_REF_1_REF02]
           ,[L2420A_1_REF_1_REF04_1]
           ,[L2420A_1_REF_1_REF04_2]
           ,[L2420A_1_REF_2_REF01]
           ,[L2420A_1_REF_2_REF02]
           ,[L2420A_1_REF_2_REF04_1]
           ,[L2420A_1_REF_2_REF04_2]
           ,[L2420A_1_REF_3_REF01]
           ,[L2420A_1_REF_3_REF02]
           ,[L2420A_1_REF_3_REF04_1]
           ,[L2420A_1_REF_3_REF04_2]
           ,[L2420A_1_REF_4_REF01]
           ,[L2420A_1_REF_4_REF02]
           ,[L2420A_1_REF_4_REF04_1]
           ,[L2420A_1_REF_4_REF04_2]
           ,[L2420B_1_NM1_1_NM101]
           ,[L2420B_1_NM1_1_NM102]
           ,[L2420B_1_NM1_1_NM108]
           ,[L2420B_1_NM1_1_NM109]
           ,[L2420B_1_REF_1_REF01]
           ,[L2420B_1_REF_1_REF02]
           ,[L2420B_1_REF_1_REF04_1]
           ,[L2420B_1_REF_1_REF04_2]
           ,[L2420B_1_REF_2_REF01]
           ,[L2420B_1_REF_2_REF02]
           ,[L2420B_1_REF_2_REF04_1]
           ,[L2420B_1_REF_2_REF04_2]
           ,[L2420B_1_REF_3_REF01]
           ,[L2420B_1_REF_3_REF02]
           ,[L2420B_1_REF_3_REF04_1]
           ,[L2420B_1_REF_3_REF04_2]
           ,[L2420C_1_NM1_1_NM101]
           ,[L2420C_1_NM1_1_NM102]
           ,[L2420C_1_NM1_1_NM103]
           ,[L2420C_1_NM1_1_NM108]
           ,[L2420C_1_NM1_1_NM109]
           ,[L2420C_1_N3_1_N301]
           ,[L2420C_1_N3_1_N302]
           ,[L2420C_1_N4_1_N401]
           ,[L2420C_1_N4_1_N402]
           ,[L2420C_1_N4_1_N403]
           ,[L2420C_1_N4_1_N404]
           ,[L2420C_1_N4_1_N407]
           ,[L2420C_1_REF_1_REF01]
           ,[L2420C_1_REF_1_REF02]
           ,[L2420C_1_REF_1_REF04_1]
           ,[L2420C_1_REF_1_REF04_2]
           ,[L2420C_1_REF_2_REF01]
           ,[L2420C_1_REF_2_REF02]
           ,[L2420C_1_REF_2_REF04_1]
           ,[L2420C_1_REF_2_REF04_2]
           ,[L2420D_1_NM1_1_NM101]
           ,[L2420D_1_NM1_1_NM102]
           ,[L2420D_1_NM1_1_NM103]
           ,[L2420D_1_NM1_1_NM104]
           ,[L2420D_1_NM1_1_NM105]
           ,[L2420D_1_NM1_1_NM107]
           ,[L2420D_1_NM1_1_NM108]
           ,[L2420D_1_NM1_1_NM109]
           ,[L2420D_1_REF_1_REF01]
           ,[L2420D_1_REF_1_REF02]
           ,[L2420D_1_REF_1_REF04_1]
           ,[L2420D_1_REF_1_REF04_2]
           ,[L2420D_1_REF_2_REF01]
           ,[L2420D_1_REF_2_REF02]
           ,[L2420D_1_REF_2_REF04_1]
           ,[L2420D_1_REF_2_REF04_2]
           ,[L2420D_1_REF_3_REF01]
           ,[L2420D_1_REF_3_REF02]
           ,[L2420D_1_REF_3_REF04_1]
           ,[L2420D_1_REF_3_REF04_2]
           ,[L2420D_1_REF_4_REF01]
           ,[L2420D_1_REF_4_REF02]
           ,[L2420D_1_REF_4_REF04_1]
           ,[L2420D_1_REF_4_REF04_2]
           ,[L2420E_1_NM1_1_NM101]
           ,[L2420E_1_NM1_1_NM102]
           ,[L2420E_1_NM1_1_NM103]
           ,[L2420E_1_NM1_1_NM104]
           ,[L2420E_1_NM1_1_NM105]
           ,[L2420E_1_NM1_1_NM107]
           ,[L2420E_1_NM1_1_NM108]
           ,[L2420E_1_NM1_1_NM109]
           ,[L2420E_1_N3_1_N301]
           ,[L2420E_1_N3_1_N302]
           ,[L2420E_1_N4_1_N401]
           ,[L2420E_1_N4_1_N402]
           ,[L2420E_1_N4_1_N403]
           ,[L2420E_1_N4_1_N404]
           ,[L2420E_1_N4_1_N407]
           ,[L2420E_1_REF_1_REF01]
           ,[L2420E_1_REF_1_REF02]
           ,[L2420E_1_REF_1_REF04_1]
           ,[L2420E_1_REF_1_REF04_2]
           ,[L2420E_1_REF_2_REF01]
           ,[L2420E_1_REF_2_REF02]
           ,[L2420E_1_REF_2_REF04_1]
           ,[L2420E_1_REF_2_REF04_2]
           ,[L2420E_1_REF_3_REF01]
           ,[L2420E_1_REF_3_REF02]
           ,[L2420E_1_REF_3_REF04_1]
           ,[L2420E_1_REF_3_REF04_2]
           ,[L2420E_1_PER_1_PER01]
           ,[L2420E_1_PER_1_PER02]
           ,[L2420E_1_PER_1_PER03]
           ,[L2420E_1_PER_1_PER04]
           ,[L2420E_1_PER_1_PER05]
           ,[L2420E_1_PER_1_PER06]
           ,[L2420E_1_PER_1_PER07]
           ,[L2420E_1_PER_1_PER08]
           ,[L2420F_1_NM1_1_NM101]
           ,[L2420F_1_NM1_1_NM102]
           ,[L2420F_1_NM1_1_NM103]
           ,[L2420F_1_NM1_1_NM104]
           ,[L2420F_1_NM1_1_NM105]
           ,[L2420F_1_NM1_1_NM107]
           ,[L2420F_1_NM1_1_NM108]
           ,[L2420F_1_NM1_1_NM109]
           ,[L2420F_1_REF_1_REF01]
           ,[L2420F_1_REF_1_REF02]
           ,[L2420F_1_REF_1_REF04_1]
           ,[L2420F_1_REF_1_REF04_2]
           ,[L2420F_1_REF_2_REF01]
           ,[L2420F_1_REF_2_REF02]
           ,[L2420F_1_REF_2_REF04_1]
           ,[L2420F_1_REF_2_REF04_2]
           ,[L2420F_1_REF_3_REF01]
           ,[L2420F_1_REF_3_REF02]
           ,[L2420F_1_REF_3_REF04_1]
           ,[L2420F_1_REF_3_REF04_2]
           ,[L2420F_2_NM1_1_NM101]
           ,[L2420F_2_NM1_1_NM102]
           ,[L2420F_2_NM1_1_NM103]
           ,[L2420F_2_NM1_1_NM104]
           ,[L2420F_2_NM1_1_NM105]
           ,[L2420F_2_NM1_1_NM107]
           ,[L2420F_2_NM1_1_NM108]
           ,[L2420F_2_NM1_1_NM109]
           ,[L2420F_2_REF_1_REF01]
           ,[L2420F_2_REF_1_REF02]
           ,[L2420F_2_REF_1_REF04_1]
           ,[L2420F_2_REF_1_REF04_2]
           ,[L2420F_2_REF_2_REF01]
           ,[L2420F_2_REF_2_REF02]
           ,[L2420F_2_REF_2_REF04_1]
           ,[L2420F_2_REF_2_REF04_2]
           ,[L2420F_2_REF_3_REF01]
           ,[L2420F_2_REF_3_REF02]
           ,[L2420F_2_REF_3_REF04_1]
           ,[L2420F_2_REF_3_REF04_2]
           ,[L2420G_1_NM1_1_NM101]
           ,[L2420G_1_NM1_1_NM102]
           ,[L2420G_1_N3_1_N301]
           ,[L2420G_1_N3_1_N302]
           ,[L2420G_1_N4_1_N401]
           ,[L2420G_1_N4_1_N402]
           ,[L2420G_1_N4_1_N403]
           ,[L2420G_1_N4_1_N404]
           ,[L2420G_1_N4_1_N407]
           ,[L2420H_1_NM1_1_NM101]
           ,[L2420H_1_NM1_1_NM102]
           ,[L2420H_1_N3_1_N301]
           ,[L2420H_1_N3_1_N302]
           ,[L2420H_1_N4_1_N401]
           ,[L2420H_1_N4_1_N402]
           ,[L2420H_1_N4_1_N403]
           ,[L2420H_1_N4_1_N404]
           ,[L2420H_1_N4_1_N407]
           ,[L2430_1_SVD_1_SVD01]
           ,[L2430_1_SVD_1_SVD02]
           ,[L2430_1_SVD_1_SVD03_1]
           ,[L2430_1_SVD_1_SVD03_2]
           ,[L2430_1_SVD_1_SVD03_3]
           ,[L2430_1_SVD_1_SVD03_4]
           ,[L2430_1_SVD_1_SVD03_5]
           ,[L2430_1_SVD_1_SVD03_6]
           ,[L2430_1_SVD_1_SVD03_7]
           ,[L2430_1_SVD_1_SVD05]
           ,[L2430_1_SVD_1_SVD06]
           ,[L2430_1_CAS_1_CAS01]
           ,[L2430_1_CAS_1_CAS02]
           ,[L2430_1_CAS_1_CAS03]
           ,[L2430_1_CAS_1_CAS04]
           ,[L2430_1_CAS_1_CAS05]
           ,[L2430_1_CAS_1_CAS06]
           ,[L2430_1_CAS_1_CAS07]
           ,[L2430_1_CAS_1_CAS08]
           ,[L2430_1_CAS_1_CAS09]
           ,[L2430_1_CAS_1_CAS10]
           ,[L2430_1_CAS_1_CAS11]
           ,[L2430_1_CAS_1_CAS12]
           ,[L2430_1_CAS_1_CAS13]
           ,[L2430_1_CAS_1_CAS14]
           ,[L2430_1_CAS_1_CAS15]
           ,[L2430_1_CAS_1_CAS16]
           ,[L2430_1_CAS_1_CAS17]
           ,[L2430_1_CAS_1_CAS18]
           ,[L2430_1_CAS_1_CAS19]
           ,[L2430_1_CAS_2_CAS01]
           ,[L2430_1_CAS_2_CAS02]
           ,[L2430_1_CAS_2_CAS03]
           ,[L2430_1_CAS_2_CAS04]
           ,[L2430_1_CAS_2_CAS05]
           ,[L2430_1_CAS_2_CAS06]
           ,[L2430_1_CAS_2_CAS07]
           ,[L2430_1_CAS_2_CAS08]
           ,[L2430_1_CAS_2_CAS09]
           ,[L2430_1_CAS_2_CAS10]
           ,[L2430_1_CAS_2_CAS11]
           ,[L2430_1_CAS_2_CAS12]
           ,[L2430_1_CAS_2_CAS13]
           ,[L2430_1_CAS_2_CAS14]
           ,[L2430_1_CAS_2_CAS15]
           ,[L2430_1_CAS_2_CAS16]
           ,[L2430_1_CAS_2_CAS17]
           ,[L2430_1_CAS_2_CAS18]
           ,[L2430_1_CAS_2_CAS19]
           ,[L2430_1_CAS_3_CAS01]
           ,[L2430_1_CAS_3_CAS02]
           ,[L2430_1_CAS_3_CAS03]
           ,[L2430_1_CAS_3_CAS04]
           ,[L2430_1_CAS_3_CAS05]
           ,[L2430_1_CAS_3_CAS06]
           ,[L2430_1_CAS_3_CAS07]
           ,[L2430_1_CAS_3_CAS08]
           ,[L2430_1_CAS_3_CAS09]
           ,[L2430_1_CAS_3_CAS10]
           ,[L2430_1_CAS_3_CAS11]
           ,[L2430_1_CAS_3_CAS12]
           ,[L2430_1_CAS_3_CAS13]
           ,[L2430_1_CAS_3_CAS14]
           ,[L2430_1_CAS_3_CAS15]
           ,[L2430_1_CAS_3_CAS16]
           ,[L2430_1_CAS_3_CAS17]
           ,[L2430_1_CAS_3_CAS18]
           ,[L2430_1_CAS_3_CAS19]
           ,[L2430_1_CAS_4_CAS01]
           ,[L2430_1_CAS_4_CAS02]
           ,[L2430_1_CAS_4_CAS03]
           ,[L2430_1_CAS_4_CAS04]
           ,[L2430_1_CAS_4_CAS05]
           ,[L2430_1_CAS_4_CAS06]
           ,[L2430_1_CAS_4_CAS07]
           ,[L2430_1_CAS_4_CAS08]
           ,[L2430_1_CAS_4_CAS09]
           ,[L2430_1_CAS_4_CAS10]
           ,[L2430_1_CAS_4_CAS11]
           ,[L2430_1_CAS_4_CAS12]
           ,[L2430_1_CAS_4_CAS13]
           ,[L2430_1_CAS_4_CAS14]
           ,[L2430_1_CAS_4_CAS15]
           ,[L2430_1_CAS_4_CAS16]
           ,[L2430_1_CAS_4_CAS17]
           ,[L2430_1_CAS_4_CAS18]
           ,[L2430_1_CAS_4_CAS19]
           ,[L2430_1_CAS_5_CAS01]
           ,[L2430_1_CAS_5_CAS02]
           ,[L2430_1_CAS_5_CAS03]
           ,[L2430_1_CAS_5_CAS04]
           ,[L2430_1_CAS_5_CAS05]
           ,[L2430_1_CAS_5_CAS06]
           ,[L2430_1_CAS_5_CAS07]
           ,[L2430_1_CAS_5_CAS08]
           ,[L2430_1_CAS_5_CAS09]
           ,[L2430_1_CAS_5_CAS10]
           ,[L2430_1_CAS_5_CAS11]
           ,[L2430_1_CAS_5_CAS12]
           ,[L2430_1_CAS_5_CAS13]
           ,[L2430_1_CAS_5_CAS14]
           ,[L2430_1_CAS_5_CAS15]
           ,[L2430_1_CAS_5_CAS16]
           ,[L2430_1_CAS_5_CAS17]
           ,[L2430_1_CAS_5_CAS18]
           ,[L2430_1_CAS_5_CAS19]
           ,[L2430_1_DTP_1_DTP01]
           ,[L2430_1_DTP_1_DTP02]
           ,[L2430_1_DTP_1_DTP03]
           ,[L2430_1_AMT_1_AMT01]
           ,[L2430_1_AMT_1_AMT02])
     VALUES
           (@claimid ,
@Fileid ,
@HeaderID ,
@subscriber_patientid ,
@L2400_1_LX_1_LX01         ,       
@L2400_1_SV1_1_SV101_01    ,       
@L2400_1_SV1_1_SV101_02    ,
@L2400_1_SV1_1_SV101_03    ,
@L2400_1_SV1_1_SV101_04    ,
@L2400_1_SV1_1_SV101_05    ,
@L2400_1_SV1_1_SV101_06    ,
@L2400_1_SV1_1_SV101_07    ,
@L2400_1_SV1_1_SV102       ,
@L2400_1_SV1_1_SV103       ,
@L2400_1_SV1_1_SV104       ,
@L2400_1_SV1_1_SV105       ,
@L2400_1_SV1_1_SV107_1     ,
@L2400_1_SV1_1_SV107_2     ,
@L2400_1_SV1_1_SV107_3     ,
@L2400_1_SV1_1_SV107_4     ,
@L2400_1_SV1_1_SV109       ,
@L2400_1_SV1_1_SV111       ,
@L2400_1_SV1_1_SV112       ,
@L2400_1_SV1_1_SV115       ,
@L2400_1_SV5_1_SV501_01    ,
@L2400_1_SV5_1_SV501_02    ,
@L2400_1_SV5_1_SV502       ,
@L2400_1_SV5_1_SV503       ,
@L2400_1_SV5_1_SV504       ,
@L2400_1_SV5_1_SV505       ,
@L2400_1_SV5_1_SV506       ,
@L2400_1_PWK_1_PWK01       ,
@L2400_1_PWK_1_PWK02       ,
@L2400_1_PWK_1_PWK05       ,
@L2400_1_PWK_1_PWK06       ,
@L2400_1_PWK_2_PWK01       ,
@L2400_1_PWK_2_PWK02       ,
@L2400_1_PWK_2_PWK05       ,
@L2400_1_PWK_2_PWK06       ,
@L2400_1_PWK_3_PWK01       ,
@L2400_1_PWK_3_PWK02       ,
@L2400_1_PWK_3_PWK05       ,
@L2400_1_PWK_3_PWK06       ,
@L2400_1_PWK_4_PWK01       ,
@L2400_1_PWK_4_PWK02       ,
@L2400_1_PWK_4_PWK05       ,
@L2400_1_PWK_4_PWK06       ,
@L2400_1_PWK_5_PWK01       ,
@L2400_1_PWK_5_PWK02       ,
@L2400_1_PWK_5_PWK05       ,
@L2400_1_PWK_5_PWK06       ,
@L2400_1_PWK_6_PWK01       ,
@L2400_1_PWK_6_PWK02       ,
@L2400_1_PWK_6_PWK05       ,
@L2400_1_PWK_6_PWK06       ,
@L2400_1_PWK_7_PWK01       ,
@L2400_1_PWK_7_PWK02       ,
@L2400_1_PWK_7_PWK05       ,
@L2400_1_PWK_7_PWK06       ,
@L2400_1_PWK_8_PWK01       ,
@L2400_1_PWK_8_PWK02       ,
@L2400_1_PWK_8_PWK05       ,
@L2400_1_PWK_8_PWK06       ,
@L2400_1_PWK_9_PWK01       ,
@L2400_1_PWK_9_PWK02       ,
@L2400_1_PWK_9_PWK05       ,
@L2400_1_PWK_9_PWK06       ,
@L2400_1_PWK_10_PWK01      ,
@L2400_1_PWK_10_PWK02      ,
@L2400_1_PWK_10_PWK05      ,
@L2400_1_PWK_10_PWK06      ,
@L2400_1_PWK_11_PWK01      ,
@L2400_1_PWK_11_PWK02      ,
@L2400_1_PWK_11_PWK05      ,
@L2400_1_PWK_11_PWK06      ,
@L2400_1_CR1_1_CR101       ,
@L2400_1_CR1_1_CR102       ,
@L2400_1_CR1_1_CR104       ,
@L2400_1_CR1_1_CR105       ,
@L2400_1_CR1_1_CR106       ,
@L2400_1_CR1_1_CR109       ,
@L2400_1_CR1_1_CR110       ,
@L2400_1_CR3_1_CR301       ,
@L2400_1_CR3_1_CR302       ,
@L2400_1_CR3_1_CR303       ,
@L2400_1_CRC_1_CRC01       ,
@L2400_1_CRC_1_CRC02       ,
@L2400_1_CRC_1_CRC03       ,
@L2400_1_CRC_1_CRC04       ,
@L2400_1_CRC_1_CRC05       ,
@L2400_1_CRC_1_CRC06       ,
@L2400_1_CRC_1_CRC07       ,
@L2400_1_CRC_2_CRC01       ,
@L2400_1_CRC_2_CRC02       ,
@L2400_1_CRC_2_CRC03       ,
@L2400_1_CRC_2_CRC04       ,
@L2400_1_CRC_2_CRC05       ,
@L2400_1_CRC_2_CRC06       ,
@L2400_1_CRC_2_CRC07       ,
@L2400_1_CRC_3_CRC01       ,
@L2400_1_CRC_3_CRC02       ,
@L2400_1_CRC_3_CRC03       ,
@L2400_1_CRC_3_CRC04       ,
@L2400_1_CRC_3_CRC05       ,
@L2400_1_CRC_3_CRC06       ,
@L2400_1_CRC_3_CRC07       ,
@L2400_1_CRC_4_CRC01       ,
@L2400_1_CRC_4_CRC02       ,
@L2400_1_CRC_4_CRC03       ,
@L2400_1_CRC_4_CRC04       ,
@L2400_1_CRC_4_CRC05       ,
@L2400_1_CRC_4_CRC06       ,
@L2400_1_CRC_4_CRC07       ,
@L2400_1_CRC_5_CRC01       ,
@L2400_1_CRC_5_CRC02       ,
@L2400_1_CRC_5_CRC03       ,
@L2400_1_CRC_5_CRC04       ,
@L2400_1_CRC_5_CRC05       ,
@L2400_1_CRC_5_CRC06       ,
@L2400_1_CRC_5_CRC07       ,
@L2400_1_DTP_1_DTP01       ,
@L2400_1_DTP_1_DTP02       ,
@L2400_1_DTP_1_DTP03       ,
@L2400_1_DTP_2_DTP01       ,
@L2400_1_DTP_2_DTP02       ,
@L2400_1_DTP_2_DTP03       ,
@L2400_1_DTP_3_DTP01       ,
@L2400_1_DTP_3_DTP02       ,
@L2400_1_DTP_3_DTP03       ,
@L2400_1_DTP_4_DTP01       ,
@L2400_1_DTP_4_DTP02       ,
@L2400_1_DTP_4_DTP03       ,
@L2400_1_DTP_5_DTP01       ,
@L2400_1_DTP_5_DTP02       ,
@L2400_1_DTP_5_DTP03       ,
@L2400_1_DTP_6_DTP01       ,
@L2400_1_DTP_6_DTP02       ,
@L2400_1_DTP_6_DTP03       ,
@L2400_1_DTP_7_DTP01       ,
@L2400_1_DTP_7_DTP02       ,
@L2400_1_DTP_7_DTP03       ,
@L2400_1_DTP_8_DTP01       ,
@L2400_1_DTP_8_DTP02       ,
@L2400_1_DTP_8_DTP03       ,
@L2400_1_DTP_9_DTP01       ,
@L2400_1_DTP_9_DTP02       ,
@L2400_1_DTP_9_DTP03       ,
@L2400_1_DTP_10_DTP01      ,
@L2400_1_DTP_10_DTP02      ,
@L2400_1_DTP_10_DTP03      ,
@L2400_1_QTY_1_QTY01       ,
@L2400_1_QTY_1_QTY02       ,
@L2400_1_QTY_2_QTY01       ,
@L2400_1_QTY_2_QTY02       ,
@L2400_1_MEA_1_MEA01       ,
@L2400_1_MEA_1_MEA02       ,
@L2400_1_MEA_1_MEA03       ,
@L2400_1_MEA_2_MEA01       ,
@L2400_1_MEA_2_MEA02       ,
@L2400_1_MEA_2_MEA03       ,
@L2400_1_MEA_3_MEA01       ,
@L2400_1_MEA_3_MEA02       ,
@L2400_1_MEA_3_MEA03       ,
@L2400_1_MEA_4_MEA01       ,
@L2400_1_MEA_4_MEA02       ,
@L2400_1_MEA_4_MEA03       ,
@L2400_1_MEA_5_MEA01       ,
@L2400_1_MEA_5_MEA02       ,
@L2400_1_MEA_5_MEA03       ,
@L2400_1_CN1_1_CN101       ,
@L2400_1_CN1_1_CN102       ,
@L2400_1_CN1_1_CN103       ,
@L2400_1_CN1_1_CN104       ,
@L2400_1_CN1_1_CN105       ,
@L2400_1_CN1_1_CN106       ,
@L2400_1_REF_1_REF01       ,
@L2400_1_REF_1_REF02       ,
@L2400_1_REF_1_REF04_1     ,
@L2400_1_REF_1_REF04_2     , 
@L2400_1_REF_2_REF01       ,
@L2400_1_REF_2_REF02       ,
@L2400_1_REF_2_REF04_1     ,
@L2400_1_REF_2_REF04_2     , 
@L2400_1_REF_3_REF01       ,
@L2400_1_REF_3_REF02       ,
@L2400_1_REF_3_REF04_1     ,
@L2400_1_REF_3_REF04_2     , 
@L2400_1_REF_4_REF01       ,
@L2400_1_REF_4_REF02       ,
@L2400_1_REF_4_REF04_1     ,
@L2400_1_REF_4_REF04_2     , 
@L2400_1_REF_5_REF01       ,
@L2400_1_REF_5_REF02       ,
@L2400_1_REF_5_REF04_1     ,
@L2400_1_REF_5_REF04_2     , 
@L2400_1_REF_6_REF01       ,
@L2400_1_REF_6_REF02       ,
@L2400_1_REF_6_REF04_1     ,
@L2400_1_REF_6_REF04_2     , 
@L2400_1_REF_7_REF01       ,
@L2400_1_REF_7_REF02       ,
@L2400_1_REF_7_REF04_1     ,
@L2400_1_REF_7_REF04_2     , 
@L2400_1_REF_8_REF01       ,
@L2400_1_REF_8_REF02       ,
@L2400_1_REF_8_REF04_1     ,
@L2400_1_REF_8_REF04_2     , 
@L2400_1_REF_9_REF01       ,
@L2400_1_REF_9_REF02       ,
@L2400_1_REF_9_REF04_1     ,
@L2400_1_REF_9_REF04_2     , 
@L2400_1_REF_11_REF01      ,
@L2400_1_REF_11_REF02      ,
@L2400_1_REF_11_REF04_1    , 
@L2400_1_REF_11_REF04_2    , 
@L2400_1_REF_12_REF01      ,
@L2400_1_REF_12_REF02      ,
@L2400_1_REF_12_REF04_1    , 
@L2400_1_REF_12_REF04_2    , 
@L2400_1_REF_13_REF01      ,
@L2400_1_REF_13_REF02      ,
@L2400_1_REF_13_REF04_1    , 
@L2400_1_REF_13_REF04_2    , 
@L2400_1_REF_14_REF01      ,
@L2400_1_REF_14_REF02      ,
@L2400_1_REF_14_REF04_1    , 
@L2400_1_REF_14_REF04_2    , 
@L2400_1_REF_15_REF01      ,
@L2400_1_REF_15_REF02      ,
@L2400_1_REF_15_REF04_1    , 
@L2400_1_REF_15_REF04_2    , 
@L2400_1_REF_16_REF01      ,
@L2400_1_REF_16_REF02      ,
@L2400_1_REF_16_REF04_1    , 
@L2400_1_REF_16_REF04_2    , 
@L2400_1_REF_17_REF01      ,
@L2400_1_REF_17_REF02      ,
@L2400_1_REF_17_REF04_1    , 
@L2400_1_REF_17_REF04_2    , 
@L2400_1_AMT_1_AMT01       ,
@L2400_1_AMT_1_AMT02       ,
@L2400_1_K3_1_K301         ,
@L2400_1_K3_2_K301         ,
@L2400_1_K3_3_K301         ,
@L2400_1_K3_4_K301         ,
@L2400_1_K3_5_K301         ,
@L2400_1_K3_6_K301         ,
@L2400_1_K3_7_K301         ,
@L2400_1_K3_8_K301         ,
@L2400_1_K3_9_K301         ,
@L2400_1_K3_10_K301        ,
@L2400_1_NTE_1_NTE01       ,
@L2400_1_NTE_1_NTE02       ,
@L2400_1_NTE_2_NTE01       ,
@L2400_1_NTE_2_NTE02       ,
@L2400_1_PS1_1_PS101       ,
@L2400_1_PS1_1_PS102       ,
@L2400_1_HCP_1_HCP01       ,
@L2400_1_HCP_1_HCP02       ,
@L2400_1_HCP_1_HCP03       ,
@L2400_1_HCP_1_HCP04       ,
@L2400_1_HCP_1_HCP05       ,
@L2400_1_HCP_1_HCP06       ,
@L2400_1_HCP_1_HCP07       ,
@L2400_1_HCP_1_HCP09       ,
@L2400_1_HCP_1_HCP10       ,
@L2400_1_HCP_1_HCP11       ,
@L2400_1_HCP_1_HCP12       ,
@L2400_1_HCP_1_HCP13       ,
@L2400_1_HCP_1_HCP14       ,
@L2400_1_HCP_1_HCP15       ,
@L2410_1_LIN_1_LIN01       ,
@L2410_1_LIN_1_LIN02       ,
@L2410_1_LIN_1_LIN03       ,
@L2410_1_CTP_1_CTP04       ,
@L2410_1_CTP_1_CTP05       ,
@L2410_1_REF_1_REF01       ,
@L2410_1_REF_1_REF02       ,
@L2410_1_REF_2_REF01       ,
@L2410_1_REF_2_REF02       ,
@L2420A_1_NM1_1_NM101      ,
@L2420A_1_NM1_1_NM102      ,
@L2420A_1_NM1_1_NM103      ,
@L2420A_1_NM1_1_NM104      ,
@L2420A_1_NM1_1_NM105      ,
@L2420A_1_NM1_1_NM107      ,
@L2420A_1_NM1_1_NM108      ,
@L2420A_1_NM1_1_NM109      ,
@L2420A_1_PRV_1_PRV01      ,
@L2420A_1_PRV_1_PRV02      ,
@L2420A_1_PRV_1_PRV03      ,
@L2420A_1_REF_1_REF01      ,
@L2420A_1_REF_1_REF02      ,
@L2420A_1_REF_1_REF04_1    ,
@L2420A_1_REF_1_REF04_2    , 
@L2420A_1_REF_2_REF01      ,
@L2420A_1_REF_2_REF02      ,
@L2420A_1_REF_2_REF04_1    ,
@L2420A_1_REF_2_REF04_2    ,
@L2420A_1_REF_3_REF01      ,
@L2420A_1_REF_3_REF02      ,
@L2420A_1_REF_3_REF04_1    ,
@L2420A_1_REF_3_REF04_2    ,
@L2420A_1_REF_4_REF01      ,
@L2420A_1_REF_4_REF02      ,
@L2420A_1_REF_4_REF04_1    ,
@L2420A_1_REF_4_REF04_2    ,
@L2420B_1_NM1_1_NM101      ,
@L2420B_1_NM1_1_NM102      ,
@L2420B_1_NM1_1_NM108      ,
@L2420B_1_NM1_1_NM109      ,
@L2420B_1_REF_1_REF01      ,
@L2420B_1_REF_1_REF02      ,
@L2420B_1_REF_1_REF04_1    ,
@L2420B_1_REF_1_REF04_2    ,
@L2420B_1_REF_2_REF01      ,
@L2420B_1_REF_2_REF02      ,
@L2420B_1_REF_2_REF04_1    ,
@L2420B_1_REF_2_REF04_2    ,
@L2420B_1_REF_3_REF01      ,
@L2420B_1_REF_3_REF02      ,
@L2420B_1_REF_3_REF04_1    ,
@L2420B_1_REF_3_REF04_2    ,
@L2420C_1_NM1_1_NM101      ,
@L2420C_1_NM1_1_NM102      ,
@L2420C_1_NM1_1_NM103      ,
@L2420C_1_NM1_1_NM108      ,
@L2420C_1_NM1_1_NM109      ,
@L2420C_1_N3_1_N301        ,
@L2420C_1_N3_1_N302        ,
@L2420C_1_N4_1_N401        ,
@L2420C_1_N4_1_N402        ,
@L2420C_1_N4_1_N403        ,
@L2420C_1_N4_1_N404        ,
@L2420C_1_N4_1_N407        ,
@L2420C_1_REF_1_REF01      ,
@L2420C_1_REF_1_REF02      ,
@L2420C_1_REF_1_REF04_1    ,
@L2420C_1_REF_1_REF04_2    ,
@L2420C_1_REF_2_REF01      ,
@L2420C_1_REF_2_REF02      ,
@L2420C_1_REF_2_REF04_1    ,
@L2420C_1_REF_2_REF04_2    ,
@L2420D_1_NM1_1_NM101      ,
@L2420D_1_NM1_1_NM102      ,
@L2420D_1_NM1_1_NM103      ,
@L2420D_1_NM1_1_NM104      ,
@L2420D_1_NM1_1_NM105      ,
@L2420D_1_NM1_1_NM107      ,
@L2420D_1_NM1_1_NM108      ,
@L2420D_1_NM1_1_NM109      ,
@L2420D_1_REF_1_REF01      ,
@L2420D_1_REF_1_REF02      ,
@L2420D_1_REF_1_REF04_1    ,
@L2420D_1_REF_1_REF04_2    ,
@L2420D_1_REF_2_REF01      ,
@L2420D_1_REF_2_REF02      ,
@L2420D_1_REF_2_REF04_1    ,
@L2420D_1_REF_2_REF04_2    ,
@L2420D_1_REF_3_REF01      ,
@L2420D_1_REF_3_REF02      ,
@L2420D_1_REF_3_REF04_1    ,
@L2420D_1_REF_3_REF04_2    ,
@L2420D_1_REF_4_REF01      ,
@L2420D_1_REF_4_REF02      ,
@L2420D_1_REF_4_REF04_1    ,
@L2420D_1_REF_4_REF04_2    ,
@L2420E_1_NM1_1_NM101      ,
@L2420E_1_NM1_1_NM102      ,
@L2420E_1_NM1_1_NM103      ,
@L2420E_1_NM1_1_NM104      ,
@L2420E_1_NM1_1_NM105      ,
@L2420E_1_NM1_1_NM107      ,
@L2420E_1_NM1_1_NM108      ,
@L2420E_1_NM1_1_NM109      ,
@L2420E_1_N3_1_N301        ,
@L2420E_1_N3_1_N302        ,
@L2420E_1_N4_1_N401        ,
@L2420E_1_N4_1_N402        ,
@L2420E_1_N4_1_N403        ,
@L2420E_1_N4_1_N404        ,
@L2420E_1_N4_1_N407        ,
@L2420E_1_REF_1_REF01      ,
@L2420E_1_REF_1_REF02      ,
@L2420E_1_REF_1_REF04_1    ,
@L2420E_1_REF_1_REF04_2    ,
@L2420E_1_REF_2_REF01      ,
@L2420E_1_REF_2_REF02      ,
@L2420E_1_REF_2_REF04_1    ,
@L2420E_1_REF_2_REF04_2    ,
@L2420E_1_REF_3_REF01      ,
@L2420E_1_REF_3_REF02      ,
@L2420E_1_REF_3_REF04_1    ,
@L2420E_1_REF_3_REF04_2    ,
@L2420E_1_PER_1_PER01      ,
@L2420E_1_PER_1_PER02      ,
@L2420E_1_PER_1_PER03      ,
@L2420E_1_PER_1_PER04      ,
@L2420E_1_PER_1_PER05      ,
@L2420E_1_PER_1_PER06      ,
@L2420E_1_PER_1_PER07      ,
@L2420E_1_PER_1_PER08      ,
@L2420F_1_NM1_1_NM101      ,
@L2420F_1_NM1_1_NM102      ,
@L2420F_1_NM1_1_NM103      ,
@L2420F_1_NM1_1_NM104      ,
@L2420F_1_NM1_1_NM105      ,
@L2420F_1_NM1_1_NM107      ,
@L2420F_1_NM1_1_NM108      ,
@L2420F_1_NM1_1_NM109      ,
@L2420F_1_REF_1_REF01      ,
@L2420F_1_REF_1_REF02      ,
@L2420F_1_REF_1_REF04_1    ,
@L2420F_1_REF_1_REF04_2    ,
@L2420F_1_REF_2_REF01      ,
@L2420F_1_REF_2_REF02      ,
@L2420F_1_REF_2_REF04_1    ,
@L2420F_1_REF_2_REF04_2    ,
@L2420F_1_REF_3_REF01      ,
@L2420F_1_REF_3_REF02      ,
@L2420F_1_REF_3_REF04_1    ,
@L2420F_1_REF_3_REF04_2    ,
@L2420F_2_NM1_1_NM101      ,
@L2420F_2_NM1_1_NM102      ,
@L2420F_2_NM1_1_NM103      ,
@L2420F_2_NM1_1_NM104      ,
@L2420F_2_NM1_1_NM105      ,
@L2420F_2_NM1_1_NM107      ,
@L2420F_2_NM1_1_NM108      ,
@L2420F_2_NM1_1_NM109      ,
@L2420F_2_REF_1_REF01      ,
@L2420F_2_REF_1_REF02      ,
@L2420F_2_REF_1_REF04_1    ,
@L2420F_2_REF_1_REF04_2    ,
@L2420F_2_REF_2_REF01      ,
@L2420F_2_REF_2_REF02      ,
@L2420F_2_REF_2_REF04_1    ,
@L2420F_2_REF_2_REF04_2    ,
@L2420F_2_REF_3_REF01      ,
@L2420F_2_REF_3_REF02      ,
@L2420F_2_REF_3_REF04_1    ,
@L2420F_2_REF_3_REF04_2    ,
@L2420G_1_NM1_1_NM101      ,
@L2420G_1_NM1_1_NM102      ,
@L2420G_1_N3_1_N301        ,
@L2420G_1_N3_1_N302        ,
@L2420G_1_N4_1_N401        ,
@L2420G_1_N4_1_N402        ,
@L2420G_1_N4_1_N403        ,
@L2420G_1_N4_1_N404        ,
@L2420G_1_N4_1_N407        ,
@L2420H_1_NM1_1_NM101      ,
@L2420H_1_NM1_1_NM102      ,
@L2420H_1_N3_1_N301        ,
@L2420H_1_N3_1_N302        ,
@L2420H_1_N4_1_N401        ,
@L2420H_1_N4_1_N402        ,
@L2420H_1_N4_1_N403        ,
@L2420H_1_N4_1_N404        ,
@L2420H_1_N4_1_N407        ,
@L2430_1_SVD_1_SVD01       ,
@L2430_1_SVD_1_SVD02       ,
@L2430_1_SVD_1_SVD03_1     ,
@L2430_1_SVD_1_SVD03_2     ,
@L2430_1_SVD_1_SVD03_3     ,
@L2430_1_SVD_1_SVD03_4     ,
@L2430_1_SVD_1_SVD03_5     ,
@L2430_1_SVD_1_SVD03_6     ,
@L2430_1_SVD_1_SVD03_7     ,
@L2430_1_SVD_1_SVD05       ,
@L2430_1_SVD_1_SVD06       ,
@L2430_1_CAS_1_CAS01       ,
@L2430_1_CAS_1_CAS02       ,
@L2430_1_CAS_1_CAS03       ,
@L2430_1_CAS_1_CAS04       ,
@L2430_1_CAS_1_CAS05       ,
@L2430_1_CAS_1_CAS06       ,
@L2430_1_CAS_1_CAS07       ,
@L2430_1_CAS_1_CAS08       ,
@L2430_1_CAS_1_CAS09       ,
@L2430_1_CAS_1_CAS10       ,
@L2430_1_CAS_1_CAS11       ,
@L2430_1_CAS_1_CAS12       ,
@L2430_1_CAS_1_CAS13       ,
@L2430_1_CAS_1_CAS14       ,
@L2430_1_CAS_1_CAS15       ,
@L2430_1_CAS_1_CAS16       ,
@L2430_1_CAS_1_CAS17       ,
@L2430_1_CAS_1_CAS18       ,
@L2430_1_CAS_1_CAS19       ,
@L2430_1_CAS_2_CAS01       ,
@L2430_1_CAS_2_CAS02       ,
@L2430_1_CAS_2_CAS03       ,
@L2430_1_CAS_2_CAS04       ,
@L2430_1_CAS_2_CAS05       ,
@L2430_1_CAS_2_CAS06       ,
@L2430_1_CAS_2_CAS07       ,
@L2430_1_CAS_2_CAS08       ,
@L2430_1_CAS_2_CAS09       ,
@L2430_1_CAS_2_CAS10       ,
@L2430_1_CAS_2_CAS11       ,
@L2430_1_CAS_2_CAS12       ,
@L2430_1_CAS_2_CAS13       ,
@L2430_1_CAS_2_CAS14       ,
@L2430_1_CAS_2_CAS15       ,
@L2430_1_CAS_2_CAS16       ,
@L2430_1_CAS_2_CAS17       ,
@L2430_1_CAS_2_CAS18       ,
@L2430_1_CAS_2_CAS19       ,
@L2430_1_CAS_3_CAS01       ,
@L2430_1_CAS_3_CAS02       ,
@L2430_1_CAS_3_CAS03       ,
@L2430_1_CAS_3_CAS04       ,
@L2430_1_CAS_3_CAS05       ,
@L2430_1_CAS_3_CAS06       ,
@L2430_1_CAS_3_CAS07       ,
@L2430_1_CAS_3_CAS08       ,
@L2430_1_CAS_3_CAS09       ,
@L2430_1_CAS_3_CAS10       ,
@L2430_1_CAS_3_CAS11       ,
@L2430_1_CAS_3_CAS12       ,
@L2430_1_CAS_3_CAS13       ,
@L2430_1_CAS_3_CAS14       ,
@L2430_1_CAS_3_CAS15       ,
@L2430_1_CAS_3_CAS16       ,
@L2430_1_CAS_3_CAS17       ,
@L2430_1_CAS_3_CAS18       ,
@L2430_1_CAS_3_CAS19       ,
@L2430_1_CAS_4_CAS01       ,
@L2430_1_CAS_4_CAS02       ,
@L2430_1_CAS_4_CAS03       ,
@L2430_1_CAS_4_CAS04       ,
@L2430_1_CAS_4_CAS05       ,
@L2430_1_CAS_4_CAS06       ,
@L2430_1_CAS_4_CAS07       ,
@L2430_1_CAS_4_CAS08       ,
@L2430_1_CAS_4_CAS09       ,
@L2430_1_CAS_4_CAS10       ,
@L2430_1_CAS_4_CAS11       ,
@L2430_1_CAS_4_CAS12       ,
@L2430_1_CAS_4_CAS13       ,
@L2430_1_CAS_4_CAS14       ,
@L2430_1_CAS_4_CAS15       ,
@L2430_1_CAS_4_CAS16       ,
@L2430_1_CAS_4_CAS17       ,
@L2430_1_CAS_4_CAS18       ,
@L2430_1_CAS_4_CAS19       ,
@L2430_1_CAS_5_CAS01       ,
@L2430_1_CAS_5_CAS02       ,
@L2430_1_CAS_5_CAS03       ,
@L2430_1_CAS_5_CAS04       ,
@L2430_1_CAS_5_CAS05       ,
@L2430_1_CAS_5_CAS06       ,
@L2430_1_CAS_5_CAS07       ,
@L2430_1_CAS_5_CAS08       ,
@L2430_1_CAS_5_CAS09       ,
@L2430_1_CAS_5_CAS10       ,
@L2430_1_CAS_5_CAS11       ,
@L2430_1_CAS_5_CAS12       ,
@L2430_1_CAS_5_CAS13       ,
@L2430_1_CAS_5_CAS14       ,
@L2430_1_CAS_5_CAS15       ,
@L2430_1_CAS_5_CAS16       ,
@L2430_1_CAS_5_CAS17       ,
@L2430_1_CAS_5_CAS18       ,
@L2430_1_CAS_5_CAS19       ,
@L2430_1_DTP_1_DTP01       ,
@L2430_1_DTP_1_DTP02       ,
@L2430_1_DTP_1_DTP03       ,
@L2430_1_AMT_1_AMT01       ,
@L2430_1_AMT_1_AMT02       )
end
GO
/****** Object:  StoredProcedure [dbo].[spgetfileid]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spgetfileid](
	@filename varchar(100)
)
as
begin
	insert into file837table values(@filename);
	select @@IDENTITY as fileid
end
GO
/****** Object:  StoredProcedure [dbo].[spgetclaim]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spgetclaim]
as
begin
select c.Fileid,c.claimid,s.L2010BA_1_NM1_1_NM109,s.L2010BA_1_NM1_1_NM104,s.L2010BA_1_NM1_1_NM103,s.L2010BA_1_DMG_1_DMG02,c.L2310B_1_NM1_1_NM104,c.L2310B_1_NM1_1_NM103,c.L2300_1_CLM_1_CLM02 
from EDI_837P_claim c
left join EDI_837P_Patient p on c.subscriber_patientid=p.L2000C_1_HL_1_HL01 and c.Fileid=p.Fileid and c.HeaderId=p.HeaderID
left join EDI_837P_subscriber s on c.Fileid=s.Fileid and c.HeaderId=s.HeaderID and (c.subscriber_patientid=s.L2000B_1_HL_1_HL01 or p.L2000C_1_HL_1_HL02=s.L2000B_1_HL_1_HL01)
order by c.claimid
end
GO
/****** Object:  StoredProcedure [dbo].[spgetallpcps]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgetallpcps]
@memberid varchar(100),
@hp varchar(100)
as
begin
	 select pcpid,p.lastName+' '+p.firstName as [pcpName],MaintReason,organization,mp.fromdate,mp.todate from MemberPCPtb mp join Members m on m.id=mp.Member_Key_ID join Provider p on p.providerID=mp.pcpid where m.memberID=@memberid and m.HealthPlanCode=@hp
end
GO
/****** Object:  StoredProcedure [dbo].[spgetallhps]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgetallhps]
@memberid varchar(100),
@hp varchar(100)
as
begin
	 select BenefitCode,fromdate,todate,EmpGrp,MaintReason from MembersHealthPlantb mp join Members m on m.id=mp.Member_Key_ID where m.memberID=@memberid and m.HealthPlanCode=@hp
end
GO
/****** Object:  StoredProcedure [dbo].[spget837list]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spget837list] @path nvarchar(1000)
as 
begin
	create table #ediColTable(
			col varchar(max)
		) 
	declare @sqlscript varchar(max)='bulk insert #ediColTable from '''+@path+''' with (rowterminator=''~'')';
	exec(@sqlscript);
create table #ediTable(
		id int identity(1,1) primary key,
		[segid] nvarchar(max),
		seg1 nvarchar(max),
		seg2 nvarchar(max),
		seg3 nvarchar(max),
		seg4 nvarchar(max),
		seg5 nvarchar(max),
		seg6 nvarchar(max),
		seg7 nvarchar(max),
		seg8 nvarchar(max),
		seg9 nvarchar(max),
		seg10 nvarchar(max),
		seg11 nvarchar(max),
		seg12 nvarchar(max),
		seg13 nvarchar(max),
		seg14 nvarchar(max),
		seg15 nvarchar(max),
		seg16 nvarchar(max),
		seg17 nvarchar(max),
		seg18 nvarchar(max),
		seg19 nvarchar(max)
		)
		
	declare @col varchar(max);
	declare c cursor for
	select col from #ediColTable;
	open c;
	fetch next from c into @col;
	while(@@FETCH_STATUS=0)
	begin
		declare c1 cursor for
		select value from string_split(@col,'*');
		declare @column nvarchar(max);
		open c1;
		fetch next from c1 into @column;
		insert into #ediTable(segid) values(@column);
		declare @id int=1;
		declare @colid int=@@Identity;
		fetch next from c1 into @column;
		while(@@FETCH_STATUS=0)
		begin
			IF(@column='')
			begin
				set @column=null
			end
			declare @updatescript varchar(max)='update #ediTable set seg'+Convert(varchar(max),@id)+'='''+@column+''' where id='+Convert(varchar(5),@colid);
			exec(@updatescript);
			set @id=@id+1;
			fetch next from c1 into @column;
		end
		close c1;
		deallocate c1;
		fetch next from c into @col;
	end	
	close c;
	deallocate c;	
	declare ClaimCursor cursor for select * from #ediTable
		declare @ediid int;
		declare @segid nvarchar(max);
		declare @seg01 nvarchar(max);
		declare @seg02 nvarchar(max);
		declare @seg03 nvarchar(max);
		declare @seg04 nvarchar(max);
		declare @seg05 nvarchar(max);
		declare @seg06 nvarchar(max);
		declare @seg07 nvarchar(max);
		declare @seg08 nvarchar(max);
		declare @seg09 nvarchar(max);
		declare @seg10 nvarchar(max);
		declare @seg11 nvarchar(max);
		declare @seg12 nvarchar(max);
		declare @seg13 nvarchar(max);
		declare @seg14 nvarchar(max);
		declare @seg15 nvarchar(max);
		declare @seg16 nvarchar(max);
		declare @seg17 nvarchar(max);
		declare @seg18 nvarchar(max);
		declare @seg19 nvarchar(max);
		declare @edidataid int;
		declare @transactionsetcontrol varchar(9);
		declare @BillingProviderLoopID varchar(12);
		declare @BillingProviderID nvarchar(20);
		declare @BillingProviderLastName varchar(60);
		declare @BillingProviderFirstName varchar(35);
		declare @BillingProviderNameMiddle varchar(25);
		declare @BillingProviderNameSuffix varchar(10);
		declare @BillingProviderAddress1 nvarchar(55);
		declare @BillingProviderAddress2 nvarchar(55);
		declare @BillingProviderCity varchar(30);
		declare @BillingProviderStateOrProvinceCode varchar(2);
		declare @BillingProviderPostalCode varchar(15);
		declare @BillingProviderCountryCode varchar(3);
		declare @BillingProviderCountrySubDivisionCode nvarchar(3);
		declare @BillingProviderTaxId nvarchar(50);
		open ClaimCursor;
		fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
		while(@segid<>'ST')
		BEGIN
			fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
		END
		while(@segid='ST')
		begin
			if(@segid='ST')
			begin
				set @transactionsetcontrol=@seg02;
				fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
			end
			while(@segid<>'HL' OR @seg03<>'20')
			begin
				fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
			end
			while(@segid='HL' and @seg03='20')
			begin
				if(@segid='HL' and @seg03='20')
				begin
					set @BillingProviderLoopID=@seg01;
				end
				while(@segid<>'NM1' OR @seg01<>'85')
				begin
					fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
				end
				if(@segid='NM1' AND @seg01='85')
				begin
					set @BillingProviderID=@seg09;
					set @BillingProviderLastName=@seg03;
					set @BillingProviderFirstName=@seg04;
					set @BillingProviderNameMiddle=@seg05;
					set @BillingProviderNameSuffix=@seg07;
					fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
				end
				if(@segid='N3')
				begin
					set @BillingProviderAddress1=@seg01;
					set @BillingProviderAddress2=@seg02;
					fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
				end
				if(@segid='N4')
				begin
					set @BillingProviderCity=@seg01;
					set @BillingProviderStateOrProvinceCode=@seg02;
					set @BillingProviderPostalCode=@seg03;
					set @BillingProviderCountryCode=@seg04;
					set @BillingProviderCountrySubDivisionCode=@seg07;
					fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
				end
				if(@segid='REF' and @seg01 in ('EI','SY'))
				BEGIN
					SET @BillingProviderTaxId=@seg02;
				END
				while(@segid<>'HL' OR @seg03<>'22' OR @seg02<>@BillingProviderLoopID)
				BEGIN
					fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
				END
				while(@segid='HL' and @seg03='22' and @seg02=@BillingProviderLoopID)
				BEGIN
					IF(@segid='HL' and @seg03='22' and @seg02=@BillingProviderLoopID)
					BEGIN
						INSERT INTO Claim837PDetails(TransactionSetControl,BillingProviderID,BillingProviderLastName,BillingProviderNameMiddle,BillingProviderNameSuffix,BillingProviderAddress1,BillingProviderAddress2,BillingProviderCity,BillingProviderStateOrProvinceCode,BillingProviderPostalCode,BillingProviderCountryCode,BillingProviderCountrySubDivisionCode,BillingProviderTaxId) values (@transactionsetcontrol,@BillingProviderID,@BillingProviderLastName,@BillingProviderNameMiddle,@BillingProviderNameSuffix,@BillingProviderAddress1,@BillingProviderAddress2,@BillingProviderCity,@BillingProviderStateOrProvinceCode,@BillingProviderPostalCode,@BillingProviderCountryCode,@BillingProviderCountrySubDivisionCode,@BillingProviderTaxId);
						set @edidataid=@@IDENTITY;
						fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
					END
					while(@segid<>'NM1' or @seg01<>'IL')
					BEGIN
						fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
					END
					IF(@segid='NM1' and @seg01='IL')
					BEGIN
					update Claim837PDetails set MemberID=@seg09,MemberLastName=@seg03,MemberFirstName=@seg04,MemberMiddleName=@seg05,MemberSuffix=@seg07 where Id=@edidataid;
						fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
					end
					if(@segid='N3')
					begin
						update Claim837PDetails set MemberAddress1=@seg01,MemberAddress2=@seg02 where Id=@edidataid;
						fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
					end
					if(@segid='N4')
					begin
						update Claim837PDetails set MemberCity=@seg01,MemberState=@seg02,MemberPostalCode=@seg03,MemberCountryCode=@seg04,MemberCountrySubDivisionCode=@seg07 where Id=@edidataid;
						fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
					end
					if(@segid='DMG')
					begin
						update Claim837PDetails set MemberBirthDate=@seg02,MemberGender=@seg03 where Id=@edidataid;
						fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
					end
					while(@segid<>'CLM')
					begin
						fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
					end
					if(@segid='CLM')
					begin
						update Claim837PDetails set Claimid=@seg01 where Id=@edidataid;
					end
					while(@segid<>'LX')
					begin
						fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
					end
					WHILE(@segid='LX')
					begin
						fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
						if(@segid='SV1')
						BEGIN
							DECLARE ServiceLineCursor CURSOR scroll FOR
							SELECT value FROM string_split(@seg01,':');
							OPEN ServiceLineCursor;
							DECLARE @servicelinevalues varchar(48);
							FETCH absolute 2 FROM ServiceLineCursor INTO @servicelinevalues;
							DECLARE @ModifierNumber int=1;							
							INSERT INTO ServiceLineTable(ClaimLineId,ProcedureCode) VALUES(@edidataid,@servicelinevalues);
							DECLARE @ServiceLineId int=@@Identity;
							if(@@FETCH_STATUS=0)
							begin						
								FETCH next FROM ServiceLineCursor INTO @servicelinevalues;
							end
							WHILE(@@FETCH_STATUS=0 and @ModifierNumber<7)
							BEGIN
								declare @cmd varchar(max)='update ServiceLineTable SET ProcedureModifer'+CONVERT(varchar,@ModifierNumber)+' = '''+@servicelinevalues+''' where Id = '+CONVERT(NVARCHAR(max),@ServiceLineId);
								exec(@cmd);
								SET @ModifierNumber=@ModifierNumber+1;
								FETCH NEXT FROM ServiceLineCursor INTO @servicelinevalues;
							END
							close ServiceLineCursor;
							deallocate ServiceLineCursor;
							DECLARE ServiceLineCursor CURSOR FOR
							SELECT value FROM string_split(@seg07,':');
							OPEN ServiceLineCursor;
							FETCH NEXT FROM ServiceLineCursor INTO @servicelinevalues;
							declare @PointerNumber int=1;
							WHILE(@@FETCH_STATUS=0)
							BEGIN
								declare @cmd1 nvarchar(max)='update ServiceLineTable SET DiagnosisPointer'+CONVERT(varchar,@PointerNumber)+' = '''+@servicelinevalues+''' where Id = '+CONVERT(NVARCHAR(max),@ServiceLineId);
								exec(@cmd1);
								SET @PointerNumber=@PointerNumber+1;
								FETCH NEXT FROM ServiceLineCursor INTO @servicelinevalues;
							END
							close ServiceLineCursor;
							deallocate ServiceLineCursor;
							WHILE(@segid<>'DTP' OR @seg01<>'472')
							BEGIN
								fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
							END
							IF(@segid='DTP' AND @seg01='472')
							BEGIN
								IF(@seg02='D8')
								BEGIN
									update ServiceLineTable set ServiceStartDate=@seg03 where Id=@ServiceLineId;
								END
								ELSE
								BEGIN
									declare servicedatecursor cursor for
									select value from string_split(@seg03,'-');
									declare @servicedate varchar(35);
									open servicedatecursor; 
									fetch next from servicedatecursor into @servicedate;
									update ServiceLineTable set ServiceStartDate=@servicedate where Id=@ServiceLineId;
									fetch next from servicedatecursor into @servicedate;
									update ServiceLineTable set ServiceEndDate=@servicedate where Id=@ServiceLineId;
									close servicedatecursor;
									deallocate servicedatecursor;
								END
							END
							while((@segid<>'HL' OR not @seg03 in ('22','20')) AND (not @segid in ('IEA','ST')) AND (@segid<>'LX'))
							BEGIN
								fetch next from ClaimCursor into @ediid,@segid,@seg01,@seg02,@seg03,@seg04,@seg05,@seg06,@seg07,@seg08,@seg09,@seg10,@seg11,@seg12,@seg13,@seg14,@seg15,@seg16,@seg17,@seg18,@seg19;
							END
						END
					end
				end
			end
		end
		close ClaimCursor;
		deallocate ClaimCursor;
end
GO
/****** Object:  StoredProcedure [dbo].[spdroppcp]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spdroppcp]
@keyid varchar(max)
as
begin
	delete from MemberPCPtb where member_key_id=@keyid
end
GO
/****** Object:  StoredProcedure [dbo].[spdrophp]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spdrophp]
@keyid varchar(max)
as
begin
	delete from MembersHealthPlantb where Member_Key_ID=@keyid
end
GO
/****** Object:  StoredProcedure [dbo].[spcrudBeneficiery]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spcrudBeneficiery]
@HealthPlanCode varchar(10)=null,
@BenefitCode varchar(20)=null,
@EmployerGroup varchar(500)=null,
@Description varchar(3000)=null,
@EffectiveFromDate Date=null,
@EffectiveToDate Date=null,
@AccumilationPeriod int=null,
@LineOfBusiness varchar(3)=null,
@FinancialResponcibilitySet varchar(100)=null,
@OOPMaximumMember varchar(8)=null,
@OOPMaximumSubscriber varchar(8)=null,
@DeductableForMember varchar(8)=null,
@DeductableForSubscriber varchar(8)=null,
@InNetworkOOPMaximumMember varchar(8)=null,
@InNetworkOOPMaximumSubscriber varchar(8)=null,
@InNetworkDeductableForMember varchar(8)=null,
@InNetworkDeductableForSubscriber varchar(8)=null,
@OutNetworkOOPMaximumMember varchar(8)=null,
@OutNetworkOOPMaximumSubscriber varchar(8)=null,
@OutNetworkDeductableForMember varchar(8)=null,
@OutNetworkDeductableForSusbscriber varchar(8)=null,
@OOPMaximumCombinedMember varchar(8)=null,
@OOPMaximumCombinedSubscriber varchar(8)=null,
@DeductableCombinedMember varchar(8)=null,
@DeductableCombinedSubscriber varchar(8)=null,
@note varchar(max)=null,
@operation char
as
begin
	if(@operation='c')
	begin
		insert into BenefitMaster values(@HealthPlanCode,@BenefitCode,@EmployerGroup,@Description,dateadd(day,1,@EffectiveFromDate),dateadd(day,1,@EffectiveToDate),@AccumilationPeriod,@LineOfBusiness,@FinancialResponcibilitySet,@OOPMaximumMember,@OOPMaximumSubscriber,@DeductableForMember,@DeductableForSubscriber,@InNetworkOOPMaximumMember,@InNetworkOOPMaximumSubscriber,@InNetworkDeductableForMember,@InNetworkDeductableForSubscriber,@OutNetworkOOPMaximumMember,@OutNetworkOOPMaximumSubscriber,@OutNetworkDeductableForMember,@OutNetworkDeductableForSusbscriber,@OOPMaximumCombinedMember,@OOPMaximumCombinedMember,@DeductableCombinedMember,@DeductableCombinedSubscriber,@note);
	end
	else if(@operation='r')
	begin
			select * from BenefitMaster;
		--select HealthPlanCode,BenefitCode,EmployerGroup,Description,EffectiveFromDate,EffectiveToDate,AccumilationPeriod,LineOfBusiness,FinancialResponcibilitySet,OOPMaximumMember,OOPMaximumSubscriber,DeductableForMember,DeductableForSubscriber,InNetworkOOPMaximumMember,InNetworkOOPMaximumSubscriber,InNetworkDeductableForMember,InNetworkDeductableForSuscriber,OutNetworkOOPMaximumMember,OutNetworkOOPMaximumSubscriber,OutNetworkDeductableForMember,OutNetworkDeductableForSusbscriber,OOPMaximumCombinedMember,OOPMaximumCombinedSuscriber,DeductableCombinedMember,DeductableCombinedSuscriber,note from BenefitMaster where HealthPlanCode like '%'+@HealthPlanCode+'%' and BenefitCode like '%'+@BenefitCode+'%' and EmployerGroup like '%'+@EmployerGroup+'%' and Description like '%'+@Description+'%' and FinancialResponcibilitySet like '%'+@FinancialResponcibilitySet+'%' and note like '%'+@note+'%';
	end
	else if(@operation='u')
	begin
		update BenefitMaster set EmployerGroup=@EmployerGroup,Description=@Description,EffectiveFromDate=@EffectiveFromDate,EffectiveToDate=@EffectiveToDate,AccumilationPeriod=@AccumilationPeriod,LineOfBusiness=@LineOfBusiness,FinancialResponcibilitySet=@FinancialResponcibilitySet,OOPMaximumCombinedMember=@OOPMaximumCombinedMember,OOPMaximumCombinedSuscriber=@OOPMaximumCombinedSubscriber,DeductableCombinedMember=@DeductableCombinedMember,note=@note
	end
end
GO
/****** Object:  StoredProcedure [dbo].[spcreatemembers]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spcreatemembers]
@memberID varchar(80)=NULL
,@lastName varchar(60)=NULL
,@HealthPlanCode varchar(5)=null 
,@firstName varchar(35)=NULL
,@middleName varchar(25)=NULL
,@suffixName varchar(10)=NULL
,@address1 varchar(55)=NULL
,@address2 varchar(55)=NULL
,@city varchar(30)=null
,@state varchar(2)=null
,@postalCode varchar(15)=null
,@countryCode varchar(3)=null
,@dob varchar(35)=null
,@gender char

as
begin
INSERT INTO [EDIDatabase].[dbo].[Members]
           (
           [memberID]
           ,[HealthPlanCode]
           ,[lastName]
           ,[firstName]
           ,[middleName]
           ,[suffixName]
           ,[address1]
           ,[address2]
           ,[city]
           ,[state]
           ,[postalCode]
           ,[countryCode],
           [dob],gender)
     VALUES
           (@memberID 
           ,@HealthPlanCode
,@lastName
,@firstName
,@middleName
,@suffixName
,@address1
,@address2
,@city
,@state
,@postalCode
,@countryCode
,@dob
,@gender
)
select @@identity as member_key_id
end
GO
/****** Object:  StoredProcedure [dbo].[spcreatememberpcp]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spcreatememberpcp]
@memberId varchar(80)
,@pcpid varchar(80)
,@fromdate varchar(80)
,@todate varchar(80)
as
begin
INSERT INTO [EDIDatabase].[dbo].[MemberPCPtb]
           ([memberId]
           ,[pcpid]
           ,[fromdate]
           ,[todate])
     VALUES
           (@memberId
           ,@pcpid
           ,@fromdate
           ,@todate)
           end
GO
/****** Object:  StoredProcedure [dbo].[spaltermember]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spaltermember]
@memberid varchar(80)=null,
@firstName varchar(35)=null,
@lastName varchar(60)=null,
@middleName varchar(25)=null,
@suffixName varchar(10)=null,
@address1 varchar(55)=null,
@address2 varchar(55)=null,
@city varchar(30)=null,
@state varchar(2)=null,
@postalCode varchar(15)=null,
@countryCode varchar(3)=null,
@gender char(1)=null,
@dob varchar(35)=null,
@hp varchar(5)=null
as
begin
	declare @keyid varchar(max);
	select @keyid=id from Members where memberID=@memberID and HealthPlanCode=@hp;
	update Members set  firstName=@firstName,lastName=@lastName,dob=@dob,middleName=@middleName,suffixName=@suffixName,address1=@address1,address2=@address2,city=@city,state=@state,postalCode=@postalCode,countryCode=@countryCode,gender=@gender where id=@keyid; 
	select @keyid as keyid;
end
GO
/****** Object:  StoredProcedure [dbo].[spAddProvider]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spAddProvider]
@providerNpi nvarchar(10)= null,
@providerID nvarchar(20)=null,
@category nvarchar(100)=null,
@providerType nvarchar(100) = null,
@primarySpeciality nvarchar(100) = null,
@preferedSpeciality bit = null,
@referAnyMember bit = null,
@title nvarchar(10)=null,
@lastName nvarchar(500)=null,
@firstName nvarchar(500)=null,
@middle nvarchar(500)=null,
@suffix nvarchar(10)=null,
@profSuffix nvarchar(10)=null,
@middleName nvarchar(500)=null,
@gender nvarchar(500) = null,
@dob nvarchar(100)=null,
@ssn nvarchar(20) = null,
@citizenship nvarchar(20)=null,
@birthCity nvarchar(30) = null,
@birthState nvarchar(5) = null,
@birthCountry nvarchar(200)=null,
@contractType nvarchar(100)=null,
@fromDate nvarchar(100)=null,
@contractTermedDate nvarchar(100)=null,
@paymentType nvarchar(200)=null,
@account nvarchar(200)=null,
@carrierlocality nvarchar(200)=null,
@cliaCertified bit=null,
@clia1Waivable bit=null,
@clia2Waivable bit=null,
@authorizationValidForDays nvarchar(10)=null,
@allowedVisits nvarchar(10)=null,
@acceptPatients bit=null,
@allowedAsRefferingToProvider bit = null,
@practiceType nvarchar(20)=null,
@name nvarchar(100)=null,
@address1 nvarchar(1000)=null,
@address2 nvarchar(1000)=null,
@aptNo nvarchar(100)=null,
@city nvarchar(100)=null,
@state nvarchar(5)=null,
@doctorCountry nvarchar(200)=null,
@country nvarchar(200)=null,
@zip nvarchar(50)=null,
@phone nvarchar(200)=null,
@fax nvarchar(200)=null,
@contractTemplate nvarchar(200)=null,
@contractFromDate nvarchar(100)=null,
@contractToDate nvarchar(100)=null,
@parentPayorFacility1 nvarchar(50)=null,
@parentPayorFacility2 nvarchar(50)=null,
@appType nvarchar(50)=null,
@operation nvarchar,
@condition nvarchar(1000)=null
as
begin
	begin tran
		save tran MySavePoint;
		begin Try
			if(@operation = 'c')
			begin
				insert into Provider values(@providerNpi,@providerID,@category,@providerType,@primarySpeciality,@preferedSpeciality,@referAnyMember,@title,@lastName,@firstName,@middle,@suffix,@profSuffix,@middleName,@gender,@dob,@ssn,@citizenship,@birthCity,@birthState,@birthCountry,@contractType,@fromDate,@contractTermedDate,@paymentType,@account,@carrierlocality,@cliaCertified,@clia1Waivable,@clia2Waivable,@authorizationValidForDays,@allowedVisits,@acceptPatients,@allowedAsRefferingToProvider,@practiceType,@name,@address1,@address2,@aptNo,@city,@state,@doctorCountry,@country,@zip,@phone,@fax,@contractTemplate,@contractFromDate,@contractToDate,@parentPayorFacility1,@parentPayorFacility2,@appType)
				select * from Provider where providerID=@providerID
			end
			else if(@operation = 'r')
			begin
				select * from Provider where providerID like '%'+isnull(@providerID,'')+'%' and providerNpi like '%'+ISNULL(@providerNpi,'')+'%' and upper(category) like '%'+ISNULL(UPPER(@category),'')+'%' and upper(providerType) like '%'+ISNULL(UPPER(@providerType),'')+'%' and UPPER(primarySpeciality) like '%'+ISNULL(UPPER(@primarySpeciality),'')+'%' and upper(title) like '%'+ISNULL(UPPER(@title),'')+'%' and UPPER(lastName) like '%'+ISNULL(UPPER(@lastName),'')+'%' and UPPER(firstName) like '%'+ISNULL(upper(@firstName),'')+'%' and UPPER(middle) like '%'+ISNULL(UPPER(@middle),'')+'%' and UPPER(suffix) like '%'+ISNULL(UPPER(@suffix),'')+'%' and UPPER(profSuffix) like '%'+ISNULL(UPPER(@profSuffix),'')+'%' and upper(middleName) like '%'+ISNULL(UPPER(@middleName),'')+'%' and UPPER(gender) like '%'+ISNULL(UPPER(@gender),'')+'%' and dob like ISNULL(@dob,'') and UPPER(ssn) like '%'+ISNULL(UPPER(@ssn),'')+'%' and UPPER(citizenship) like '%'+ISNULL(UPPER(@citizenship),'')+'%' and UPPER(birthCity) like '%'+ISNULL(UPPER(@birthCity),'')+'%' and UPPER(birthState) like '%'+ISNULL(UPPER(@birthState),'')+'%' and UPPER(birthCountry) like '%'+ISNULL(UPPER(@birthCountry),'')+'%' and UPPER(contractType) like '%'+ISNULL(UPPER(@contractType),'')+'%' and UPPER(paymentType) like  '%'+ISNULL(UPPER(@paymentType),'')+'%' and UPPER(name) like '%'+ISNULL(UPPER(name),'')+'%' and UPPER(address1) like '%'+ISNULL(UPPER(@address1),'')+'%' and UPPER(address2) like '%'+ISNULL(UPPER(address2),'')+'%' and UPPER(aptNo) like '%'+ISNULL(UPPER(@aptNo),'')+'%' and UPPER(city) like '%'+ISNULL(UPPER(@city),'')+'%' and UPPER([state]) like '%'+ISNULL(UPPER(@state),'')+'%' and UPPER(country) like '%'+ISNULL(UPPER(@country),'')+'%' and UPPER(zip) like '%'+ISNULL(UPPER(@zip),'')+'%' and phone like '%'+ISNULL(@phone,'')+'%' and fax like '%'+ISNULL(@fax,'')+'%'
			end
			else if(@operation = 'u')
			begin
				declare @sqlu nvarchar(1100);
				set @sqlu='update Provider set '+@condition;
				exec sp_executesql @sqlu;
			end
			else if(@operation='d')
			begin
				delete from Provider where providerID=@providerID
			end
			commit tran
		end try
		begin catch
			if @@TRANCOUNT>0
			begin
				print('error');
				rollback tran MySavePoint;
			end
		end catch
end
GO
/****** Object:  StoredProcedure [dbo].[spselectmemberhp]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spselectmemberhp]
@memberid varchar(80)=null,
@hp varchar(5)=null
as
begin
	declare @id int;
	select @id=id from Members where memberID=@memberid and HealthPlanCode=@hp;
	select @hp as healthplan,BenefitCode,fromdate,todate from MembersHealthPlantb where Member_Key_ID=@id order by cast(fromdate as date);
end
GO
/****** Object:  StoredProcedure [dbo].[spsearchprovider]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spsearchprovider]
@pcpid varchar(80)='',
@providernpi varchar(80)='',
@providerlastname varchar(60)='',
@providerfirstname varchar(35)='',
@organizationname varchar(60)='',
@address1 varchar(55)='',
@address2 varchar(55)='',
@city varchar(35)='',
@state varchar(5)='',
@postalcode varchar(30)=''
as
begin
	select p.providerID,p.providerNpi,p.lastName,p.firstName,o.taxId,p.phone,p.fax,p.contractType,o.organizationName,p.contractFromDate,p.contractToDate from Provider p join ProviderOrganization po on p.providerID=po.providerId join Organization o on o.organizationId=po.organizationId
	where p.providerID like +@pcpid+'%' and p.providerNpi like @providernpi+'%' and p.lastName like '%'+@providerlastname+'%' and p.firstName like '%'+@providerfirstname+'%' and (o.organizationName like'%'+@organizationname+'%')and p.address1 like '%'+p.address1+'%' and p.address2 like '%'+p.address2+'%' and p.city like '%'+@city+'%' and p.state like '%'+@state+'%' and p.zip like '%'+@postalcode+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[spaddorganizationtoprovider]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spaddorganizationtoprovider]
@providerId nvarchar(20)=null,
@organizationId nvarchar(20)=null,
@organizationType nvarchar(20)=null,
@orgEffectiveFrom nvarchar(100)=null,
@orgEffectiveTo nvarchar(100)=null
as
begin
	insert into ProviderOrganization values(@providerId,@organizationId,@organizationType,@orgEffectiveFrom,@orgEffectiveTo)
end
GO
/****** Object:  StoredProcedure [dbo].[spaddbulkproviders]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spaddbulkproviders]
@path nvarchar(500)
as
begin
	begin tran
		save tran MySavePoint;
		begin Try
		create table #provtemp(npi nvarchar(10),providerId nvarchar(20),primaryspeciality nvarchar(100),providertype nvarchar(100),category nvarchar(100),title nvarchar(10),lastname nvarchar(500),firstName nvarchar(500),middle nvarchar(500),suffix nvarchar(10),profsuffix nvarchar(10),middleName nvarchar(500),gender nvarchar(10),dob nvarchar(100),ssn nvarchar(20),citizenship nvarchar(20),birthCity nvarchar(30),birthState nvarchar(5),birthCountry nvarchar(200),contractType nvarchar(100),fromDate nvarchar(100),contracttermdate nvarchar(100),paymentType nvarchar(200),account nvarchar(200),carrierlocality nvarchar(200),organizationId nvarchar(20),organizationType nvarchar(20),orgEffectiveFrom nvarchar(100),orgEffectiveTo nvarchar(100),authvalidfordays nvarchar(10),allowedVisits nvarchar(10),practiceType nvarchar(20),name nvarchar(100),address1 nvarchar(1000),address2 nvarchar(1000),aptno nvarchar(100),city nvarchar(100),[state] nvarchar(5),doctorContory nvarchar(200),country nvarchar(200),zip nvarchar(50),phone nvarchar(200),fax nvarchar(200),contractTemplate nvarchar(200),contractFromDate nvarchar(200),contractToDate nvarchar(100))
		declare @sqlscript nvarchar(1000)='bulk insert #provtemp from '''+@path+''' with (rowterminator=''\n'',fieldterminator='','',firstrow=2)';
		exec(@sqlscript)
		insert into Provider select npi,providerId,category,providertype,primaryspeciality,0,0,title,lastname,firstName,middle,suffix,profsuffix,middleName,gender,dob,ssn,citizenship,birthCity,birthState,birthCountry,contractType,fromDate,contracttermdate,paymentType,account,carrierlocality,0,0,0,authvalidfordays,allowedVisits,1,1,practiceType,name,address1,address2,aptno,city,[state],doctorContory,country,zip,phone,fax,contractTemplate,contractFromDate,contractFromDate,'AMG','AMG','NONE' from #provtemp
		insert into ProviderOrganization select providerId,organizationId,organizationType,orgEffectiveFrom,orgEffectiveTo from #provtemp
		select * from #provtemp
		commit tran
		end try
		begin catch
			if @@TRANCOUNT>0
			begin
				print('error');
				rollback tran MySavePoint;
			end
		end catch
end
GO
/****** Object:  StoredProcedure [dbo].[spgetpcpprimorg]    Script Date: 03/06/2021 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spgetpcpprimorg]
@providerId nvarchar(20)= null
as
begin
	select top 1 org.organizationName,p.lastName,p.firstName from ProviderOrganization pcp join Organization org on pcp.organizationid=org.organizationid join Provider p on p.providerID=pcp.providerId   where pcp.providerId=@providerId
end
GO
/****** Object:  Default [DF__MembersHe__EmpGr__607251E5]    Script Date: 03/06/2021 17:15:50 ******/
ALTER TABLE [dbo].[MembersHealthPlantb] ADD  DEFAULT ('') FOR [EmpGrp]
GO
/****** Object:  Default [DF__MembersHe__Maint__6166761E]    Script Date: 03/06/2021 17:15:50 ******/
ALTER TABLE [dbo].[MembersHealthPlantb] ADD  DEFAULT ((1)) FOR [MaintReason]
GO
/****** Object:  ForeignKey [fk_organizationrelation]    Script Date: 03/06/2021 17:15:51 ******/
ALTER TABLE [dbo].[ProviderOrganization]  WITH CHECK ADD  CONSTRAINT [fk_organizationrelation] FOREIGN KEY([organizationId])
REFERENCES [dbo].[Organization] ([organizationId])
GO
ALTER TABLE [dbo].[ProviderOrganization] CHECK CONSTRAINT [fk_organizationrelation]
GO
/****** Object:  ForeignKey [fk_providerrelation]    Script Date: 03/06/2021 17:15:51 ******/
ALTER TABLE [dbo].[ProviderOrganization]  WITH CHECK ADD  CONSTRAINT [fk_providerrelation] FOREIGN KEY([providerId])
REFERENCES [dbo].[Provider] ([providerID])
GO
ALTER TABLE [dbo].[ProviderOrganization] CHECK CONSTRAINT [fk_providerrelation]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 03/06/2021 17:15:51 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 03/06/2021 17:15:51 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 03/06/2021 17:15:51 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 03/06/2021 17:15:51 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
