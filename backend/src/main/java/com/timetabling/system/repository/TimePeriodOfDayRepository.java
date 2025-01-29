package com.example.repository;

import com.example.entity.TimePeriodOfDay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TimePeriodOfDayRepository extends JpaRepository<TimePeriodOfDay, Integer> {
}
