package com.timetabling.system.service;

import com.timetabling.system.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataFetcher {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // I = days_of_the_week
    public short[] getDayWeek() {
        String sql = "SELECT id, day FROM days_of_the_week WHERE state = 1";
        List<Short> ids = jdbcTemplate.query(sql, (rs, rowNum) -> rs.getShort("id"));

        short[] result = new short[ids.size()];
        for (int i = 0; i < ids.size(); i++) {
            result[i] = ids.get(i);
        }
        return result;
    }

    // J = time_periods_of_day
    public short[] getPeriod() {
        String sql = "SELECT id, start_time, end_time FROM time_periods_of_day WHERE state = 1";
        List<Short> ids = jdbcTemplate.query(sql, (rs, rowNum) -> rs.getShort("id"));

        short[] result = new short[ids.size()];
        for (int i = 0; i < ids.size(); i++) {
            result[i] = ids.get(i);
        }
        return result;
    }

    // K1 = groups from lower-grade
    public List<GroupDTO> getLowerGradeGroups() {
        String sql = """
        SELECT  gp.id, gp.group_name, gd.grade_name, gd.grade_type
        FROM groups gp
        JOIN grades gd  ON gp.grade_id = gd.id
        WHERE gd.grade_type = 'lower-grade' AND gp.state = 1;
    """;

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            short id = rs.getShort("id");
            String groupName = rs.getString("group_name");
            String gradeName = rs.getString("grade_name");
            String gradeType = rs.getString("grade_type");

            return new GroupDTO(id, groupName, gradeName, gradeType);
        });
    }


    // K2 = groups from higher-grade
    public List<GroupDTO> getHigherGradeGroups() {
        String sql = """
        SELECT  gp.id, gp.group_name, gd.grade_name, gd.grade_type
        FROM groups gp
        JOIN grades gd  ON gp.grade_id = gd.id
        WHERE gd.grade_type = 'higher-grade' AND gp.state = 1;
    """;

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            short id = rs.getShort("id");
            String groupName = rs.getString("group_name");
            String gradeName = rs.getString("grade_name");
            String gradeType = rs.getString("grade_type");

            return new GroupDTO(id, groupName, gradeName, gradeType);
        });
    }

    // K = groups from both
    public short[] getGroups() {
        String sql = "SELECT id FROM groups WHERE state = 1";
        List<Short> ids = jdbcTemplate.query(sql, (rs, rowNum) -> rs.getShort("id"));

        short[] result = new short[ids.size()];
        for (int i = 0; i < ids.size(); i++) {
            result[i] = ids.get(i);
        }
        return result;
    }

    // L = professors
    public short[] getProfs() {
        String sql = "SELECT id FROM professors WHERE state = 1";
        List<Short> ids = jdbcTemplate.query(sql, (rs, rowNum) -> rs.getShort("id"));

        short[] result = new short[ids.size()];
        for (int i = 0; i < ids.size(); i++) {
            result[i] = ids.get(i);
        }
        return result;
    }

    // M = courses
    public short[] getCourses() {
        String sql = "SELECT id FROM courses WHERE state = 1";
        List<Short> ids = jdbcTemplate.query(sql, (rs, rowNum) -> rs.getShort("id"));

        short[] result = new short[ids.size()];
        for (int i = 0; i < ids.size(); i++) {
            result[i] = ids.get(i);
        }
        return result;
    }

    // N = classrooms
    public short[] getClassrooms() {
        String sql = "SELECT id FROM classrooms WHERE state = 1";
        List<Short> ids = jdbcTemplate.query(sql, (rs, rowNum) -> rs.getShort("id"));

        short[] result = new short[ids.size()];
        for (int i = 0; i < ids.size(); i++) {
            result[i] = ids.get(i);
        }
        return result;
    }

    // Kl & Lk = group_prof
    public List<GroupProfDTO> getGroupProf() {
        String sql = "SELECT id, prof_id, group_id FROM group_prof WHERE state = 1";

        List<GroupProfDTO> groupProfs = jdbcTemplate.query(sql, (rs, rowNum) -> {
            int id = rs.getInt("id");
            int profId = rs.getInt("prof_id");
            int groupId = rs.getInt("group_id");

            return new GroupProfDTO(id, profId, groupId);
        });

        return groupProfs;
    }


    // Li & Il = prof_available_on
    public List<ProfessorAvailabilityDTO> getProfAvOn() {
        String sql = "SELECT pa.id AS prof_avail_id, pa.prof_id, pa.day_id, d.day_name " +
                "FROM prof_available_on pa " +
                "JOIN days d ON pa.day_id = d.id " +
                "WHERE pa.state = 1";

        // Fetch the data and map it to a DTO
        List<ProfessorAvailabilityDTO> availabilityList = jdbcTemplate.query(sql, (rs, rowNum) -> {
            int profAvailId = rs.getInt("prof_avail_id");
            int profId = rs.getInt("prof_id");
            int dayId = rs.getInt("day_id");
            String dayName = rs.getString("day_name");

            // Return a new DTO for the professor's availability on a specific day
            return new ProfessorAvailabilityDTO(profAvailId, profId, dayId, dayName);
        });

        return availabilityList;
    }


    // Lm & Ml = prof_course
    public List<ProfessorCourseDTO> getProfCourse() {
        String sql = "SELECT pc.id, pc.prof_id, pc.course_id, c.course_name " +
                "FROM prof_course pc " +
                "JOIN courses c ON c.id = pc.course_id " +
                "WHERE pc.state = 1";

        List<ProfessorCourseDTO> professorCourses = jdbcTemplate.query(sql, (rs, rowNum) -> {
            int id = rs.getInt("id");
            int profId = rs.getInt("prof_id");
            int courseId = rs.getInt("course_id");
            String courseName = rs.getString("course_name");

            return new ProfessorCourseDTO(id, profId, courseId, courseName);
        });

        return professorCourses;
    }


    // Mk = course_group
    public List<CourseGroupDTO> getCourseGroups() {
        String sql = "SELECT cg.id, cg.group_name, c.course_name " +
                "FROM course_group cg " +
                "JOIN courses c ON c.id = cg.course_id " +
                "WHERE cg.state = 1";

        List<CourseGroupDTO> courseGroups = jdbcTemplate.query(sql, (rs, rowNum) -> {
            int id = rs.getInt("id");
            String groupName = rs.getString("group_name");
            String courseName = rs.getString("course_name");

            return new CourseGroupDTO(id, groupName, courseName);
        });

        return courseGroups;
    }


    // Lkm & Mkl = prof_group_course
    public List<ProfGroupCourseDTO> getProfGroupCourses() {
        String sql = "SELECT id, group_prof_id, prof_course_id " +
                "FROM prof_group_course " +
                "WHERE state = 1";

        List<ProfGroupCourseDTO> profGroupCourses = jdbcTemplate.query(sql, (rs, rowNum) -> {
            int id = rs.getInt("id");
            int groupProfId = rs.getInt("group_prof_id");
            int profCourseId = rs.getInt("prof_course_id");

            return new ProfGroupCourseDTO(id, groupProfId, profCourseId);
        });

        return profGroupCourses;
    }


    // Lki = prof_group_day
    public List<ProfGroupDayDTO> getProfGroupDays() {
        String sql = "SELECT id, prof_group_id, prof_available_on_id FROM prof_group_day WHERE state = 1";

        List<ProfGroupDayDTO> profGroupDays = jdbcTemplate.query(sql, (rs, rowNum) -> {
            int id = rs.getInt("id");
            int profGroupId = rs.getInt("prof_group_id");
            int profAvailableOnId = rs.getInt("prof_available_on_id");

            return new ProfGroupDayDTO(id, profGroupId, profAvailableOnId);
        });

        return profGroupDays;
    }


    // Mn = course_classroom
    public List<CourseClassroomDTO> getCourseClassrooms() {
        String sql = "SELECT id, course_id, classroom_id FROM course_classroom WHERE state = 1";

        List<CourseClassroomDTO> courseClassrooms = jdbcTemplate.query(sql, (rs, rowNum) -> {
            int id = rs.getInt("id");
            int courseId = rs.getInt("course_id");
            int classroomId = rs.getInt("classroom_id");

            return new CourseClassroomDTO(id, courseId, classroomId);
        });

        return courseClassrooms;
    }


    // Nmk ~ Mkn = course_group_classroom
    public List<CourseGroupClassroomDTO> getCourseGroupClassrooms() {
        String sql = "SELECT id, course_group_id, course_classroom_id FROM course_group_classroom WHERE state = 1";

        List<CourseGroupClassroomDTO> courseGroupClassrooms = jdbcTemplate.query(sql, (rs, rowNum) -> {
            int id = rs.getInt("id");
            int courseGroupId = rs.getInt("course_group_id");
            int courseClassroomId = rs.getInt("course_classroom_id");

            return new CourseGroupClassroomDTO(id, courseGroupId, courseClassroomId);
        });

        return courseGroupClassrooms;
    }


    // Mkln = course_group_prof_classroom
    public List<CourseGroupProfClassroomDTO> getCourseGroupProfClassrooms() {
        String sql = "SELECT id, course_group_classroom_id, prof_course_id FROM course_group_prof_classroom WHERE state = 1";

        List<CourseGroupProfClassroomDTO> courseGroupProfClassrooms = jdbcTemplate.query(sql, (rs, rowNum) -> {
            int id = rs.getInt("id");
            int courseGroupClassroomId = rs.getInt("course_group_classroom_id");
            int profCourseId = rs.getInt("prof_course_id");

            return new CourseGroupProfClassroomDTO(id, courseGroupClassroomId, profCourseId);
        });

        return courseGroupProfClassrooms;
    }


    // Ni = classroom_available_on
    public List<ClassroomAvailableOnDTO> getClassroomAvOn() {
        String sql = "SELECT id, classroom_id, day_of_the_week_id FROM classroom_available_on WHERE state = 1";

        List<ClassroomAvailableOnDTO> classroomAvailableOnList = jdbcTemplate.query(sql, (rs, rowNum) -> {
            int id = rs.getInt("id");
            int classroomId = rs.getInt("classroom_id");
            int dayOfTheWeekId = rs.getInt("day_of_the_week_id");

            return new ClassroomAvailableOnDTO(id, classroomId, dayOfTheWeekId);
        });

        return classroomAvailableOnList;
    }


    // Lni = prof_classroom_availability
    public List<ProfClassroomAvailabilityDTO> getProfClassroomAvOn() {
        String sql = "SELECT id, prof_available_on_id, classroom_available_on_id FROM prof_classroom_availability WHERE state = 1";

        List<ProfClassroomAvailabilityDTO> profClassroomAvOnList = jdbcTemplate.query(sql, (rs, rowNum) -> {
            int id = rs.getInt("id");
            int profAvailableOnId = rs.getInt("prof_available_on_id");
            int classroomAvailableOnId = rs.getInt("classroom_available_on_id");

            return new ProfClassroomAvailabilityDTO(id, profAvailableOnId, classroomAvailableOnId);
        });

        return profClassroomAvOnList;
    }


    // Jlni = period_prof_classroom_availability
    public List<PeriodProfClassroomAvailabilityDTO> getPeriodProfClassroomAvOn() {
        String sql = "SELECT id, period_id, prof_classroom_availability_id FROM period_prof_classroom_availability WHERE state = 1";

        List<PeriodProfClassroomAvailabilityDTO> result = jdbcTemplate.query(sql, (rs, rowNum) -> {
            int id = rs.getInt("id");
            int periodId = rs.getInt("period_id");
            int profClassroomAvailabilityId = rs.getInt("prof_classroom_availability_id");

            return new PeriodProfClassroomAvailabilityDTO(id, periodId, profClassroomAvailabilityId);
        });

        return result;
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
}
