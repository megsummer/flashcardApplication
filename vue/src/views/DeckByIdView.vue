<template>
  <div class="DeckById"> 
    <NavTool />
    <div class="loading" v-if="isLoading">Loading...</div>
    <div v-else>
      


      <div class="deckDetails">
        <h2> Title: {{ localDeck.deckTitle }}</h2>
        <p>Description: {{ localDeck.deckDescription }}</p>
        <img :src="localDeck.coverImg" alt="Deck Image" />
  
      </div>
      <p></p>
      <UpdateDeck :deck="localDeck" />
      <p></p>
      <router-link class="nav-button" v-bind:to="{ name: 'studySession', params:{id: localDeck.deckId} }">Study Session</router-link>
      <p></p>
      <router-link class="nav-button" v-bind:to="{ name: 'createCard' }">Create Cards</router-link>
      <p></p>
      <button class="nav-button" @click="deleteDeck">Delete Deck</button>
     
<p></p>
      Cards In This Deck

      <button v-on:click="toggleDeleting">Delete Cards From This Deck</button>

      <div class="deleting" v-if="isDeleting">Click a card to delete from this deck.       
        
        <p v-for="card in cards" v-bind:key="card.cardId"
        v-on:click="removeCard(card.cardId)">
        <CardIcon v-bind:card="card"/>
      </p>
      
      </div>
    <div v-else>
      <router-link v-for="card in cards" v-bind:key="card.cardId"
        v-bind:to="{name: 'cardById', params : {id : card.cardId}}">
        <CardIcon v-bind:card="card"/>
     </router-link>
</div>
  

    </div>
    <Logo/>
  </div>
</template>

<script>

import NavTool from '../components/NavTool.vue';
import DeckServices from '../services/DeckServices.js';
import UpdateDeck from '../components/UpdateDeck.vue';
import Logo from '../components/Logo.vue';
import CardServices from '../services/CardServices.js';
import CardIcon from '../components/CardIcon.vue';


export default {
  name: 'DeckById',
  components: {
    NavTool,
    UpdateDeck,
    Logo,
    CardIcon,

},
  data() {
    return {
      isLoading: true,
      isDeleting: false,
      localDeck: {},
      cards: [], 
      hasImage: false,
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
    toggleDeleting(){
      this.isDeleting = !this.isDeleting;
       },

    removeCard(cardId){
      CardServices.removeCardFromDeck(this.localDeck.deckId, cardId)
    },

    deleteDeck(){
      
      const shouldDelete = confirm("Are you sure you want to delete this deck?");

      if(shouldDelete){
        DeckServices.deleteDeckById(this.localDeck.deckId)
        .then(response => {
          if(response.status === 200){
            this.$store.commit('SET_NOTIFICATION', {message: "Successfully deleted board.", type: 'success'})
            this.$router.push({name: 'myDecks'});
          }
        }).catch(error => {
          this.handleError(error, 'deleting');
        });
      }

    },

    methods: {
    setHasImage(){
        if(this.deck.coverImg != null && this.deck.coverImg.length != 0){
          this.hasImage = true;}
          else {
            this.hasImage = false;
          }
        }
    },
    getCardsByDeckId(deckId) {
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
    this.getCardsByDeckId(deckId);
    
  }
};
</script>