package com.timetabling.system.dto;

public class ProfClassroomAvailabilityDTO {
    private int id;
    private int profAvailableOnId;
    private int classroomAvailableOnId;

    // Constructor
    public ProfClassroomAvailabilityDTO(int id, int profAvailableOnId, int classroomAvailableOnId) {
        this.id = id;
        this.profAvailableOnId = profAvailableOnId;
        this.classroomAvailableOnId = classroomAvailableOnId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProfAvailableOnId() {
        return profAvailableOnId;
    }

    public void setProfAvailableOnId(int profAvailableOnId) {
        this.profAvailableOnId = profAvailableOnId;
    }

    public int getClassroomAvailableOnId() {
        return classroomAvailableOnId;
    }

    public void setClassroomAvailableOnId(int classroomAvailableOnId) {
        this.classroomAvailableOnId = classroomAvailableOnId;
    }
}