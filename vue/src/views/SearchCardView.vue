<template>

    
    <div class="loading" v-if="isLoading">Loading...</div>

    <div v-else>
        

        <form v-on:submit.prevent="search">
            <input type="text" id="search-bar" v-model="searchTags.searchTags"/>
            <button v-on:click="search">Search</button>
            <p>Please separate your keywords with a comma. Example: science, chemistry, lipids</p>
        </form>
       
    <router-link v-for="card in cards" v-bind:key="card.cardId"
        v-bind:to="{name: 'cardById', params : {id : card.cardId}}">
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
            searchedCards: [],
            isLoading: false,
            searchTags: {searchTags: ""},
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
    },
    search(){
        console.log("searching for cards...")
        console.log(this.searchTags)
        this.isLoading=false;
        cardService.getCardsByTag(this.searchTags).then(response =>{
            this.searchedCards=response.data;
            console.log("search complete.")
            this.isLoading = false;
            console.log("search complete.")
            this.cards = this.searchedCards;
        }).catch(error => {
            this.handleError(error, "searching");
        })
        console.log("exiting search.")
        
}

    },
    created(){
        this.retrieveAllCards();
    }
}
</script>

<style>
</style>