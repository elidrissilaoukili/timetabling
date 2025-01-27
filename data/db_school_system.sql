-- Days of the Week
CREATE TABLE days_of_the_week (
    id INT AUTO_INCREMENT PRIMARY KEY,
    day VARCHAR(20) NOT NULL UNIQUE,
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

-- Time Periods of Day
CREATE TABLE time_periods_of_day (
    id INT AUTO_INCREMENT PRIMARY KEY,
    period_starts_at TIME NOT NULL,
    period_ends_at TIME NOT NULL,
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

-- Groups
CREATE TABLE groups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(255) NOT NULL UNIQUE,
    group_size INT DEFAULT NULL,
    grade_id INT DEFAULT NULL,
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

    FOREIGN KEY (grade_id) REFERENCES grades(id)
);

-- Professors
CREATE TABLE professors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    department VARCHAR(255) NOT NULL,
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Courses
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    classroom_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

    FOREIGN KEY (classroom_id) REFERENCES classrooms(id)
);

-- Classrooms
CREATE TABLE classrooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    classroom_name VARCHAR(40) NOT NULL,
    capacity INT NOT NULL,
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

------------ tables relationships

-- Grades
CREATE TABLE grades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    grade_name VARCHAR(40) NOT NULL,
    grade_type VARCHAR(40) CHECK (grade_type IN ('lower-grade', 'higher-grade')),

	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

-- Labs
CREATE TABLE labs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lab_name VARCHAR(40) NOT NULL,
    lab_for VARCHAR(40) NOT NULL,
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);


-- Kl & Lk
CREATE TABLE prof_group (
	id INT AUTO_INCREMENT PRIMARY KEY,
    prof_id INT NOT NULL,
    group_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,
    
	FOREIGN KEY (prof_id) REFERENCES professors(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)	
);

-- Li & Il
CREATE TABLE prof_available_on (
	id INT AUTO_INCREMENT PRIMARY KEY,
    prof_id INT NOT NULL,
    day_of_the_week_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,
   
    FOREIGN KEY (prof_id) REFERENCES professors(id),
    FOREIGN KEY (day_of_the_week_id) REFERENCES days_of_the_week(id)	
);

-- Lm & Ml
CREATE TABLE prof_course (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prof_id INT NOT NULL,
    course_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,
    
	FOREIGN KEY (prof_id) REFERENCES professors(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)	
);

-- Lkm = Lk intersection Lm
CREATE TABLE prof_group_course (
	id INT AUTO_INCREMENT PRIMARY KEY,
	prof_group_id INT NOT NULL,
	prof_course_id INT NOT NULL,
	
	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

	FOREIGN KEY (prof_group_id) REFERENCES prof_group(id),		
	FOREIGN KEY (prof_course_id) REFERENCES prof_course(id)		
);

-- Lki = Lk intersection Li
CREATE TABLE prof_group_day (
	id INT AUTO_INCREMENT PRIMARY KEY,
	prof_group_id INT NOT NULL,
	prof_available_on_id INT NOT NULL,
	
	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

	FOREIGN KEY (prof_group_id) REFERENCES prof_group(id),		
	FOREIGN KEY (prof_available_on_id) REFERENCES prof_available_on(id)		
);

-- Mk & Km
CREATE TABLE course_group (
 	id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    group_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,
    
	FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)	
);

-- Mn & Nm
CREATE TABLE course_classroom (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    classroom_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,
    
	FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id)		
);

-- Mkl = Mk intersection Ml
CREATE TABLE course_group_prof (
	id INT AUTO_INCREMENT PRIMARY KEY,
	course_group_id  INT NOT NULL,
	prof_course_id  INT NOT NULL,
	
	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

	FOREIGN KEY (course_group_id) REFERENCES course_group(id),		
	FOREIGN KEY (prof_course_id) REFERENCES prof_course(id)		
);

-- Mkn = Mk intersection Mn
CREATE TABLE course_group_classroom (
	id INT AUTO_INCREMENT PRIMARY KEY,
	course_group_id  INT NOT NULL,
	course_classroom_id  INT NOT NULL,
	
	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

	FOREIGN KEY (course_group_id) REFERENCES course_group(id),	
	FOREIGN KEY (course_classroom_id) REFERENCES course_classroom(id)	
);

