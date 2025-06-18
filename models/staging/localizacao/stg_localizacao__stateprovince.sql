with 

source as (

    select * from {{ source('localizacao', 'stateprovince') }}

),

renamed as (

    select
        cast(stateprovinceid as int) as state_id,
        cast(stateprovincecode as varchar) as state_codigo,
        cast(countryregioncode as varchar) as state_codigo_regiao,
        cast(isonlystateprovinceflag as varchar) as state_is_onlystateprovinceflag,
        cast(name as varchar) as state_nome,
        cast(territoryid as int) as state_territorio_id,
        cast(rowguid as varchar) as state_rowguid,
        cast(modifieddate as varchar) as state_data_modificacao

    from source

)

select * from renamed
