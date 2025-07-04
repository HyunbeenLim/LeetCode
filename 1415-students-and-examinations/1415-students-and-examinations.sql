# Write your MySQL query statement below
with exam_count as (
    select student_id, subject_name, count(*) attended_exams
    from examinations
    group by student_id, subject_name
),
student_subject as (
    select *
    from students, subjects
)
select s.student_id, s.student_name, s.subject_name, ifnull(e.attended_exams, 0) attended_exams
from exam_count e
right join student_subject s on e.student_id = s.student_id and e.subject_name = s.subject_name
order by student_id, subject_name