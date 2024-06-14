<template>
  <div class="searchCards-container">
    <NavTool class="nav-tool"/>
    <div class="first-row">
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
      <div v-if="isLoading" class="loading">Loading...</div>
      <div v-else class="grid-container">
        <router-link 
          v-for="card in cards"
          :key="card.cardId"
          :to="{ name: 'cardById', params: { id: card.cardId } }"
          class="grid-item"
        >
          <CardIcon :card="card" />
        </router-link>
      </div>
    </div>
  </div>
</template>
<script>

import NavTool from '../components/NavTool.vue';
import CardServices from '../services/CardServices.js';
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
            hasImage: false
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
        CardServices.getAllCards().then(response => {
            this.cards = response.data;
            this.isLoading = false;
        })
    },
    setHasImage(){
        if(this.card.cardImg != null && this.card.cardImg.length != 0){
          this.hasImage = true;}
          else {
            this.hasImage = false;
          }
        },
    search(){
     
    
        this.isLoading=false;
        CardServices.getCardsByTag(this.searchTags).then(response =>{
            this.searchedCards=response.data;
         
            this.isLoading = false;
          
            this.cards = this.searchedCards;
        }).catch(error => {
            this.handleError(error, "searching");
        })
        
        
}

    },
    created(){
        this.retrieveAllCards();
    }
}
</script>

<style scoped>
.loading {
  text-align: center;
  font-size: 2em;
  margin-top: 20px;
}

form {
  text-align: center;
  margin-bottom: 20px;
}

#search-bar {
  margin-top: 50px;
  padding: 10px;
  margin-right: 5px;
  border-radius: 25px;
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

.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 10px;
}

.grid-item {
  border-radius: 10px;
  padding: 10px;
  text-align: center;
  background-color: #fff;
}

p {
  text-align: center;
  color: black;
}

.main-container {
  grid-area: main;
  padding: 4px;
}

.nav-tool {
  grid-area: nav;
  margin-right: 20px;
}

.search-container {
  text-align: center;
  margin: auto;
}

.logo-container {
  display: flex;
  justify-content: center;
}

.first-row {
  grid-area: first-row;
  display: flex;
  justify-content: right;
  
}

.searchCards-container {
  display: grid;
  grid-template-columns: 250px 1fr;
  grid-template-areas: 
    "nav first-row"
    "nav main";
  gap: 15px;
}
</style>