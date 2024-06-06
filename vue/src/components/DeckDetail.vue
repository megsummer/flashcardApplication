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
  import { ref, onMounted } from 'vue';
  import { useRoute } from 'vue-router';
  import DeckService from '../services/DeckServices';
  
  export default {
    setup() {
      const route = useRoute();
      const deck = ref(null);
  
      const fetchDeck = async () => {
        const deckId = route.params.id;
        try {
          const response = await DeckService.getDeckById(deckId);
          deck.value = response.data;
        } catch (error) {
          console.error('Error fetching deck:', error);
        }
      };
  
      onMounted(() => {
        fetchDeck();
      });
  
      return {
        deck,
      };
    },
  };
  </script>