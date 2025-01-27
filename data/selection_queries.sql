K1 = SELECT  gp.id, gp.group_name, gd.grade_name, gd.grade_type
	FROM groups gp
	JOIN grades gd  ON gp.grade_id = gd.id
	WHERE gd.grade_type = "lower-grade" AND gp.state = 1;

K2 = SELECT  gp.id, gp.group_name, gd.grade_name, gd.grade_type
	FROM groups gp
	JOIN grades gd  ON gp.grade_id = gd.id
	WHERE gd.grade_type = "higher-grade" AND gp.state = 1;


Lk : Filter by gp.id (a specific group).
Kl : Filter by prof.id (a specific professor).
Kl = SELECT 
	    grp.id, 
	    grp.prof_id,
	    grp.group_id,
	    prof.full_name, 
	    gp.group_name, 
	    gd.grade_name, 
	    gd.grade_type
	FROM 
	    group_prof grp
	JOIN 
	    professors prof 
	ON 
	    prof.id = grp.prof_id
	JOIN 
	    groups gp 
	ON 
	    gp.id = grp.group_id
	JOIN 
	    grades gd 
	ON 
	    gp.grade_id = gd.id
	WHERE grp.state = 1;


Li = SELECT 
	    prof.full_name, 
	    day.day
	FROM 
	    prof_available_on pd
	JOIN 
	    professors prof 
	ON 
	    prof.id = pd.prof_id
	JOIN 
	    days_of_the_week day
	ON 
	    pd.day_of_the_week_id = day.id
	WHERE pd.state = 1;


Lm = SELECT 
	    pc.id, 
	    prof.full_name, 
	    c.course_name
	FROM 
	    prof_course pc
	JOIN 
	    professors prof 
	ON 
	    pc.prof_id = prof.id
	JOIN 
	    courses c 
	ON 
	    pc.course_id = c.id
	WHERE pc.state = 1;


Mkl = Mk \ Ml, 	
Lkm = SELECT 
	    pgc.id AS prof_group_course_id,
	    prof.full_name, 
	    c.course_name, 
	    gp.group_name, 
	    gd.grade_name, 
	    gd.grade_type
	FROM 
	    prof_group_course pgc
	JOIN 
	    group_prof pg 
	ON 
	    pg.id = pgc.group_prof_id
	JOIN 
	    prof_course pc 
	ON 
	    pc.id = pgc.prof_course_id
	JOIN 
	    professors prof 
	ON 
	    prof.id = pg.prof_id
	JOIN 
	    groups gp 
	ON 
	    gp.id = pg.group_id
	JOIN 
	    grades gd 
	ON 
	    gp.grade_id = gd.id
	JOIN 
	    courses c 
	ON 
	    c.id = pc.course_id
	WHERE 
	    pgc.state = 1;


Lki = SELECT 
	    pgd.id AS prof_group_day_id,
	    prof.full_name,
	    grp.group_name,
	    grd.grade_name,
	    grd.grade_type,
	    day.day
	FROM 
	    prof_group_day pgd
	JOIN group_prof gp ON gp.id = pgd.prof_group_id
	JOIN prof_available_on pa ON pa.id = pgd.prof_available_on_id
	JOIN groups grp ON grp.id = gp.group_id
	JOIN grades grd ON grd.id = grp.grade_id
	JOIN days_of_the_week day ON day.id = pa.day_of_the_week_id  -- Corrected this join
	JOIN professors prof ON prof.id = gp.prof_id  -- Corrected this join
	WHERE 
	    pgd.state = 1;


Mk = SELECT c.course_name, 
			g.group_name
	FROM course_group cg
	JOIN
		courses c
	on
		c.id = cg.course_id
	JOIN 
		groups g
	ON
		g.id = cg.group_id
	where 
		cg.state = 1;


