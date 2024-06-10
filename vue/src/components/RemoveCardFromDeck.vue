<template>Remove Cards


<p></p>
      Cards In This Deck

      <router-link v-for="card in cards" v-bind:key="card.cardId"
        v-bind:to="removeCard">
        <CardIcon v-bind:card="card"/>
     </router-link>

</template>


<script>
import CardServices from '../services/CardServices';
import DeckServices from '../services/DeckServices';
import CardIcon from '../components/CardIcon.vue';

export default{
    components: {

    },
    props: ['cards', 'deck'],
    data(){
        return {

        };
    },
    methods:{
        handleError(error, verb) {
      if (error.response) {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} deck. Response received was ${error.response.statusText}.`);
      } else if (error.request) {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} deck. Server could not be reached.`);
      } else {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} deck. Request could not be created.`);
      }
    },

    removeCard(){
        CardServices.removeCardFromDeck(this.deck.deckId, this.card.cardId)
    }
    },
}

</script>
