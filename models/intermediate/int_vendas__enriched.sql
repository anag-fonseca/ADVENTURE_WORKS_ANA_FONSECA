with 
-- import models
salesorderdetail as (
    select *
    from {{ ref('stg_vendas__salesorderdetail')}}
)
, salesorderheader as (
    select *
    from {{ ref('stg_vendas__salesorderheader')}}
)

-- transformaçao para construção dos dados de venda

, joined as (
    select 
        salesorderheader.salesorderheader_pedido_id as pedido_id,
        salesorderheader.salesorderheader_data_pedido as data_pedido,
        salesorderheader.salesorderheader_status as status,
        salesorderheader.salesorderheader_cliente_id as cliente_id,
        salesorderheader.salesorderheader_vendedor_id as vendedor_id,
        salesorderheader.salesorderheader_territorio_id as territorio_id,
        salesorderheader.salesorderheader_cartao_id as cartao_id,
        salesorderheader.salesorderheader_subtotal as subtotal,
        salesorderheader.salesorderheader_imposto as imposto,
        salesorderheader.salesorderheader_frete as frete,
        salesorderheader.salesorderheader_totaldue as total,
        salesorderdetail.salesorderdetail_quantidade_pedido as quantidade_pedido,
        salesorderdetail.salesorderdetail_produto_id as produto_id,
        salesorderdetail.salesorderdetail_preco_unitario as preco_unitario,
        salesorderdetail.salesorderdetail_preco_unitario_desconto as preco_unitario_desconto,
from salesorderheader 
    left join salesorderdetail on salesorderheader.salesorderheader_pedido_id = salesorderdetail.salesorderdetail_pedido_id
)

select *
from joined