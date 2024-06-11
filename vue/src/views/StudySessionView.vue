<template>
   <div class="loading" v-if="isLoading">Loading...</div>
    <div v-else>
   
  <div class="study-grid"> 
  <div class = "card-display"> CARD DISPLAY

<div class="card-display">
      <div class="loading" v-if="sessionOver">Session is Over...
        Your final score is {{ score }} correct.</div>
      
        <div v-else>
    <div  v-if="!isFlipped" class="front">
        
        <h1>{{ currentCard.frontQuestion }}</h1>
          <div  v-if="hasImage" id="image">
           <img :src="currentCard.cardImg" alt="Card Image" /></div>
          <div v-else></div>
        <button v-on:click="flip()">Flip!</button>
        </div>  
    <div v-else class="back">
        <h1>{{ currentCard.backAnswer }}</h1>
  

      <button v-on:click="right()">Right!</button> 
      <button v-on:click="wrong()">Wrong!</button>
    </div>
    </div>
</div>
    

  </div>
 
 
  <div class = "score-card" v-bind:score="score">
 
    <button v-on:click="endSession()">End Session</button>
    <p></p>
    SCORE CARD: {{ score}}</div>
  <div class = "logo"> <Logo/></div>

  </div>
  </div>
 
</template>

<script>

import Logo from '../components/Logo.vue';
import CardServices from '../services/CardServices';
import DeckServices from '../services/DeckServices';


export default {
  name: 'StudySession',
  components: {
 
    Logo
},  
data() {
    return {
      isLoading: true,
      localDeck: {},
      cards: [],
      score: 0,
      hasImage: false,
      isFlipped: false,
      currentCard: {},
      cardIndex: 0,
      sessionOver: false,
     
     
    };
  },

methods: {
  endSession(){
    this.sessionOver = true;
  },

  setHasImage(){
        if(this.currentCard.cardImg != null){
          this.hasImage = true;}
          else {
            this.hasImage = false;
          }
        },
        flip(){
            this.isFlipped = true;

        },
        right(){
            this.score++;
            this.cardIndex ++;
            if(this.cardIndex == this.cards.length - 1){
                this.sessionOver = true;
                this.cardIndex = 0;
            }else{
            this.currentCard = this.cards[this.cardIndex];
            this.isFlipped = false;}
        },
        wrong(){
            this.cardIndex ++;
            if(this.cardIndex == this.cards.length - 1){
                this.sessionOver = true;
                this.cardIndex = 0;
            }else{
            this.currentCard = this.cards[this.cardIndex];
            this.isFlipped = false;}
        },

  handleError(error, verb) {
      if (error.response) {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} deck. Response received was ${error.response.statusText}.`);
      } else if (error.request) {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} deck. Server could not be reached.`);
      } else {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} deck. Request could not be created.`);
      }
    },

  getCardsByDeckId(deckId) {
      CardServices.getCardsByDeckId(deckId)
        .then(response => {
          this.cards = response.data;
          this.isLoading = false;
          this.cardIndex = 0;
          this.currentCard= this.cards[this.cardIndex];
          this.setHasImage();
          this.isFlipped= false;
          this.sessionOver= false;
          this.score=0;
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
}


</script>
<style>

.card-display{
  grid-area: card-display;
}
.logo{
  grid-area: logo;
}
.score-card{
  grid-area: score-card;
}


.study-grid{
  display: grid;
  grid-template-columns: 2fr 1fr;
  grid-template-areas: 
  "card-display logo"
  "card-display score-card"
  "card-display .";
}

</style>
