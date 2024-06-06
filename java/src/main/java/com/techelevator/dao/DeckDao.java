package com.techelevator.dao;

import com.techelevator.model.Deck;

import java.util.List;

public interface DeckDao {

    public Deck getDeckByDeckId(int deckId);
    public List<Deck> getAllDecks();
    public List<Deck> geAllDecksByUserId(int userId);
    public List<Deck> getAllAdminDecks();
    public int createDeck(Deck deckToCreate);
    public boolean deleteDeck(int deckId);
    public boolean updateDeck(Deck updateDeck);

}
