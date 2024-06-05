<template>



  <div class = "loading" v-if="isLoading">Loading...</div>


  <div v-else>
    See All Decks:
    {{decks}}

    <div class = "deck" v-for="deck in decks" :key="deck.deckId">

   
    hi

  <div id = "deck-icons" class="deck-icons">
    <DeckIcon v-bind:deck="deck"/>
  
  
  </div>
</div>
    
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

</style>