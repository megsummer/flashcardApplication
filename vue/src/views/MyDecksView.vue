<template>
  <div class="grid-container">
      <div class="loading" v-if="isLoading">
    Loading...
 
      </div>
      <div v-else>
        <div class="deck-view">
    <NavTool class="nav-tool" />
    <Logo class="logo"/>
    <div class="deck-content">
      
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
  </div>
</template>

<script>
import NavTool from '@/components/NavTool.vue';
import DeckIcon from '../components/DeckIcon.vue';
import DeckService from '../services/DeckServices'; 
import Logo from '../components/Logo.vue';

export default {
  components: {
    DeckIcon,
    NavTool,
    Logo
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
<style scoped>
.grid-container {
    display: grid;
    grid-template-columns: 200px 1fr 1fr;
    grid-template-rows: auto 1fr;
    grid-template-areas: 
        "nav-tool logo ."
        "mydeck mydeck mydeck";
    gap: 15px;
}

.logo {
    grid-area: logo;
    display: flex;
    justify-content: center; /* center content horizontally */
    align-items: center; /* center content vertically */
}

.nav-tool {
    grid-area: nav-tool;
    display: flex;
    justify-content: center; /* center content horizontally */
    align-items: center; /* center content vertically */
}

.loading {
    display: flex;
    justify-content: center;
    align-items: center;
    grid-area: mydeck; /* place loading within deck area */
}

.deck-content {
    grid-area: mydeck;
    display: flex;
    justify-content: center; /* center content horizontally */
    align-items: center; /* center content vertically */
}
</style>