Ml = SELECT prof.full_name,
			c.course_name
	FROM prof_course pc
	JOIN professors prof
	ON prof.id = pc.prof_id
	JOIN courses c
	ON c.id = pc.course_id
	WHERE pc.state = 1;

-- all 
Mn = SELECT c.course_name,
			cls.classroom_name,
			cls.classroom_type
	FROM course_classroom cc
	JOIN courses c
	ON c.id = cc.course_id
	JOIN classrooms cls
	ON cls.id = cc.classroom_id
	WHERE cc.state = 1;


Mkn = Mk \ Mn, 
Mkn = SELECT 
	    crs.course_name,
	    grp.group_name,
	    grd.grade_name,
	    grd.grade_type,
	    clsr.classroom_name,
	    clsr.classroom_type
	FROM 
	    course_group_classroom cgc
	JOIN 
	    course_group cg
	ON 
	    cg.id = cgc.course_group_id
	JOIN 
	    course_classroom cc
	ON 
	    cc.id = cgc.course_classroom_id
	JOIN 
	    courses crs
	ON 
	    crs.id = cg.course_id 
	JOIN 
	    groups grp
	ON 
	    grp.id = cg.group_id
	JOIN 
	    classrooms clsr
	ON 
	    clsr.id = cc.classroom_id
	JOIN 
	    grades grd
	ON 
	    grd.id = grp.grade_id
	WHERE 
	    cgc.state = 1;


Mkln = Mk \ Ml \ Mn.
Mkln = SELECT 
	    crs.course_name,
	    grp.group_name,
	    grd.grade_name,
	    grd.grade_type,
	    prof.full_name,
	    clsr.classroom_name,
	    clsr.classroom_type
	FROM course_group_prof_classroom cgpc
	JOIN
		course_group_classroom cgc
	ON
		cgc.id = cgpc.course_group_classroom_id
	JOIN
		prof_course pc
	ON
		pc.id = cgpc.prof_course_id

	JOIN
		course_group cg
	ON
		cg.id = cgc.course_group_id
	JOIN
		course_classroom cc
	ON
		cc.id = cgc.course_classroom_id

	JOIN
		courses crs
	ON
		crs.id = cg.course_id
	AND
		crs.id = cc.course_id
	AND
		crs.id = pc.course_id
	JOIN
		groups grp
	ON
		grp.id = cg.group_id
	JOIN
		grades grd
	ON
		grd.id = grp.grade_id

	JOIN
		classrooms clsr
	ON
		clsr.id = cc.classroom_id

	JOIN
		professors prof 
	ON
		prof.id = pc.prof_id

	WHERE cgpc.state=1;





Mkcom = SELECT 
	    crs.course_name,
	    prof.full_name AS professor_name,
	    grp_main.group_name AS main_group_name,
	    grp_elective.group_name AS elective_group_name
	FROM 
	    courses crs
	JOIN 
	    prof_course cp
	ON 
	    crs.id = cp.course_id
	JOIN 
	    professors prof
	ON 
	    prof.id = cp.prof_id
	JOIN 
	    course_group cg_main
	ON 
	    crs.id = cg_main.course_id
	JOIN 
	    groups grp_main
	ON 
	    grp_main.id = cg_main.group_id
	JOIN 
	    course_group cg_elective
	ON 
	    crs.id = cg_elective.course_id
	JOIN 
	    groups grp_elective
	ON 
	    grp_elective.id = cg_elective.group_id
	WHERE 
	    grp_main.id <> grp_elective.id; 


Mlab = SELECT c.course_name,
			cls.classroom_name,
			cls.classroom_type
		FROM course_classroom cc
		JOIN courses c
		ON c.id = cc.course_id
		JOIN classrooms cls
		ON cls.id = cc.classroom_id
		WHERE cc.state = 1
		AND cls.classroom_type="TP";



