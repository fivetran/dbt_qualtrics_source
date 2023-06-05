
with base as (

    select * 
    from {{ ref('stg_qualtrics__directory_mailing_list_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_qualtrics__directory_mailing_list_tmp')),
                staging_columns=get_directory_mailing_list_columns()
            )
        }}
    from base
),

final as (
    
    select 
        creation_date as created_at,
        directory_id,
        id as directory_mailing_list_id,
        last_modified_date as last_modified_at,
        name,
        owner_id as owner_user_id,
        _fivetran_deleted as is_deleted,
        _fivetran_synced

    from fields
)

select *
from final
