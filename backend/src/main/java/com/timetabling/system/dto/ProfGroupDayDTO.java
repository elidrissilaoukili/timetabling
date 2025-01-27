package com.timetabling.system.dto;

public class ProfGroupDayDTO {
    private int id;
    private int profGroupId;
    private int profAvailableOnId;

    // Constructor
    public ProfGroupDayDTO(int id, int profGroupId, int profAvailableOnId) {
        this.id = id;
        this.profGroupId = profGroupId;
        this.profAvailableOnId = profAvailableOnId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProfGroupId() {
        return profGroupId;
    }

    public void setProfGroupId(int profGroupId) {
        this.profGroupId = profGroupId;
    }

    public int getProfAvailableOnId() {
        return profAvailableOnId;
    }

    public void setProfAvailableOnId(int profAvailableOnId) {
        this.profAvailableOnId = profAvailableOnId;
    }
}
