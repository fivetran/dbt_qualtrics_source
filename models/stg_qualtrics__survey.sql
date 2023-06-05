
with base as (

    select * 
    from {{ ref('stg_qualtrics__survey_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_qualtrics__survey_tmp')),
                staging_columns=get_survey_columns()
            )
        }}
    from base
),

final as (
    
    select 
        auto_scoring_category,
        brand_base_url,
        brand_id,
        bundle_short_name,
        composition_type,
        creator_id as creator_user_id,
        default_scoring_category,
        division_id,
        id as survey_id,
        last_accessed as last_accessed_at,
        last_activated as last_activated_at
        last_modified as last_modified_at,
        owner_id as owner_user_id,
        project_category,
        project_type,
        registry_sha,
        registry_version,
        schema_version,
        scoring_summary_after_questions,
        scoring_summary_after_survey,
        scoring_summary_category,
        survey_name,
        survey_status,
        _fivetran_deleted as is_deleted,
        _fivetran_synced
    from fields
)

select *
from final
