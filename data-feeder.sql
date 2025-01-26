INSERT INTO days_of_the_week(`day`) 
VALUES 
    ("Monday"),
    ("Tuesday"),
    ("Wednesday"),
    ("Thursday"),
    ("Friday"),
    ("Saturday");

INSERT INTO time_periods_of_day(`start_time`,`end_time`)
VALUES 
    ("08:00", "09:00"), ("09:00", "10:00"), ("10:00", "11:00"), ("11:00", "12:00"),
    ("12:00", "01:00"), ("01:00", "02:00"),
    ("02:00", "03:00"), ("03:00", "04:00"), ("04:00", "05:00"), ("05:00", "06:00");


INSERT INTO grades (`grade_name`, `grade_type`)
VALUES
    ("Semester 1", "lower-grade"),
    ("Semester 3", "lower-grade"),
    ("Semester 5", "lower-grade");

INSERT INTO groups (`group_name`, `grade_id`)
VALUES 
    ("SMI section A", 1),
    ("SMI section B", 1),

    ("SMI section A", 2),

    ("SMI section A", 3),

    ("SMA section A", 1),

    ("SMA section A", 2),

    ("SMA section A", 3),

    ("SMP section A", 1),
    ("SMP section B", 1),
    ("SMP section C", 1),
    ("SMP section D", 1),

    ("SMP section A", 2),
    ("SMP section B", 2),

    ("SMP section A option x", 3),
    ("SMP section A option y", 3),

    ("SMC section A", 1),
    ("SMC section B", 1),
    ("SMC section C", 1),

    ("SMC section A", 2),
    ("SMC section B", 2),

    ("SMC section A option x", 3),
    ("SMC section A option y", 3);

-- Professors
INSERT INTO professors (`full_name`)
VALUES 
    ("prof de info 1"),
    ("prof de info 2"),
    ("prof de info 3"),
    ("prof de info 4"),
    ("prof de info 5"),
    ("prof de info 6"),
    ("prof de Math 1"),
    ("prof de Math 2"),
    ("prof de Math 3"),
    ("prof de Physic 1"),
    ("prof de Physic 2");

-- Courses
INSERT INTO courses (`course_name`)
VALUES 
    ("SMI S1 module 1 Math"),
    ("SMI S1 module 1 Math TD"),
    ("SMI S1 module 2 Math"),
    ("SMI S1 module 2 Math TD"),
    ("SMI S1 module 3 Math"),
    ("SMI S1 module 3 Math TD"),
    ("SMI S1 module 4 Physic"),
    ("SMI S1 module 4 Physic TD"),
    ("SMI S1 module 5 Physic"),
    ("SMI S1 module 5 Physic TD"),
    ("SMI S1 module 6 info"),
    ("SMI S1 module 6 info TD"),
    ("SMI S3 module 1 info"),
    ("SMI S3 module 1 info TD"),
    ("SMI S3 module 1 info TP"),
    ("SMI S3 module 2 info"),
    ("SMI S3 module 2 info TD"),
    ("SMI S3 module 2 info TP"),
    ("SMI S3 module 3 info"),
    ("SMI S3 module 3 info TD"),
    ("SMI S3 module 3 info TP"),
    ("SMI S3 module 4 info"),
    ("SMI S3 module 4 info TD"),
    ("SMI S3 module 4 info TP"),
    ("SMI S3 module 5 Math"),
    ("SMI S3 module 5 Math TD"),
    ("SMI S3 module 6 Physic"),
    ("SMI S3 module 6 Physic TD"),
    ("SMI S5 module 1 info"),
    ("SMI S5 module 1 info TD"),
    ("SMI S5 module 1 info TP"),
    ("SMI S5 module 2 info"),
    ("SMI S5 module 2 info TD"),
    ("SMI S5 module 2 info TP"),
    ("SMI S5 module 3 info"),
    ("SMI S5 module 3 info TD"),
    ("SMI S5 module 3 info TP"),
    ("SMI S5 module 4 info"),
    ("SMI S5 module 4 info TD"),
    ("SMI S5 module 4 info TP"),
    ("SMI S5 module 5 info"),
    ("SMI S5 module 5 info TD"),
    ("SMI S5 module 5 info TP"),
    ("SMI S5 module 6 info"),
    ("SMI S5 module 6 info TD"),
    ("SMI S5 module 6 info TP");

-- Classrooms
INSERT INTO classrooms (`classroom_name`, `classroom_type`) 
VALUES 
    ("Amphi H1", "Amphi"),
    ("Amphi H2", "Amphi"),
    ("Amphi M", "Amphi"),
    ("Amphi E", "Amphi"),
    ("Amphi F", "Amphi"),

    ("class L1", "TD"),
    ("class L2", "TD"),
    ("class L4", "TD"),
    ("class L5", "TD"),
    ("class L6", "TD"),
    ("class L7", "TD"),
    ("class L8", "TD"),

    ("A1", "TP"),
    ("A2", "TP"),
    ("i106", "TP"),
    ("i107", "TP"),
    ("i111", "TP");

