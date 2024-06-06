<template>
  <div class="deck-view">
    <NavTool />

    <div class="deck-content">
      <div class="loading" v-if="isLoading">Loading...</div>

      <div v-else>
        <h1>My Decks</h1>

        <div class="deck-grid">
          <router-link
            v-for="deck in decks"
            :key="deck.id"
            :to="{ name: 'DeckDetail', params: { id: deck.id } }"
            class="deck-item"
          >
            <DeckIcon :deck="deck" />
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue';
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
      isLoading: false,
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
    async retrieveDecks(userId = null) {
      try {
        const response = userId ? await DeckService.getDecksByUserId(userId) : await DeckService.getAllDecks();
        this.decks = response.data;
      } catch (error) {
        this.handleError(error, 'retrieving');
      } finally {
        this.isLoading = false;
      }
    }
  },
  created() {
    const userId = this.$store.state.user.userId; 
    this.retrieveDecks(userId);
  }
}
</script>

<style>

</style>