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

    getDecksByUserId(){
        return axios.get('/decks/user');
    },

    createNewDeck(newDeck){

        return axios.post('/decks/new', newDeck);
    },

    deleteDeckById(deckId){
        return axios.delete(`/decks/${deckId}`);
    },

    updateDeck(updatedDeck){
        return axios.put('/decks', updatedDeck);
    },

    getAdminDecks() {
        return axios.get('/decks/admin');
    }

}