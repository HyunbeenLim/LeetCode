# Write your MySQL query statement below
with requests as (
    select s.user_id,
        case when c.action is null then 0
        else count(*)
        end request_cnt
    from signups s
    left join confirmations c on s.user_id = c.user_id
    group by s.user_id
),
confirms as (
    select s.user_id, count(*) confirmed
    from signups s
    join confirmations c on s.user_id = c.user_id
    where c.action = 'confirmed'
    group by s.user_id
)
select s.user_id,
    case when c.confirmed is null then 0 else round(c.confirmed/r.request_cnt, 2)
    end confirmation_rate
from signups s
join requests r on s.user_id = r.user_id
left join confirms c on s.user_id = c.user_id