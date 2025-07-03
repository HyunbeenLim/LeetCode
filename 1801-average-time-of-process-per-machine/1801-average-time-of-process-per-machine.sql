# Write your MySQL query statement below
select a.machine_id, round(avg(a.timestamp - s.timestamp), 3) processing_time
from activity a
join activity s on a.machine_id = s.machine_id and a.process_id = s.process_id and s.activity_type = 'start'
where a.activity_type = 'end'
group by a.machine_id