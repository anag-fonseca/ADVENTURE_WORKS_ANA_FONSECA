with 
-- import models
personcreditcard as (
    select *
    from {{ ref('stg_pagamento__personcreditcard')}}
)
, creditcard as (
    select *
    from {{ ref('stg_pagamento__creditcard')}}
)

-- transformaçao para união das formas de pagamento
, joined as (
    select 
        creditcard.creditcard_id as cartao_id,
        creditcard.creditcard_tipo as tipo_cartao,
        creditcard.creditcard_numero as numero_cartao,
        creditcard.creditcard_val_mes as val_mes,
        creditcard.creditcard_val_ano as val_ano,
        personcreditcard.personcreditcard_clienteid as cliente_id
from creditcard
    left join personcreditcard on creditcard.creditcard_id = personcreditcard.personcreditcard_cartaoid
)

select *
from joined