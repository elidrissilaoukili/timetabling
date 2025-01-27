package com.timetabling.system.dto;

public class ProfGroupCourseDTO {
    private int id;
    private int groupProfId;
    private int profCourseId;

    // Constructor
    public ProfGroupCourseDTO(int id, int groupProfId, int profCourseId) {
        this.id = id;
        this.groupProfId = groupProfId;
        this.profCourseId = profCourseId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGroupProfId() {
        return groupProfId;
    }

    public void setGroupProfId(int groupProfId) {
        this.groupProfId = groupProfId;
    }

    public int getProfCourseId() {
        return profCourseId;
    }

    public void setProfCourseId(int profCourseId) {
        this.profCourseId = profCourseId;
    }
}
