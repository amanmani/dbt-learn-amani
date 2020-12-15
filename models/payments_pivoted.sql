{% set payment_methods=dbt_utils.get_column_values(table=ref('stg_payments'), column='payment_method', max_records=50, default=[]) %}
select
  order_id,
  {%- for payment_method in payment_methods %} 
  sum(case when payment_method = '{{ payment_method }}' then amount end) as {{ payment_method}} 
     {%- if not loop.last  %}, 
     {%- endif -%}
  {% endfor %}
from {{ ref('stg_payments') }}
group by 1
--Trailing comma 
--Whitespace
--Dynamic