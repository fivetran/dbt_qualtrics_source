{{
    qualtrics_union_data(
        table_identifier='directory_contact', 
        database_variable='qualtrics_database', 
        schema_variable='qualtrics_schema', 
        default_database=target.database,
        default_schema='qualtrics',
        default_variable='directory_contact',
        union_schema_variable='qualtrics_union_schemas',
        union_database_variable='qualtrics_union_databases'
    )
}}