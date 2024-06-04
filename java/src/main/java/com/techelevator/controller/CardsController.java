package com.techelevator.controller;

import com.techelevator.dao.CardsDao;
import com.techelevator.model.Cards;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.ReadOnlyProperty;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
public class CardsController {

    @Autowired
    private CardsDao cardsDao;

    //private Cards cards;

    public CardsController(CardsDao cardsDao){
        this.cardsDao = cardsDao;
    }

// getAllCards
    @RequestMapping(path = "/cards", method = RequestMethod.GET)
    public List<Cards> listCards(){
        return cardsDao.getAllCards();
    }


// getCardById
    @RequestMapping(path ="/cards/{id}", method = RequestMethod.GET)
    public Cards getCards(@PathVariable int cardId) {
        Cards cards = cardsDao.getCardById(cardId);
        if (cards == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Hotel not found.");
        } else {
            return cards;
        }
    }


//saveCard
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/cards/new", method = RequestMethod.POST)
    public Cards saveCard(@Valid @RequestBody Cards card) {
        return cardsDao.saveCard(card);
    }
//^^ COME BACK TO THIS ONE ^^


//updateCard

    @



//deleteCard
@RequestMapping(path = "/cards/{id}", method = RequestMethod.DELETE)
public boolean deleteCard(@PathVariable int cardId){
        return cardsDao.deleteCard(cardId);
}

//getCardByTags -- maybe TBD

    @RequestMapping(path = "/cards/search", method=RequestMethod.PUT)
public List<Cards> getCardByTags(@RequestBody List<String> tags){
        return cardsDao.getCardByTags(tags);
}


}
