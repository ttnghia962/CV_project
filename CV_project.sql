USE [CV_pj]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/21/2023 10:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [nchar](10) NOT NULL,
	[PassIDLv2] [nchar](10) NOT NULL,
	[Username] [nchar](10) NULL,
	[Password] [nchar](10) NULL,
	[Status] [nchar](10) NULL,
	[FullName] [nchar](10) NULL,
	[Age] [nchar](10) NULL,
	[Address] [nchar](10) NULL,
	[RoleID] [nchar](10) NULL,
	[PhoneNumber] [nchar](10) NULL,
	[Email] [nchar](10) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 5/21/2023 10:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar](
	[AccountID] [nchar](10) NULL,
	[calendarID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED 
(
	[calendarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calendar_note]    Script Date: 5/21/2023 10:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar_note](
	[CalendarID] [nchar](10) NULL,
	[Time] [nchar](10) NULL,
	[Note] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invest]    Script Date: 5/21/2023 10:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invest](
	[AccountID] [nchar](10) NULL,
	[totalMoney] [nchar](10) NULL,
	[Boxname] [nchar](10) NULL,
	[BoxPercent] [nchar](10) NULL,
	[BoxID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Invest] PRIMARY KEY CLUSTERED 
(
	[BoxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invest_Detail]    Script Date: 5/21/2023 10:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invest_Detail](
	[BoxID] [nchar](10) NULL,
	[Detail] [nchar](10) NULL,
	[Date] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PassLv2]    Script Date: 5/21/2023 10:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PassLv2](
	[PassIDLv2] [nchar](10) NOT NULL,
	[status] [nchar](10) NULL,
	[PassQuestion] [nchar](10) NULL,
	[PassAnswer] [nchar](10) NULL,
 CONSTRAINT [PK_PassLv2] PRIMARY KEY CLUSTERED 
(
	[PassIDLv2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_PassLv2] FOREIGN KEY([PassIDLv2])
REFERENCES [dbo].[PassLv2] ([PassIDLv2])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_PassLv2]
GO
ALTER TABLE [dbo].[Calendar]  WITH CHECK ADD  CONSTRAINT [FK_Calendar_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Calendar] CHECK CONSTRAINT [FK_Calendar_Account]
GO
ALTER TABLE [dbo].[Calendar_note]  WITH CHECK ADD  CONSTRAINT [FK_Clendar_note_Calendar] FOREIGN KEY([CalendarID])
REFERENCES [dbo].[Calendar] ([calendarID])
GO
ALTER TABLE [dbo].[Calendar_note] CHECK CONSTRAINT [FK_Clendar_note_Calendar]
GO
ALTER TABLE [dbo].[Invest]  WITH CHECK ADD  CONSTRAINT [FK_Invest_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Invest] CHECK CONSTRAINT [FK_Invest_Account]
GO
ALTER TABLE [dbo].[Invest_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Invest_Detail_Invest] FOREIGN KEY([BoxID])
REFERENCES [dbo].[Invest] ([BoxID])
GO
ALTER TABLE [dbo].[Invest_Detail] CHECK CONSTRAINT [FK_Invest_Detail_Invest]
GO
