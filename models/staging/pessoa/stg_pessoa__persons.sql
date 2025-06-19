with 

source as (

    select * from {{ source('pessoa', 'person') }}

),

renamed as (

    select
        cast(businessentityid as int) as person_id,
        cast(persontype as varchar) as person_tipo,
        cast(namestyle as varchar) as person_nome_estilo,
        cast(title as varchar) as person_titulo,
        cast(firstname as varchar) as person_primeiro_nome,
        cast(middlename as varchar) as person_nome_meio,
        cast(lastname as varchar) as person_ultimo_nome,
        cast(suffix as varchar) as person_suffix,
        cast(emailpromotion as varchar) as person_email,
        cast(additionalcontactinfo as varchar) as person_outro_contato,
        cast(demographics as varchar) as person_demografia,
        cast(rowguid as varchar) as person_rowguid,
        cast(modifieddate as varchar) as person_data_modificacao

    from source

)

select * from renamed
