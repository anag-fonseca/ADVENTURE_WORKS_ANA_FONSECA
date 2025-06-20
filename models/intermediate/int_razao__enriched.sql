with 
-- import models
salesreson as (
    select *
    from {{ ref('stg_razao__salesreason')}}
)
, salesorderheadersalesreason as (
    select *
    from {{ ref('stg_razao__salesorderheadersalesreason')}}
)

-- transformaçao para razões de vendas
, joined as (
    select
        salesorderheadersalesreason.pedido_razao_sk,
        salesorderheadersalesreason.salesorderheadersalesreason_pedido_id as pedido_id,
        salesorderheadersalesreason.salesorderheadersalesreason_razao_id as razao_id,
        salesreson.salesreason_nome as nome_razao,
        salesreson.salesreason_tipo as tipo_razao
from salesorderheadersalesreason
    left join salesreson on salesorderheadersalesreason.salesorderheadersalesreason_razao_id = salesreson.salesreason_id
)

select *
from joined