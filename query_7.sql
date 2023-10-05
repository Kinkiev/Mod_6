--Знайти оцінки студентів у окремій групі з певного предмета.

SELECT students.student, grades.grade
FROM students
JOIN grades ON students.id = grades.student_id
JOIN predmets ON grades.predmet_id = predmets.id
JOIN groups ON students.group_id = groups.id
WHERE groups.group_name = 'Belarus'
  AND predmets.predmet_name = 'Antoniostad';
