package com.techelevator.controller;

import com.techelevator.dao.DeckDao;
import com.techelevator.model.Deck;
import org.hibernate.validator.constraints.pl.REGON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@RestController
@CrossOrigin
public class DeckController {
    private final String BASE_URL = "/decks";

    @Autowired
    private DeckDao deckDao;

    public DeckController(DeckDao deckDao) {
        this.deckDao = deckDao;
    }

    //GET ALL DECKS BY ID
    //@PreAuthorize("isAuthenticated()")
    @RequestMapping(path = BASE_URL + "/{deckId}", method = RequestMethod.GET)
    public Deck getDeckByDeckId(@PathVariable int deckId) {
        return deckDao.getDeckByDeckId(deckId);
    }

    //GET ALL DECKS
 //   @PreAuthorize("isAuthenticated()")
    @RequestMapping(path = BASE_URL, method = RequestMethod.GET)
    public List<Deck> getAllDecks() {
        return deckDao.getAllDecks();
    }

    //GET ALL DECKS BY USER ID
   // @PreAuthorize("isAuthenticated()")
    @RequestMapping(path = BASE_URL + "/user/{userId}", method = RequestMethod.GET)
    public List<Deck> geAllDecksByUserId(@PathVariable int userId){
        return deckDao.geAllDecksByUserId(userId);
    }

// GET ALL ADMIN DECKS
@RequestMapping(path = BASE_URL + "/admin", method = RequestMethod.GET)
    public List<Deck> getAllAdminDecks() {
        return deckDao.getAllAdminDecks();
    }

    //CREATE A DECK
   // @PreAuthorize("isAuthenticated()")
 @ResponseStatus(HttpStatus.CREATED)
@RequestMapping(path = BASE_URL + "/new", method = RequestMethod.POST)
    public int createDeck(@RequestBody Deck deckToCreate){
        return deckDao.createDeck(deckToCreate);
    }

    //DELETE DECK
   // @PreAuthorize("isAuthenticated()")
@RequestMapping(path = BASE_URL + "/{deckId}", method = RequestMethod.DELETE)
     public boolean deleteDeck(@PathVariable int deckId){
        return deckDao.deleteDeck(deckId);
     }

     //UPDATE DECK
  //  @PreAuthorize("isAuthenticated()")
@RequestMapping(path = BASE_URL + "/{id}", method = RequestMethod.PUT)
     public boolean updateDeck(@RequestBody Deck updateDeck, @PathVariable int id){
        return deckDao.updateDeck(updateDeck);
     }

    //use only if adding deck tags
   // public List<String> getTagsByDeckId(int deckId){
      //use only if adding deck tags
    //public List<Deck> getDeckIdByTag(String tag){}
    //use only if adding deck tags
    //public DeckTags updateTagByDeckId(DeckTags deckTags)
}
