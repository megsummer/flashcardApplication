import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:9000"
});

export default {

    getAllDecks() {
        return http.get('/decks');
    },

    getDeckById(deckId){
        return http.get(`/decks/${deckId}`);
    },

    getDecksByUserId(userId){
        return http.get(`/decks/user/${userId}`);
    },

    createNewDeck(newDeck){
        return http.post('/decks/new', newDeck);
    },

    deleteDeckById(deckId){
        return http.delete(`/decks/${deckId}`);
    },

    updateDeck(deckId, updatedDeck){
        return http.put(`/decks/${deckId}`, updatedDeck);
    },

    getAdminDecks() {
        return http.get('/decks/admin');
    }

}