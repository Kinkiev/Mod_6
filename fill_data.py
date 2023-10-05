from datetime import datetime
import faker
from random import randint, choice
import sqlite3

NUMBER_GROUPS = 3
NUMBER_STUDENTS = 30
NUMBER_PREDMETS = 5
NUMBER_TEACHERS = 5


def generate_fake_data(
    number_groups, number_students, number_predmets, number_teachers
) -> tuple():
    fake_groups = []  # тут зберігатимемо групи
    fake_students = []  # тут зберігатимемо студентів
    fake_predmets = []  # тут зберігатимемо предмети
    fake_teachers = []  # тут зберігатимемо вчителів

    fake_data = faker.Faker()

    # Створимо набір груп у кількості number_groups
    for _ in range(number_groups):
        fake_groups.append(fake_data.country())

    # Згенеруємо тепер кількість студентів'''
    for _ in range(number_students):
        fake_students.append(fake_data.name())

    # Та набір предметів
    for _ in range(number_predmets):
        fake_predmets.append(fake_data.city())

    # кількість вчителів
    for _ in range(number_teachers):
        fake_teachers.append(fake_data.name())

    return fake_groups, fake_students, fake_predmets, fake_teachers


def prepare_data(groups, students, predmets, teachers) -> tuple():
    for_groups = []
    # Готуємо список кортежів назв компаній
    for group in groups:
        for_groups.append((group,))

    for_students = []  # для таблиці employees

    for stud in students:
        for_students.append((stud, randint(1, NUMBER_GROUPS)))

    for_teachers = []

    for teach in teachers:
        for_teachers.append((teach, randint(1, NUMBER_PREDMETS)))

    for_predmets = []

    for pred in predmets:
        for_predmets.append((pred, randint(1, NUMBER_TEACHERS)))

    for_grades = []

    for stud in range(1, NUMBER_STUDENTS + 1):
        grade_date = datetime(2023, randint(1, 12), randint(1, 28)).date()
        # Виконуємо цикл за кількістю співробітників
        for_grades.append(
            (stud, randint(1, NUMBER_PREDMETS), grade_date, randint(1, 11))
        )

    return for_groups, for_students, for_teachers, for_predmets, for_grades


def insert_data_to_db(groups, students, teachers, predmets, grades) -> None:
    # Створимо з'єднання з нашою БД та отримаємо об'єкт курсору для маніпуляцій з даними

    with sqlite3.connect("grades.db") as con:
        cur = con.cursor()

        sql_to_groups = """INSERT INTO groups(group_name)
                               VALUES (?)"""

        cur.executemany(sql_to_groups, groups)

        sql_to_predmets = """INSERT INTO predmets(predmet_name, teacher_id)
                               VALUES (?, ?)"""

        cur.executemany(sql_to_predmets, predmets)

        # Далі вставляємо дані про співробітників. Напишемо для нього скрипт і вкажемо змінні

        sql_to_students = """INSERT INTO students(student, group_id)
                               VALUES (?, ?)"""

        # Дані були підготовлені заздалегідь, тому просто передаємо їх у функцію

        cur.executemany(sql_to_students, students)

        sql_to_teachers = """INSERT INTO teachers(teacher, predmet_id)
                               VALUES (?, ?)"""

        # Дані були підготовлені заздалегідь, тому просто передаємо їх у функцію

        cur.executemany(sql_to_teachers, teachers)

        # Останньою заповнюємо таблицю з оцінками

        sql_to_grades = """INSERT INTO grades(student_id, predmet_id, date_of, grade)
                              VALUES (?, ?, ?, ?)"""

        # Вставляємо дані про оцінки

        cur.executemany(sql_to_grades, grades)

        # Фіксуємо наші зміни в БД

        con.commit()


if __name__ == "__main__":
    groups, students, predmets, teachers, grades = prepare_data(
        *generate_fake_data(
            NUMBER_GROUPS, NUMBER_STUDENTS, NUMBER_PREDMETS, NUMBER_TEACHERS
        )
    )
    insert_data_to_db(groups, students, predmets, teachers, grades)
