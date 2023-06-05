
with base as (

    select * 
    from {{ ref('stg_qualtrics__survey_version_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_qualtrics__survey_version_tmp')),
                staging_columns=get_survey_version_columns()
            )
        }}
    from base
),

final as (
    
    select 
        creation_date as created_at,
        description as version_description,
        id as version_id,
        published as is_published,
        survey_id,
        user_id as publisher_user_id,
        version_number,
        was_published,
        _fivetran_deleted as is_deleted,
        _fivetran_synced
    from fields
)

select *
from final
