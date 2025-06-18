with 

source as (

    select * from {{ source('produto', 'product') }}

),

renamed as (

    select
        cast(productid as int) as product_id,
        cast(name as varchar) as product_nome,
        cast(productnumber as varchar) as product_numero,
        cast(makeflag as varchar) as product_is_makeflag,
        cast(finishedgoodsflag as varchar) as product_is_finishedgoodsflag,
        cast(color as varchar) as product_cor,
        cast(safetystocklevel as varchar) as product_safetystocklevel,
        cast(reorderpoint as int) as product_reorderpoint,
        cast(standardcost as numeric) as product_custo_padrao,
        cast(listprice as numeric) as product_lista_preco,
        cast(size as varchar) as product_tamanho,
        cast(sizeunitmeasurecode as varchar) as product_sizeunitmeasurecode,
        cast(weightunitmeasurecode as varchar) as product_weightunitmeasurecode,
        cast(weight as varchar) as product_weight,
        cast(daystomanufacture as int) as product_dias_producao,
        cast(productline as varchar) as product_linha_producao,
        cast(class as varchar) as product_classe,
        cast(style as varchar) as product_estilo,
        cast(productsubcategoryid as varchar) as product_subcategoria_id,
        cast(productmodelid as varchar) as product_modelo_producao_id,
        cast(sellstartdate as varchar) as product_data_inicio,
        cast(sellenddate as varchar) as product_data_fim,
        cast(discontinueddate as varchar) as product_discontinuado_data,
        cast(rowguid as varchar) as product_rowguid,
        cast(modifieddate as varchar) as product_data_modificacao

    from source

)

select * from renamed
