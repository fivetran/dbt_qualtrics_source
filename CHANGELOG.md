# dbt_qualtrics_source v0.1.0
This is the initial release of the Qualtrics dbt source package!

# 📣 What does this dbt package do?
<!--section="qualtrics_source_model"-->
- Materializes [Qualtrics staging tables](https://fivetran.github.io/dbt_qualtrics_source/#!/overview/github_source/models/?g_v=1) which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/qualtrics/#schemainformation). These staging tables clean, test, and prepare your Qualtrics data from [Fivetran's connector](https://fivetran.com/docs/applications/qualtrics) for analysis by doing the following:
  - Name columns for consistency across all packages and for easier analysis
    - Primary keys are renamed from `id` to `<table name>_id`. 
    - Foreign key names explicitly map onto their related tables (ie `owner_id` -> `owner_user_id`).
    - Datetime fields are renamed to `<event happened>_at`.
  - Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your Qualtrics data through the [dbt docs site](https://fivetran.github.io/dbt_qualtrics_source/).
- These tables are designed to work simultaneously with our [Qualtrics transformation package](https://github.com/fivetran/dbt_qualtrics).