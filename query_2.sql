--Знайти студента із найвищим середнім балом з певного предмета.

SELECT s.id, s.student, AVG(g.grade) as average_grade
FROM students AS s
JOIN grades g ON s.id = g.student_id
WHERE g.predmet_id = 3 
GROUP BY s.id, s.student
ORDER BY average_grade DESC
LIMIT 1;