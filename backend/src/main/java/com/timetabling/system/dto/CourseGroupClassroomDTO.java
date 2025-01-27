package com.timetabling.system.dto;

public class CourseGroupClassroomDTO {
    private int id;
    private int courseGroupId;
    private int courseClassroomId;

    // Constructor
    public CourseGroupClassroomDTO(int id, int courseGroupId, int courseClassroomId) {
        this.id = id;
        this.courseGroupId = courseGroupId;
        this.courseClassroomId = courseClassroomId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourseGroupId() {
        return courseGroupId;
    }

    public void setCourseGroupId(int courseGroupId) {
        this.courseGroupId = courseGroupId;
    }

    public int getCourseClassroomId() {
        return courseClassroomId;
    }

    public void setCourseClassroomId(int courseClassroomId) {
        this.courseClassroomId = courseClassroomId;
    }
}