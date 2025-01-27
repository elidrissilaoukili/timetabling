package com.timetabling.system.dto;

public class ProfessorCourseDTO {
    private int id;
    private int profId;
    private int courseId;
    private String courseName;

    // Constructor
    public ProfessorCourseDTO(int id, int profId, int courseId, String courseName) {
        this.id = id;
        this.profId = profId;
        this.courseId = courseId;
        this.courseName = courseName;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProfId() {
        return profId;
    }

    public void setProfId(int profId) {
        this.profId = profId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
}
