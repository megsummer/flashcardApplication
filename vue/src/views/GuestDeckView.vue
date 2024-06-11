<template>
  <div class="griddy-container">
    <NavTool class="nav-tool"/>
    <div class="first-row">
      <div class="search-container">
        These flash card study decks are provided by your school administration.  To view the decks in full, please
        <a id="Register" class = "register">
      <router-link v-bind:to="{ name: 'register' }">Register Here!</router-link></a>
      <p class="register-link"></p>
      </div>
      
      <div class="logo-container">
        <Logo />
      </div>
    </div>


<div class="main-container">
  <div class = "loading" v-if="isLoading">Loading...</div>


  <div v-else class="grid-container">

    <div v-for="deck in decks" v-bind:key="deck.deckId" 
          v-bind:to="{name: 'deckById', params :{id: deck.deckId}}"
          class="grid-item"
          >
          <DeckIcon v-bind:deck="deck"/> 
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

.griddy-container {
  display: grid;
  grid-template-columns: 1fr 4fr;
  grid-template-areas: 
    "nav first-row"
    "nav main";
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