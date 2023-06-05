
with base as (

    select * 
    from {{ ref('stg_qualtrics__survey_response_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_qualtrics__survey_response_tmp')),
                staging_columns=get_survey_response_columns()
            )
        }}
    from base
),

final as (
    
    select 
        distribution_channel,
        duration_in_seconds,
        end_date as finished_at,
        cast(finished as {{ dbt.type_boolean() }}) as is_finished,
        id as response_id,
        ip_address,
        last_modified_date as last_modified_at,
        location_latitude,
        location_longitude,
        progress,
        recipient_email,
        recipient_first_name,
        recipient_last_name,
        recorded_date,
        start_date as started_at,
        status,
        survey_id,
        user_language,
        _fivetran_synced
    from fields
)

select *
from final
