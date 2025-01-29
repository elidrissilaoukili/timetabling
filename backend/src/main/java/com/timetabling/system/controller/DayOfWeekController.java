package com.example.controller;

import com.example.dto.DayOfWeekDTO;
import com.example.entity.DayOfWeek;
import com.example.service.DayOfWeekService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/days")
public class DayOfWeekController {

    @Autowired
    private DayOfWeekService service;

    @GetMapping
    public List<DayOfWeek> getAllDays() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<DayOfWeek> getDayById(@PathVariable Integer id) {
        return service.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<String> createDay(@Valid @RequestBody DayOfWeekDTO dayOfWeekDTO, BindingResult result) {
        if (result.hasErrors()) {
            String errorMessage = result.getAllErrors().stream()
                                        .map(ObjectError::getDefaultMessage)
                                        .collect(Collectors.joining(", "));
            return ResponseEntity.badRequest().body("Validation failed: " + errorMessage);
        }
        DayOfWeek createdDay = service.save(dayOfWeekDTO);
        return ResponseEntity.ok("Day of the week created successfully with ID: " + createdDay.getId());
    }

    @PutMapping("/{id}")
    public ResponseEntity<DayOfWeek> updateDay(@PathVariable Integer id, @Valid @RequestBody DayOfWeekDTO dayOfWeekDTO, BindingResult result) {
        if (result.hasErrors()) {
            String errorMessage = result.getAllErrors().stream()
                                        .map(ObjectError::getDefaultMessage)
                                        .collect(Collectors.joining(", "));
            return ResponseEntity.badRequest().body("Validation failed: " + errorMessage);
        }
        return service.findById(id)
                .map(existingDay -> {
                    existingDay.setDay(dayOfWeekDTO.getDay());
                    existingDay.setState(dayOfWeekDTO.getState());
                    existingDay.setDescription(dayOfWeekDTO.getDescription().orElse(null));
                    return ResponseEntity.ok(service.save(existingDay));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteDay(@PathVariable Integer id) {
        service.deleteById(id);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping
    public ResponseEntity<Void> deleteAllDays(){
        service.deleteAll();
        return ResponseEntity.noContent().build();
    }
}
