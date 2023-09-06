{{ config(materialized='table')}}

with customerorders as (
   select c.customerid,concat(c.firstname,' ',c.lastname) as customername,
   count(o.orderid) as nooforders from PUBLIC.CUSTOMERS c 
   join PUBLIC.ORDERS o on c.customerid=o.customerid 
   group by c.customerid,customername 
   order by nooforders desc)
   select customerid,customername,nooforders from customerorders