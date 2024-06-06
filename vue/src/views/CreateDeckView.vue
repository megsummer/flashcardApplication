<template>
  <form v-on:submit.prevent="createDeck">
      <div class="deck-form">
        <label for="deck-title">Deck Title:</label>
        <input type="text" id="deck-title" v-model="newDeck.deckTitle" />
      </div>

      <div class="deck-form">
        <label for="deck-description">Description:</label>
        <input type="text" id="deck-description" v-model="newDeck.deckDescription" />
      </div>

      <input type="submit" value="Save Deck" v-on:click="resetForm"/>
      <input type="submit" value="Write New Cards" v-on:click="createCards"/> <br>
      <input type="submit" value="Submit for Admin Approval"/>
    </form>

    {{ newDeck }}
</template>

<script>
// add a pop-up box 'Deck Saved'//
//userId saving based on log-in


import DeckServices from "../services/DeckServices.js";


export default {
  props: ['deckService.deckId'],
//I don't think this is right ^^
  data(){
    return {
      newDeck: {
        deckId: "",
        userId: "",
        deckTitle: "",
        coverImg: "",
        deckDescription: "",
        pendingApproval: false,
        adminId: "",
        approved: false
      }
    };
  },
  methods: {
    createCards(){
      this.$router.push({name: 'saveCard'})
    },

    resetForm (){
      this.newDeck = {};
     // this.$router.push({name: 'getAllDecks'});

    },
    createDeck() {

      DeckServices.createNewDeck(this.newDeck).then(
                (response) => {
                    if(response.status === 201) {
                        window.alert('Deck Added!');
                        this.newDeck = {};
                        
                    }
                }
            );
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