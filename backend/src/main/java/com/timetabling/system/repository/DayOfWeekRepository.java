package com.example.repository;

import com.example.entity.DayOfWeek;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DayOfWeekRepository extends JpaRepository<DayOfWeek, Integer> {
    // Custom queries can be defined here if needed.
}
