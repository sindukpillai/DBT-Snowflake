Install dbt
**********************************************
Prerequisites:
*********************************************
Pythin 3.10 or later  - install
Microsoft visual studio  - install
Install python and dbt plugins in VS
**********************************************

Go to terminal and change to dbt_workspace directory by CD
create python virtual env by 
python -m venv dbt_env

activate virtal environment by 
.\dbt_venv\Scripts\Activate.ps1
***********************************************
install dbt with data platform
pip install dbt-snowflake 

create config folder at %userprofile% with name .dbt
initialise dbt project with
init dbt
account name : dqhllyh-ox77163
ware house : COMPUTE_WH
Role : ACCOUNTADMIN
Schema:dbt_inventory
Database:INVENTORY
Username:xxxx
Password:

 take project in visual studio
take dbt_project.yml file under project directory
   

verify connection at vs terminal by
dbt debug


Create model in visual studio
************************************************
Table -customers

customerid integer
firstname varchar
lastname varchar
email varchar
address varchar
city varchar

Table- orders

orderid integer
orderdate date
customerid integer
emloyeeid integer
storeid integer
status varchar

**************CTE to find best customers*********************
************************************************************

with customerorders as (
   select c.customerid,concat(c.firstname,' ',c.lastname) as 
	customername,
   count(o.orderid) as nooforders from PUBLIC.CUSTOMERS c 
   join PUBLIC.ORDERS o on c.customerid=o.customerid 
   group by c.customerid,customername 
   order by nooforders desc)
   select customerid,customername,nooforders from customerorders

***************************************************************
*************************************************************
Create new file under model in vs project
customerorders.sql
paste the above SQL statement 
save file

terminal - to run model
dbt run
model is created and output is saved as view under inventory database
view format output can be changed to table for the benefit of data analysts 
by adding a statement in customerorders.sql model file created
{{ config(materialized='table')}}
and materialized='table' instead of 'view' in project.yml file

Then the outut is created as table under inventory database 
and the table can be 
imported directly to visualise in power BI

*****************************************************


