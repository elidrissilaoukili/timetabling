package com.timetabling.system.dto;

public class GroupDTO {
    private short id;
    private String groupName;
    private String gradeName;
    private String gradeType;

    // Constructor
    public GroupDTO(short id, String groupName, String gradeName, String gradeType) {
        this.id = id;
        this.groupName = groupName;
        this.gradeName = gradeName;
        this.gradeType = gradeType;
    }

    // Getters and Setters
    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getGradeName() {
        return gradeName;
    }

    public void setGradeName(String gradeName) {
        this.gradeName = gradeName;
    }

    public String getGradeType() {
        return gradeType;
    }

    public void setGradeType(String gradeType) {
        this.gradeType = gradeType;
    }
}
