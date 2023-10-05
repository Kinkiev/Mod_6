--Знайти список курсів, які відвідує студент.

SELECT students.student, groups.group_name, predmets.predmet_name, teachers.teacher
FROM students
JOIN groups ON students.group_id = groups.id
JOIN grades ON students.id = grades.student_id
JOIN predmets ON grades.predmet_id = predmets.id
JOIN teachers ON predmets.teacher_id = teachers.id
WHERE students.student = 'Lisa Lynch';
