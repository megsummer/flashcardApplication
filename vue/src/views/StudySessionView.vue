<template>
   <div class="loading" v-if="isLoading">Loading...</div>
    <div v-else>
   
  <div class="study-grid"> 
  <div class = "card-display"> CARD DISPLAY

<StudyCard v-bind:cards="cards"/>
  </div>
 
  <div class = "score-card" v-bind:score="score">SCORE CARD: {{ score}}</div>
  <div class = "logo"> <Logo/></div>

  </div>
  </div>
 
</template>

<script>

import Logo from '../components/Logo.vue';
import CardServices from '../services/CardServices';
import DeckServices from '../services/DeckServices';
import StudyCard from '../components/StudyCard.vue';

export default {
  name: 'StudySession',
  components: {
   StudyCard,
    Logo
},  
data() {
    return {
      isLoading: true,
      localDeck: {},
      cards: [],
      score: this.$store.state.scoreCard,
     
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

  getCardsByDeckId(deckId) {
      CardServices.getCardsByDeckId(deckId)
        .then(response => {
          this.cards = response.data;
          this.isLoading = false;
          this.currentCard= this.cards[0];
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
