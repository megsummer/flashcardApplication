<template>
   <div class="loading" v-if="isLoading">Loading...</div>
    <div v-else>
   
    <div class="study-grid"> 
 

    <div class="card-display">
      <div class="loading" v-if="sessionOver">Session is Over...
       <p class="cardText">Your final score is {{ score }} correct.</p>
      </div>
      
      <div v-else class ="card-contents">
      <div  v-if="!isFlipped" class="front">
        
          <div  v-if="hasImage" id="card-image">
           <img class= "study-image" :src="currentCard.cardImg" alt="Card Image" /></div>
          <div v-else></div>
          <p class="cardText">{{ currentCard.frontQuestion }}</p>
       
        </div>  
    <div v-else class="back">
        <p class="cardTest">{{ currentCard.backAnswer }}</p>
  

    </div>
    
</div>
    
    </div>
 <div class="button-display">
  <div class="over" v-if="sessionOver">
    <router-link v-bind:to="{ name: 'myDecks' }">
      <button id="return">Return to Deck!</button>
    </router-link> </div>
      <div v-else>

  <div class="over" v-if="!isFlipped">
     <button id="flip" v-on:click="flip()">Flip!</button></div><div v-else>

    <button id="right" v-on:click="right()">Right!</button> 
    <button id="wrong" v-on:click="wrong()">Wrong!</button></div>

   </div>



 </div>
 
  <div class = "score-card" v-bind:score="score">
 
    <button id="end-session" v-on:click="endSession()">End Session</button>
    <p id="score">
    SCORE CARD: {{ score}}</p>
  
  </div>
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
        if(this.currentCard.cardImg != null && this.currentCard.cardImg != ""){
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
            if(this.cardIndex >= this.cards.length){
                this.sessionOver = true;
                this.cardIndex = 0;
            }else{
            this.currentCard = this.cards[this.cardIndex];
            this.setHasImage();
            this.isFlipped = false;}
        },
     wrong(){
            this.cardIndex ++;
            if(this.cardIndex >= this.cards.length){
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
  background-color: rgb(241, 237, 237);
  color: black;
  text-align: center;
  text-justify: auto;
  text-transform: none;
  font-size:xx-large;
  text-decoration: none;
  margin: auto;
  padding: 90px;
  border-radius: 20px;
  width: 500px;
  height: 450px;
  border: .2px solid black;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  transition: transform .2s, box-shadow .2s;
  justify-content: center;

}
.logo{
  grid-area: logo;
}
.score-card{
  grid-area: score-card;
  margin-right: 30px;
  text-align: center;
}


.study-grid{
  display: grid;
  grid-template-columns: 2fr 1fr;
  grid-template-areas: 
  "card-display logo"
  "card-display score-card"
  "button-display .";
}

button{
  width: 200px;
  height: 40px;
  font-size: large;
  justify-content: right;
  
}
#end-session{
  background-color: #ffd966;
  
}
#flip{
  background-color: #ffd966;
  
}
#wrong{
  background-color: #F24E29;
  
}
#right{
  background-color: #03A64A;
  
}
#return{
  background-color: #ffd966;
}

.button-display{
  grid-area: button-display;
  display: flex;
  justify-content: center;
  gap: 10px; 

}

.card-display{
  max-width: 450px;
  max-height: 450px;
  align-items: center;
}

.study-image{
max-width: 450px;
max-height: 450px;
border: .2px solid black;  
}

</style>
