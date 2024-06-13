<template>
  <div class="griddy-container">
    
      <div class="logo-container">
        <Logo />
    </div>
    <div class="register"> 
      
      <router-link v-bind:to="{ name: 'register' }">These flash card study decks are provided by your school administration.  
       <p></p> To view the decks in full, please Register Here!</router-link></div>
     

<div class="main-container">
  <div class = "loading" v-if="isLoading">Loading...</div>


  <div v-else class="grid-container">

    <div v-for="deck in decks" v-bind:key="deck.deckId" 
          v-bind:to="{name: 'deckById', params :{id: deck.deckId}}"
          class="grid-item"
          > <router-link v-bind:to="{ name: 'register' }">
          <DeckIcon v-bind:deck="deck"/> </router-link>
    </div>
   



  </div>
</div>
  </div>
</template>

<script>
import DeckService from '../services/DeckServices';
import DeckIcon from '../components/DeckIcon.vue';
import Logo from '../components/Logo.vue';



export default {
  components: {
    DeckIcon,
    Logo
},
  data() {
    return {
      decks: [],
      isLoading: false,

    };
  },
  methods: {

    handleError(error, verb) {
      if (error.response) {
        this.$store.commit('SET_NOTIFICATION',
          "Error " + verb + " deck list. Response received was '" + error.response.statusText + "'.");
      } else if (error.request) {
        this.$store.commit('SET_NOTIFICATION', "Error " + verb + " deck list. Server could not be reached.");
      } else {
        this.$store.commit('SET_NOTIFICATION', "Error " + verb + " deck list. Request could not be created.");
      }
    },

    retrieveDecks(){
      DeckService.getAdminDecks().then(response => {
        this.decks = response.data;
        this.isLoading = false;
      }) 
      
    }

  },
  created(){
   this.retrieveDecks();
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
  border-radius: 20px;
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
  padding: 10px;
}

.register {
  grid-area: nav;
  margin-right: 20px;
  grid-area: register;
  background-color: #ffd966;
  color: black;
  text-align: top;
  text-transform: none;
  text-decoration: none;
  margin: 10px;
  padding: 35px;
  border-radius: 20px;
  width: 225px;
  height: 225px;
  border: .2px solid black;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  transition: transform .2s, box-shadow .2s;
  text-align: center;
  margin: auto;
  font-size: x-large;
}



.logo-container {
  display: flex;
  justify-content: center;
  grid-area: logo;
}

.first-row {
  grid-area: first-row;
  display: flex;
  justify-content: right;
  
}

.griddy-container {
  display: grid;
  grid-template-columns: 1fr 4fr;
  grid-template-areas: 
    ". logo"
    "register main";
  gap: 15px;
}
/* .griddy-container {
  display: grid;
  grid-template-columns: 1fr 4fr;
  grid-template-areas: 
    "nav first-row"
    "main main";
  gap: 15px;
} */
</style>