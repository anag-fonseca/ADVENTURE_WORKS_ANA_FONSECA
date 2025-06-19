with 

source as (

    select * from {{ source('vendas', 'salesorderheader') }}

),

renamed as (

    select
        cast(salesorderid as int) as salesorderheader_pedido_id,
        cast(revisionnumber as int) as salesorderheader_numero_revisao,
        cast(orderdate as varchar) as salesorderheader_data_pedido,
        cast(duedate as varchar) as salesorderheader_duedate,
        cast(shipdate as varchar) as salesorderheader_shipdate,
        cast(status as int) as salesorderheader_status,
        cast(onlineorderflag as varchar) as salesorderheader_is_onlineorderflag,
        cast(purchaseordernumber as varchar) as salesorderheader_purchadeordernumber,
        cast(accountnumber as varchar) as salesorderheader_accountnumber,
        cast(customerid as int) as salesorderheader_consumidor_id,
        cast(salespersonid as int) as salesorderheader_cliente_id,
        cast(territoryid as int) as salesorderheader_territorio_id,
        cast(billtoaddressid as int) as salesorderheader_billtoadressid,
        cast(shiptoaddressid as int) as salesorderheader_shipadressid,
        cast(shipmethodid as int) as salesorderheader_shipmethodid,
        cast(creditcardid as int) as salesorderheader_cartao_id,
        cast(creditcardapprovalcode as int) as salesorderheader_codigo_aprovacao_cartao,
        cast(currencyrateid as varchar) as salesorderheader_currencyrateid,
        cast(subtotal as numeric) as salesorderheader_subtotal,
        cast(taxamt as numeric) as salesorderheader_imposto,
        cast(freight as numeric) as salesorderheader_frete,
        cast(totaldue as numeric) as salesorderheader_totaldue,
        cast(comment as varchar) as salesorderheader_comentario,
        cast(rowguid as varchar) as salesorderheader_rowguid,
        cast(modifieddate as varchar) as salesorderheader_data_modificacao

    from source

)

select * from renamed
