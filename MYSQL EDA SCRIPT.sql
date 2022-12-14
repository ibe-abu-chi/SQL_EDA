#THIS COMMAND SHOWS ALL REDORDS IN THE SALESTABLE OF THE COMPANY_SALES DATABASE
SELECT * FROM salestable

#THIS COMMAND SUMS ALL PROFITS MADE = 2224615
SELECT sum(Profit)
from salestable

#AVERAGE PROFIT MADE IS = 3875
SELECT avg(Profit)
from salestable

#THIS COMMAND SHOWS TOTAL SUM OF REVENUE MADE = 3733767
SELECT sum(Revenue)
from salestable;

#THIS COMMAND SUMS ALL UNITS SOLD = 1067761
SELECT sum(UnitsSold)
from salestable;

#AVERAGE UNITS SOLD = 1860
SELECT avg(UnitsSold)
from salestable;

#THIS QUERY ADDS COST FROM THE SALESTABLE ON THE COMPANY_SALES AND GIVES 1531459
SELECT sum(cost)
from salestable;

#THIS COMMAND SHOWS AVERAGE COST TO BE 2668.
SELECT avg(cost)
from salestable;

#THIS COMMAND COUNTS THE TOTAL NUMBER OF STAFF (9)
select count(distinct StaffNo) 
from Stafftable;

#THIS COMMAND SHOWS STAFF LESS THAN 30 YEARS OF AGE = 4
select count(*)
from stafftable
where age < 30;

#THIS COMMAND SHOWS STAFF BETWEEN 25 AND 30 YEARS OF AGE = 6
select count(*)
from stafftable
where age between 25 and 30;

#THIS COMMAND SELECTS ALL FEMALE STAFF AND SORT THEIR AGES IN DESCENDING ORDER
select * from stafftable
where staffsex = 'female'
order by age desc;

#THIS COMMAND EXECUTES FOR THE AVERAGE OF 2 STAFF NAMED MARCELO AND LINDA
select round(avg(age)) as avg_age
from stafftable
where StaffName in ('Marcelo','Linda');

#THIS COMMAND COUNTS ALL CUSTOMERS = 20
select  count(distinct CustomerCode) 
from customertable;

#THIS COMMAND COUNTS ALL CUSTOMERS FROM NIGERIA = 2
select count(*)
from customertable
where CustomerCountry = 'Nigeria';

#THIS COMMAND COUNTS ALLL CUSTOMERS FROM CONGO AND AARE MALES = 2
select count(*)
from customertable
where CustomerCountry = 'Congo' and  CustomerSex = 'male'

#THIS COMMAND SHOWS FIRSTNAME AND LAST NAMES OF CUSTOMERS FROM NIGERIA AND BRAZIL
select CustomerFirstName, CustomerLastname, CustomerCountry
from customertable
where CustomerCountry in  ( 'Nigeria','Brazil' );

#THIS COMMAND SELECTS THE FIVE OLDEST CUSTOMERS BY AGE AND DISPLAYS THEM IN DESCENDING OREDR
select * from customertable
order by age desc
limit 5;

#THIS IS AVERAGE OF CUSTOERS PER COUNTRY AND ROUNDED TO WHOLE NUMBER
select round(avg(age)) as avg_age_country, CustomerCountry
from customertable
group by CustomerCountry
order by avg_age_country;


#THIS A COMMAND JOINING 2 TABLES TO GET TOTAL COST PER CUSTOMER COUNTRY
select  sum(cost) as total_cost, CustomerCountry
from company_sales.customertable
join salestable
 on customertable.CustomerCode = salestable.CustomerCode
 group by CustomerCountry
 order by total_cost;
 
 #THIS COMMAND JOINS THE CUSTOMERTABLE AAND SALESTABLE TO GET TOTAL PROFIT PER COUNTRY
select  sum(profit) as total_profit, CustomerCountry
from company_sales.customertable
join salestable
 on customertable.CustomerCode = salestable.CustomerCode
 group by CustomerCountry
 order by total_profit;
 
 #THIS COMMANDS JOINS TWO TABLES TO GET THE AVERAGE COST PER COUNTRY
 select  round(avg(cost)) as avg_cost, CustomerCountry
from company_sales.customertable
join salestable
 on customertable.CustomerCode = salestable.CustomerCode
 group by CustomerCountry
 order by avg_cost;
 
 #THIS TOTAL REEVENUE GENERATED BY STAFF IN DESCENDING ORDER
select  sum(Revenue) as total_revenue, StaffName
from company_sales.stafftable
join salestable
 on  stafftable.StaffNo = salestable.StaffCode
group by StaffName
order by total_revenue desc;
 
 
 #THIS COMMAND IS SHOWING TOTAL UNITS OF GOODES SOLD PER COUNTRY STAARTIG WITH THE HIGHEST TO THE LEAST
select count(UnitsSold) as total_units_sold, CustomerCountry
from company_sales.customertable
join salestable
 on customertable.CustomerCode = salestable.CustomerCode
group by CustomerCountry
order by total_units_sold desc

#THIS COMMAND SUMS PROFIT MADE BY EACH STAFF IN EACH COUNTRY
select StaffCode, StaffName, sum(profit) as profit_per_staff, CustomerCountry
from company_sales.customertable
join salestable
 on customertable.CustomerCode = salestable.CustomerCode
 join stafftable
  on stafftable.StaffNo = salestable.StaffCode
  group by StaffName, CustomerCountry
  order by profit_per_staff desc;

