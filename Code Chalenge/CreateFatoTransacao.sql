USE [DM_CodeChallenge]
GO

/****** Object:  Table [dbo].[Fato_Transacao]    Script Date: 22/03/2019 16:07:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fato_Transacao](
	[ID_Transacao] [bigint] NOT NULL,
	[ID_Assinatura] [bigint] NOT NULL,
	[ID_Regiao] [varchar](2) NOT NULL,
	[Numero_Tel] [varchar](11) NOT NULL,
	[ID_Produto] [int] NOT NULL,
	[Step_Tarifacao] [smallint] NULL,
	[Dt_Transacao_amd] [date] NULL,
	[Dt_Transacao] [datetime] NULL,
	[Dt_Assinatura] [datetime] NULL,
	[Dt_Cancelamento] [datetime] NULL,
	[Status_Transacao] [bit] NULL,
	[Valor] [numeric](11, 5) NULL,
	[qtd_assinaturas] [int] NULL,
	[qtd_cancelamento] [int] NULL,
	[qtd_ativos] [int] NULL,
	[pendentes] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Transacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Fato_Transacao]  WITH CHECK ADD  CONSTRAINT [fk_Tempo] FOREIGN KEY([Dt_Transacao_amd])
REFERENCES [dbo].[Dim_Tempo] ([Data])
GO

ALTER TABLE [dbo].[Fato_Transacao] CHECK CONSTRAINT [fk_Tempo]
GO

ALTER TABLE [dbo].[Fato_Transacao]  WITH CHECK ADD  CONSTRAINT [fk_Transacao_Assinatura] FOREIGN KEY([ID_Assinatura])
REFERENCES [dbo].[Dim_Assinatura] ([ID_Assinatura])
GO

ALTER TABLE [dbo].[Fato_Transacao] CHECK CONSTRAINT [fk_Transacao_Assinatura]
GO

ALTER TABLE [dbo].[Fato_Transacao]  WITH CHECK ADD  CONSTRAINT [fk_Transacao_DDD] FOREIGN KEY([ID_Regiao])
REFERENCES [dbo].[Dim_Regiao] ([DDD])
GO

ALTER TABLE [dbo].[Fato_Transacao] CHECK CONSTRAINT [fk_Transacao_DDD]
GO

ALTER TABLE [dbo].[Fato_Transacao]  WITH CHECK ADD  CONSTRAINT [fk_Transacao_Produto] FOREIGN KEY([ID_Produto])
REFERENCES [dbo].[Dim_Produto] ([SK_Produto])
GO

ALTER TABLE [dbo].[Fato_Transacao] CHECK CONSTRAINT [fk_Transacao_Produto]
GO

ALTER TABLE [dbo].[Fato_Transacao]  WITH CHECK ADD  CONSTRAINT [fk_Transacao_ProdutoStep] FOREIGN KEY([ID_Produto], [Step_Tarifacao])
REFERENCES [dbo].[Dim_Produto_Plano] ([ID_Produto], [Step_Tarifacao])
GO

ALTER TABLE [dbo].[Fato_Transacao] CHECK CONSTRAINT [fk_Transacao_ProdutoStep]
GO


