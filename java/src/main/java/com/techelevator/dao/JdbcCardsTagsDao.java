package com.techelevator.dao;
import com.techelevator.model.CardsTags;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;



public class JdbcCardsTagsDao {
    private JdbcTemplate template;
    private CardsTags mapRowtoCards(SqlRowSet rowSet) {
        CardsTags cardsTags = new CardsTags();

        cardsTags.setCardId(rowSet.getInt("card_id"));
        cardsTags.setTag(rowSet.getString("tag"));

        return cardsTags;
    }
}