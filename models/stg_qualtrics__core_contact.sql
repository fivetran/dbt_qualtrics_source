{{ config(enabled=var('qualtrics__using_core_contacts', false)) }}

with base as (

    select * 
    from {{ ref('stg_qualtrics__core_contact_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_qualtrics__core_contact_tmp')),
                staging_columns=get_core_contact_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as mailing_list_contact_id,
        mailing_list_id,
        first_name,
        last_name,
        email,
        external_data_reference,
        language,
        unsubscribed as is_unsubscribed,
        _fivetran_deleted as is_deleted,
        _fivetran_synced

        {{ fivetran_utils.fill_pass_through_columns('qualtrics__core_contact_pass_through_columns') }}

    from fields
)

select *
from final
