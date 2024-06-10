<template>


<Logo/>

<NavTool/>
  <div class = "loading" v-if="isLoading">Loading...</div>


  <div v-else>
    
  
THESE ARE THE ADMIN DECKS
     
  Click a deck to see more!
   <p class="register-link"></p>

    <router-link v-for="deck in decks" v-bind:key="deck.deckId" 
          v-bind:to="{name: 'deckById', params: {id: deck.deckId}}">
          <DeckIcon v-bind:deck="deck"/> 
  </router-link>

  
   



    
  </div>
</template>

<script>
import DeckService from '../services/DeckServices';
import DeckIcon from '../components/DeckIcon.vue';
import Logo from '../components/Logo.vue';
import NavTool from '../components/NavTool.vue';



export default {
  components: {
    DeckIcon,
    Logo,
    NavTool
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
.loading{
  text-align: center;
  font-size: 2em;
  margin-top: 20px;
}

form{
  text-align: center;
  margin-bottom: 20px;
}


.grid-container{
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 10px;
  flex-grow: 1;
}

.grid-item{
  text-decoration: none;
}

p{
  text-align: left center;
  color: black;
}
.main-container{
  display: flex;
  padding: 10px;
}

.top-grid-container{
  display: grid;
  grid-template-columns: 1fr auto;
  align-items: center;
  padding: 10px;
  gap: 10px;
  margin-bottom: 20px;

}
.logo-container{
  display: flex;
  justify-content: center;
}
</style>