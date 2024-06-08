<template>

<div class = "loading" v-if="isLoading">Loading...</div>
<div v-else>

  <div class="Cardbyid"> 
    <NavTool />


   
        <div id="showCard" class = "showCard">
     
     <h1>CardView</h1>
     <div id=Question class="question">
       <h1> {{ card.frontQuestion }}</h1>
       <img :src="card.imageUrl" alt="Card Image"/>
     
     </div>
     <div id=Answer class="answer">
       <h1> {{ card.backAnswer }}</h1>
      </div>
      
     <div id=Tags class="tags">
       <h1> {{  card.tags }}</h1>
     </div>
<p>********************************</p>
<UpdateCard v-bind:card="card"/> 

    </div>
  </div>
  </div>
 
</template>

<script>

import NavTool from '@/components/NavTool.vue';
import CardServices from '../services/CardServices';
import UpdateCard from '../components/UpdateCard.vue';

export default {
  name: 'CardbyId',
  components: {
    NavTool,
    UpdateCard
  },
  data(){
    return {
    card:{},
    isLoading: false,
    
    };

  },
  methods: {
    handleError(error, verb) {
      if (error.response) {
        this.$store.commit('SET_NOTIFICATION', "Error " + verb + " card. Response received was " + error.response.statusText + "'.");
      } else if (error.request) {
        this.$store.commit('SET_NOTIFICATION', "Error " + verb + " card. Server could not be reached.");
      } else {
        this.$store.commit('SET_NOTIFICATION', "Error " + verb + " card. Request could not be created.");
      }
    },
  

    getCard(cardId){
      console.log("made it to here");
      CardServices.getCardById(cardId).then(response =>{
        this.card = response.data;
        this.isLoading = false;
      });
    },

  },
  created(){
    let cardId = parseInt(this.$route.params.id);
   
    if(cardId != 0){
      CardServices.getCardById(cardId).then(response =>{
        this.card = response.data;
        this.isLoading = false;
      
    }).catch(error => {
      this.handleError(error, 'retrieving');
    })
  
  }  
    }
};
</script>