with 
-- import models
address as (
    select *
    from {{ ref('stg_localizacao__address')}}
)
, businessentityaddress as (
    select *
    from {{ ref('stg_localizacao__businessentityaddress')}}
)
, countryregion as (
    select *
    from {{ ref('stg_localizacao__countryregion')}}
)
, stateprovince as (
    select *
    from {{ ref('stg_localizacao__stateprovince')}}
)
-- transformações
-- Primeira transformação: Juntar estado/província com país

, joined_estado_pais as (
    select
        stateprovince.estado_id as estado_id,
        stateprovince.estado_codigo as estado_codigo,
        stateprovince.estado_codigo_pais as estado_codigo_pais,
        stateprovince.estado_nome as estado_nome,
        stateprovince.estado_territorio_id as estado_territorio_id,
        countryregion.pais_nome as pais_nome
from stateprovince
        left join countryregion on stateprovince.estado_codigo_pais = countryregion.pais_codigo
)

-- Segunda transformação: Juntar endereço com o resultado anterior (estado + país)

, joined_endereco_completo as (
    select 
        address.address_endereco_id as endereco_id,
        address.address_cidade as cidade,
        address.address_estado_id as estado_id,
        address.address_codigo_id as codigo_id,
        joined_estado_pais.estado_codigo as estado_codigo,
        joined_estado_pais.estado_codigo_pais as codigo_pais,
        joined_estado_pais.estado_nome as estado_nome, 
        joined_estado_pais.estado_territorio_id as territorio_id,
        joined_estado_pais.pais_nome as pais_nome
from address
    left join joined_estado_pais on address.address_estado_id = joined_estado_pais.estado_id
)

--select *
--from joined_endereco_completo

-- Terceira transformação: Juntar com businessentityaddress para obter o ID do cliente

, joined_final as (
    select 
        joined_endereco_completo.endereco_id,
        joined_endereco_completo.cidade,
        joined_endereco_completo.estado_id,
        joined_endereco_completo.codigo_id,
        joined_endereco_completo.estado_codigo,
        joined_endereco_completo.codigo_pais,
        joined_endereco_completo.estado_nome,
        joined_endereco_completo.territorio_id,
        joined_endereco_completo.pais_nome,
        businessentityaddress.businessentityaddress_cliente_id as cliente_id,
        businessentityaddress.businessentityaddress_endereco_tipo as endereco_tipo
from joined_endereco_completo
    left join businessentityaddress on joined_endereco_completo.endereco_id = businessentityaddress.businessentityaddress_endereco_id
)

select *
from joined_final

