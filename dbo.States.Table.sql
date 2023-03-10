USE [CodyMappingTraining]
GO
/****** Object:  Table [dbo].[States]    Script Date: 1/26/2023 12:28:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[StateName] [varchar](50) NOT NULL,
	[StateAbbreviation] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'ALABAMA', N'AL')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'ALASKA', N'AK')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'ARIZONA', N'AZ')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'ARKANSAS', N'AR')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'CALIFORNIA', N'CA')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'COLORADO', N'CO')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'CONNECTICUT', N'CT')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'DELAWARE', N'DE')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'DISTRICT OF COLUMBIA', N'DC')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'FLORIDA', N'FL')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'GEORGIA', N'GA')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'HAWAII', N'HI')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'IDAHO', N'ID')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'ILLINOIS', N'IL')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'INDIANA', N'IN')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'IOWA', N'IA')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'KANSAS', N'KS')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'KENTUCKY', N'KY')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'LOUISIANA', N'LA')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'MAINE', N'ME')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'MARYLAND', N'MD')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'MASSACHUSETTS', N'MA')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'MICHIGAN', N'MI')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'MINNESOTA', N'MN')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'MISSISSIPPI', N'MS')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'MISSOURI', N'MO')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'MONTANA', N'MT')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'NEBRASKA', N'NE')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'NEVADA', N'NV')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'NEW HAMPSHIRE', N'NH')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'NEW JERSEY', N'NJ')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'NEW MEXICO', N'NM')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'NEW YORK', N'NY')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'NORTH CAROLINA', N'NC')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'NORTH DAKOTA', N'ND')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'OHIO', N'OH')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'OKLAHOMA', N'OK')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'OREGON', N'OR')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'PENNSYLVANIA', N'PA')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'PUERTO RICO', N'PR')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'RHODE ISLAND', N'RI')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'SOUTH CAROLINA', N'SC')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'SOUTH DAKOTA', N'SD')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'TENNESSEE', N'TN')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'TEXAS', N'TX')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'UTAH', N'UT')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'VERMONT', N'VT')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'VIRGINIA', N'VA')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'WASHINGTON', N'WA')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'WEST VIRGINIA', N'WV')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'WISCONSIN', N'WI')
INSERT [dbo].[States] ([StateName], [StateAbbreviation]) VALUES (N'WYOMING', N'WY')
GO
