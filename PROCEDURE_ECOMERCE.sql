USE [DDD_ECOMMERCE]
GO
/****** Object:  StoredProcedure [dbo].[SP_PRODUTOS_CARRINHO_USUARIO]    Script Date: 12/05/2021 21:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PRODUTOS_CARRINHO_USUARIO](
@CUS_ESTADO int ,
 @UserId VARCHAR(MAX)
)

AS
BEGIN 
select
 [PRD_ID],
 [PRD_NOME]
      ,[PRD_DESCRICAO]
      ,[PRD_OBSERVACAO]
      ,[PRD_VALO]
      ,[PRD_QTD_ESTOQUE]
      ,P.[UserId]
      ,[PRD_ESTADO]
      ,[PRD_DATA_CADASTRO]
      ,[PRD_DATA_ALTERACAO]
      ,[PRD_URL],
 C.CSU_QTD as QtdCompra,
C.CUS_ID as IdProdutoCarrinho
 from TB_PRODUTO P
join TB_COMPRA_USUARIO C on p.PRD_ID = C.IdProduto
join TB_COMPRA CO on C.IdCompra = CO.COM_ID

WHERE C.CUS_ESTADO = @CUS_ESTADO AND C.UserId = @UserId
END





