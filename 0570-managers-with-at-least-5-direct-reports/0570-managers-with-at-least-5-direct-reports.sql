# Write your MySQL query statement below
with over_5 as (
    select managerid, count(*) manage
    from employee
    where managerid is not null
    group by managerid
    having manage >= 5
)
select name
from employee
where id in (select managerid from over_5)