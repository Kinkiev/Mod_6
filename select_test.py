import sqlite3


def execute_query(sql: str) -> list:
    with sqlite3.connect("grades.db") as con:
        cur = con.cursor()
        cur.execute(sql)
        return cur.fetchall()


sql = """
SELECT ROUND(AVG(p.grade), 2), predmet_id
FROM grades as p
LEFT JOIN students as e ON p.student_id = e.id
GROUP BY predmet_id;
"""

print(execute_query(sql))
