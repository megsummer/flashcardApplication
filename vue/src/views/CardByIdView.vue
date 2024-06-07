<template>
   <!-- <div class="viewCardActions"> </div>-->
   <div>
      <NavTool />
  </div>

  <!-- 1) get working to support display a single card first
       2) then add paging thru cards from search cards ?
       3) add branding
  -->

  <!-- <div class="loading" v-if="isLoading">Loading...</div>
  <div v-else>
      <h1>CardView</h1>
      <div id=Question class="question">
        <h1> {{ card.frontQuestion }}</h1>
        <h1> {{ card.backAnswer }}</h1>
        <h1> {{  card.cardImg }}</h1>
        <h1> {{  card.tags }}</h1>
        <p> Front - Question</p>
        <p> Type question here.....</p>
      </div>
      <div id=Answer class="answer">
        <p>Back - Answer</p>
        <p>Type answer here....</p>
       </div>
       
      <div id=Tags class="tags">
        <p>Tags- Type Answer</p>
        <p>Tags type answer here....</p>
      </div>
  </div> -->

  <div class="navActions">
    <!-- <router-link :to="{ name: 'HomeView' }">Return to HomeView</router-link> -->
  </div>
  <div id="create-card">
    <h2>
      Create New Card

    </h2>
      <form v-on:submit.prevent="createCard">
        <div class="card-form">
          <label for="card-frontQuestion">Front Question:</label>
          <input type="text" id="card-frontQuestion" v-model="newCard.frontQuestion" />
        </div>
        <div class="card-form">
          <label for="card-backAnswer">Back Answer:</label>
          <input type="text" id="card-backAnswer" v-model="newCard.backAnswer"/>
        </div>
        <div class="card-form">
          <label for="card-img">Card Image:</label>
          <input type="text" id="card-img" v-model="newCard.cardImg" />
        </div>
        <div class="card-form">
          <label for="card-tags">Tags:</label>
          <input type="text" id="card-tags" v-model="newCard.tags" />
          <input type="submit" value="Save Card"/>
        </div>
      </form>
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
          newCard: {
            userId: "",
            frontQuestion: "", 
            backAnswer: "", 
            cardImg: "",
            tags: ["string1", "string2"],
          },
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

  
    resetForm (){
      this.newCard = {
        userId: "",
        frontQuestion: "", 
        backAnswer: "", 
        cardImg: "",
        tags: "",
        };
       },

    createCard() {
      console.log(this.newCard);
      CardServices.createNewCard(this.newCard)
        .then(response => {
          if(response.status === 201) {
            window.alert('Card Added!');
          }
          // this.resetForm();
          }).catch(error => {
            this.handleError(error, 'adding');
          });
        },
    },
    created(){
        this.createCard();
    }
  };
</script>

<style >
.card-form {
  margin-top: 10px;
}

.card-form label{
display: block
}

.card-form textarea {
  height: 60px;
  width: 300px;
}
</style>