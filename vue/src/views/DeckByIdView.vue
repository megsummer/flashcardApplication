<template>
  <div class="deckbyid"> 
    <NavTool />
    <div class="loading" v-if="isLoading">Loading...</div>
    <div v-else>
      <h1>DeckByID</h1>
      <p>You are inside DeckbyID if you see this.</p> 
      <div id="showDeck" class = "showCard">
        <h1>Deck View</h1>
        <div id="deckTitle">Title: {{ localDeck.deckTitle }}</div>
        <div id="deckDescription">Description: {{ localDeck.deckDescription }}</div>
       <img :src="localDeck.imageUrl" alt="Deck Image" />

      </div>

      *********

      <p></p>
      <router-link class="nav-button" v-bind:to="{ name: 'studySession' }">Study Session</router-link>
      <router-link class="nav-button" v-bind:to="{ name: 'createCard' }">Create Cards</router-link>
      
      <UpdateDeck :deck="localDeck" />

      <div class="deckDetails">
        <h2>{{ localDeck.title }}</h2>
        <p>{{ localDeck.description }}</p>
        <img :src="localDeck.image" alt="Deck Image" />
  
      </div>
      Cards In This Deck

      <router-link v-for="card in cards" v-bind:key="card.cardId"
        v-bind:to="{name: 'cardById', params : {id : card.cardId}}">
        <CardIcon v-bind:card="card"/>
     </router-link>

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
import CardServices from '../services/CardServices';
import CardIcon from '../components/CardIcon.vue';

export default {
  name: 'DeckById',
  components: {
    NavTool,
    UpdateDeck,
    Logo,
    CardIcon
},
  data() {
    return {
      isLoading: true,
      localDeck: {},
      cards: []
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
    getCardsbyDeckId(deckId) {
      CardServices.getCardsByDeckId(deckId)
        .then(response => {
          this.cards = response.data;
          this.isLoading = false;
        })
        .catch(error => {
          this.handleError(error, 'retrieving');
        });
      },
    getDeck(deckId) {
      DeckServices.getDeckById(deckId)
        .then(response => {
          this.localDeck = response.data;
          
        })
        .catch(error => {
          this.handleError(error, 'retrieving');
        });
    }
  },
  created() {
    const deckId = parseInt(this.$route.params.id);
    this.getDeck(deckId);
    this.getCardsbyDeckId(deckId);
    
  }
};
</script>