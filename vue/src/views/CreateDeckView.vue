<template>
  <div> 
      <NavTool/>
  </div>
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
      
    </form>
    <Logo/>

</template>

<script>

//userId saving based on log-in


import DeckServices from "../services/DeckServices.js";
import NavTool from '../components/NavTool.vue';
import Logo from "../components/Logo.vue";


export default {
  components:{
    NavTool,
    Logo
},



  data(){
    return {
      newDeck: {
      
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


    createDeck() {
      DeckServices.createNewDeck(this.newDeck)
        .then(response => {
          if(response.status === 201) {
           
            this.$router.push({ name: 'createCard'});
                     
            }
          }).catch(error => {
            this.handleError(error, 'adding');
          });
    },
   


  }

};
</script>



<style>

.deck-form {
  display: flex;
  align-items: center;
  
}

#NavTool {
  display: flex

}





</style>