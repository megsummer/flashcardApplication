package com.techelevator.dao;

import com.techelevator.model.Cards;

import java.util.List;

public interface CardsDao {

    public List<Cards> getAllCards();

    public Cards getCardById(int cardId);

    public int saveCard(Cards card);

    public boolean updateCard(Cards card);

    public List<String> getTagsByCardId(int cardId);


    public boolean deleteCard(int cardId);

    List<Cards> getCardByTags(List<String> tags);


}
