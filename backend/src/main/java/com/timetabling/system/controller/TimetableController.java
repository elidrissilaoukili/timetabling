package com.timetabling.system.controller;

import com.timetabling.system.timetabling.TimetablingData;
import com.timetabling.system.timetabling.Timetable;

import ilog.concert.*;
import ilog.cplex.*;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/timetable")
public class TimetableController {

    @GetMapping("/solve")
    public String solveTimetable() throws IloException {
        // Step 1: Initialize the data
        TimetablingData data = new TimetablingData();
        data.initializeData();

        // Step 2: Create the timetable model
        Timetable timetable = new Timetable(data);

        // Step 3: Create and solve the model
        timetable.createModel();
        timetable.solveModel();
        return "";
    }
}