Nmk = SELECT 
	    clsr.classroom_name,
	    clsr.classroom_type,
	    grp.group_name,
	    grd.grade_name,
	    grd.grade_type,
	    crs.course_name
	FROM 
	    classrooms clsr
	JOIN 
	    course_group_classroom cgc
	ON 
	    clsr.id = cgc.course_classroom_id  -- Corrected to use course_classroom_id
	JOIN 
	    course_group cg
	ON 
	    cg.id = cgc.course_group_id
	JOIN 
	    groups grp
	ON 
	    grp.id = cg.group_id
	JOIN 
	    grades grd
	ON 
	    grd.id = grp.grade_id
	JOIN 
	    courses crs
	ON 
	    crs.id = cg.course_id
	WHERE 
	    clsr.capacity >= grp.number_of_students -- Ensure classroom fits the group
	AND 
	    cgc.state = 1;                          -- Ensure the relationship is active



In = SELECT clsr.classroom_name,
			clsr.classroom_type,
			day.day
	FROM
		classroom_available_on clsav
	JOIN
		classrooms clsr
	ON 
		clsr.id = clsav.classroom_id
	JOIN
		days_of_the_week day
	ON 
		day.id = clsav.day_of_the_week_id
	WHERE 
		clsav.state=1;


Il = SELECT prof.full_name,
			day.day
	FROM
		prof_available_on profav
	JOIN
		professors prof
	ON 
		prof.id = profav.prof_id
	JOIN
		days_of_the_week day
	ON 
		day.id = profav.day_of_the_week_id
	WHERE 
		profav.state=1;


Iln = Il \ In.
Iln = SELECT prof.full_name,
			clsr.classroom_name,
			clsr.classroom_type,
			day.day
	FROM
		prof_classroom_availability profclsav
	JOIN
		prof_available_on profav
	ON
		profav.id = profclsav.prof_available_on_id
	JOIN
		classroom_available_on clsav
	ON
		clsav.id = profclsav.classroom_available_on_id

	JOIN
		professors prof
	ON
		prof.id = profav.prof_id
	JOIN
		classrooms clsr
	ON
		clsr.id = clsav.classroom_id
	JOIN
		days_of_the_week day
	ON
		day.id = profav.day_of_the_week_id
		AND 
		day.id = clsav.day_of_the_week_id
	WHERE 
		profclsav.state=1;


Jiln = SELECT 
			period.start_time,
			period.end_time,
			prof.full_name,
			clsr.classroom_name,
			clsr.classroom_type,
			day.day
	FROM
		period_prof_classroom_availability ppcav
	JOIN
		time_periods_of_day period
	ON
		period.id = ppcav.period_id
	JOIN
		prof_classroom_availability pcav
	ON
		pcav.id = ppcav.prof_classroom_availability_id

	JOIN
		prof_available_on pav
	ON
		pav.id = pcav.prof_available_on_id
	JOIN
		classroom_available_on clsav
	ON
		clsav.id = pcav.classroom_available_on_id

	JOIN
		professors prof 
	ON
		prof.id = pav.prof_id
	JOIN
		classrooms clsr
	ON
		clsr.id = clsav.classroom_id

	JOIN
		days_of_the_week day
	ON
		day.id = pav.day_of_the_week_id

	WHERE pcav.state = 1;


