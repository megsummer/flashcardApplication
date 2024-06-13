package com.techelevator.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.dao.CardsDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Cards;
import com.techelevator.model.SearchTags;
import com.techelevator.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.ReadOnlyProperty;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class CardsController {

    @Autowired
    private CardsDao cardsDao;
    @Autowired
    private UserDao userDao;


    public CardsController(CardsDao cardsDao, UserDao userDao){
        this.cardsDao = cardsDao;
        this.userDao = userDao;
    }


    @RequestMapping(path = "/cards", method = RequestMethod.GET)
    public List<Cards> listCards(){
        return cardsDao.getAllCards();
    }



    @RequestMapping(path ="/cards/{cardId}", method = RequestMethod.GET)
    public Cards getCards(@PathVariable int cardId) {
        Cards cards = cardsDao.getCardById(cardId);
        if (cards == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Hotel not found.");
        } else {
            return cards;
        }
    }


    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/cards/new", method = RequestMethod.POST)
    public int saveCard(@Valid @RequestBody Cards card, Principal principal) {
        User user = userDao.getUserByUsername(principal.getName());
        card.setUserId(user.getId());
        return cardsDao.saveCard(card);
    }

    @RequestMapping(path = "/decks/{deckId}/cards", method =RequestMethod.PUT)
    public boolean updateCard (@RequestBody Cards updateCard, Principal principal, @PathVariable int deckId) {
        User user = userDao.getUserByUsername(principal.getName());
        updateCard.setUserId(user.getId());
        return cardsDao.updateCard(updateCard, user.getId(), deckId);



    }


@RequestMapping(path = "/cards/{cardId}", method = RequestMethod.DELETE)
public boolean deleteCard(@PathVariable int cardId, Principal principal){
    User user = userDao.getUserByUsername(principal.getName());
        return cardsDao.deleteCard(cardId, user);
}


    @RequestMapping(path = "/cards/search", method=RequestMethod.PUT)
public List<Cards> getCardByTags(@RequestBody SearchTags tags)  {
        List<String> tagsList = List.of((tags.getSearchTags()).split(", "));
        return cardsDao.getCardByTags(tagsList);
}
@RequestMapping(path = "/decks/{deckId}/cards", method = RequestMethod.GET)
    public List<Cards> getCardsByDeckId (@PathVariable int deckId){
        return cardsDao.getCardsByDeckId(deckId);
    }

    @RequestMapping( path = "/decks/{deckId}/cards/{cardId}",  method = RequestMethod.DELETE)
    public boolean removeCardFromDeck(@PathVariable Integer cardId, @PathVariable Integer deckId){
        return cardsDao.removeCardFromDeck(cardId, deckId);
    }

    @RequestMapping(path = "/decks/{deckId}/cards", method = RequestMethod.POST)
    public boolean addCardToDeck(@RequestBody Cards card, @PathVariable Integer deckId){
        return cardsDao.addCardToDeck(card, deckId);
    }



}
