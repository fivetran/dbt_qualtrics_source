# v0.2.0 dbt_qualtrics_source

[PR #5](https://github.com/fivetran/dbt_qualtrics_source/pull/5) includes the following updates: 

## 🚨 Breaking Changes: Bug Fixes 🚨
- Casted the following timestamp fields in the below models using the `dbt.type_timestamp()` macro. This is necessary to ensure all timestamps are consistently casted and do not experience datatype mismatches in downstream transformations.
    - stg_qualtrics__contact_mailing_list_membership
        - unsubscribed_at
    - stg_qualtrics__directory_contact
        - created_at
        - unsubscribed_from_directory_at
        - last_modified_at
    - stg_qualtrics__directory_mailing_list
        - created_at
        - last_modified_at
    - stg_qualtrics__distribution_contact
        - opened_at
        - response_completed_at
        - response_started_at
        - sent_at
    - stg_qualtrics__distribution
        - created_at
        - last_modified_at
        - send_at
        - survey_link_expires_at
    - stg_qualtrics__survey_response
        - finished_at
        - is_finished
        - last_modified_at
        - recorded_date
        - started_at
    - stg_qualtrics__survey_version
        - created_at
    - stg_qualtrics__survey
        - last_accessed_at
        - last_activated_at
        - last_modified_at
    - stg_qualtrics__user
        - account_created_at
        - account_expires_at
        - last_login_at
        - password_expires_at
        - password_last_changed_at

> Please note: this update will likely only impact Redshift destinations as it was found the connector synced these fields as `timestamp with time zone` when in fact they were without. Most users will not see any changes following this release. But we marked this as breaking to ensure no possible datatype conflicts downstream.

## Under the Hood
- Updated the maintainer PR template to resemble the most up to date format.
- Added the auto release GitHub Action for easier deployment.

# v0.1.0 dbt_qualtrics_source
Initial release!