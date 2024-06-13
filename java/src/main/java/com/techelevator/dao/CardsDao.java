package com.techelevator.dao;

import com.techelevator.model.Cards;
import com.techelevator.model.User;

import java.util.List;

public interface CardsDao {

    public List<Cards> getAllCards();

    public Cards getCardById(int cardId);

    public int saveCard(Cards card);

    public boolean updateCard(Cards card, int userId, int deckId);

    public List<String> getTagsByCardId(int cardId);


    public boolean deleteCard(int cardId, User user);

    List<Cards> getCardByTags(List<String> tags);

    public List<Cards> getCardsByDeckId (int deckId);

    public boolean removeCardFromDeck(int cardId, int deckId);

    public boolean addCardToDeck(Cards card, int deckId);


}
