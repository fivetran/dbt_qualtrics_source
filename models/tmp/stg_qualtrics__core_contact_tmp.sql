{{ config(enabled=var('qualtrics__using_core_contacts', false)) }}
-- can disable 
{{
    qualtrics_union_data(
        table_identifier='core_contact', 
        database_variable='qualtrics_database', 
        schema_variable='qualtrics_schema', 
        default_database=target.database,
        default_schema='qualtrics',
        default_variable='core_contact',
        union_schema_variable='qualtrics_union_schemas',
        union_database_variable='qualtrics_union_databases'
    )
}}