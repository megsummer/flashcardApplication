<template>
  <div class="deck-view">
    <NavTool />
    <div class="deck-content">
      <div class="loading" v-if="isLoading">
        hi
      </div>
      <div v-else>
        <h1>My Decks</h1>
        <div class="deck-grid">
          <router-link v-for="deck in decks" v-bind:key="deck.deckId" 
          v-bind:to="{name: 'deckDetail',  params:{ id: deck.deckId }}">
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
      isLoading: true
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
    async retrieveDecks(userId) {
      try {
        this.isLoading = true;
        const response = await DeckService.getDecksByUserId(userId);
        this.decks = response.data;
      } catch (error) {
        this.handleError(error, 'retrieving');
      } finally {
        this.isLoading = false;
      }
    }
  },
  created() {
    // const userId = this.$store.state.user.userId;
    const userId = 3;
    if (userId) {
      this.retrieveDecks(userId);
    } else {
      this.handleError(new Error('User ID is not defined'), 'retrieving');
    }
  }
}
</script>
../services/DeckServices