-- Mkln = Mk intersection Ml intersection Mn
CREATE TABLE course_group_prof_classroom (
	id INT AUTO_INCREMENT PRIMARY KEY,
	course_group_id  INT NOT NULL,
	prof_course_id INT NOT NULL,
	course_classroom_id  INT NOT NULL,
	
	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

	FOREIGN KEY (course_group_id) REFERENCES course_group(id),		
	FOREIGN KEY (prof_course_id) REFERENCES prof_course(id),		
	FOREIGN KEY (course_classroom_id) REFERENCES course_classroom(id)	
);


-- Mlab
CREATE TABLE course_lab (
	id INT AUTO_INCREMENT PRIMARY KEY,
	course_id  INT NOT NULL,
	lab_id  INT NOT NULL,
	
	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

	FOREIGN KEY (course_id) REFERENCES courses(id),		
	FOREIGN KEY (lab_id) REFERENCES labs(id)	
);

-- In / Ni
CREATE TABLE classroom_available_on (
	id INT AUTO_INCREMENT PRIMARY KEY,
	classroom_id  INT NOT NULL,
	day_of_the_week_id  INT NOT NULL,
	
	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

	FOREIGN KEY (classroom_id) REFERENCES classrooms(id),		
	FOREIGN KEY (day_of_the_week_id) REFERENCES days_of_the_week(id)	
);

-- Iln = Il intersection In
CREATE TABLE prof_classroom_availability (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prof_available_on_id INT NOT NULL,
    classroom_available_on_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

    FOREIGN KEY (prof_available_on_id) REFERENCES prof_available_on(id),
    FOREIGN KEY (classroom_available_on_id) REFERENCES classroom_available_on(id)	
);

-- Jiln
CREATE TABLE period_day_prof_classroom_availability (
	id INT AUTO_INCREMENT PRIMARY KEY,
	period_id  INT NOT NULL,
	prof_classroom_availability_id  INT NOT NULL,
	
	state TINYINT DEFAULT 1, 			

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

	FOREIGN KEY (period_id) REFERENCES time_periods_of_day(id),		
	FOREIGN KEY (prof_classroom_availability_id) REFERENCES prof_classroom_availability(id)		
);

------------ extra
create table users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
	
    cin VARCHAR(30) UNIQUE,
    code VARCHAR(50) UNIQUE,
    date_of_birth DATE,
    place_of_birth VARCHAR(255),
    address VARCHAR(255),
    country VARCHAR(50),
    city VARCHAR(50),
    sex VARCHAR(50),
    handicap VARCHAR(50),
    personal_email VARCHAR(255) UNIQUE,
    email_academy VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    phone VARCHAR(50) UNIQUE,
    profile VARCHAR(255),
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE,
    
	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,
);

CREATE TABLE user_role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL, 
    role_id INT NOT NULL, 

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE permissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE,

	state TINYINT DEFAULT 1,
    description TEXT DEFAULT NULL,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

CREATE TABLE role_permission (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INT NOT NULL, 
    permission_id INT NOT NULL, 

	state TINYINT DEFAULT 1, 

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

    FOREIGN KEY (role_id) REFERENCES roles(id),
    FOREIGN KEY (permission_id) REFERENCES permissions(id)
);

CREATE TABLE students (
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    cne VARCHAR(30),
    serie VARCHAR(255),
    year_of_obtaining INT,
    academy VARCHAR(255),
    mention VARCHAR(255),
  
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,				

    FOREIGN KEY (user_id) REFERENCES users(id)
);

create table group_student (
	id INT AUTO_INCREMENT PRIMARY KEY,
    group_id INT NOT NULL,
    student_id INT NOT NULL,
    
	state TINYINT DEFAULT 1,

	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

	FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE students_notes (
    id INT AUTO_INCREMENT PRIMARY KEY,

    note DECIMAL(5,2) UNSIGNED,
    mention VARCHAR(55),

    student_id INT,
    course_id INT,

    state TINYINT DEFAULT 1,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,

    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

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
    deleted_at TIMESTAMP NULL,
    
    FOREIGN KEY (day_of_the_week_id) REFERENCES days_of_the_week(id),
    FOREIGN KEY (time_period_id) REFERENCES time_periods_of_day(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (prof_id) REFERENCES proffessors(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id)
);
