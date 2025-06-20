with
    int_pagamento as (
        select *
        from {{ ref('int_pagamento__enriched')}}
    )

    select *
    from int_pagamento