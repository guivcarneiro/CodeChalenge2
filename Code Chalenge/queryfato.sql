

select 
    id_transacao
	,isnull(a.ID_Assinatura,-1) ID_Assinatura
	,isnull(a.ddd,-1) ID_Regiao
	,isnull(a.Numero_Tel,-1) Numero_Tel
	,isnull(a.ID_Produto,-1) ID_Produto
	,isnull(a.Step_Tarifacao,-1) Step_Tarifacao
	,isnull(a.Dt_Transacao,'1900-01-01')Dt_Transacao
	,isnull( b.Dt_Assinatura,'1900-01-01') Dt_Assinatura
	,isnull( b.Dt_Cancelamento,'1900-01-01') Dt_Cancelamento
	,a.Status_Transacao
	,a.valor 
	,1 qtd_assinaturas 
	,case when b.Dt_Cancelamento is null then 0 else 1 end qtd_cancelamento
	,case when b.Status_Assinatura = 1 then 1 else 0 end qtd_ativo
	,case when b.Pendente = 1 then 1 else 0 end pendentes

from  [dbo].[tblTransacao] a
inner join [DM_CodeChallenge].[dbo].[Dim_Assinatura] B ON (A.ID_Assinatura=B.ID_Assinatura)
inner join [DM_CodeChallenge].[dbo].[Dim_Produto] c on (a.ID_Produto = c.SK_Produto)
inner join [DM_CodeChallenge].[dbo].[Dim_Produto_Plano] d on (d.id_produto =  a.ID_Produto)
inner join [DM_CodeChallenge].[dbo].[Dim_Regiao]  e on (e.DDD = a.DDD)
inner join [DM_CodeChallenge].[dbo].[Dim_Tempo] f on (f.data = convert(date,a.Dt_Transacao,100))


group by   id_transacao
	,a.ID_Assinatura
	,a.ddd
	,a.Numero_Tel
	,a.ID_Produto
	,a.Step_Tarifacao
	,a.Dt_Transacao
    ,b.Dt_Assinatura
	,b.Dt_Cancelamento
	,a.Status_Transacao
	,a.valor 
	,case when b.Dt_Cancelamento is null then 0 else 1 end 
	,case when b.Status_Assinatura = 1 then 1 else 0 end	
	,case when b.Pendente = 1 then 1 else 0 end



