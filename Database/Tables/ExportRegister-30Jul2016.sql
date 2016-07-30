USE [ExportRegister]
GO
/****** Object:  Table [dbo].[tDesignation]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tDesignation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tDesignation](
	[DesignationId] [uniqueidentifier] NOT NULL,
	[DesignationName] [varchar](200) NOT NULL,
	[ActionDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DesignationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tDepartments]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tDepartments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tDepartments](
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[DepartmentName] [varchar](200) NOT NULL,
	[ActionDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tCompanyDetails]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tCompanyDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tCompanyDetails](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[CompanyName] [varchar](200) NOT NULL,
	[CompanyUrl] [varchar](200) NULL,
	[CompanyAddress] [varchar](2000) NOT NULL,
	[CompanyPhone] [varchar](30) NULL,
	[CompanyFax] [varchar](30) NULL,
	[ActionDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CompanyName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tEmployeeDetails]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tEmployeeDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tEmployeeDetails](
	[EmployeeDetailsId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [varchar](200) NOT NULL,
	[EmployeeName] [varchar](200) NOT NULL,
	[EmployeeShortName] [varchar](30) NOT NULL,
	[EmailId] [varchar](30) NOT NULL,
	[MobileNumber] [varchar](20) NOT NULL,
	[LandlineNumber] [varchar](20) NULL,
	[ExtnNumber] [varchar](20) NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[DesignationId] [uniqueidentifier] NOT NULL,
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[ActionDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeDetailsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MobileNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tLogin]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tLogin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tLogin](
	[LoginId] [uniqueidentifier] NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[LoginPassword] [varchar](30) NOT NULL,
	[EmployeeDetailsId] [uniqueidentifier] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[IsRandomPwd] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tWareHouseMaster]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tWareHouseMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tWareHouseMaster](
	[WareHouseMasterId] [uniqueidentifier] NOT NULL,
	[Customer] [varchar](50) NOT NULL,
	[PartNo] [varchar](50) NOT NULL,
	[PartName] [varchar](50) NOT NULL,
	[QtyPerBox] [int] NOT NULL,
	[NetWeightPerPiece] [decimal](18, 0) NOT NULL,
	[NetWeightPerBox] [decimal](18, 0) NOT NULL,
	[GrossWeightPerBox] [decimal](18, 0) NOT NULL,
	[MeasurementPerBox] [varchar](50) NOT NULL,
	[TypOfPackng] [varchar](25) NOT NULL,
	[M3] [decimal](18, 0) NOT NULL,
	[ActionDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[WareHouseMasterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tExportRegisterBaseData]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tExportRegisterBaseData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tExportRegisterBaseData](
	[ExportRegisterBaseDataId] [uniqueidentifier] NOT NULL,
	[CUSNO] [int] NOT NULL,
	[SHPNO] [smallint] NOT NULL,
	[PRTNO] [varchar](50) NOT NULL,
	[DUEDT] [datetime] NOT NULL,
	[CORNO] [varchar](50) NOT NULL,
	[CPRTN] [varchar](50) NOT NULL,
	[OGQTY] [int] NOT NULL,
	[ORQTY] [int] NOT NULL,
	[ALQTY] [int] NOT NULL,
	[SHDQY] [int] NOT NULL,
	[SHPDT] [datetime] NOT NULL,
	[NOSHP] [int] NOT NULL,
	[KBFLG] [int] NOT NULL,
	[ODRFL] [int] NOT NULL,
	[SORNO] [varchar](20) NULL,
	[SPODF] [varchar](20) NULL,
	[LMNDT] [datetime] NOT NULL,
	[ACTIONDATE] [datetime] NOT NULL,
	[CREATEDBY] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExportRegisterBaseDataId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tDispatchInstructionNote]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tDispatchInstructionNote]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tDispatchInstructionNote](
	[DispatchInstructionNoteId] [uniqueidentifier] NOT NULL,
	[ConsigneeName] [varchar](500) NOT NULL,
	[ConsigneeAddress] [varchar](max) NOT NULL,
	[IssueDate] [datetime] NOT NULL,
	[PackingType] [varchar](50) NOT NULL,
	[CigmaCustCode] [int] NOT NULL,
	[ShptToCode] [smallint] NOT NULL,
	[ActionDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[DispatchInstructionNoteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tFinanceInvoice]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tFinanceInvoice]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tFinanceInvoice](
	[FinanceInvoiceId] [uniqueidentifier] NOT NULL,
	[DispatchInstructionNoteId] [uniqueidentifier] NOT NULL,
	[InvoiceNumber] [int] NOT NULL,
	[Exporter] [varchar](1000) NOT NULL,
	[TinNo] [bigint] NOT NULL,
	[KstNo] [varchar](100) NOT NULL,
	[CstNo] [varchar](100) NOT NULL,
	[EccNo] [varchar](100) NOT NULL,
	[LtuNo] [varchar](1000) NOT NULL,
	[Date] [datetime] NOT NULL,
	[BuyersOrderNo] [varchar](1000) NOT NULL,
	[BuyersOrderDate] [datetime] NULL,
	[ExportersRef] [varchar](1000) NOT NULL,
	[OtherReferences] [varchar](max) NULL,
	[SoldTo] [varchar](max) NOT NULL,
	[ShipToAddress] [varchar](max) NOT NULL,
	[PreCaariageBy] [varchar](100) NOT NULL,
	[PlaceOfReceiptByPreCarrier] [varchar](100) NOT NULL,
	[CountryOfOrigionOfGooods] [varchar](100) NOT NULL,
	[CountryOfFinalDestintion] [varchar](100) NOT NULL,
	[TermsOfDelivery] [varchar](100) NOT NULL,
	[Payment] [varchar](200) NOT NULL,
	[VesselOrFlightNo] [varchar](200) NULL,
	[PortOfLoading] [varchar](200) NOT NULL,
	[PaymentBank] [varchar](100) NOT NULL,
	[PaymentBranch] [varchar](100) NOT NULL,
	[PaymentCountry] [varchar](100) NOT NULL,
	[PaymentSwiftNo] [varchar](100) NOT NULL,
	[PaymentCurrentAccNo] [bigint] NOT NULL,
	[PortOfDischarge] [varchar](200) NOT NULL,
	[FinalDelivery] [varchar](200) NOT NULL,
	[Beneficiaryname] [varchar](200) NOT NULL,
	[ContainerNo] [varchar](200) NOT NULL,
	[SealNo] [varchar](200) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ActionDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FinanceInvoiceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[InvoiceNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tDispatchInstructionNoteVersion]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tDispatchInstructionNoteVersion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tDispatchInstructionNoteVersion](
	[DispatchInstructionNoteVersionId] [uniqueidentifier] NOT NULL,
	[DispatchInstructionNoteId] [uniqueidentifier] NOT NULL,
	[ModelOrEvent] [varchar](20) NULL,
	[CustomerPONo] [varchar](20) NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[CustomerPartNumber] [varchar](50) NOT NULL,
	[DNKIFGpartnumber] [varchar](50) NOT NULL,
	[Descp] [varchar](100) NOT NULL,
	[ShipQty] [int] NOT NULL,
	[UOM] [varchar](10) NOT NULL,
	[NPDPartHandOvertoCKD] [varchar](20) NULL,
	[ProdStckInDtQAchk] [datetime] NOT NULL,
	[PckgDtlToFin] [datetime] NOT NULL,
	[CigInvFinInv] [datetime] NOT NULL,
	[Mode] [varchar](10) NOT NULL,
	[ETDDNKI] [datetime] NOT NULL,
	[ETACust] [varchar](50) NULL,
	[Remarks] [varchar](50) NULL,
	[ActionDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[DispatchInstructionNoteVersionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tLoadingCheckSheet]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tLoadingCheckSheet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tLoadingCheckSheet](
	[LoadingCheckSheetId] [uniqueidentifier] NOT NULL,
	[DispatchInstructionNoteId] [uniqueidentifier] NOT NULL,
	[TotNoBoxes] [int] NOT NULL,
	[ContainerType] [int] NOT NULL,
	[ContainerFillingRationInM3] [decimal](18, 0) NOT NULL,
	[ActualFillingRationInM3] [decimal](18, 0) NOT NULL,
	[ContainerFillingEfficiencyInPercent] [decimal](18, 0) NOT NULL,
	[ActionDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[LoadingCheckSheetId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tLoadingCheckSheetPalletVersion]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tLoadingCheckSheetPalletVersion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tLoadingCheckSheetPalletVersion](
	[LoadingCheckSheetPalletVersionId] [uniqueidentifier] NOT NULL,
	[LoadingCheckSheetId] [uniqueidentifier] NOT NULL,
	[DNKIFGPrtNo] [varchar](50) NOT NULL,
	[QtyToShip] [int] NOT NULL,
	[QtyPerBox] [int] NOT NULL,
	[NoOfBox] [int] NOT NULL,
	[NoOfPallet] [int] NOT NULL,
	[GrossWghtPerBox] [decimal](18, 0) NOT NULL,
	[NetWghtperBox] [decimal](18, 0) NOT NULL,
	[M3PerBox] [decimal](18, 0) NOT NULL,
	[TotGw] [decimal](18, 0) NOT NULL,
	[TotNw] [decimal](18, 0) NOT NULL,
	[TotM3] [decimal](18, 0) NOT NULL,
	[TypBox] [varchar](50) NOT NULL,
	[BoxMeasurement] [varchar](50) NOT NULL,
	[NetWghtPerPiece] [decimal](18, 0) NOT NULL,
	[ActionDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[LoadingCheckSheetPalletVersionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tLoadingCheckSheetContainerVersion]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tLoadingCheckSheetContainerVersion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tLoadingCheckSheetContainerVersion](
	[tLoadingCheckSheetContainerVersion] [uniqueidentifier] NOT NULL,
	[LoadingCheckSheetId] [uniqueidentifier] NOT NULL,
	[DNKIFGPrtNo] [varchar](50) NOT NULL,
	[NoOfPallets] [int] NOT NULL,
	[CabinNo] [int] NOT NULL,
	[CabinDirection] [int] NOT NULL,
	[ActionDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[tLoadingCheckSheetContainerVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tFinanceInvoiceVersion]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tFinanceInvoiceVersion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tFinanceInvoiceVersion](
	[tFinanceInvoiceVersionId] [uniqueidentifier] NOT NULL,
	[FinanceInvoiceId] [uniqueidentifier] NOT NULL,
	[MarksandNos] [varchar](1000) NOT NULL,
	[Noandkindsofpckgs] [varchar](100) NOT NULL,
	[CustomerPartNumber] [varchar](100) NOT NULL,
	[DNKIPartNumber] [varchar](100) NOT NULL,
	[DescGoods] [varchar](100) NOT NULL,
	[Cth] [int] NOT NULL,
	[NetWeight] [decimal](18, 0) NOT NULL,
	[Qty] [int] NOT NULL,
	[UnitPirce] [decimal](18, 0) NOT NULL,
	[TotalPrice] [decimal](18, 0) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ActionDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tFinanceInvoiceVersionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tFinanceInvoiceDocketDetails]    Script Date: 07/30/2016 18:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tFinanceInvoiceDocketDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tFinanceInvoiceDocketDetails](
	[FinanceInvoiceDocketDetailsId] [uniqueidentifier] NOT NULL,
	[FinanceInvoiceId] [uniqueidentifier] NOT NULL,
	[DocketNo] [varchar](200) NOT NULL,
	[InvoiceNo] [varchar](200) NOT NULL,
	[BillOfEntryNum] [int] NOT NULL,
	[BillOfEntryDate] [datetime] NOT NULL,
	[Item] [varchar](200) NOT NULL,
	[InwardQty] [int] NOT NULL,
	[ReExportQty] [int] NOT NULL,
	[ESugmaNo] [varchar](200) NULL,
	[PreapredBy] [varchar](200) NOT NULL,
	[RequestedBy] [varchar](200) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ActionDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FinanceInvoiceDocketDetailsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF__tCompanyD__Actio__33D4B598]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tCompanyD__Actio__33D4B598]') AND parent_object_id = OBJECT_ID(N'[dbo].[tCompanyDetails]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tCompanyD__Actio__33D4B598]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tCompanyDetails] ADD  DEFAULT (getdate()) FOR [ActionDate]
END


End
GO
/****** Object:  Default [DF__tDepartme__Actio__34C8D9D1]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tDepartme__Actio__34C8D9D1]') AND parent_object_id = OBJECT_ID(N'[dbo].[tDepartments]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tDepartme__Actio__34C8D9D1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tDepartments] ADD  DEFAULT (getdate()) FOR [ActionDate]
END


End
GO
/****** Object:  Default [DF__tDesignat__Actio__35BCFE0A]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tDesignat__Actio__35BCFE0A]') AND parent_object_id = OBJECT_ID(N'[dbo].[tDesignation]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tDesignat__Actio__35BCFE0A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tDesignation] ADD  DEFAULT (getdate()) FOR [ActionDate]
END


End
GO
/****** Object:  Default [DF__tDispatch__Actio__4BAC3F29]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tDispatch__Actio__4BAC3F29]') AND parent_object_id = OBJECT_ID(N'[dbo].[tDispatchInstructionNote]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tDispatch__Actio__4BAC3F29]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tDispatchInstructionNote] ADD  DEFAULT (getdate()) FOR [ActionDate]
END


End
GO
/****** Object:  Default [DF__tDispatch__Actio__534D60F1]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tDispatch__Actio__534D60F1]') AND parent_object_id = OBJECT_ID(N'[dbo].[tDispatchInstructionNoteVersion]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tDispatch__Actio__534D60F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tDispatchInstructionNoteVersion] ADD  DEFAULT (getdate()) FOR [ActionDate]
END


End
GO
/****** Object:  Default [DF__tEmployee__Actio__37A5467C]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tEmployee__Actio__37A5467C]') AND parent_object_id = OBJECT_ID(N'[dbo].[tEmployeeDetails]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tEmployee__Actio__37A5467C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tEmployeeDetails] ADD  DEFAULT (getdate()) FOR [ActionDate]
END


End
GO
/****** Object:  Default [DF__tExportRe__ACTIO__38996AB5]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tExportRe__ACTIO__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[tExportRegisterBaseData]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tExportRe__ACTIO__38996AB5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tExportRegisterBaseData] ADD  DEFAULT (getdate()) FOR [ACTIONDATE]
END


End
GO
/****** Object:  Default [DF__tFinanceI__Actio__0D7A0286]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tFinanceI__Actio__0D7A0286]') AND parent_object_id = OBJECT_ID(N'[dbo].[tFinanceInvoice]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tFinanceI__Actio__0D7A0286]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tFinanceInvoice] ADD  DEFAULT (getdate()) FOR [ActionDate]
END


End
GO
/****** Object:  Default [DF__tFinanceI__Actio__14270015]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tFinanceI__Actio__14270015]') AND parent_object_id = OBJECT_ID(N'[dbo].[tFinanceInvoiceDocketDetails]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tFinanceI__Actio__14270015]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tFinanceInvoiceDocketDetails] ADD  DEFAULT (getdate()) FOR [ActionDate]
END


End
GO
/****** Object:  Default [DF__tFinanceI__Actio__1AD3FDA4]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tFinanceI__Actio__1AD3FDA4]') AND parent_object_id = OBJECT_ID(N'[dbo].[tFinanceInvoiceVersion]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tFinanceI__Actio__1AD3FDA4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tFinanceInvoiceVersion] ADD  DEFAULT (getdate()) FOR [ActionDate]
END


End
GO
/****** Object:  Default [DF__tLoadingC__Actio__5BE2A6F2]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tLoadingC__Actio__5BE2A6F2]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLoadingCheckSheet]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tLoadingC__Actio__5BE2A6F2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tLoadingCheckSheet] ADD  DEFAULT (getdate()) FOR [ActionDate]
END


End
GO
/****** Object:  Default [DF__tLoadingC__Actio__6EF57B66]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tLoadingC__Actio__6EF57B66]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLoadingCheckSheetContainerVersion]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tLoadingC__Actio__6EF57B66]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tLoadingCheckSheetContainerVersion] ADD  DEFAULT (getdate()) FOR [ActionDate]
END


End
GO
/****** Object:  Default [DF__tLoadingC__Actio__68487DD7]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tLoadingC__Actio__68487DD7]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLoadingCheckSheetPalletVersion]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tLoadingC__Actio__68487DD7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tLoadingCheckSheetPalletVersion] ADD  DEFAULT (getdate()) FOR [ActionDate]
END


End
GO
/****** Object:  Default [DF__tLogin__LastLogi__3A81B327]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tLogin__LastLogi__3A81B327]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLogin]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tLogin__LastLogi__3A81B327]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tLogin] ADD  DEFAULT (getdate()) FOR [LastLoginDate]
END


End
GO
/****** Object:  Default [DF__tLogin__IsRandom__3B75D760]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tLogin__IsRandom__3B75D760]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLogin]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tLogin__IsRandom__3B75D760]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tLogin] ADD  DEFAULT ((1)) FOR [IsRandomPwd]
END


End
GO
/****** Object:  Default [DF__tLogin__IsActive__3C69FB99]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tLogin__IsActive__3C69FB99]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLogin]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tLogin__IsActive__3C69FB99]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tLogin] ADD  DEFAULT ((1)) FOR [IsActive]
END


End
GO
/****** Object:  Default [DF__tWareHous__Actio__3D5E1FD2]    Script Date: 07/30/2016 18:55:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tWareHous__Actio__3D5E1FD2]') AND parent_object_id = OBJECT_ID(N'[dbo].[tWareHouseMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tWareHous__Actio__3D5E1FD2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tWareHouseMaster] ADD  DEFAULT (getdate()) FOR [ActionDate]
END


End
GO
/****** Object:  ForeignKey [FK__tDispatch__Creat__4AB81AF0]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tDispatch__Creat__4AB81AF0]') AND parent_object_id = OBJECT_ID(N'[dbo].[tDispatchInstructionNote]'))
ALTER TABLE [dbo].[tDispatchInstructionNote]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tLogin] ([LoginId])
GO
/****** Object:  ForeignKey [FK__tDispatch__Creat__5165187F]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tDispatch__Creat__5165187F]') AND parent_object_id = OBJECT_ID(N'[dbo].[tDispatchInstructionNoteVersion]'))
ALTER TABLE [dbo].[tDispatchInstructionNoteVersion]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tLogin] ([LoginId])
GO
/****** Object:  ForeignKey [FK__tDispatch__Creat__52593CB8]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tDispatch__Creat__52593CB8]') AND parent_object_id = OBJECT_ID(N'[dbo].[tDispatchInstructionNoteVersion]'))
ALTER TABLE [dbo].[tDispatchInstructionNoteVersion]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tLogin] ([LoginId])
GO
/****** Object:  ForeignKey [FK__tDispatch__Dispa__5070F446]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tDispatch__Dispa__5070F446]') AND parent_object_id = OBJECT_ID(N'[dbo].[tDispatchInstructionNoteVersion]'))
ALTER TABLE [dbo].[tDispatchInstructionNoteVersion]  WITH CHECK ADD FOREIGN KEY([DispatchInstructionNoteId])
REFERENCES [dbo].[tDispatchInstructionNote] ([DispatchInstructionNoteId])
GO
/****** Object:  ForeignKey [FK__tEmployee__Depar__3F466844]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tEmployee__Depar__3F466844]') AND parent_object_id = OBJECT_ID(N'[dbo].[tEmployeeDetails]'))
ALTER TABLE [dbo].[tEmployeeDetails]  WITH CHECK ADD FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[tDepartments] ([DepartmentId])
GO
/****** Object:  ForeignKey [FK__tEmployee__Desig__403A8C7D]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tEmployee__Desig__403A8C7D]') AND parent_object_id = OBJECT_ID(N'[dbo].[tEmployeeDetails]'))
ALTER TABLE [dbo].[tEmployeeDetails]  WITH CHECK ADD FOREIGN KEY([DesignationId])
REFERENCES [dbo].[tDesignation] ([DesignationId])
GO
/****** Object:  ForeignKey [FK__tExportRe__CREAT__412EB0B6]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tExportRe__CREAT__412EB0B6]') AND parent_object_id = OBJECT_ID(N'[dbo].[tExportRegisterBaseData]'))
ALTER TABLE [dbo].[tExportRegisterBaseData]  WITH CHECK ADD FOREIGN KEY([CREATEDBY])
REFERENCES [dbo].[tLogin] ([LoginId])
GO
/****** Object:  ForeignKey [FK__tFinanceI__Creat__0C85DE4D]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tFinanceI__Creat__0C85DE4D]') AND parent_object_id = OBJECT_ID(N'[dbo].[tFinanceInvoice]'))
ALTER TABLE [dbo].[tFinanceInvoice]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tLogin] ([LoginId])
GO
/****** Object:  ForeignKey [FK__tFinanceI__Dispa__0B91BA14]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tFinanceI__Dispa__0B91BA14]') AND parent_object_id = OBJECT_ID(N'[dbo].[tFinanceInvoice]'))
ALTER TABLE [dbo].[tFinanceInvoice]  WITH CHECK ADD FOREIGN KEY([DispatchInstructionNoteId])
REFERENCES [dbo].[tDispatchInstructionNote] ([DispatchInstructionNoteId])
GO
/****** Object:  ForeignKey [FK__tFinanceI__Creat__1332DBDC]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tFinanceI__Creat__1332DBDC]') AND parent_object_id = OBJECT_ID(N'[dbo].[tFinanceInvoiceDocketDetails]'))
ALTER TABLE [dbo].[tFinanceInvoiceDocketDetails]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tLogin] ([LoginId])
GO
/****** Object:  ForeignKey [FK__tFinanceI__Finan__123EB7A3]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tFinanceI__Finan__123EB7A3]') AND parent_object_id = OBJECT_ID(N'[dbo].[tFinanceInvoiceDocketDetails]'))
ALTER TABLE [dbo].[tFinanceInvoiceDocketDetails]  WITH CHECK ADD FOREIGN KEY([FinanceInvoiceId])
REFERENCES [dbo].[tFinanceInvoice] ([FinanceInvoiceId])
GO
/****** Object:  ForeignKey [FK__tFinanceI__Creat__19DFD96B]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tFinanceI__Creat__19DFD96B]') AND parent_object_id = OBJECT_ID(N'[dbo].[tFinanceInvoiceVersion]'))
ALTER TABLE [dbo].[tFinanceInvoiceVersion]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tLogin] ([LoginId])
GO
/****** Object:  ForeignKey [FK__tFinanceI__Finan__18EBB532]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tFinanceI__Finan__18EBB532]') AND parent_object_id = OBJECT_ID(N'[dbo].[tFinanceInvoiceVersion]'))
ALTER TABLE [dbo].[tFinanceInvoiceVersion]  WITH CHECK ADD FOREIGN KEY([FinanceInvoiceId])
REFERENCES [dbo].[tFinanceInvoice] ([FinanceInvoiceId])
GO
/****** Object:  ForeignKey [FK__tLoadingC__Creat__5AEE82B9]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tLoadingC__Creat__5AEE82B9]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLoadingCheckSheet]'))
ALTER TABLE [dbo].[tLoadingCheckSheet]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tLogin] ([LoginId])
GO
/****** Object:  ForeignKey [FK__tLoadingC__Creat__619B8048]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tLoadingC__Creat__619B8048]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLoadingCheckSheet]'))
ALTER TABLE [dbo].[tLoadingCheckSheet]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tLogin] ([LoginId])
GO
/****** Object:  ForeignKey [FK__tLoadingC__Dispa__59FA5E80]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tLoadingC__Dispa__59FA5E80]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLoadingCheckSheet]'))
ALTER TABLE [dbo].[tLoadingCheckSheet]  WITH CHECK ADD FOREIGN KEY([DispatchInstructionNoteId])
REFERENCES [dbo].[tDispatchInstructionNote] ([DispatchInstructionNoteId])
GO
/****** Object:  ForeignKey [FK__tLoadingC__Creat__6D0D32F4]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tLoadingC__Creat__6D0D32F4]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLoadingCheckSheetContainerVersion]'))
ALTER TABLE [dbo].[tLoadingCheckSheetContainerVersion]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tLogin] ([LoginId])
GO
/****** Object:  ForeignKey [FK__tLoadingC__Loadi__6E01572D]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tLoadingC__Loadi__6E01572D]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLoadingCheckSheetContainerVersion]'))
ALTER TABLE [dbo].[tLoadingCheckSheetContainerVersion]  WITH CHECK ADD FOREIGN KEY([LoadingCheckSheetId])
REFERENCES [dbo].[tLoadingCheckSheet] ([LoadingCheckSheetId])
GO
/****** Object:  ForeignKey [FK__tLoadingC__Creat__6754599E]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tLoadingC__Creat__6754599E]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLoadingCheckSheetPalletVersion]'))
ALTER TABLE [dbo].[tLoadingCheckSheetPalletVersion]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tLogin] ([LoginId])
GO
/****** Object:  ForeignKey [FK__tLoadingC__Loadi__66603565]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tLoadingC__Loadi__66603565]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLoadingCheckSheetPalletVersion]'))
ALTER TABLE [dbo].[tLoadingCheckSheetPalletVersion]  WITH CHECK ADD FOREIGN KEY([LoadingCheckSheetId])
REFERENCES [dbo].[tLoadingCheckSheet] ([LoadingCheckSheetId])
GO
/****** Object:  ForeignKey [FK__tLogin__Employee__4316F928]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tLogin__Employee__4316F928]') AND parent_object_id = OBJECT_ID(N'[dbo].[tLogin]'))
ALTER TABLE [dbo].[tLogin]  WITH CHECK ADD FOREIGN KEY([EmployeeDetailsId])
REFERENCES [dbo].[tEmployeeDetails] ([EmployeeDetailsId])
GO
/****** Object:  ForeignKey [FK__tWareHous__Creat__440B1D61]    Script Date: 07/30/2016 18:55:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__tWareHous__Creat__440B1D61]') AND parent_object_id = OBJECT_ID(N'[dbo].[tWareHouseMaster]'))
ALTER TABLE [dbo].[tWareHouseMaster]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tLogin] ([LoginId])
GO
