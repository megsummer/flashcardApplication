package com.techelevator.dao;

import com.techelevator.model.Cards;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Component
public class JdbcCardsDao implements CardsDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcCardsDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Cards> getAllCards() {
        String sql = "SELECT * FROM cards";
        return jdbcTemplate.query(sql, new CardMapper());
    }

    @Override
    public Cards getCardById(int cardId) {
        String sql = "SELECT * FROM cards WHERE card_id = ?";
        return jdbcTemplate.queryForObject(sql, new CardMapper(), cardId);
    }

    @Override
    public void saveCard(Cards card) {
        String sql = "INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, card.getFrontQuestion(), card.getBackAnswer(), card.getCardImg(), card.getUserId());
    }

    @Override
    public void updateCard(Cards card) {
        String sql = "UPDATE cards SET front_question=?, back_answer=?, card_img=?, user_id=? WHERE card_id=?";
        jdbcTemplate.update(sql, card.getFrontQuestion(), card.getBackAnswer(), card.getCardImg(), card.getUserId(), card.getCardId());
    }

    @Override
    public void deleteCard(int cardId) {
        String sql = "DELETE FROM cards WHERE card_id=?";
        jdbcTemplate.update(sql, cardId);
    }

    private static class CardMapper implements RowMapper<Cards> {
        @Override
        public Cards mapRow(ResultSet rs, int rowNum) throws SQLException {
            Cards card = new Cards();
            card.setCardId(rs.getInt("card_id"));
            card.setFrontQuestion(rs.getString("front_question"));
            card.setBackAnswer(rs.getString("back_answer"));
            card.setCardImg(rs.getString("card_img"));
            card.setUserId(rs.getInt("user_id"));
            return card;
        }
    }
}