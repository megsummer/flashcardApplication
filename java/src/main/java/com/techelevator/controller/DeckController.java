package com.techelevator.controller;

import com.techelevator.dao.DeckDao;
import com.techelevator.dao.JdbcDeckDao;
import com.techelevator.dao.JdbcUserDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Deck;
import com.techelevator.model.User;
import org.hibernate.validator.constraints.pl.REGON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
@RestController
@CrossOrigin
public class DeckController {
    private final String BASE_URL = "/decks";



    @Autowired
    private DeckDao deckDao;
    @Autowired
    private UserDao userDao;

    public DeckController(DeckDao deckDao, UserDao userDao) {
        this.deckDao = deckDao;
        this.userDao = userDao;
    }



    //GET ALL DECKS BY ID

   @PreAuthorize("isAuthenticated()")
    @RequestMapping(path = BASE_URL + "/{deckId}", method = RequestMethod.GET)
    public Deck getDeckByDeckId(@PathVariable int deckId) {
        return deckDao.getDeckByDeckId(deckId);
    }


    //GET ALL DECKS

  @PreAuthorize("isAuthenticated()")
    @RequestMapping(path = BASE_URL, method = RequestMethod.GET)
    public List<Deck> getAllDecks() {
        return deckDao.getAllDecks();
    }

    //GET ALL DECKS BY USER ID


  @PreAuthorize("isAuthenticated()")
    @RequestMapping(path = BASE_URL + "/user", method = RequestMethod.GET)
    public List<Deck> getAllDecksByUserId( Principal principal){
      User user = userDao.getUserByUsername(principal.getName());

        return deckDao.getAllDecksByUserId(user.getId());
    }

// GET ALL ADMIN DECKS
@RequestMapping(path = BASE_URL + "/admin", method = RequestMethod.GET)
    public List<Deck> getAllAdminDecks() {
        return deckDao.getAllAdminDecks();
    }


    //CREATE A DECK


  @PreAuthorize("isAuthenticated()")
 @ResponseStatus(HttpStatus.CREATED)
  @RequestMapping(path = BASE_URL + "/new", method = RequestMethod.POST)
    public int createDeck(@RequestBody Deck deckToCreate, Principal principal){

        User user = userDao.getUserByUsername(principal.getName());
      deckToCreate.setUserId(user.getId());

        return deckDao.createDeck(deckToCreate);
    }


    //DELETE DECK


   @PreAuthorize("isAuthenticated()")
@RequestMapping(path = BASE_URL + "/{deckId}", method = RequestMethod.DELETE)
     public boolean deleteDeck(@PathVariable int deckId, Principal principal){
        User user = userDao.getUserByUsername(principal.getName());
        return deckDao.deleteDeck(deckId, user);
     }


     //UPDATE DECK


     @PreAuthorize("isAuthenticated()")
@RequestMapping(path = BASE_URL, method = RequestMethod.PUT)
     public boolean updateDeck(@RequestBody Deck updateDeck, Principal principal) {
         User user = userDao.getUserByUsername(principal.getName());
         updateDeck.setUserId(user.getId());

         return deckDao.updateDeck(updateDeck);
     }



}
