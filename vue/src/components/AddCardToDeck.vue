<template>
     <div class="loading" v-if="isLoading">
    Loading...
 
      </div>
      <div v-else>

        Hi
        {{ decks }}
        
        <form>
            <label for="deck-to-add">Which Deck Should We add this card to?</label>
        
            <select name="deckToAddTo" id="deck-to-add">
            </select>

        </form>

        </div>

</template>


<script>
import CardServices from '../services/CardServices';
import DeckServices from '../services/DeckServices';

export default{
    components: {

    },
    props: ['card'],
    data(){
        return {
            decks: [],
            isLoading: true,
            deckToAddTo: "",

        };
    },
    methods:{
        createFormOptions(){
        let options ="<option value ='0'>Please Choose a Deck</option>"

        for (let i = 0; i<this.decks.length; i++){  
        options += " <option value ='"+ i +"'>"+ this.decks[i].deckTitle+"</option>";
        }
        document.getElementById('deck-to-add').innerHTML.options;
    },
        handleError(error, verb) {
      if (error.response) {
        this.$store.commit('SET_NOTIFICATION',
          `Error ${verb} deck list. Response received was '${error.response.statusText}'.`);
      } else if (error.request) {
        this.$store.commit('SET_NOTIFICATION',
          `Error ${verb} deck list. Server could not be reached.`);
      } else {
        this.$store.commit('SET_NOTIFICATION',
          `Error ${verb} deck list. Request could not be created.`);
      }
    },
    async retrieveDecks() {
      try {
        this.isLoading = true;
        const response = await DeckServices.getDecksByUserId();
        this.decks = response.data;
      } catch (error) {
        this.handleError(error, 'retrieving');
      } finally {
        this.isLoading = false;
      }
    },
    },
    

  created() { 
 
      this.retrieveDecks();
      this.createFormOptions();
  
  }

}

</script>
