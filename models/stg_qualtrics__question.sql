
with base as (

    select * 
    from {{ ref('stg_qualtrics__question_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_qualtrics__question_tmp')),
                staging_columns=get_question_columns()
            )
        }}
    from base
),

final as (
    
    select 
        data_export_tag,
        data_visibility_hidden,
        data_visibility_private,
        id as question_id,
        next_answer_id,
        next_choice_id,
        question_description,
        question_description_option,
        question_text,
        question_text_unsafe,
        question_type,
        selector,
        sub_selector,
        survey_id,
        validation_setting_force_response,
        validation_setting_force_response_type,
        validation_setting_type,
        _fivetran_deleted as is_deleted,
        _fivetran_synced
    from fields
)

select *
from final
