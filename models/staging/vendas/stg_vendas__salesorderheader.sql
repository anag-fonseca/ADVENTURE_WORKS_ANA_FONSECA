with 

source as (

    select * from {{ source('vendas', 'salesorderheader') }}

),

renamed as (

    select
        cast(salesorderid as varchar) as salesorderheader_pedido_id,
        cast(revisionnumber as varchar) as salesorderheader_numero_revisao,
        cast(orderdate as varchar) as salesorderheader_data_pedido,
        cast(duedate as varchar) as salesorderheader_duedate,
        cast(shipdate as varchar) as salesorderheader_shipdate,
        cast(status as varchar) as salesorderheader_status,
        cast(onlineorderflag as varchar) as salesorderheader_onlineorderflag,
        cast(purchaseordernumber as varchar) as salesorderheader_purchadeordernumber,
        cast(accountnumber as varchar) as salesorderheader_accountnumber,
        cast(customerid as varchar) as salesorderheader_cosumidor_id,
        cast(salespersonid as varchar) as salesorderheader_cliente_id,
        cast(territoryid as varchar) as salesorderheader_territorio_id,
        cast(billtoaddressid as varchar) as salesorderheader_billtoadressid,
        cast(shiptoaddressid as varchar) as salesorderheader_shipadressid,
        cast(shipmethodid as varchar) as salesorderheader_shipmethodid,
        cast(creditcardid as varchar) as salesorderheader_cartao_id,
        cast(creditcardapprovalcode as varchar) as salesorderheader_codigo_aprovacao_cartao,
        cast(currencyrateid as varchar) as salesorderheader_currencyrateid,
        cast(subtotal as varchar) as salesorderheader_subtotal,
        cast(taxamt as varchar) as salesorderheader_imposto,
        cast(freight as varchar) as salesorderheader_frete,
        cast(totaldue as varchar) as salesorderheader_totaldue,
        cast(comment as varchar) as salesorderheader_comentario,
        cast(rowguid as varchar) as salesorderheader_rowguid,
        cast(modifieddate as varchar) as salesorderheader_data_modificacao

    from source

)

select * from renamed
