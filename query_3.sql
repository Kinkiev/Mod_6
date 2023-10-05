--Знайти середній бал у групах з певного предмета.
WITH StudentAverages AS (
    SELECT s.group_id, AVG(g.grade) AS group_average
    FROM students AS s
    JOIN grades AS g ON s.id = g.student_id
    WHERE g.predmet_id = 3 
    GROUP BY s.group_id
)

SELECT g.group_name, sa.group_average
FROM groups AS g
LEFT JOIN StudentAverages AS sa ON g.id = sa.group_id;
