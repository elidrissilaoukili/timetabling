-- Days of the Week
CREATE TABLE days_of_the_week (
    id INT AUTO_INCREMENT PRIMARY KEY,
    day VARCHAR(20) NOT NULL UNIQUE,
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
)

-- Time Periods of Day
CREATE TABLE time_periods_of_day (
    id INT AUTO_INCREMENT PRIMARY KEY,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
)

-- Groups
CREATE TABLE groups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(255) NOT NULL,
    grade_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (grade_id) REFERENCES grades(id)
)

-- Professors
CREATE TABLE professors (
    id INT AUTO_INCREMENT PRIMARY KEY,
        
    full_name VARCHAR(255),
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

-- Courses
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    course_type VARCHAR(255) NOT NULL,
    period_repetition_count INT NOT NULL,
    period_length_count INT NOT NULL,
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
)

-- Classrooms
CREATE TABLE classrooms (
    id INT AUTO_INCREMENT PRIMARY KEY,

    classroom_name VARCHAR(40) NOT NULL,
    classroom_type VARCHAR(40) NOT NULL,

	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

------------ tables relationships

-- Grades
CREATE TABLE grades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    grade_name VARCHAR(40) NOT NULL,
    grade_type VARCHAR(40) CHECK (grade_type IN ('lower-grade', 'higher-grade')),

	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)


-- Kl & Lk
CREATE TABLE group_prof (
	id INT AUTO_INCREMENT PRIMARY KEY,
    group_id INT NOT NULL,
    prof_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY (prof_id) REFERENCES professors(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)	
)

-- Li & Il
CREATE TABLE prof_available_on (
	id INT AUTO_INCREMENT PRIMARY KEY,
    prof_id INT NOT NULL,
    day_of_the_week_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
    FOREIGN KEY (prof_id) REFERENCES professors(id),
    FOREIGN KEY (day_of_the_week_id) REFERENCES days_of_the_week(id)	
)

-- Lm & Ml
CREATE TABLE prof_course (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prof_id INT NOT NULL,
    course_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY (prof_id) REFERENCES professors(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)	
)


-- Mk & Km
CREATE TABLE course_group (
 	id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    group_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)	
)


-- Lkm = Lk intersection Lm -- Mkl = Mk intersection Ml
CREATE TABLE prof_group_course (
	id INT AUTO_INCREMENT PRIMARY KEY,
	
    group_prof_id INT NOT NULL,
    prof_course_id INT NOT NULL,

	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	FOREIGN KEY (group_prof_id) REFERENCES group_prof(id),		
	FOREIGN KEY (prof_course_id) REFERENCES prof_course(id)		
)

-- Lki = Lk intersection Li
CREATE TABLE prof_group_day (
	id INT AUTO_INCREMENT PRIMARY KEY,
	prof_group_id INT NOT NULL,
	prof_available_on_id INT NOT NULL,
	
	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	FOREIGN KEY (prof_group_id) REFERENCES prof_group(id),		
	FOREIGN KEY (prof_available_on_id) REFERENCES prof_available_on(id)	
)

-- Mn & Nm
CREATE TABLE course_classroom (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    classroom_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id)		
)

-- Mkn = Mk intersection Mn
CREATE TABLE course_group_classroom (
	id INT AUTO_INCREMENT PRIMARY KEY,
	course_group_id  INT NOT NULL,
	course_classroom_id  INT NOT NULL,
	
	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	FOREIGN KEY (course_group_id) REFERENCES course_group(id),		
	FOREIGN KEY (course_classroom_id) REFERENCES course_classroom(id)	
)

-- Mkln = Mk intersection Ml intersection Mn
CREATE TABLE course_group_prof_classroom (
	id INT AUTO_INCREMENT PRIMARY KEY,
	
	course_group_classroom_id  INT NOT NULL,
	prof_course_id INT NOT NULL,
	
	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	FOREIGN KEY (course_group_classroom_id) REFERENCES course_group_classroom(id),		
	FOREIGN KEY (prof_course_id) REFERENCES prof_course(id)
)



-- Mlab


-- In / Ni
CREATE TABLE classroom_available_on (
	id INT AUTO_INCREMENT PRIMARY KEY,
	classroom_id  INT NOT NULL,
	day_of_the_week_id  INT NOT NULL,
	
	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	FOREIGN KEY (classroom_id) REFERENCES classrooms(id),		
	FOREIGN KEY (day_of_the_week_id) REFERENCES days_of_the_week(id)
)

-- Iln = Il intersection In
CREATE TABLE prof_classroom_availability (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prof_available_on_id INT NOT NULL,
    classroom_available_on_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (prof_available_on_id) REFERENCES prof_available_on(id),
    FOREIGN KEY (classroom_available_on_id) REFERENCES classroom_available_on(id)	
)

-- Jiln
CREATE TABLE period_prof_classroom_availability (
	id INT AUTO_INCREMENT PRIMARY KEY,
	period_id  INT NOT NULL,
	prof_classroom_availability_id  INT NOT NULL,
	
	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	FOREIGN KEY (period_id) REFERENCES time_periods_of_day(id),		
	FOREIGN KEY (prof_classroom_availability_id) REFERENCES prof_classroom_availability(id)	
)


-- time table
CREATE TABLE timetable (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    day_of_the_week_id INT NOT NULL,
    time_period_id INT NOT NULL,
    group_id INT NOT NULL,
    prof_id INT NOT NULL,
    course_id INT NOT NULL,
    classroom_id INT NOT NULL,
    
    state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (day_of_the_week_id) REFERENCES days_of_the_week(id),
    FOREIGN KEY (time_period_id) REFERENCES time_periods_of_day(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (prof_id) REFERENCES professors(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id)
)