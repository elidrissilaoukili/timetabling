package com.timetabling.system.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

@Service
public class TimetableService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // I = days_of_the_week
    public short[] findAll() {
        String sql = "SELECT * FROM timetable";
        return getShorts(sql);
    }

    private short[] getShorts(String sql) {
        List<Short> ids = jdbcTemplate.query(sql, (rs, rowNum) -> rs.getShort("id"));

        short[] result = new short[ids.size()];
        for (int i = 0; i < ids.size(); i++) {
            result[i] = ids.get(i);
        }
        return result;
    }

}
