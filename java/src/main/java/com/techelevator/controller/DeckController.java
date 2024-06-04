package com.techelevator.controller;

import com.techelevator.dao.DeckDao;
import com.techelevator.model.Deck;
import org.hibernate.validator.constraints.pl.REGON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@RestController

public class DeckController {
    private final String BASE_URL = "/decks";

    @Autowired
    private DeckDao deckDao;

    public DeckController(DeckDao deckDao) {
        this.deckDao = deckDao;
    }

    @RequestMapping(path = BASE_URL + "/{deckId}", method = RequestMethod.GET)
    public Deck getDeckByDeckId(@PathVariable int deckId) {
        return deckDao.getDeckByDeckId(deckId);
    }

    @RequestMapping(path = BASE_URL, method = RequestMethod.GET)
    public List<Deck> getAllDecks() {
        return deckDao.getAllDecks();
    }

    @RequestMapping(path = BASE_URL + "/user/{userId}", method = RequestMethod.GET)
    public List<Deck> geAllDecksByUserId(@PathVariable int userId){
        return deckDao.geAllDecksByUserId(userId);
    }


@RequestMapping(path = BASE_URL + "/admin", method = RequestMethod.GET)
    public List<Deck> getAllAdminDecks() {
        return deckDao.getAllAdminDecks();
    }

@RequestMapping(path = BASE_URL + "/new", method = RequestMethod.POST)
    public int createDeck(@RequestBody Deck deckToCreate){
        return deckDao.createDeck(deckToCreate);
    }

@RequestMapping(path = BASE_URL + "/{deckId}", method = RequestMethod.DELETE)
     public boolean deleteDeck(@PathVariable int deckId){
        return deckDao.deleteDeck(deckId);
     }

@RequestMapping(path = BASE_URL + "/{id}", method = RequestMethod.PUT)
     public boolean updateDeck(@RequestBody Deck updateDeck){
        return deckDao.updateDeck(updateDeck);
     }



   /* public List<String> getTagsByDeckId(int deckId){}
    public List<Deck> getDeckIdByTag(String tag){}
}*/
}