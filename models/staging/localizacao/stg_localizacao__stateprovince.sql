with 

source as (

    select * from {{ source('localizacao', 'stateprovince') }}

),

renamed as (

    select
        cast(stateprovinceid as int) as estado_id,
        cast(stateprovincecode as varchar) as estado_codigo,
        cast(countryregioncode as varchar) as estado_codigo_pais,
        cast(isonlystateprovinceflag as varchar) as estado_is_onlystateprovinceflag,
        cast(name as varchar) as estado_nome,
        cast(territoryid as int) as estado_territorio_id,
        cast(rowguid as varchar) as estado_rowguid,
        cast(modifieddate as varchar) as estado_data_modificacao

    from source

)

select * from renamed
