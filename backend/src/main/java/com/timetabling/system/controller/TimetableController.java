package com.scholarium.system.timetable.controller;

import com.scholarium.system.timetable.cplex.TimetableData;
import com.scholarium.system.timetable.cplex.TimetableSolver;

import com.scholarium.system.timetable.service.DataFetcher;
import com.scholarium.system.timetable.service.DataFetcherID;
import ilog.concert.IloException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/timetable")
public class TimetableController {

    TimetableSolver timetableSolver;

    @GetMapping("/solve")
    public String solveTimetable() throws IloException {
        timetableSolver.solveModel();
        return "";
    }
}
