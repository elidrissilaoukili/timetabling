package com.timetabling.system.dto;

public class CourseGroupProfClassroomDTO {
    private int id;
    private int courseGroupClassroomId;
    private int profCourseId;

    // Constructor
    public CourseGroupProfClassroomDTO(int id, int courseGroupClassroomId, int profCourseId) {
        this.id = id;
        this.courseGroupClassroomId = courseGroupClassroomId;
        this.profCourseId = profCourseId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourseGroupClassroomId() {
        return courseGroupClassroomId;
    }

    public void setCourseGroupClassroomId(int courseGroupClassroomId) {
        this.courseGroupClassroomId = courseGroupClassroomId;
    }

    public int getProfCourseId() {
        return profCourseId;
    }

    public void setProfCourseId(int profCourseId) {
        this.profCourseId = profCourseId;
    }
}