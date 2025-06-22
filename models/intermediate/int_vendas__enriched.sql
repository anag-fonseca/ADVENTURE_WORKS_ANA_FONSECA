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
        salesorderdetail.pedido_produto_sk,
        salesorderdetail.salesorderdetail_quantidade_pedido as quantidade_pedido,
        salesorderdetail.salesorderdetail_produto_id as produto_id,
        salesorderdetail.salesorderdetail_preco_unitario as preco_unitario,
        salesorderdetail.salesorderdetail_preco_unitario_desconto as preco_unitario_desconto,
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
        salesorderheader.salesorderheader_totaldue as total
from salesorderdetail
    left join salesorderheader on salesorderdetail.salesorderdetail_pedido_id = salesorderheader.salesorderheader_pedido_id
)
, metrics as (
    select
        pedido_produto_sk,
        quantidade_pedido,
        produto_id,
        preco_unitario,
        preco_unitario_desconto,
        pedido_id,
        data_pedido,
        status,
        cliente_id,
        vendedor_id,
        territorio_id,
        cartao_id,
        subtotal,
        imposto,
        frete,
        total,
        quantidade_pedido * preco_unitario as valor_bruto,
        cast( 
            (total/ count(pedido_produto_sk) over (partition by pedido_produto_sk)) as numeric) as valor_alocado,
        cast( 
            (frete/ count(pedido_produto_sk) over (partition by pedido_produto_sk)) as numeric) as frete_alocado,
        cast( 
            (imposto/ count(pedido_produto_sk) over (partition by pedido_produto_sk)) as numeric) as imposto_alocado,
        case
            when preco_unitario_desconto > 0 then true 
            else false 
            end as tem_desconto,
        case
           when status = 1 then 'Solicitado'
           when status = 2 then 'Aprovado'
           when status = 3 then 'Em producao'
           when status = 4 then 'Embalado'
           when status = 5 then 'Enviado'
           when status = 6 then 'Cancelado'
         end as status_2
    from joined
)

select *
from metrics
