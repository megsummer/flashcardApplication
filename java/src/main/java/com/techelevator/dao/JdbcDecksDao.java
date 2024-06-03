package com.techelevator.dao;

import org.springframework.jdbc.core.JdbcTemplate;

public class JdbcDecksDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcDecksDao(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }
}
