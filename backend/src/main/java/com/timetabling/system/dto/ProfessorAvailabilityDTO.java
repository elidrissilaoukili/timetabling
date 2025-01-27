package com.timetabling.system.dto;

public class ProfessorAvailabilityDTO {
    private int profAvailId;
    private int profId;
    private int dayId;
    private String dayName;

    // Constructor
    public ProfessorAvailabilityDTO(int profAvailId, int profId, int dayId, String dayName) {
        this.profAvailId = profAvailId;
        this.profId = profId;
        this.dayId = dayId;
        this.dayName = dayName;
    }

    // Getters and Setters
    public int getProfAvailId() {
        return profAvailId;
    }

    public void setProfAvailId(int profAvailId) {
        this.profAvailId = profAvailId;
    }

    public int getProfId() {
        return profId;
    }

    public void setProfId(int profId) {
        this.profId = profId;
    }

    public int getDayId() {
        return dayId;
    }

    public void setDayId(int dayId) {
        this.dayId = dayId;
    }

    public String getDayName() {
        return dayName;
    }

    public void setDayName(String dayName) {
        this.dayName = dayName;
    }
}
