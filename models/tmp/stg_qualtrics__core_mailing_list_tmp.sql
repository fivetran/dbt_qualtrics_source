{{ config(enabled=var('qualtrics__using_core_mailing_lists', false)) }}

select * 
from {{ var('core_mailing_list') }}
