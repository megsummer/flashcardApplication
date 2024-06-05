<template>
<h1>{{ deck.deckTitle }}</h1>
<h2>{{ deck.deckDescription }}</h2>

DECK ICONS
</template>

<script>
import DeckService from '../services/DeckServices';


export default {
  components: {
    

  },
  props: ['deck'],
  data() {
    return {
      

    };
  },
  methods: {

  },
 
  }


</script>