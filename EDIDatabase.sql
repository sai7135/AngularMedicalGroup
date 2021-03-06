USE [master]
GO
/****** Object:  Database [EDIDatabase]    Script Date: 02/06/2021 07:21:08 ******/
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
/****** Object:  Table [dbo].[subscriber]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[Provider]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[patient]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[Organization]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[MembersHealthPlantb]    Script Date: 02/06/2021 07:21:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MembersHealthPlantb](
	[Member_Key_ID] [int] NULL,
	[BenefitCode] [varchar](30) NULL,
	[fromdate] [varchar](35) NULL,
	[todate] [varchar](35) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Members]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[MemberPCPtb]    Script Date: 02/06/2021 07:21:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberPCPtb](
	[member_key_id] [int] NULL,
	[pcpid] [varchar](80) NULL,
	[fromdate] [varchar](30) NULL,
	[todate] [varchar](30) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[file837table]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[EDI_837P_SupportDoc]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[EDI_837P_subscriber]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[EDI_837P_ServiceLine]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[EDI_837P_Patient]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[EDI_837P_Header]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[EDI_837P_FormIdentification]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[EDI_837P_Form]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[EDI_837P_claim]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[EDI_837P_BillingProvider]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[EDI_837P_2320_OtherSubscriber]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[Claim837PDetails]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[claim]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[BillingProvider]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[BenefitMaster]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[ambulancepickup]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[ambulancedroplocation]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[servicefacilitylocation]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[renderingprovider]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[referingprovider]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[ProviderOrganization]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  View [dbo].[ClaimView]    Script Date: 02/06/2021 07:21:09 ******/
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
/****** Object:  StoredProcedure [dbo].[spsearchmember]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spsearchbenefitmaster]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spsearchbenefitcode]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sporgcrud]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spmemberselect]    Script Date: 02/06/2021 07:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmemberselect]
@memberid varchar(80)=null,
@healthplan varchar(5)=null
as
begin
	select memberID,lastName,firstName,middleName,suffixName,address1,address2,city,state,postalCode,countryCode,dob,gender,pcpid,pcptb.fromdate as pcpfromdate,pcptb.todate as pcptodate,HealthPlanCode,BenefitCode,hptb.fromdate as hpfrmdate,hptb.todate as hptodate from Members mb join MemberPCPtb pcptb on mb.id=pcptb.member_key_id join MembersHealthPlantb hptb on mb.id=hptb.Member_Key_ID where mb.memberID=@memberid and mb.HealthPlanCode=@healthplan
end
GO
/****** Object:  StoredProcedure [dbo].[spmemberexist]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertsupportdoc]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertsubscriber]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertserviceline]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertservicefacilitylocation]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertrenderingprovider]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertreferingprovider]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertpatient]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertothersubscriber]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertMembersHealthPlantb]    Script Date: 02/06/2021 07:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertMembersHealthPlantb]
@memberkeyid int=null,
@BenefitCode varchar(30)=null,
@fromdate varchar(35)=null,
@todate varchar(35)=null
as
begin
INSERT INTO [EDIDatabase].[dbo].[MembersHealthPlantb]
           ([Member_Key_ID]
           ,[BenefitCode]
           ,[fromdate]
           ,[todate])
     VALUES
           (@memberkeyid,@BenefitCode,@fromdate,@todate)
end
GO
/****** Object:  StoredProcedure [dbo].[spinsertMemberPCPtb]    Script Date: 02/06/2021 07:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spinsertMemberPCPtb]
@member_key_id int=null,
@pcpid varchar(80)=null,
@fromdate varchar(30)=null,
@todate varchar(30)=null
as
begin
INSERT INTO [EDIDatabase].[dbo].[MemberPCPtb]
           ([member_key_id]
           ,[pcpid]
           ,[fromdate]
           ,[todate])
     VALUES
           (@member_key_id
           ,@pcpid
           ,@fromdate
           ,@todate)
end
GO
/****** Object:  StoredProcedure [dbo].[spinserthealthealthplan]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertformidentification]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertform]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertEDIHeader]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertclaim]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertBillingprovider]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertambulancepickup]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinsertambulancedroplocation]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spinertserviceline]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spgetfileid]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spgetclaim]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spget837list]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spdroppcp]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spdrophp]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spcrudBeneficiery]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spcreatemembers]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spcreatememberpcp]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spaltermember]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spAddProvider]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spselectmemberhp]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spsearchprovider]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spaddorganizationtoprovider]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spaddbulkproviders]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  StoredProcedure [dbo].[spgetpcpprimorg]    Script Date: 02/06/2021 07:21:10 ******/
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
/****** Object:  ForeignKey [fk_organizationrelation]    Script Date: 02/06/2021 07:21:09 ******/
ALTER TABLE [dbo].[ProviderOrganization]  WITH CHECK ADD  CONSTRAINT [fk_organizationrelation] FOREIGN KEY([organizationId])
REFERENCES [dbo].[Organization] ([organizationId])
GO
ALTER TABLE [dbo].[ProviderOrganization] CHECK CONSTRAINT [fk_organizationrelation]
GO
/****** Object:  ForeignKey [fk_providerrelation]    Script Date: 02/06/2021 07:21:09 ******/
ALTER TABLE [dbo].[ProviderOrganization]  WITH CHECK ADD  CONSTRAINT [fk_providerrelation] FOREIGN KEY([providerId])
REFERENCES [dbo].[Provider] ([providerID])
GO
ALTER TABLE [dbo].[ProviderOrganization] CHECK CONSTRAINT [fk_providerrelation]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 02/06/2021 07:21:09 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 02/06/2021 07:21:09 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 02/06/2021 07:21:09 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 02/06/2021 07:21:09 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
