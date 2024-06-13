<template>
  <div class="deckgriddy-container">
    <NavTool class="nav-toolbig"/>

    <div class="deckidrow-container">
      
      <div v-if="hasImage" class="image">
      
        <img class="deckImage" :src="localDeck.coverImg" alt="Deck Image" />
  </div>
      
    
    <div class="decklogo-container">
      <Logo />
    </div>
    </div>
    <div v-if="isLoading" class="loading">Loading...</div>
    <div v-else>
      <div class="deckHeader">
        <h2> Title: {{ localDeck.deckTitle }}</h2>
        <p>Description: {{ localDeck.deckDescription }}</p>
      </div>

    
      

      <div class="deckDetails">

 
       
      <div class="study-button">
        <div v-if="cards.length != 0">
        <router-link v-bind:to="{ name: 'studySession', params: { id: localDeck.deckId } }">
          <button>Study Session</button>
        </router-link></div><div v-else></div>
      </div>

        <div class="create-cards-button">
        <router-link v-bind:to="{ name: 'createCard' }">
          <button>Create Cards</button>
        </router-link>
      </div>
        
        <div class = "delete-deck-button">
        <button @click="deleteDeck">Delete Deck</button>
        </div>

        <div class = "update-deck-button">
        <UpdateDeck class="updateDeck-button" :deck="localDeck" />
      </div>
        
      </div><!--end of deck details-->


    

      <div v-if="isDeleting" class="delete-cards-section">

        <!--<div id="delete-text" class="deckgrid-item">Click a card to delete from this deck.</div>-->

        <div v-for="card in cards" :key="card.cardId" @click="deleteCard(card.cardId)" class="deckgrid-item">
          <CardIcon class="deleting-cards" :card="card" />
        </div>
        
      </div>
      
     

      <div v-else class="regular-cards-section"> <!--regular cards-->

         <div class="single-cards-reg">
          <router-link v-for="card in cards" :key="card.cardId" :to="{ name: 'cardById', params: { id: card.cardId } }">
            <CardIcon :card="card" /></router-link></div>
         </div>





            <div v-if="cards.length === 0">There Are No Cards In This Deck.</div><div else></div>

            <div class = "delete-cards-button">
            <button class="deletecard" @click="toggleDeleting">{{deleteMsg}}</button></div>
         
         
      
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
      deleteMsg: "Delete Cards",
      isUser: false,
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
      if(this.deleteMsg === "Delete Cards"){
        this.deleteMsg = "Cancel";
      }else {
        this.deleteMsg = "Delete Cards";
      }

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
        if(this.localDeck.coverImg != null && this.localDeck.coverImg.length != 0){
          this.hasImage = true;}
          else {
            this.hasImage = false;
          }
        
    },
    getCardsByDeckId(deckId) {
      CardServices.getCardsByDeckId(deckId)
        .then(response => {
          this.cards = response.data;
          this.setHasImage();
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
  grid-template-columns: 250px 2fr;
  grid-template-areas: 
    "nav deckidrow"
    "nav deckDetails";
  gap: 10px;
}


.deckHeader{
  grid-area: deckHeader;
  text-align: center;
  
}
.deckidrow-container {
  grid-area: deckidrow;
  display: grid;;
  grid-template-areas: "image logo";
  
}

.decklogo-container {
  grid-area: logo;
  display: flex;
  justify-content: center;
}

.deckgrid-item {
  border-radius: 10px;
  padding: px;
  text-align: center;
  background-color: #ffffff;
}



.deckDetails{
  grid-area: deckDetails;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-template-areas: 
  "study createCard deldeck updateDeck"
  "carddeck carddeck carddeck deletecards"; 
}


.regular-cards-section{
  padding: 4px;
}

.single-cards-reg{
  grid-area: carddeck;
  display: flex;
  flex-wrap: wrap;
  
  gap: 20px;
}

.update-deck-button{
  display: grid;
  grid-area: updateDeck;
}
.create-cards-button{
  grid-area: createCard;
   
}

.study-button{
  grid-area: study;
  
}

.delete-deck-button{
  grid-area: deldeck
}

.delete-cards-button {
  grid-area: deletecards;
  
}
.regular-card-section {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  justify-content: center;}
.delete-cards-section {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  justify-content: center;}
.nav-toolbig {
  grid-area: nav;
  margin-right: 20px;
}

.image {
  grid-area: image;
  max-width: 100%;
  height: auto;
  margin: auto;
}

.deleting-cards {
  background-color: #fa6a49;
}

#delete-text{
  margin: auto;
  font-size: larger;
}
.deckImage{
  max-width: 600px;
}


</style>