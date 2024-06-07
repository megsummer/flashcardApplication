<template>
  <div class="deck-view">
    <NavTool />
    <div class="deck-content">
      <div class="loading" v-if="isLoading">
    Loading...
 
      </div>
      <div v-else>
        <h1>My Decks</h1>
        <div class="deck-grid">
          <router-link v-for="deck in decks" v-bind:key="deck.deckId" 
          v-bind:to="{name: 'deckById',  params:{ id: deck.deckId }}">
          <DeckIcon v-bind:deck="deck"/> 
  </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import NavTool from '@/components/NavTool.vue';
import DeckIcon from '../components/DeckIcon.vue';
import DeckService from '../services/DeckServices'; 

export default {
  components: {
    DeckIcon,
    NavTool
  },
  data() {
    return {
      decks: [],
      isLoading: true,
      
    };
  },
  methods: {
    handleError(error, verb) {
      if (error.response) {
        this.$store.commit('SET_NOTIFICATION',
          `Error ${verb} deck list. Response received was '${error.response.statusText}'.`);
      } else if (error.request) {
        this.$store.commit('SET_NOTIFICATION',
          `Error ${verb} deck list. Server could not be reached.`);
      } else {
        this.$store.commit('SET_NOTIFICATION',
          `Error ${verb} deck list. Request could not be created.`);
      }
    },
    async retrieveDecks() {
      try {
        this.isLoading = true;
        const response = await DeckService.getDecksByUserId();
        this.decks = response.data;
      } catch (error) {
        this.handleError(error, 'retrieving');
      } finally {
        this.isLoading = false;
      }
    }
  },
  created() {
 
      this.retrieveDecks();
  
  }
}
</script>
../services/DeckServices