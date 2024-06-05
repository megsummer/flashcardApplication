<template>
<h1>{{ deck.title }}</h1>
<h2>{{ deck.description }}</h2>
<h3>{{ card.tags }}</h3>
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