-- Знайти список студентів у певній групі.

SELECT students.student
FROM students
JOIN groups ON students.group_id = groups.id
WHERE groups.group_name = 'Belarus';
