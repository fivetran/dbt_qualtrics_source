{{
    qualtrics_union_data(
        table_identifier='directory_mailing_list', 
        database_variable='qualtrics_database', 
        schema_variable='qualtrics_schema', 
        default_database=target.database,
        default_schema='qualtrics',
        default_variable='directory_mailing_list',
        union_schema_variable='qualtrics_union_schemas',
        union_database_variable='qualtrics_union_databases'
    )
}}