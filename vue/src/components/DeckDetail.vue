<template>
  <div>
    <h2>{{ deck.name }}</h2>
    <ul>
      <li v-for="card in deck.cards" :key="card.id">
        {{ card.content }}
      </li>
    </ul>
  </div>
</template>
  
<script>
import DeckService from '../services/DeckService';

export default {
  data() {
    return {
      deck: null
    };
  },
  methods: {
    fetchDeck() {
      const deckId = this.$route.params.id;
      DeckService.getDeckById(deckId)
        .then(response => {
          this.deck = response.data;
        })
        .catch(error => {
          let errorMessage = 'Error fetching deck.';
          if (error.response) {
            errorMessage += ` Response received was "${error.response.statusText}".`;
          } else if (error.request) {
            errorMessage += ' Server could not be reached.';
          } else {
            errorMessage += ' Request could not be created.';
          }
          console.error(errorMessage);
        });
    }
  },
  mounted() {
    this.fetchDeck();
  }
};
</script>