<template>
     <div class="loading" v-if="isLoading">
    Loading...
 
      </div>
      <div v-else>

      
        <form>
            <label for="deck-to-add">Which Deck Should We add this card to?</label>
        {{ deckToAddTo }}
            <select name="deckToAddTo" id="deck-to-add"  v-model="deckToAddTo.id">
                <option v-for="deck in decks" v-bind:key="deck.deckId" v-bind:value="deck.deckId">{{ deck.deckTitle }}</option>

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
            deckToAddTo: {},

        };
    },
    methods:{
     
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
      
  
  }

}

</script>
