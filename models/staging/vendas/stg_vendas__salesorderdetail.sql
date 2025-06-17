with 

source as (

    select * from {{ source('vendas', 'salesorderdetail') }}

),

renamed as (

    select
        cast(salesorderid as varchar) as salesorderdetail_pedido_id,
        cast(salesorderdetailid as varchar) as salesorderdetail_detalhe_id,
        cast(carriertrackingnumber as varchar) as salesorderdetail_carriertackingnumber,
        cast(orderqty as varchar) as salesorderdetail_quantidade_pedido,
        cast(productid as varchar) as salesorderdetail_produto_id,
        cast(specialofferid as varchar) as salesorderdetail_specialofferid,
        cast(unitprice as varchar) as salesorderdetail_preco_unitario,
        cast(unitpricediscount as varchar) as salesorderdetail_preco_unitario_desconto,
        cast(rowguid as varchar) as salesorderdetail_rowguid,
        cast(modifieddate as varchar) as salesorderdetail_data_modificacao

    from source

)

select * from renamed
