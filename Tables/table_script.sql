USE [s16guest26]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 5/1/2016 2:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] NOT NULL,
	[Zip] [char](18) NULL,
	[Street] [char](18) NULL,
	[State] [char](18) NULL,
	[City] [char](18) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 5/1/2016 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchId] [int] NOT NULL,
	[IterationId] [int] NOT NULL,
	[VersionId] [int] NOT NULL,
	[BranchName] [char](18) NULL,
 CONSTRAINT [XPKBranch] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Commits]    Script Date: 5/1/2016 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commits](
	[CommitId] [int] NOT NULL,
	[BranchId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 5/1/2016 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] NOT NULL,
	[Name] [char](18) NULL,
 CONSTRAINT [XPKCompany] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/1/2016 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] NOT NULL,
	[FirstName] [char](18) NULL,
	[CompanyId] [int] NOT NULL,
	[LastName] [char](18) NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [XPKCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Download]    Script Date: 5/1/2016 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Download](
	[DownloadID] [int] NOT NULL,
	[Date] [datetime] NULL,
	[CustomerId] [int] NOT NULL,
	[ReleaseId] [int] NOT NULL,
	[VersionId] [int] NOT NULL,
 CONSTRAINT [XPKDownload] PRIMARY KEY CLUSTERED 
(
	[DownloadID] ASC,
	[CustomerId] ASC,
	[ReleaseId] ASC,
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feature]    Script Date: 5/1/2016 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feature](
	[FeatureID] [int] NOT NULL,
	[Description] [char](1) NULL,
	[VersionId] [int] NOT NULL,
 CONSTRAINT [XPKFeature] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC,
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Iteration]    Script Date: 5/1/2016 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Iteration](
	[IterationName] [nchar](10) NULL,
	[IterationId] [int] NOT NULL,
	[VersionId] [int] NOT NULL,
 CONSTRAINT [XPKIteration] PRIMARY KEY CLUSTERED 
(
	[IterationId] ASC,
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phone]    Script Date: 5/1/2016 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phone](
	[PhoneId] [int] NOT NULL,
	[Work] [char](18) NULL,
	[Home] [char](18) NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [XPKPhone] PRIMARY KEY CLUSTERED 
(
	[PhoneId] ASC,
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/1/2016 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] NOT NULL,
	[ProudctName] [char](18) NULL,
 CONSTRAINT [XPKProduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Release]    Script Date: 5/1/2016 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Release](
	[ReleaseId] [int] NOT NULL,
	[Description] [char](1) NULL,
	[Date] [datetime] NULL,
	[VersionId] [int] NOT NULL,
 CONSTRAINT [XPKRelease] PRIMARY KEY CLUSTERED 
(
	[ReleaseId] ASC,
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Version]    Script Date: 5/1/2016 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Version](
	[VersionId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [XPKVersion] PRIMARY KEY CLUSTERED 
(
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Version_Features]    Script Date: 5/1/2016 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Version_Features](
	[VersionId] [int] NOT NULL,
	[FeatureId] [char](18) NULL,
 CONSTRAINT [XPKVersion_Features] PRIMARY KEY CLUSTERED 
(
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [R_7] FOREIGN KEY([IterationId], [VersionId])
REFERENCES [dbo].[Iteration] ([IterationId], [VersionId])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [R_7]
GO
ALTER TABLE [dbo].[Commits]  WITH CHECK ADD  CONSTRAINT [FK_Commits_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Commits] CHECK CONSTRAINT [FK_Commits_Branch]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Address]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Company]
GO
ALTER TABLE [dbo].[Download]  WITH CHECK ADD  CONSTRAINT [FK_Download_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Download] CHECK CONSTRAINT [FK_Download_Customer]
GO
ALTER TABLE [dbo].[Download]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([ReleaseId], [VersionId])
REFERENCES [dbo].[Release] ([ReleaseId], [VersionId])
GO
ALTER TABLE [dbo].[Download] CHECK CONSTRAINT [R_12]
GO
ALTER TABLE [dbo].[Feature]  WITH CHECK ADD  CONSTRAINT [R_3] FOREIGN KEY([VersionId])
REFERENCES [dbo].[Version_Features] ([VersionId])
GO
ALTER TABLE [dbo].[Feature] CHECK CONSTRAINT [R_3]
GO
ALTER TABLE [dbo].[Iteration]  WITH CHECK ADD  CONSTRAINT [R_5] FOREIGN KEY([VersionId])
REFERENCES [dbo].[Version] ([VersionId])
GO
ALTER TABLE [dbo].[Iteration] CHECK CONSTRAINT [R_5]
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [R_10] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [R_10]
GO
ALTER TABLE [dbo].[Release]  WITH CHECK ADD  CONSTRAINT [R_4] FOREIGN KEY([VersionId])
REFERENCES [dbo].[Version] ([VersionId])
GO
ALTER TABLE [dbo].[Release] CHECK CONSTRAINT [R_4]
GO
ALTER TABLE [dbo].[Version]  WITH CHECK ADD  CONSTRAINT [R_1] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Version] CHECK CONSTRAINT [R_1]
GO
ALTER TABLE [dbo].[Version_Features]  WITH CHECK ADD  CONSTRAINT [R_2] FOREIGN KEY([VersionId])
REFERENCES [dbo].[Version] ([VersionId])
GO
ALTER TABLE [dbo].[Version_Features] CHECK CONSTRAINT [R_2]
GO
