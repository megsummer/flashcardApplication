package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Deck;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.ArrayList;
import java.util.List;

@Component
@CrossOrigin
public class JdbcDeckDao implements DeckDao{



    private final JdbcTemplate jdbcTemplate;

    public JdbcDeckDao(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }
@Override

    public Deck getDeckByDeckId(int deckId){
        Deck deck = null;
        String sql = "SELECT deck_id, user_id, deck_title, deck_description, cover_img, pending_approval, " +
                "is_approved, admin_id FROM decks WHERE deck_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, deckId);
            if(results.next()){
                deck = mapRowToDeck(results);

            }
        }catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }return deck;
    }
@Override
    public List<Deck> getAllDecks() {
        List<Deck> decks = new ArrayList<>();
        String sql = "SELECT deck_id, user_id, deck_title, deck_description, cover_img, pending_approval," +
                "is_approved, admin_id FROM decks;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while(results.next()) {
                Deck deck = mapRowToDeck(results);
                decks.add(deck);
            }
            } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return decks;
    }


@Override
    public List<Deck> geAllDecksByUserId(int userId) {
        List<Deck> decks = new ArrayList<>();
        String sql = "SELECT deck_id, user_id, deck_title, cover_img, deck_description, pending_approval," +
                "is_approved, admin_id FROM decks WHERE user_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
            while(results.next()) {
                Deck deck = mapRowToDeck(results);
                decks.add(deck);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return decks;
    }
@Override
    public List<Deck> getAllAdminDecks() {
        List<Deck> decks = new ArrayList<>();
        String sql = "SELECT deck_id, user_id, deck_title, cover_img, deck_description, pending_approval," +
                "is_approved, admin_id FROM decks WHERE is_approved = true;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while(results.next()) {
                Deck deck = mapRowToDeck(results);
                decks.add(deck);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return decks;
    }
@Override

    public int createDeck(Deck deckToCreate){
        Deck newDeck = null;
        String sql = "INSERT INTO decks (user_id, deck_title, cover_img, deck_description) VALUES (?, ?, ?, ?) RETURNING deck_id;";

        try{
            int newDeckId = jdbcTemplate.queryForObject(sql, int.class, deckToCreate.getUserId(), deckToCreate.getDeckTitle(),
                    deckToCreate.getCoverImg(), deckToCreate.getDeckDescription());
            newDeck = getDeckByDeckId(newDeckId);
        }catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return newDeck.getDeckId();
    }
@Override

    public boolean deleteDeck(int deckId){
        String sql = "DELETE FROM deck WHERE deck_id = ?";
        jdbcTemplate.update(sql, deckId);
        boolean isDeleted = false;
        if (getDeckByDeckId(deckId) == null){
            isDeleted = true;
        }
        return isDeleted;

    }

    @Override

    public boolean updateDeck(Deck updateDeck){

        String sql = "UPDATE decks " +
                "SET deck_title = ?, cover_img = ?, deck_description =?, pending_approval = ?, is_approved = ?, admin_id =?" +
                "WHERE deck_id = ?";
        try{
           jdbcTemplate.update(sql, updateDeck.getDeckTitle(), updateDeck.getCoverImg(), updateDeck.getDeckDescription(),
                   updateDeck.isPendingApproval(), updateDeck.isApproved(), updateDeck.getAdminId(), updateDeck.getDeckId());

        }catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
return true;
    }





    private Deck mapRowToDeck(SqlRowSet rs){
        Deck deck = new Deck();
        deck.setDeckId(rs.getInt("deck_id"));
        deck.setUserId(rs.getInt("user_id"));
        deck.setDeckTitle(rs.getString("deck_title"));
        deck.setCoverImg(rs.getString("cover_img"));
        deck.setDeckDescription(rs.getString("deck_description"));
        deck.setPendingApproval(rs.getBoolean("pending_approval"));
        deck.setApproved(rs.getBoolean("is_approved"));
        deck.setAdminId(rs.getInt("admin_id"));
        return deck;
    }

}
