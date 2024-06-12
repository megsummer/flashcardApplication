<template>
   <div class="loading" v-if="isLoading">Loading...</div>
    <div v-else>
 
    <div class="griddy-container"> 
    <NavTool class="nav-tool"/>
    <Logo class="logo"/>
   

    <div class="deckHeader">
        <h2> Title: {{ localDeck.deckTitle }}</h2>
        <p>Description: {{ localDeck.deckDescription }}</p>
    </div>

     <div class = "image">   <img :src="localDeck.coverImg" alt="Deck Image" />
    </div>

  <div class = "deckDetails">
      <p></p>

      <UpdateDeck :deck="localDeck" />
      <p></p>

      <router-link class="page-button" v-bind:to="{ name: 'studySession', params:{id: localDeck.deckId} }"><button>Study Session</button> </router-link>
      <p></p>

      <router-link class="page-button" v-bind:to="{ name: 'createCard' }"><button>Create Cards</button></router-link>
      <p></p>

      <button class="page-button" @click="deleteDeck">Delete Deck</button>
      <button v-on:click="toggleDeleting">Delete Cards From This Deck</button>
    </div>
      <div v-if="isDeleting" class="cards-in-deck"> <div id="delete-text" class="grid-item">Click a card to delete from this deck.

      </div> 
      <div v-for="card in cards" :key="card.cardId" @click="deleteCard(card.cardId)" class="grid-item"> <CardIcon class="deleting-cards" :card="card" /> 
      </div> 
    </div> 
    <div v-else class="cards-in-deck"> <router-link v-for="card in cards" :key="card.cardId" :to="{ name: 'cardById', params: { id: card.cardId } }" class="grid-item"> <CardIcon :card="card" /> </router-link> </div> </div>
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




<style>
.deleting-cards{
  background-color: rgb(245, 130, 130);
}

.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 10px;
}

.grid-item {
  border-radius: 10px;
  padding: 10px;
  text-align: center;
  background-color: #fff;
}

#delete-text{
  margin: auto;
  font-size: larger;
}

.deckDetails{
  grid-area: deckDetails;
}
.cards-in-deck{
  grid-area: cards-in-deck;
}

.logo{
  grid-area: logo;
  margin-left: auto;
}
.deckHeader{
  grid-area: deckHeader;
  text-align: center;
  
}
.griddy-container {
  display: grid;
  grid-template-columns: 1fr 3fr 1 fr;
  grid-template-areas: 
    "nav deckHeader  logo"
    "nav image deckDetails"
    ". cards-in-deck cards-in-deck";
  gap: 15px;
}

.page-button{
  width: 170px;
  padding: 2px;
  height: 30px;
  border: black;
  background-color: rgb(241, 214, 11);
  color: black;
  border-radius: 5px;
  font-size: 15px;
  cursor: pointer;
  transition: background-color .3s ease;
  font-weight: bold;  
  
}
.nav-tool{
  grid-area: nav;
  margin-right: 20px;
}


</style>