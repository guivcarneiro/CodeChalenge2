USE [DM_CodeChallenge]
GO

/****** Object:  Table [dbo].[Dim_Produto]    Script Date: 21/03/2019 19:17:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Produto](
	[SK_Produto] [int] NOT NULL,
	[Nm_Produto] [varchar](150) NOT NULL,
	[Dsc_Produto] [varchar](300) NOT NULL,
	[Dt_Ativacao] [datetime] NOT NULL,
	[Status_Produto] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_Produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


