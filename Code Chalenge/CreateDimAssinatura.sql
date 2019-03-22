USE [DM_CodeChallenge]
GO

/****** Object:  Table [dbo].[Dim_Assinatura]    Script Date: 22/03/2019 16:03:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Assinatura](
	[ID_Assinatura] [bigint] NOT NULL,
	[DDD] [varchar](2) NOT NULL,
	[Numero_Tel] [varchar](11) NOT NULL,
	[ID_Produto] [int] NULL,
	[Dt_Assinatura] [datetime] NULL,
	[Pendente] [bit] NULL,
	[Status_Assinatura] [bit] NULL,
	[Dt_Cancelamento] [datetime] NULL,
	[MotivoCancelamento] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Assinatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


