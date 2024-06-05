import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:9000"
});

export default {

    getAllCards(){
        return http.get('/cards');
    },

    getCardById(cardId){
        return http.get(`/cards/${cardId}`);
    },

    createNewCard(newCard){
        return http.post('/cards/new', newCard);
    },

    updateCardById(cardId, updatedCard){
        return http.put(`/cards/${cardId}`, updatedCard);
    },

    deleteCardById(cardId){
        return http.delete(`/cards/${cardId}`);
    },
    getCardsByTag(tags){
        return http.get('/cards/search', tags);
    }

}