---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------


--- relationships

INSERT INTO group_prof (`group_id`, `prof_id`)
VALUES
    (1, 7)
    (1, 8),
    (1, 9),
    (1, 10),
    (1, 11),
    (1, 1),
    (2, 7),
    (2, 8),
    (2, 9),
    (2, 10),
    (2, 11),
    (2, 1),
    (3, 2),
    (3, 3),
    (3, 4),
    (3, 5),
    (3, 7),
    (3, 10),
    (4, 1),
    (4, 2),
    (4, 3),
    (4, 4),
    (4, 5),
    (4, 6);


INSERT INTO prof_available_on (`prof_id`, `day_of_the_week_id`)
VALUES 
    (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1),
    (9, 1), (10, 1), (11, 1), (1, 2), (2, 2), (3, 2), (4, 2), (5, 2),
    (6, 2), (7, 2), (8, 2), (9, 2), (10, 2), (11, 2),
    (1, 3), (2, 3), (3, 3), (4, 3), (5, 3), (6, 3), (7, 3),
    (8, 3), (9, 3), (10, 3), (11, 3), (1, 4), (2, 4), (3, 4), (4, 4), (5, 4), (6, 4),
    (7, 4), (8, 4), (9, 4), (10, 4), (11, 4), (1, 5), (2, 5), (3, 5),
    (4, 5), (5, 5), (6, 5), (7, 5), (8, 5), (9, 5), (10, 5), (11, 5), (1, 6),
    (2, 6), (3, 6), (4, 6), (5, 6), (6, 6), (7, 6), (8, 6), (9, 6), (10, 6), (11, 6);


INSERT INTO prof_course (`prof_id`, `course_id`)
VALUES
    (7, 1), (7, 2), (8, 3), (8, 4), (9, 5), (9, 6), (10, 7), (10, 8), (11, 9), (11, 10), (1, 11),
    (1, 12), (2, 13), (2, 14), (2, 15), (3, 16), (3, 17), (3, 18), (4, 19), (4, 20), (4, 21),
    (5, 22), (5, 23), (5, 24), (7, 25), (7, 26), (10, 27), (10, 28), (1, 29), (1, 30),
    (1, 31), (2, 32), (2, 33), (2, 34), (3, 35), (3, 36), (3, 37), (4, 38), (4, 39), (4, 40), 
    (5, 41), (5, 42), (5, 43), (6, 44), (6, 45), (6, 46);


INSERT INTO course_group (`course_id`, `group_id`)
VALUES 
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 1),
    (8, 1),
    (9, 1),
    (10, 1),
    (11, 1),
    (12, 1),
    (1, 2),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 2),
    (6, 2),
    (7, 2),
    (8, 2),
    (9, 2),
    (10, 2),
    (11, 2),
    (12, 2),
    (13, 3),
    (14, 3),
    (15, 3),
    (16, 3),
    (17, 3),
    (18, 3),
    (19, 3),
    (20, 3),
    (21, 3),
    (22, 3),
    (23, 3),
    (24, 3),
    (25, 3),
    (26, 3),
    (27, 3),
    (28, 3),
    (29, 4),
    (30, 4),
    (31, 4),
    (32, 4),
    (33, 4),
    (34, 4),
    (35, 4),
    (36, 4),
    (37, 4),
    (38, 4),
    (39, 4),
    (40, 4),
    (41, 4),
    (42, 4),
    (43, 4),
    (44, 4),
    (45, 4),
    (46,  4);


INSERT INTO prof_group_course (`prof_id`, `group_id`, `course_id`)
VALUES
    ();


INSERT INTO course_classroom (`course_id`, `classroom_id`)
VALUES
    (1, 1),
    (2, 6),
    (3, 1),
    (4, 6),
    (5, 1),
    (6, 6),
    (7, 2),
    (8, 7),
    (9, 2),
    (10, 7),
    (11, 4),
    (12, 8),
    (13, 2),
    (14, 8),
    (15, 13),
    (16, 2),
    (17, 8),
    (18, 13),
    (19, 4),
    (20, 9),
    (21, 14),
    (22, 4),
    (23, 9),
    (24, 14),
    (25, 3),
    (26, 9),
    (27, 3),
    (28, 14),
    (29, 4),
    (30, 10),
    (31, 15),
    (32, 4),
    (33, 10),
    (34, 16),
    (35, 5),
    (36, 11),
    (37, 17),
    (38, 5),
    (39, 11),
    (40, 15),
    (41, 5),
    (42, 12),
    (43, 16),
    (44, 5),
    (45, 12),
    (46, 17);


