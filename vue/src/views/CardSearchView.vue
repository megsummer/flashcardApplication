<template>

    
    <div class="loading" v-if="isLoading">Loading...</div>

    <div v-else>
        Card Search

        <form></form>

    <router-link v-for="card in cards" v-bind:key="card.cardId"
        v-bind:to="{name: 'getCardById'}">
        <CardIcon v-bind:card="card"/>
     </router-link>


    </div>
</template>

<script>

import cardService from '../services/CardServices';
import CardIcon from '../components/CardIcon.vue';

export default{
    components:{
CardIcon
    },
    data(){
        return {
            cards: [],
            isLoading: false,
        };
    },
    methods:{
     
        handleError(error, verb) {
      if (error.response) {
        this.$store.commit('SET_NOTIFICATION',
          "Error " + verb + " deck list. Response received was '" + error.response.statusText + "'.");
      } else if (error.request) {
        this.$store.commit('SET_NOTIFICATION', "Error " + verb + " card list. Server could not be reached.");
      } else {
        this.$store.commit('SET_NOTIFICATION', "Error " + verb + " card list. Request could not be created.");
      }
    },

    retrieveAllCards(){
        cardService.getAllCards().then(response => {
            this.cards = response.data;
            this.isLoading = false;
        })
    }


    },
    created(){
        this.retrieveAllCards();
    }
}
</script>

<style>
</style>