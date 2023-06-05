
with base as (

    select * 
    from {{ ref('stg_qualtrics__question_response_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_qualtrics__question_response_tmp')),
                staging_columns=get_question_response_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_id,
        loop_id,
        question_id,
        question,
        question_option_key,
        response_id,
        sub_question_key,
        sub_question_text,
        value,
        _fivetran_synced
    from fields
)

select *
from final
