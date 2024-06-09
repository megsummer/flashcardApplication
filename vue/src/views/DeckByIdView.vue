<template>
  <div class="deckbyid"> 
    <NavTool />
    <div class="loading" v-if="isLoading">Loading...</div>
    <div v-else>
      <h1>DeckByID</h1>
      <p>You are inside DeckbyID if you see this.</p>
      <p></p>
      <router-link class="nav-button" v-bind:to="{ name: 'studySession' }">Study Session</router-link>
      <router-link class="nav-button" v-bind:to="{ name: 'createCard' }">Create Cards</router-link>
      
      <UpdateDeck :deck="localDeck" />

      <div class="deckDetails">
        <h2>{{ localDeck.title }}</h2>
        <p>{{ localDeck.description }}</p>
        <img :src="localDeck.image" alt="Deck Image" />
  
      </div>
      <button class="delete-button" @click="deleteDeck">Delete Deck</button>
      

      <div v-for="card in localDeck.cards" :key="card.cardId">
        <div class="card">
          <h3>{{ card.frontQuestion }}</h3>
          <p>{{ card.backAnswer }}</p>
        </div>
      </div>
    </div>
    <Logo/>
  </div>
</template>

<script>

import NavTool from '@/components/NavTool.vue';
import DeckServices from '../services/DeckServices';
import UpdateDeck from '../components/UpdateDeck.vue';
import Logo from '../components/Logo.vue';

export default {
  name: 'DeckById',
  components: {
    NavTool,
    UpdateDeck,
    Logo
},
  data() {
    return {
      isLoading: true,
      localDeck: {}
    };
  },
  methods: {
    handleError(error, verb) {
      if (error.response) {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} deck. Response received was ${error.response.statusText}.`);
      } else if (error.request) {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} deck. Server could not be reached.`);
      } else {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} deck. Request could not be created.`);
      }
    },
    getDeck(deckId) {
      DeckServices.getDeckById(deckId)
        .then(response => {
          this.localDeck = response.data;
          this.isLoading = false;
        })
        .catch(error => {
          this.handleError(error, 'retrieving');
        });
    }
  },
  created() {
    const deckId = parseInt(this.$route.params.id);
    this.getDeck(deckId);
  }
};
</script>