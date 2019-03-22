USE [DM_CodeChallenge]
GO

/****** Object:  Table [dbo].[Dim_Produto_Plano]    Script Date: 22/03/2019 16:06:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Produto_Plano](
	[ID_Produto] [int] NOT NULL,
	[Plano] [varchar](30) NOT NULL,
	[Step_Tarifacao] [smallint] NOT NULL,
	[Valor_Step] [numeric](11, 5) NULL,
 CONSTRAINT [PK_ProdutoPlanoStep] PRIMARY KEY CLUSTERED 
(
	[ID_Produto] ASC,
	[Step_Tarifacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


