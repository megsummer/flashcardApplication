package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Deck;
import com.techelevator.model.DeckTags;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlInOutParameter;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.util.ArrayList;
import java.util.List;

public class JdbcDeckDao {

    //TODO add @markups and authorizations

    private final JdbcTemplate jdbcTemplate;

    public JdbcDeckDao(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    public Deck getDeckByDeckId(int deckId){
        Deck deck = null;
        String sql = "SELECT deck_id, user_id, deck_title, deck_description, cover_img, pending_approval, " +
                "is_approved, admin_id FROM decks WHERE deck_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, deckId);
            if(results.next()){
                deck = mapRowToDeck(results);
                deck.setTags(getTagsByDeckId(deck.getDeckId()));

            }
        }catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }return deck;
    }

    public List<Deck> getAllDecks() {
        List<Deck> decks = new ArrayList<>();
        String sql = "SELECT SELECT deck_id, user_id, deck_title, deck_description, cover_img, pending_approval," +
                "is_approved, admin_id FROM decks;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while(results.next()) {
                Deck deck = mapRowToDeck(results);
                deck.setTags(getTagsByDeckId(deck.getDeckId()));
                decks.add(deck);
            }
            } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return decks;
    }


    public List<Deck> geAllDecksByUserId(int userId) {
        List<Deck> decks = new ArrayList<>();
        String sql = "SELECT SELECT deck_id, user_id, deck_title, cover_img, deck_description, pending_approval," +
                "is_approved, admin_id FROM decks WHERE user_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
            while(results.next()) {
                Deck deck = mapRowToDeck(results);
                deck.setTags(getTagsByDeckId(deck.getDeckId()));
                decks.add(deck);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return decks;
    }

    //TODO: add code to add new tags from deck object to the database
    public Deck createDeck(Deck deckToCreate){
        Deck newDeck = null;
        String sql = "INSERT INTO decks (user_id, deck_title, cover_img, deck_description, pending_approval, " +
                "is_approved, admin_id) VALUES (?, ?, ?, ?, ?, ?, ?) RETURNING deck_id;";

        try{
            int newDeckId = jdbcTemplate.queryForObject(sql, int.class, deckToCreate.getUserId(), deckToCreate.getDeckTitle(),
                    deckToCreate.getCoverImg(), deckToCreate.getDeckDescription(), deckToCreate.isPendingApproval(),
                    deckToCreate.isApproved(), deckToCreate.getAdminId());
            newDeck = getDeckByDeckId(newDeckId);
        }catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return newDeck;
    }

    //TODO: Add sql to delete rows from tags before deleting deck
    public void deleteDeck(int deckId){
        String sql = "DELETE FROM deck WHERE deck_id = ?";
        jdbcTemplate.update(sql, deckId);

    }
//TODO: add sql to add tags from updated deck to the database
    public void updateDeck(Deck updateDeck){

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

    }

//copied these over from the deckTags dao, should prevent us having to instantiate a deck-tag object.



    public List<String> getTagsByDeckId(int deckId){
        List<String> deckTags = new ArrayList<>();
        String sql = "SELECT * FROM deck_tags WHERE deck_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql,deckId);
            while (results.next()) {
                deckTags.add(results.getString("tag"));
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return deckTags;
    }


    public List<Deck> getDeckIdByTag(String tag){
        List<Deck> decks = new ArrayList<>();
        String sql = "SELECT * FROM deck_tags WHERE tag = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql,tag);
            while (results.next()) {
              Deck deck = mapRowToDeck(results);
              deck.setTags(getTagsByDeckId(deck.getDeckId()));
              decks.add(deck);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return decks;
    }

    //todo: I think we need to adjust this so that it is deleting all existing tags under deck id, then adding new tags with deck id..
    public DeckTags updateTagByDeckId(DeckTags deckTags){
        DeckTags updateTags = null;
        String sql = "UPDATE deck_tags SET tag = ? WHERE deck_id = ?";
        try {
            int numberOfRows = jdbcTemplate.update(sql, deckTags.getDeckId(), deckTags.getTag());
            if (numberOfRows == 0) {
                throw new DaoException("Zero rows updated, expected at least one");
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("unable to connect", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("data integrity violation", e);
        } catch (DaoException e) {
            throw new DaoException("no rows effected");
        }
        return getTagsByDeckId(deckTags.getDeckId());
    }




    private Deck mapRowToDeck(SqlRowSet rs){
        Deck deck = new Deck();
        deck.setDeckId(rs.getInt("deck_id"));
        deck.setUserId(rs.getInt("user_id"));
        deck.setDeckTitle(rs.getString("deck_name"));
        deck.setCoverImg(rs.getString("cover_img"));
        deck.setDeckDescription(rs.getString("deck_description"));
        deck.setPendingApproval(rs.getBoolean("pending_approval"));
        deck.setApproved(rs.getBoolean("is_approved"));
        deck.setAdminId(rs.getInt("admin_id"));
        return deck;
    }

}
