--Знайти середній бал, який ставить певний викладач зі своїх предметів.

SELECT teachers.teacher, predmets.predmet_name, AVG(grades.grade) AS average_grade
FROM teachers
JOIN predmets ON teachers.id = predmets.teacher_id
JOIN grades ON predmets.id = grades.predmet_id
JOIN students ON grades.student_id = students.id
GROUP BY teachers.teacher, predmets.predmet_name;
