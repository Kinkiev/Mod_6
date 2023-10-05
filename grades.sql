-- Table: groups (групи)
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_name VARCHAR(255) UNIQUE NOT NULL
);

-- Table: students (студенти)
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student VARCHAR(255) UNIQUE NOT NULL,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES groups (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

-- Table: grades
DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    predmet_id INTEGER,
    date_of DATE NOT NULL,
    grade INTEGER NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students (id)
    FOREIGN KEY (predmet_id) REFERENCES predmets (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

-- Table: teachers (вчителі)
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    teacher VARCHAR(255) UNIQUE NOT NULL,
    predmet_id INTEGER,
    FOREIGN KEY (predmet_id) REFERENCES predmets (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

-- Table: predmets (предмети)
DROP TABLE IF EXISTS predmets;
CREATE TABLE predmets (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    predmet_name VARCHAR(255) UNIQUE NOT NULL,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teachers (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE 
);