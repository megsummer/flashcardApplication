<template>
  <form v-on:submit.prevent="createDeck">
    {{newDeck}}
      <div class="deck-form">
        <label for="deck-title">Deck Title:</label>
        <input type="text" id="deck-title" v-model="newDeck.deckTitle" />
      </div>

      <div class="deck-form">
        <label for="deck-description">Description:</label>
        <input type="text" id="deck-description" v-model="newDeck.deckDescription" />
      </div>

      <input type="submit" value="Save Deck"/>
      <input type="button" value="Write New Cards" v-on:click="createCards"/> <br>
      <input type="button" value="Submit for Admin Approval"/>
    </form>

</template>

<script>
// add a pop-up box 'Deck Saved'//
//userId saving based on log-in


import DeckServices from "../services/DeckServices.js";
import Logo from "../components/Logo.vue"
import NavTool from '../components/NavTool.vue';

export default {
  components:{
    // Logo,
    // NavTool
   


  },



  data(){
    return {
      newDeck: {
        userId: 1,
        deckTitle: "",
        coverImg: "",
        deckDescription: "",
      },
    };
  },
  methods: {

    handleError(error, verb) {
      if (error.response) {
        this.$store.commit('SET_NOTIFICATION',
          "Error " + verb + " deck list. Response received was '" + error.response.statusText + "'.");
      } else if (error.request) {
        this.$store.commit('SET_NOTIFICATION', "Error " + verb + " card list. Server could not be reached.");
      } else {
        this.$store.commit('SET_NOTIFICATION', "Error " + verb + " card list. Request could not be created.");
      }
    },
    createCards(){
      this.$router.push({name: 'saveCard'})
    },

    resetForm (){
      this.newDeck = {
        userId: "",
        deckTitle: "",
        coverImg: "",
        deckDescription: "",
      };
     // this.$router.push({name: 'getAllDecks'});

    },

    createDeck() {
      console.log('What am I passing to the service?')
      console.log(this.newDeck);
      DeckServices.createNewDeck(this.newDeck)
        .then(response => {
          if(response.status === 201) {
            window.alert('Deck Added!');
             //this.resetForm();         
            }
          }).catch(error => {
            this.handleError(error, 'adding');
          });
    },
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