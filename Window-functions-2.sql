-- Statistics with window functions

-- Ranking in SQL

create database ipl;
use ipl;
select * from ipldata;
select count(*) from ipldata;

select * from (
select battingteam,batter,sum(batsman_run) as total_runs,
dense_rank() over (partition by battingteam order by sum(batsman_run) desc) as run_rank_team
from ipldata
group by battingteam,batter)t
where t.run_rank_team<6
order by t.battingteam,t.run_rank_team;

SELECT * FROM ipldata;

-- cumulative_sum()
-- Sum of set of values up to a given point in time and includes all previous values in calc
-- After 50 match what is the career runs
select * from(
select concat("Match-",cast(row_number() over (order by id) as char)) as match_no,
sum(batsman_run) as score,
avg(sum(batsman_run)) over (rows between unbounded preceding and current row) as career_runs
from ipldata
where batter = 'V Kohli' 
group by id)t
where t.match_no = 'Match-50' or match_no = 'Match-70';


select * from(
select concat("Match-",cast(row_number() over (order by id) as char)) as match_no,
sum(batsman_run) as score,
avg(sum(batsman_run)) over w  as career_avg,
sum(sum(batsman_run)) over w  as career_sum,
avg(sum(batsman_run)) over (rows between 9 preceding and current row) as moving_avg
from ipldata
where batter = 'V Kohli' 
group by id
window w as (rows between unbounded preceding and current row))t
;

-- percent of total
use restaurents;
select f_name,(total_value /sum(total_value) over())*100 as percent_of_total
from ( select f_id , sum(amount) as total_value
from orders t1
join order_details t2
on t1.order_id = t2.order_id
where r_id =4
group by f_id) t
join food f3
on t.f_id = f3.f_id
order by percent_of_total desc;

-- percentage change 
-- how value is increased /decreased over a given period of time as compared to 2 diff values

select month(date)
,sum(amount) ,
((sum(amount) - lag(sum(amount)) over (order by month(date)))
/lag(sum(amount)) over (order by month(date)) )*100 as pct_change
from orders
group by month(date) 
order by month(date) ;

select *,
((amount-lag(amount,7) over (order by date))/lag(amount,7) over (order by date))*100 as weekly_chg
 from orders;

-- Percentiles and Quantiles
select * , ntile(50) over (order by amount) 
from orders;


SELECT 
    *,
    PERCENT_RANK() OVER (ORDER BY amount) AS percentile
FROM 
orders;

-- Bucketing data on the basis of column 
select *,
case
	when bucket =1 then 'budget'
    when bucket =2 then 'mid-range'
    when bucket =3 then 'premium'
end as purchase_type
from (
select * , ntile(3) over (order by amount)  as bucket
from orders)t;

-- cumulative distribution
-- p(x<=x) discrete aur continuous
--  cdf using cume_dist()
select date,amount,
cume_dist() over (order by amount) 
from orders;

select * from (select *,cume_dist() over(order by amount) as cdf from orders)t
where t.cdf<0.90;

-- exponential moving avg
-- streak
-- exponential weighted moving avg
use restaurents;
-- Partition by Multiple Columns
select avg(amount) , 
dense_rank() over (partition by partner_id ,user_id order by avg(amount)) as rank1
 from restaurents.orders
group by user_id ,partner_id;
