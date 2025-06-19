with 
-- import models
salesorderdatail as (
    select *
    from {{ ref('stg_produto__product')}}
)
salesorderheader as (
    select *
    from {{ ref('stg_produto__productcategory')}}
)

-- transformaçao
,-- joined as (
    select 

, from stg_pagamento__creditcard
    left join personcreditcard on stg_pagamento__creditcard.creditcard_id = stg_pagamento__personcreditcard.personcreditcard_cartaoid
)

select *
from joined