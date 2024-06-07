<template>



  <div class = "loading" v-if="isLoading">Loading...</div>


  <div v-else>
  
    <p id="Register" class = "register">
      <router-link v-bind:to="{ name: 'register' }">Register Here!</router-link></p>
     
   View Admin Decks
Or    <p class="register-link"></p>

    <router-link v-for="deck in decks" v-bind:key="deck.deckId" 
          v-bind:to="{name: 'getAllAdminDecks'}">
          <DeckIcon v-bind:deck="deck"/> 
  </router-link>
   



    
  </div>
</template>

<script>
import DeckService from '../services/DeckServices';
import DeckIcon from '../components/DeckIcon.vue';



export default {
  components: {
    DeckIcon

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

<style>

</style>../services/DeckServices