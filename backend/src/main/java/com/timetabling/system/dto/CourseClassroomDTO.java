package com.timetabling.system.dto;

public class CourseClassroomDTO {
    private int id;
    private int courseId;
    private int classroomId;

    // Constructor
    public CourseClassroomDTO(int id, int courseId, int classroomId) {
        this.id = id;
        this.courseId = courseId;
        this.classroomId = classroomId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getClassroomId() {
        return classroomId;
    }

    public void setClassroomId(int classroomId) {
        this.classroomId = classroomId;
    }
}
