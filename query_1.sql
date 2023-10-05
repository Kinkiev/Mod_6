--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT s.id, s.student, AVG(g.grade) as average_grade
FROM students AS s
JOIN grades g ON s.id = g.student_id
GROUP BY s.id, s.student
ORDER BY average_grade DESC
LIMIT 5;