JLiln = SELECT 
	    period_ja.start_time AS start_time_ja,
	    period_ja.end_time AS end_time_ja,
	    period_jb.start_time AS start_time_jb,
	    period_jb.end_time AS end_time_jb,
	    prof.full_name,
	    clsr.classroom_name,
	    clsr.classroom_type,
	    day.day
	FROM 
	    period_prof_classroom_availability ppcav_ja
	JOIN 
	    time_periods_of_day period_ja
	    ON period_ja.id = ppcav_ja.period_id
	JOIN 
	    period_prof_classroom_availability ppcav_jb
	    ON ppcav_jb.prof_classroom_availability_id = ppcav_ja.prof_classroom_availability_id
	    AND ppcav_jb.state = 1
	JOIN 
	    time_periods_of_day period_jb
	    ON period_jb.id = ppcav_jb.period_id
	JOIN 
	    prof_classroom_availability pcav_ja
	    ON pcav_ja.id = ppcav_ja.prof_classroom_availability_id
	JOIN 
	    prof_available_on pav
	    ON pav.id = pcav_ja.prof_available_on_id
	JOIN 
	    classroom_available_on clsav
	    ON clsav.id = pcav_ja.classroom_available_on_id
	JOIN 
	    professors prof
	    ON prof.id = pav.prof_id
	JOIN 
	    classrooms clsr
	    ON clsr.id = clsav.classroom_id
	JOIN 
	    days_of_the_week day
	    ON day.id = pav.day_of_the_week_id
	WHERE 
	    ppcav_ja.state = 1
	    AND period_ja.id < period_jb.id
	ORDER BY
	    day.day, period_ja.start_time, period_jb.start_time;



FJLiln = SELECT 
	    period.start_time AS start_period,    -- The start time of the period (ja)
	    prof.full_name,
	    clsr.classroom_name,
	    clsr.classroom_type,
	    day.day
	FROM
	    period_prof_classroom_availability ppcav
	JOIN
	    time_periods_of_day period
	    ON period.id = ppcav.period_id
	JOIN
	    prof_classroom_availability pcav
	    ON pcav.id = ppcav.prof_classroom_availability_id
	JOIN
	    prof_available_on pav
	    ON pav.id = pcav.prof_available_on_id
	JOIN
	    classroom_available_on clsav
	    ON clsav.id = pcav.classroom_available_on_id
	JOIN
	    professors prof 
	    ON prof.id = pav.prof_id
	JOIN
	    classrooms clsr
	    ON clsr.id = clsav.classroom_id
	JOIN
	    days_of_the_week day
	    ON day.id = pav.day_of_the_week_id
	WHERE 
	    pcav.state = 1;   -- Ensures only active (available) periods are included



Pm = SELECT 
	    course_name,
	    period_repetition_count AS p_maxm
	FROM 
	    courses;

Hm = SELECT 
	    course_name,
	    period_repetition_count AS hm
	FROM 
	    courses;

PRA = SELECT 
	    t.id AS timetable_id,
	    dow.day AS day_of_week,
	    tpd.start_time AS start_time,
	    tpd.end_time AS end_time,
	    g.group_name AS group_name,
	    p.full_name AS professor_name,
	    c.course_name AS course_name,
	    cl.classroom_name AS classroom_name
	FROM 
	    timetable t
	JOIN 
	    days_of_the_week dow ON t.day_of_the_week_id = dow.id
	JOIN 
	    time_periods_of_day tpd ON t.time_period_id = tpd.id
	JOIN 
	    groups g ON t.group_id = g.id
	JOIN 
	    professors p ON t.prof_id = p.id
	JOIN 
	    courses c ON t.course_id = c.id
	JOIN 
	    classrooms cl ON t.classroom_id = cl.id
	WHERE 
	    t.state = 1
	ORDER BY 
	    dow.id, tpd.start_time;








simple timetable

SELECT 
	t.id,
    day.day,
    time_period.start_time, time_period.end_time,
    grp.group_name, grd.grade_name, grd.grade_type,
    prof.full_name, 
    course.course_name, course.course_type, 
    classroom.classroom_name, classroom.classroom_type
FROM timetable t
JOIN days_of_the_week day ON day.id = t.day_of_the_week_id
JOIN time_periods_of_day time_period ON time_period.id = t.time_period_id
JOIN groups grp ON grp.id = t.group_id
JOIN grades grd ON grd.id = grp.grade_id
JOIN professors prof ON prof.id = t.prof_id
JOIN courses course ON course.id = t.course_id
JOIN classrooms classroom ON classroom.id = t.classroom_id
WHERE grd.grade_name="semester 1" AND grp.group_name="SMI section A";