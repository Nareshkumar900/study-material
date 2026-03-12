-- USERS TABLE (Students and Teachers)

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL
);


-- DEPARTMENTS TABLE

CREATE TABLE departments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    department_name TEXT NOT NULL
);


-- SUBJECTS TABLE

CREATE TABLE subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject_name TEXT NOT NULL,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);


-- TOPICS TABLE

CREATE TABLE topics (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    topic_name TEXT NOT NULL,
    subject_id INTEGER,
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);


-- MATERIALS TABLE (Notes / Videos)

CREATE TABLE materials (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    material_type TEXT,
    file_path TEXT,
    video_link TEXT,
    topic_id INTEGER,
    uploaded_by INTEGER,
    downloads INTEGER DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (topic_id) REFERENCES topics(id),
    FOREIGN KEY (uploaded_by) REFERENCES users(id)
);