<template>
   <div class="viewCardActions"> </div>
  <div id=navpanel>
      <NavTool />
  </div>

  <title>  </title>
  <!-- 1) get working to support display a single card first
       2) then add paging thru cards from search cards ?
       3) add branding
  -->

  <div class="loading" v-if="isLoading">Loading...</div>
  <div v-else>
        <h1>CardView</h1>
  </div>


  <router-link v-for="card in cards" v-bind:key="card.cardId"
    v-bind:to="{name: 'getCardById'}">
    <CardIcon v-bind:card="card"/>
  </router-link>

  <div class="navActions">
    <!-- return needs to move to navigation bar top or bottom -->
    <!-- <router-link v-bind:to="{ name: 'HomeView' }">Return to HomeView</router-link> -->
  </div>
  
  <!-- <div id="branding">
    <header>
        <h1>
          <title> Card View - Viewing a Card </title>
          <img src="../assets/croppedFlipFlashLogo.png" />
        </h1>
    </header>
  </div>
  -->

 <!-- add buttons for previous, next, exit -->

  <div id=card-view>
    
    <div id=Question class="question">
        <h1> {{ cardId }}</h1>  
        <h1> {{  frontQuestion }}</h1>
        <h1> {{ backAnswer }}</h1>
        <h1> {{  cardImg }}</h1>
        <h1> {{  userId }}</h1>
        <h1> {{  tags }}</h1>

        <p>Front - Question</p>
        <p>Type question here.....</p>
    </div>
    <div id=Answer class="answer">
        <p>Back - Answer</p>
        <p>Type answer here....</p>
    </div>
  </div>
</template>

<script>
import NavTool from '@/components/NavTool.vue';
import CardServices from '@/services/CardServices.js';
import CardIcon from '@/components/CardIcon.vue';

export default {
  name: 'CardView',

  components: { 
    CardIcon,
    NavTool 
    },
    
    data () {
      return {
        cards: [], 
        isLoading: false,
      };
    }, 
    
    methods: {
      handleError(error, verb) {
      if (error.response) {
        this.$store.commit('SET_NOTIFICATION',
          "Error " + verb + " CardView. Response received was '" + error.response.statusText + "'.");
      } else if (error.request) {
        this.$store.commit('SET_NOTIFICATION', "Error " + verb + " card list. Server could not be reached.");
      } else {
        this.$store.commit('SET_NOTIFICATION', "Error " + verb + " card list. Request could not be created.");
      }
          },
    
    getCardById(cardId) {
        CardServices.getCardById(cardId).then (response=> {
          this.cards = response.data;
          this.isLoading = false; 
        })
      },

    computed: {},
    
    created () {
      const cardId ='1';
      this.getCardById();

      // test for single card to screen for starters
      // Fetch card data when the component is created
      }
    }
  }
</script>

<style scoped>
</style>