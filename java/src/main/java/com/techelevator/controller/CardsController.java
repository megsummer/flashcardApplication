package com.techelevator.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.dao.CardsDao;
import com.techelevator.model.Cards;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.ReadOnlyProperty;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class CardsController {

    @Autowired
    private CardsDao cardsDao;


    public CardsController(CardsDao cardsDao){
        this.cardsDao = cardsDao;
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
    public int saveCard(@Valid @RequestBody Cards card) {
        return cardsDao.saveCard(card);
    }

    @RequestMapping(path = "/cards/{cardId}", method =RequestMethod.PUT)
    public boolean updateCard (@RequestBody Cards updateCard, @PathVariable int cardId) {
        return cardsDao.updateCard(updateCard);
    }


@RequestMapping(path = "/cards/{cardId}", method = RequestMethod.DELETE)
public boolean deleteCard(@PathVariable int cardId){
        return cardsDao.deleteCard(cardId);
}

    //Mapper info from: https://stackoverflow.com/questions/36846055/json-string-array-into-java-string-list
    @RequestMapping(path = "/cards/search", method=RequestMethod.PUT)
public List<Cards> getCardByTags(@RequestBody String tags) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        List<String> tagsList = mapper.readValue(tags, List.class);
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
