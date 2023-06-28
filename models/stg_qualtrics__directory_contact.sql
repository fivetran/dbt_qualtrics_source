
with base as (

    select * 
    from {{ ref('stg_qualtrics__directory_contact_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_qualtrics__directory_contact_tmp')),
                staging_columns=get_directory_contact_columns()
            )
        }}

        {{ fivetran_utils.source_relation(
            union_schema_variable='qualtrics_union_schemas', 
            union_database_variable='qualtrics_union_databases') 
        }}
        
    from base
),

final as (
    
    select 
        creation_date as created_at,
        directory_id,
        directory_unsubscribe_date as unsubscribed_from_directory_at,
        directory_unsubscribed as is_unsubscribed_from_directory,
        lower(email) as email,
        lower(email_domain) as email_domain,
        ext_ref,
        first_name,
        last_name,
        phone,
        id as contact_id,
        language,
        last_modified as last_modified_at,
        write_blanks as can_write_blanks,
        _fivetran_synced,
        source_relation

        {{ fivetran_utils.fill_pass_through_columns('qualtrics__directory_contact_pass_through_columns') }}

    from fields
)

select *
from final
