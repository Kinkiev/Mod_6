-- Список курсів, які певному студенту читає певний викладач.

SELECT students.student, predmets.predmet_name, teachers.teacher
FROM students
JOIN grades ON students.id = grades.student_id
JOIN predmets ON grades.predmet_id = predmets.id
JOIN teachers ON predmets.teacher_id = teachers.id
WHERE students.student = 'Lisa Lynch' AND teachers.teacher = 'Laura Davidson';
