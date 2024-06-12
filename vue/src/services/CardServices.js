import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:9000"
});

export default {

    getAllCards(){
        return axios.get('/cards');
    },

    getCardById(id){
        return axios.get(`/cards/${id}`);
    },

    createNewCard(newCard){
        return axios.post('/cards/new', newCard);
    },

    updateCardById(updatedCard, deckId){
        return axios.put(`/decks/${deckId}/cards`, updatedCard);
    
    },

    deleteCardById(cardId){
        return axios.delete(`/cards/${cardId}`);
    },
    getCardsByTag(tags){
     
        return axios.put('/cards/search', tags);
    },

    getCardsByDeckId(deckId){
        return axios.get(`/decks/${deckId}/cards`);
    },
    
    addCardToDeck(card, deckId){
        return axios.post(`/decks/${deckId}/cards`, card);
    },
    removeCardFromDeck(deckId, cardId){
        return axios.delete(`/decks/${deckId}/cards/${cardId}`);
    }

}
