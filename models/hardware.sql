{{
 config(
 materialized = "table", 
 file_format = "delta"
 )
}}

with source_data as (

    select date, model, count(failure) as failure_count
    from confessions.default.hard_drive_failures
    group by date, model 

)

select *
from source_data

