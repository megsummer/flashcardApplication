<template>
  <div class = form> 
  <div>
      <NavTool/>
  </div>
  <form v-on:submit.prevent="createDeck">
    
      <div class="deck-form">
        <label for="deck-title">Deck Title:</label>
        <input type="text" id="deck-title" v-model="newDeck.deckTitle" />
      </div>

      <div class="deck-form">
        <label for="deck-description">Description:</label>
        <input type="text" id="deck-description" v-model="newDeck.deckDescription" />
      </div>

      <input class = 'submit-button' type="submit" value="Save Deck"/>
      
    </form>
    <Logo/>
  </div>
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
           
            this.$router.push({ name: 'myDecks'});
                     
            }
          }).catch(error => {
            this.handleError(error, 'adding');
          });
    },
   


  }

};
</script>

<style>




.form {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  color: black;
  text-align: center;
  border-radius: 10px;
  margin: 10px;
  padding: 10px;
  align-items: center;
  
}


.deck-form {

}

.submit-button {
  color: black;
  text-align: center;
  margin: 10px;
  padding: 5px;
  border-radius: 10px;
  
}

.submit-button:hover {
  background-color: #ffc107;
}

.NavTool{

}





</style>