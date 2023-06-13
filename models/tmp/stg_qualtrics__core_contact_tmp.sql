{{ config(enabled=var('qualtrics__using_core_contacts', false)) }}

select * 
from {{ var('core_contact') }}
