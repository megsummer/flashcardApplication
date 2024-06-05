<template>
 <div class="deck-form">
        <label for="deck-title">Title:</label>
        <input type="text" id="deck-title" v-model="newDeck.title" />
      </div>

      <div class="deck-form">
        <label for="deck-description">Title:</label>
        <input type="text" id="deck-description" v-model="newDeck.description" />
      </div>


</template>

<script>
import deckService from "../services/DeckServices.js";





export default {

  data(){
    return {
      newDeck: {
        title: "", 
        description: ""
      }
    };
  },
  methods: {
    //saving title, description (&img)//
    //after save keep you on same page to add card?


  }

};
</script>





<style>

.deck-form {
  margin-top: 10px;
}

.deck-form label{
display: block
}

.deck-form textarea {
  height: 60px;
  width: 300px;
}

</style>