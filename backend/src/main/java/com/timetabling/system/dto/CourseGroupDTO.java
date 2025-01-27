package com.timetabling.system.dto;

public class CourseGroupDTO {
    private int id;
    private String groupName;
    private String courseName;

    // Constructor
    public CourseGroupDTO(int id, String groupName, String courseName) {
        this.id = id;
        this.groupName = groupName;
        this.courseName = courseName;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
}
