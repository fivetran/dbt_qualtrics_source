
with base as (

    select * 
    from {{ ref('stg_qualtrics__contact_mailing_list_membership_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_qualtrics__contact_mailing_list_membership_tmp')),
                staging_columns=get_contact_mailing_list_membership_columns()
            )
        }}
    from base
),

final as (
    
    select 
        contact_id,
        contact_lookup_id,
        directory_id,
        mailing_list_id,
        name,
        owner_id as owner_user_id,
        unsubscribe_date as unsubscribed_at,
        unsubscribed as is_unsubscribed,
        _fivetran_synced

    from fields
)

select *
from final