INSERT INTO classroom_available_on (`classroom_id`, `day_of_the_week_id`)
VALUES
    (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1),
    (12, 1), (13, 1), (14, 1), (15, 1), (16, 1), (17, 1), (1, 2), (2, 2), (3, 2), (4, 2), (5, 2),
    (6, 2), (7, 2), (8, 2), (9, 2), (10, 2), (11, 2), (12, 2), (13, 2), (14, 2), (15, 2), (16, 2),
    (17, 2), (1, 3), (2, 3), (3, 3), (4, 3), (5, 3), (6, 3), (7, 3), (8, 3), (9, 3), (10, 3),
    (11, 3), (12, 3), (13, 3), (14, 3), (15, 3), (16, 3), (17, 3), (1, 4), (2, 4), (3, 4), (4, 4),
    (5, 4), (6, 4), (7, 4), (8, 4), (9, 4), (10, 4), (11, 4), (12, 4), (13, 4), (14, 4),
    (15, 4), (16, 4), (17, 4), (1, 5), (2, 5), (3, 5), (4, 5), (5, 5), (6, 5), (7, 5), (8, 5), 
    (9, 5), (10, 5), (11, 5), (12, 5), (13, 5), (14, 5), (15, 5), (16, 5), (17, 5), (1, 6), 
    (2, 6), (3, 6), (4, 6), (5, 6), (6, 6), (7, 6), (8, 6), (9, 6), (10, 6), (11, 6), (12, 6),
    (13, 6), (14, 6), (15, 6), (16, 6), (17, 6);














---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------

("SMA S1 module 1 Math"),
("SMA S1 module 1 Math TD"),
("SMA S1 module 2 Math"),
("SMA S1 module 2 Math TD"),
("SMA S1 module 3 Math"),
("SMA S1 module 3 Math TD"),
("SMA S1 module 4 Physic"),
("SMA S1 module 4 Physic TD"),
("SMA S1 module 5 Physic"),
("SMA S1 module 5 Physic TD"),
("SMA S1 module 6 info"),
("SMA S1 module 6 info TD"),

("SMA S3 module 1 Math"),
("SMA S3 module 1 Math TD"),
("SMA S3 module 2 Math"),
("SMA S3 module 2 Math TD"),
("SMA S3 module 3 Math"),
("SMA S3 module 3 Math TD"),
("SMA S3 module 4 Math"),
("SMA S3 module 4 Math TD"),
("SMA S3 module 5 Physic"),
("SMA S3 module 5 Physic TD"),
("SMA S3 module 6 info"),
("SMA S3 module 6 info TD"),

("SMA S5 module 1 Math"),
("SMA S5 module 1 Math TD"),
("SMA S5 module 2 Math"),
("SMA S5 module 2 Math TD"),
("SMA S5 module 3 Math"),
("SMA S5 module 3 Math TD"),
("SMA S5 module 4 Math"),
("SMA S5 module 4 Math TD"),
("SMA S5 module 5 Math"),
("SMA S5 module 5 Math TD"),
("SMA S5 module 6 info"),
("SMA S5 module 6 info TD"),

("SMP S1 module 1 Math"),
("SMP S1 module 2 Math"),
("SMP S1 module 3 Physic"),
("SMP S1 module 4 Physic"),
("SMP S1 module 5 Physic"),
("SMP S1 module 6 info"),
("SMP S3 module 1 Math"),
("SMP S3 module 2 Math"),
("SMP S3 module 3 Physic"),
("SMP S3 module 4 Physic"),
("SMP S3 module 5 Physic"),
("SMP S3 module 6 info"),
("SMP S5 module 1 Math"),
("SMP S5 module 2 Math"),
("SMP S5 module 3 Physic"),
("SMP S5 module 4 Physic"),
("SMP S5 module 5 Physic"),
("SMP S5 module 6 Physic"),
("SMC S1 module 1 Math"),
("SMC S1 module 2 Math"),
("SMC S1 module 3 Physic"),
("SMC S1 module 4 Physic"),
("SMC S1 module 5 Physic"),
("SMC S1 module 6 info"),
("SMC S3 module 1 Math"),
("SMC S3 module 2 Math"),
("SMC S3 module 3 Physic"),
("SMC S3 module 4 Physic"),
("SMC S3 module 5 Physic"),
("SMC S3 module 6 info"),
("SMC S5 module 1 Physic"),
("SMC S5 module 2 Physic"),
("SMC S5 module 3 Physic"),
("SMC S5 module 4 Physic"),
("SMC S5 module 5 Math"),
("SMC S5 module 6 info")