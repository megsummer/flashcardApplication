package com.techelevator.dao;

import com.techelevator.model.Cards;

import java.util.List;

public interface CardsDao {

    List<Cards> getAllCards();

    Cards getCardById(int cardId);

    void saveCard(Cards card);

    void updateCard(Cards card);

    void deleteCard(int cardId);

    List<Cards> getCardByTags(List<String> tags);


}
