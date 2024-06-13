<template>
  <div class="deckgriddy-container">
    <NavTool class="nav-toolbig"/>

      <div class="search-container">
          <div class="image">
            <img :src="localDeck.coverImg" alt="Deck Image" />
          </div>
        </div>
      <div class="logo-container">
          <Logo />
      </div>

    <div v-if="isLoading" class="loading">Loading...</div>
    <div v-else>
      <div class="deckHeader">
        <h2> Title: {{ localDeck.deckTitle }}</h2>
        <p>Description: {{ localDeck.deckDescription }}</p>
      </div>

      <div class="image">
        
      </div>

      

      <div class="deckDetails"><div v-if="cards.length != 0">
        <router-link class="study-button" v-bind:to="{ name: 'studySession', params: { id: localDeck.deckId } }">
          <button>Study Session</button>
        </router-link></div><div v-else></div>
        
        <router-link class="card-button" v-bind:to="{ name: 'createCard' }">
          <button>Create Cards</button>
        </router-link>
        
        <button class="deleteDeck-button" @click="deleteDeck">Delete Deck</button>
        <button @click="toggleDeleting">Delete Cards</button>
      </div>

      <div v-if="isDeleting" class="deleteCard-button">
        <div id="delete-text" class="grid-item">Click a card to delete from this deck.</div>
        <div v-for="card in cards" :key="card.cardId" @click="deleteCard(card.cardId)" class="grid-item">
          <CardIcon class="deleting-cards" :card="card" />
        </div>
      </div>

      <div v-else class="cards-in-deck">
        <div v-if="cards.length === 0">There Are No Cards In This Deck.</div>
        <div v-else>
          <router-link v-for="card in cards" :key="card.cardId" :to="{ name: 'cardById', params: { id: card.cardId } }" class="grid-item">
            <CardIcon :card="card" />
          </router-link>
          <UpdateDeck class="updateDeck-button" :deck="localDeck" />
        </div>
      </div>
    </div>
  </div>
</template>



<script>

import NavTool from '../components/NavTool.vue';
import DeckServices from '../services/DeckServices.js';
import UpdateDeck from '../components/UpdateDeck.vue';
import Logo from '../components/Logo.vue';
import CardServices from '../services/CardServices.js';
import CardIcon from '../components/CardIcon.vue';
import DeckIcon from '../components/DeckIcon.vue';


export default {
  name: 'DeckById',
  components: {
    NavTool,
    UpdateDeck,
    Logo,
    CardIcon,
    DeckIcon

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
    deleteCard(cardId){
      
      const shouldDelete = confirm("Are you sure you want to delete this card?");

      if(shouldDelete){
        CardServices.removeCardFromDeck(this.localDeck.deckId, cardId)
        .then(response => {
          if(response.status === 200){
            this.$store.commit('SET_NOTIFICATION', {message: "Successfully deleted board.", type: 'success'})
            this.$router.go(0);
          }
        }).catch(error => {
          this.handleError(error, 'deleting');
        });
      }
    },
    
    setHasImage(){
        if(this.deck.coverImg != null && this.deck.coverImg.length != 0){
          this.hasImage = true;}
          else {
            this.hasImage = false;
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
          this.localDeck.deckId = parseInt(this.$route.params.id);
          
        })
        .catch(error => {
          this.handleError(error, 'retrieving');
        });
    
  },
},
  created() {
    const deckId = parseInt(this.$route.params.id);
    this.getDeck(deckId);
    this.getCardsByDeckId(deckId);
    
  }
};
</script>




<style scoped>

.deckgriddy-container {
  display: grid;
  grid-template-columns: 250px 2fr 2fr;
  grid-template-areas: 
    "nav deckicon logo"
    "nav deckDetails deckDetails"
    "cards-in-deck cards-in-deck cards-in-deck";
  gap: 15px;
}


.deckHeader{
  grid-area: deckHeader;
  text-align: center;
  
}

.logo-container{
  grid-area: logo;
  display: flex;
  justify-content: center;
}



.grid-item {
  border-radius: 10px;
  padding: 10px;
  text-align: center;
  background-color: #fff;
}



.deckDetails{
  grid-area: deckDetails;
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
  justify-content: flex-start;
  flex: 1 1 45%;

  
  
}

.cards-in-deck{
  grid-area: cards-in-deck;
  display: flex;
  flex-wrap: wrap;
  flex-direction: column;
  justify-content: flex-start;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 20px;
}

.updateDeck-button{
  display: grid;
  grid-area: updateDeck-button;
   
}
.card-button{
  grid-area: card-button;
   
}

.study-button{
  grid-area: study-button;
  
}

.deleteDeck-button{
  grid-area: deleteDeck-button
}

.deleteCard-button{
  grid-area: deleteCard-button
}


.nav-toolbig{
  grid-area: nav;
  margin-right: 20px;
}

.image{
  max-width: 100%;
  height: auto;
}

.deleting-cards{
  background-color: #F24E29;
}

#delete-text{
  margin: auto;
  font-size: larger;
}
.search-container {
  grid-area: deckicon;
  text-align: center;
  margin: auto;
}


</style>