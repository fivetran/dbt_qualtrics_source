
with base as (

    select * 
    from {{ ref('stg_qualtrics__distribution_contact_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_qualtrics__distribution_contact_tmp')),
                staging_columns=get_distribution_contact_columns()
            )
        }}
    from base
),

final as (
    
    select 
        contact_frequency_rule_id,
        contact_id,
        contact_lookup_id,
        distribution_id,
        opened_at,
        response_completed_at,
        response_id,
        response_started_at,
        sent_at,
        status,
        survey_link,
        survey_session_id,
        _fivetran_synced

    from fields
)

select *
from final
