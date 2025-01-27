package com.timetabling.system.dto;

public class PeriodProfClassroomAvailabilityDTO {
    private int id;
    private int periodId;
    private int profClassroomAvailabilityId;

    // Constructor
    public PeriodProfClassroomAvailabilityDTO(int id, int periodId, int profClassroomAvailabilityId) {
        this.id = id;
        this.periodId = periodId;
        this.profClassroomAvailabilityId = profClassroomAvailabilityId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPeriodId() {
        return periodId;
    }

    public void setPeriodId(int periodId) {
        this.periodId = periodId;
    }

    public int getProfClassroomAvailabilityId() {
        return profClassroomAvailabilityId;
    }

    public void setProfClassroomAvailabilityId(int profClassroomAvailabilityId) {
        this.profClassroomAvailabilityId = profClassroomAvailabilityId;
    }
}