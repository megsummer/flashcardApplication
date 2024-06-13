package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Cards;
import com.techelevator.model.User;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

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
                Cards card = mapRowToCard(results);
                card.setTags(getTagsByCardId(card.getCardId()));
                cardsList.add(card);

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
                    Cards card = mapRowToCard(results);
                    card.setTags(getTagsByCardId(card.getCardId()));
                    return card;

                } else {
                    return null; // or throw an exception if needed
                }
        } catch (DataAccessException e) {
            throw new DaoException("Error retrieving card by id: " + cardId, e);
        }
    }

    @Override

    public int saveCard(Cards card) {
        List<String> tags = card.getTags();
        int newCardId;
        try {
            String sql = "INSERT INTO cards (front_question, back_answer, card_img, user_id) VALUES (?, ?, ?, ?) RETURNING card_id;";
            newCardId = jdbcTemplate.queryForObject(sql, int.class, card.getFrontQuestion(), card.getBackAnswer(), card.getCardImg(), card.getUserId());
        } catch (DataAccessException e) {
            throw new DaoException("Error saving card: " + card, e);
        }
        for (String tag : tags) {
            tag = tag.toLowerCase(Locale.ROOT);

            try {
                String sql = "INSERT INTO cards_tags (card_id, tag) VALUES (?,?);";
                jdbcTemplate.update(sql, newCardId, tag);
            } catch (DataAccessException e) {
                throw new DaoException("Error saving tag: " + tag, e);
            }
        }
        return newCardId;
    }

    @Override
    public boolean updateCard(Cards card, int userId, int deckId) {

        List<String> tags = card.getTags();

        Cards currentCard = getCardById(card.getCardId());
        int currentCardUserId = currentCard.getUserId();
        if (userId != currentCardUserId) {

            int newId = saveCard(card);
            Cards newCard = getCardById(newId);
            addCardToDeck(newCard, deckId);
            return true;

        } else {


            try {
                String sql1 = "UPDATE cards SET front_question=?, back_answer=?, card_img=? WHERE card_id=?; ";
                String sql2 = "DELETE from cards_tags where card_id = ?;";
                jdbcTemplate.update(sql1, card.getFrontQuestion(), card.getBackAnswer(), card.getCardImg(), card.getCardId());
                jdbcTemplate.update(sql2, card.getCardId());
            } catch (DataAccessException e) {
                throw new DaoException("Error updating card: " + card, e);
            }
            if (tags != null) {
                for (String tag : tags) {
                    tag = tag.toLowerCase(Locale.ROOT);
                    try {
                        String sql = "INSERT INTO cards_tags (card_id, tag) VALUES (?,?);";
                        jdbcTemplate.update(sql, card.getCardId(), tag);
                    } catch (DataAccessException e) {
                        throw new DaoException("Error saving tag: " + tag, e);
                    }
                }
            }
            List<Cards> cardsCurrentlyInDeck = getCardsByDeckId(deckId);
            boolean isInDeck = false;
            for (Cards searchCard : cardsCurrentlyInDeck) {
                if (searchCard.getCardId() == card.getCardId()) {
                    isInDeck = true;
                }
            }
                if (!isInDeck) {
                    addCardToDeck(card, deckId);

            } return true;
        }

    }

    @Override
    public List<String> getTagsByCardId(int cardId) {
        List<String> cardTags = new ArrayList<>();
        String sql = "SELECT * FROM cards_tags WHERE card_id = ?;";
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
    public boolean deleteCard(int cardId, User user) {
    Cards card = getCardById(cardId);
    int deleteCardUserId = card.getUserId();
    boolean isDeleted = false;

    if(deleteCardUserId == user.getId()) {

        String sql1 = "DELETE from cards_tags where card_id = ?;";
        try {
            jdbcTemplate.update(sql1, cardId);
        } catch (DataAccessException e) {
            throw new DaoException("Error deleting tags for this card");
        }

        String sql2 = "DELETE from cards_to_decks where card_id = ?;";
        try {
            jdbcTemplate.update(sql2, cardId);
        } catch (DataAccessException e) {
            throw new DaoException("Error deleting card from decks");
        }


        try {
            String sql3 = "DELETE FROM cards WHERE card_id = ?;";
            jdbcTemplate.update(sql3, cardId);
        } catch (DataAccessException e) {
            throw new DaoException("Error deleting card with id: " + cardId, e);

        }
        isDeleted = true;
    }
        return isDeleted;

    }

    @Override
    public List<Cards> getCardByTags(List<String> tags) {
        List<Cards> cards = new ArrayList<>();
        for (String tag : tags) {
            tag = tag.toLowerCase(Locale.ROOT);
            String modTag = "%" + tag + "%";
            String sql = "SELECT * FROM cards WHERE card_id IN (SELECT card_id FROM cards_tags WHERE tag LIKE ?);";
            try {
                SqlRowSet results = jdbcTemplate.queryForRowSet(sql, modTag);

                while (results.next()) {
                    Cards card = mapRowToCard(results);
                    card.setTags(getTagsByCardId(card.getCardId()));
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

    @Override
public List<Cards> getCardsByDeckId (int deckId){
       List<Cards> cards = new ArrayList<>();

       String sql = "SELECT cards.card_id, front_question, back_answer, card_img, user_id \n" +
               "FROM cards\n" +
               "JOIN cards_to_decks\n" +
               "ON cards.card_id\n" +
               "   = cards_to_decks.card_id\n" +
               "WHERE deck_id = ?;";
       try {
           SqlRowSet results = jdbcTemplate.queryForRowSet(sql, deckId);

        while (results.next()) {
            Cards card = mapRowToCard(results);
            card.setTags(getTagsByCardId(card.getCardId()));
            cards.add(card);
        }
    } catch (CannotGetJdbcConnectionException e) {
        throw new DaoException("Unable to connect to server or database", e);
    } catch (DataAccessException e) {
        throw new DaoException("Error retrieving cards.", e);
    }
        return cards;
}



    public boolean removeCardFromDeck(int cardId, int deckId){
        String sql = "DELETE FROM cards_to_decks WHERE card_id = ? AND deck_id = ?;";

        try {
             jdbcTemplate.update(sql, cardId, deckId);

        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataAccessException e) {
            throw new DaoException("Error removing cards.", e);
        }

        return true;
    }




    public boolean addCardToDeck(Cards card, int deckId){
        String sql = "INSERT INTO cards_to_decks (card_id, deck_id) VALUES (?, ?);";
        try {
            jdbcTemplate.update(sql, card.getCardId(), deckId);

        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataAccessException e) {
            throw new DaoException("Error adding cards.", e);
        }

        return true;
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