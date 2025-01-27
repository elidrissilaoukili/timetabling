package com.timetabling.system.dto;

public class ClassroomAvailableOnDTO {
    private int id;
    private int classroomId;
    private int dayOfTheWeekId;

    // Constructor
    public ClassroomAvailableOnDTO(int id, int classroomId, int dayOfTheWeekId) {
        this.id = id;
        this.classroomId = classroomId;
        this.dayOfTheWeekId = dayOfTheWeekId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClassroomId() {
        return classroomId;
    }

    public void setClassroomId(int classroomId) {
        this.classroomId = classroomId;
    }

    public int getDayOfTheWeekId() {
        return dayOfTheWeekId;
    }

    public void setDayOfTheWeekId(int dayOfTheWeekId) {
        this.dayOfTheWeekId = dayOfTheWeekId;
    }
}
