import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:9000"
});

export default {

    getAllDecks() {
        return axios.get('/decks');
    },

    getDeckById(deckId){
        return axios.get(`/decks/${deckId}`);
    },

    getDecksByUserId(userId){
        return axios.get(`/decks/user/${userId}`);
    },

    createNewDeck(newDeck){
        console.log('DEBUG')
        console.log(newDeck);
        return axios.post('/decks/new', newDeck);
    },

    deleteDeckById(deckId){
        return axios.delete(`/decks/${deckId}`);
    },

    updateDeck(deckId, updatedDeck){
        return axios.put(`/decks/${deckId}`, updatedDeck);
    },

    getAdminDecks() {
        return axios.get('/decks/admin');
    }

}