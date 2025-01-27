package com.timetabling.system.controller;

import com.timetabling.system.timetabling.OutputCapturer;
import com.timetabling.system.timetabling.TimetablingData;
import com.timetabling.system.timetabling.Timetable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/timetable")
public class TimetableController {

    @GetMapping("/solve")
    public ResponseEntity<String> solveTimetable() {
        // Step 1: Initialize the data
        TimetablingData data = new TimetablingData();
        data.initializeData();

        // Step 2: Create the timetable model
        Timetable timetable = new Timetable(data);

        // Step 3: Capture System.out output
        OutputCapturer capturer = new OutputCapturer();
        capturer.startCapture();

        // Step 4: Create and solve the model
        timetable.createModel();
        timetable.solveModel();

        // Step 5: Stop capturing and get the output
        String output = capturer.stopCapture();

        // Step 6: Return the captured output as the HTTP response
        return ResponseEntity.ok(output);
    }
}


/*package com.timetabling.system.controller;

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
}*/
