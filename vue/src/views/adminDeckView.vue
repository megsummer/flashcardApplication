<template>



  <div class = "loading" v-if="isLoading">Loading...</div>


  <div v-else>
    
    <NavTool />
     
   View All Decks

    <router-link v-for="deck in decks" v-bind:key="deck.deckId" 
          v-bind:to="{name: 'getDecksByDeckId'}">
          <DeckIcon v-bind:deck="deck"/> 
  </router-link>
   


    
  </div>
</template>

<script>
import DeckService from '../services/DeckServices';
import DeckIcon from '../components/DeckIcon.vue';
import NavTool from '../components/NavTool.vue';


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
      DeckService.getAllDecks().then(response => {
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