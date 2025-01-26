package com.scholarium.system.timetable.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataFetcherID {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // I = days_of_the_week
    public short[] getDayWeekIDs() {
        String sql = "SELECT id FROM days_of_the_week WHERE state = 1";
        return getShorts(sql);
    }

    private short[] getShorts(String sql) {
        List<Short> ids = jdbcTemplate.query(sql, (rs, rowNum) -> rs.getShort("id"));

        short[] result = new short[ids.size()];
        for (int i = 0; i < ids.size(); i++) {
            result[i] = ids.get(i);
        }
        return result;
    }

    // J = time_periods_of_day
    public short[] getPeriodIDs() {
        String sql = "SELECT id FROM time_periods_of_day WHERE state = 1";
        return getShorts(sql);
    }

    // K1 = groups from lower-grade
    public short[] getLowerGradeGroupIDs() {
        String sql = """
            SELECT gp.id
            FROM groups gp
            JOIN grades gd ON gp.grade_id = gd.id
            WHERE gd.grade_type = 'lower-grade' AND gp.state = 1
        """;
        return getShorts(sql);
    }

    // K2 = groups from higher-grade
    public short[] getHigherGradeGroupIDs() {
        String sql = """
            SELECT gp.id
            FROM groups gp
            JOIN grades gd ON gp.grade_id = gd.id
            WHERE gd.grade_type = 'higher-grade' AND gp.state = 1
        """;
        return getShorts(sql);
    }
    // K = groups from both
    public short[] getGroupIDs() {
        String sql = "SELECT id FROM groups WHERE state = 1";
        return getShorts(sql);
    }

    // L = professors
    public short[] getProfIDs() {
        String sql = "SELECT id FROM professors WHERE state = 1";
        return getShorts(sql);
    }

    // M = courses
    public short[] getCourseIDs() {
        String sql = "SELECT id FROM courses WHERE state = 1";
        return getShorts(sql);
    }

    // N = classrooms
    public short[] getClassroomIDs() {
        String sql = "SELECT id FROM classrooms WHERE state = 1";
        return getShorts(sql);
    }

    // Kl & Lk = group_prof
    public short[] getGroupProfIDs() {
        String sql = "SELECT id FROM group_prof WHERE state = 1";
        return getShorts(sql);
    }

    // Li & Il = prof_available_on
    public short[] getProfAvOnIDs() {
        String sql = "SELECT id FROM prof_available_on WHERE state = 1";
        return getShorts(sql);
    }

    // Lm & Ml = prof_course
    public short[] getProfCourseIDs() {
        String sql = "SELECT id FROM prof_course WHERE state = 1";
        return getShorts(sql);
    }

    // Mk = course_group
    public short[] getCourseGroupIDs() {
        String sql = "SELECT id FROM course_group WHERE state = 1";
        return getShorts(sql);
    }

    // Lkm & Mkl = prof_group_course
    public short[] getProfGroupCourseIDs() {
        String sql = "SELECT id FROM prof_group_course WHERE state = 1";
        return getShorts(sql);
    }

    // Lki = prof_group_day
    public short[] getProfGroupDayIDs() {
        String sql = "SELECT id FROM prof_group_day WHERE state = 1";
        return getShorts(sql);
    }

    // Mn = course_classroom
    public short[] getCourseClassroomIDs() {
        String sql = "SELECT id FROM course_classroom WHERE state = 1";
        return getShorts(sql);
    }

    // Nmk ~ Mkn = course_group_classroom
    public short[] getCourseGroupClassroomIDs() {
        String sql = "SELECT id FROM course_group_classroom WHERE state = 1";
        return getShorts(sql);
    }

    // Mkln = course_group_prof_classroom
    public short[] getCourseGroupProfClassroomIDs() {
        String sql = "SELECT id FROM course_group_prof_classroom WHERE state = 1";
        return getShorts(sql);
    }

    // Ni = classroom_available_on
    public short[] getClassroomAvOnIDs() {
        String sql = "SELECT id FROM classroom_available_on WHERE state = 1";
        return getShorts(sql);
    }

    // Lni = prof_classroom_availability
    public short[] getProfClassroomAvOnIDs() {
        String sql = "SELECT id FROM prof_classroom_availability WHERE state = 1";
        return getShorts(sql);
    }

    // Jlni = period_prof_classroom_availability
    public short[] getPeriodProfClassroomAvOnIDs() {
        String sql = "SELECT id FROM period_prof_classroom_availability WHERE state = 1";
        return getShorts(sql);
    }

    // pv
    public short[] getPeriodRepetitionCounts() {
        String sql = "SELECT period_repetition_count FROM courses WHERE state = 1";
        List<Short> counts = jdbcTemplate.query(sql, (rs, rowNum) -> rs.getShort("period_repetition_count"));

        short[] result = new short[counts.size()];
        for (int i = 0; i < counts.size(); i++) {
            result[i] = counts.get(i);
        }
        return result;
    }

    // hv
    public short[] getPeriodLengthCounts() {
        String sql = "SELECT period_length_count FROM courses WHERE state = 1";
        List<Short> counts = jdbcTemplate.query(sql, (rs, rowNum) -> rs.getShort("period_length_count"));

        short[] result = new short[counts.size()];
        for (int i = 0; i < counts.size(); i++) {
            result[i] = counts.get(i);
        }
        return result;
    }


    public short[] getMkcom() {
        String sql = """
                    SELECT crs.id
                    FROM courses crs
                    JOIN prof_course cp ON crs.id = cp.course_id
                    JOIN professors prof ON prof.id = cp.prof_id
                    JOIN course_group cg_main ON crs.id = cg_main.course_id
                    JOIN groups grp_main ON grp_main.id = cg_main.group_id
                    JOIN course_group cg_elective ON crs.id = cg_elective.course_id
                    JOIN groups grp_elective ON grp_elective.id = cg_elective.group_id
                    WHERE grp_main.id <> grp_elective.id;
                """;
        return getShorts(sql);
    }
}
