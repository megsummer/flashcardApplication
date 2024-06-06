<template>
  <form v-on:submit.prevent="createDeck">
 <div class="deck-form">
        <label for="deck-title">Title:</label>
        <input type="text" id="deck-title" v-model="newDeck.title" />
      </div>

      <div class="deck-form">
        <label for="deck-description">Description:</label>
        <input type="text" id="deck-description" v-model="newDeck.description" />
      </div>

      <input type="submit" value="Save Deck" v-on:click="resetForm"/>
      <input type="submit" value="Write New Cards"/> <br>
      <input type="submit" value="Submit for Admin Approval"/>
    </form>
</template>

<script>
// add a pop-up box 'Deck Saved'//

import deckService from "../services/DeckServices.js";





export default {

  data(){
    return {
      newDeck: [ 
        { title: "", 
        description: "" }
    ]
    };
  },
  methods: {

    resetForm (){
      this.newDeck = {};
     // this.$router.push({name: 'getAllDecks'});

    },
    createDeck() {
      let deck = {
        title: this.title,
        description: this.description
      }
      this.newDeck.push(deck);
    }
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