--Знайти які курси читає певний викладач.

SELECT predmets.predmet_name
FROM predmets
JOIN teachers ON predmets.teacher_id = teachers.id
WHERE teachers.teacher = 'Jonathan Harris';
