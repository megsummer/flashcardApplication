<template>
    <div class="loading" v-if="isLoading">Loading...</div>
    <div v-else>
      <div class="top-grid-container">
        <div class="search-container">
          <form v-on:submit.prevent="search">
            <input type="text" id="search-bar" v-model="searchTags.searchTags" />
            <button v-on:click="search">Search</button>
            <p>Please separate your keywords with a comma. Example: science, chemistry, lipids</p>
          </form>
        </div>
        <div class="logo-container">
          <Logo />
        </div>
      </div>
      <div class="main-container">
        <NavTool class="nav-tool" />
        <div class="grid-container">
          <router-link
            v-for="card in cards"
            v-bind:key="card.cardId"
            v-bind:to="{ name: 'cardById', params: { id: card.cardId } }"
            class="grid-item"
          >
            <CardIcon v-bind:card="card" />
          </router-link>
        </div>
      </div>
    </div>
  </template>

<script>

import NavTool from '../components/NavTool.vue';
import cardService from '../services/CardServices';
import CardIcon from '../components/CardIcon.vue';
import Logo from '../components/Logo.vue';

export default{
    components:{
CardIcon,
NavTool,
Logo
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

<style scoped>
.loading{
    text-align: center;
    font-size: 2em;
    margin-top: 20px;
}

form{
    text-align: center;
    margin-bottom: 20px;
}

#search-bar{
    width: 50%;
    padding: 10px;
    margin-right: 10px;
    border-radius: 5px;
    border: 1px solid black;
}

button {
  background-color: #ffd966;
  color: black;
  text-align: center;
  margin: 10px;
  padding: 10px;
  border-radius: 25px;
  cursor: pointer;
}

button:hover {
  background-color: #ffc107;
}

.grid-container{
    display: grid;
    grid-template-columns: 200px,1fr,1fr;
    grid-template-areas: 
    "Navtool top-grid-container top-grid-container"
    "Navtool cards cards"
;
    gap: 10px;
    flex-grow: 1;
}

.grid-item{
    text-decoration: none;
}

p{
    text-align: ;
    color: black;
}
.main-container{
    display: flex;
    padding: 10px;
}

.nav-tool{
    width: 200px;
    margin-right: 20px;
}

.top-grid-container{
    display: grid;
    grid-template-columns: 1fr,1fr;
    align-items: center;
    padding: 10px;
    gap: 10px;
    margin-bottom: 20px;

}
.search-container{
    text-align: center;
}
.logo-container{
    display: flex;
    justify-content: center;
}
</style>