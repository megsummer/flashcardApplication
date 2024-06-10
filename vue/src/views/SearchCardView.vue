<template>
  <div class="griddy">
    <div class="loading" v-if="isLoading">Loading...</div>
    <div v-else>
      <NavTool class="nav-tool" />
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
      <div class="main-container">
        
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
  </div>
  </template>

<script>

import NavTool from '../components/NavTool.vue';
import CardServices from '../services/CardServices';
import CardIcon from '../components/CardIcon.vue';
import CardIconVue from '../components/CardIcon.vue';
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
        CardServices.getAllCards().then(response => {
            this.cards = response.data;
            this.isLoading = false;
        })
    },
    search(){
        console.log("searching for cards...")
        console.log(this.searchTags)
        this.isLoading=false;
        CardServices.getCardsByTag(this.searchTags).then(response =>{
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
/* .loading{
    text-align: center;
    font-size: 2em;
    margin-top: 20px;
} */

/* form{
    text-align: center;
     margin-bottom: 20px;
}  */

/* #search-bar{
    width: 50%;
    padding: 10px;
    margin-right: 10px;
    border-radius: 5px;
    border: 1px solid black;
} */

/* button {
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
} */


/* .grid-item{
    text-decoration: none;
}

p{
    text-align: center;
    text-align: top;
    color: black;
} */
.main-container{
  border: solid #ffc107;
  grid-area: main;
    /* display: flex; */
    padding: 10px;
}

.nav-tool{
  border: solid;
  grid-area: nav;
    /* width: 200px;
    margin-right: 20px; */
}


.search-container{
  grid-area: search;
  border: solid sienna;
    /* text-align: center; */
}
.logo-container{
  grid-area: logo;
border: solid green;
  /* display: flex; */
    /* justify-content: center; */
}
.griddy{
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-areas: 
  "nav search logo"
  "nav main main";


}
</style>