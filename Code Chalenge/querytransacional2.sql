



select distinct

       A.ID_Assinatura
	  ,f.DDD
	  ,A.Numero_Tel
	 ,A.ID_Produto	 
	 ,b.Dt_Assinatura
	   ,b.Dt_Cancelamento
	   ,1 qtd_assinatura	 
	  ,case when Dt_Cancelamento is null then 0 else 1 end qtd_cancelamento
	  ,d.volta
	  ,c.valor
	  ,case when Dt_Cancelamento is null then 'N' else 'S' end deixa
	  ,0 Pendente

from [dbo].[tblTransacao] A  
inner join [dbo].[tblAssinatura] B ON (A.ID_Assinatura=B.ID_Assinatura)
inner join (select ID_Assinatura, sum(Valor) valor from [dbo].[tblTransacao]  group by ID_Assinatura) c on (c.ID_Assinatura = a.ID_Assinatura)
inner join (select numero_tel,ID_Assinatura,case when count(*) < 2 then 'N' else 'S' end volta from [dbo].[tblTransacao] group by numero_tel,ID_Assinatura)d on(d.ID_Assinatura = a.ID_Assinatura)
inner join [dbo].[tblProduto] e on (e.ID_Produto = a.ID_Produto)
inner join [dbo].[tblDDD] f on(f.DDD = a.DDD)
--where A.NUMERO_TEL = 12753086422

UNION all


select distinct

       A.ID_Assinatura
	  ,a.DDD
	  ,A.Numero_Tel
	  ,A.ID_Produto
	  ,a.Dt_Assinatura
	   ,a.Dt_Cancelamento
	   ,1 qtd_assinatura
	  ,case when Dt_Cancelamento is null then 0 else 1 end qtd_cancelamento
	  ,'N' volta
	  ,0 valor
	  ,case when Dt_Cancelamento is null then 'N' else 'S' end deixa
	  ,1 Pendente

from  [dbo].[tblAssinatura] A


WHERE A.ID_Assinatura NOT IN(select DISTINCT ID_Assinatura from [dbo].[tblTransacao])
