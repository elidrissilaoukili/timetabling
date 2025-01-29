package com.example.service;

import com.example.dto.DayOfWeekDTO;
import com.example.entity.DayOfWeek;
import com.example.repository.DayOfWeekRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import jakarta.validation.Valid;

@Service
public class DayOfWeekService {

    @Autowired
    private DayOfWeekRepository dayOfWeekRepository; 

    public List<DayOfWeek> findAll() {
        return dayOfWeekRepository.findAll();
    }

    public Optional<DayOfWeek> findById(Integer id) {
        return dayOfWeekRepository.findById(id);
    }

    public DayOfWeek save(@Valid DayOfWeekDTO dayOfWeekDTO) {
        // Convert DTO to Entity
        DayOfWeek dayOfWeek = new DayOfWeek();
        dayOfWeek.setDay(dayOfWeekDTO.getDay());
        dayOfWeek.setState(dayOfWeekDTO.getState());
        dayOfWeek.setDescription(dayOfWeekDTO.getDescription().orElse(null));
        
        return dayOfWeekRepository.save(dayOfWeek);
    }

    public void deleteById(Integer id) {
        dayOfWeekRepository.deleteById(id);
    }

    public void deleteAll() {
        dayOfWeekRepository.deleteAll();
    }
}
