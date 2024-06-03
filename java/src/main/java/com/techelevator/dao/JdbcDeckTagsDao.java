package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.DeckTags;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcDeckTagsDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcDeckTagsDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

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

    public List<Integer> getDeckIdByTag(String tag){
        List<Integer> deckIds = new ArrayList<>();
        String sql = "SELECT * FROM deck_tags WHERE tag = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql,tag);
            while (results.next()) {
                deckIds.add(results.getInt("deck_id"));
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return deckIds;
    }

    public DeckTags updateTagByDeckId(DeckTags deckTags){
        DeckTags updateTags = null;
        String sql = "UPDATE deck_tags SET tag = ? WHERE deck_id = ?";
        try {
            int numberOfRows = jdbcTemplate.update(sql, deckTags.getDeckId(), deckTags.getTag())
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
            return getDeckTagsByDeckId(deckTags.getDeckId());
        }




//get all deck_ids with tag //get all tags with decks_ids

    private DeckTags mapRowToDeckTags(SqlRowSet rs){
        DeckTags deckTags = new DeckTags();
        deckTags.setDeckId(rs.getInt("deck_id"));
        deckTags.setTag(rs.getString("tag"));
        return deckTags;
    }
}
