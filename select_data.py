import sqlite3


def execute_query(filename: str) -> list:
    try:
        with open(filename, "r") as file:
            sql = file.read()
    except FileNotFoundError:
        print(f"File '{filename}' not found.")
        return []

    with sqlite3.connect("grades.db") as con:
        cur = con.cursor()
        cur.execute(sql)
        return cur.fetchall()


print(execute_query("query_10.sql"))
