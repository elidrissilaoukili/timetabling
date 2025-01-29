package com.example.dto;

import jakarta.validation.constraints.*;
import java.util.Optional;

public class DayOfWeekDTO {

    @NotBlank(message = "Day cannot be blank.")
    @Size(min = 3, max = 20, message = "Day must be between 3 and 20 characters.")
    private String day;

    @NotNull(message = "State cannot be null.")
    @AssertTrue(message = "State must be either true or false.")
    private Boolean state;

    @Size(max = 255, message = "Description cannot exceed 255 characters.")
    private String description;

    // Getters and Setters
    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }

    public Optional<String> getDescription() {
        return Optional.ofNullable(description);
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
