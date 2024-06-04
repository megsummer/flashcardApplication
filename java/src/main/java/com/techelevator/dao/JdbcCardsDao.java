package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Cards;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcCardsDao implements CardsDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcCardsDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Cards> getAllCards() {
        try {
            String sql = "SELECT * FROM cards";
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            List<Cards> cardsList = new ArrayList<>();
            while (results.next()) {
                cardsList.add(mapRowToCard(results));
            }
            return cardsList;
        } catch (DataAccessException e) {
            throw new DaoException("Error retrieving all cards", e);
        }
    }

    @Override
    public Cards getCardById(int cardId) {
        try {
            String sql = "SELECT * FROM cards WHERE card_id = ?";
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, cardId);
                if(results.next()) {
                    return mapRowToCard(results);
                } else {
                    return null; // or throw an exception if needed
                }
        } catch (DataAccessException e) {
            throw new DaoException("Error retrieving card by id: " + cardId, e);
        }
    }

    @Override
    public void saveCard(Cards card) {
        List<String> tag = card.getTags();
        if (tag != null) {
            try {
                String sql = "INSERT INTO cards_tags (tag)";
                jdbcTemplate.update(sql, tag);
            } catch (DataAccessException e) {
                throw new DaoException("Error saving tag: " + tag, e);
            }
        }

        try {
            String sql = "INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(sql, card.getFrontQuestion(), card.getBackAnswer(), card.getCardImg(), card.getUserId());
        } catch (DataAccessException e) {
            throw new DaoException("Error saving card: " + card, e);
        }
    }

    @Override
//    handle tags
    public void updateCard(Cards card) {
        List<String> tag = card.getTags();
        if (tag != null) {
            try {
                String sql = "UPDATE INTO cards_tags (tag)";
                jdbcTemplate.update(sql, tag);
            } catch (DataAccessException e) {
                throw new DaoException("Error saving tag: " + tag, e);
            }
        }

        try {
            String sql = "UPDATE cards SET front_question=?, back_answer=?, card_img=?, user_id=? WHERE card_id=?";
            jdbcTemplate.update(sql, card.getFrontQuestion(), card.getBackAnswer(), card.getCardImg(), card.getUserId(), card.getCardId());
        } catch (DataAccessException e) {
            throw new DaoException("Error updating card: " + card, e);
        }
    }

    @Override
    public List<String> getTagsByCardId(int cardId) {
        List<String> cardTags = new ArrayList<>();
        String sql = "SELECT * FROM card_tags WHERE card_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, cardId);
            while (results.next()) {
                cardTags.add(results.getString("tag"));
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return cardTags;
    }

    @Override
    public void deleteCard(int cardId) {
        try {
            String sql = "DELETE FROM cards WHERE card_id=?";
            jdbcTemplate.update(sql, cardId);
        } catch (DataAccessException e) {
            throw new DaoException("Error deleting card with id: " + cardId, e);
        }
    }

    @Override
    public List<Cards> getCardByTags(List<String> tags) {
        List<Cards> cards = new ArrayList<>();
        for (String tag : tags) {
            String sql = "SELECT * FROM cards WHERE card_id IN (SELECT card_id FROM card_tags WHERE tag = ?)";
            try {
                SqlRowSet results = jdbcTemplate.queryForRowSet(sql, tag);
                while (results.next()) {
                    Cards card = mapRowToCard(results);
                    cards.add(card);
                }
            } catch (CannotGetJdbcConnectionException e) {
                throw new DaoException("Unable to connect to server or database", e);
            } catch (DataAccessException e) {
                throw new DaoException("Error retrieving cards by tags: " + tags, e);
            }
        }
        return cards;
    }

    private Cards mapRowToCard(SqlRowSet rs) {
        Cards card = new Cards();
        card.setCardId(rs.getInt("card_id"));
        card.setFrontQuestion(rs.getString("front_question"));
        card.setBackAnswer(rs.getString("back_answer"));
        card.setCardImg(rs.getString("card_img"));
        card.setUserId(rs.getInt("user_id"));
        return card;
    }
}