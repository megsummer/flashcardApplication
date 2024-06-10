<template>
   <!-- <div class="viewCardActions"> </div>-->
   <div>
  
      <NavTool />
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
          <input type="text" id="card-tags" v-model="tagsAsString" />
          <input type="submit" value="Save Card"/>
        </div>
<div class="card-form">
 
</div>

      </form>
      <Logo/>
  </div>
</template>

<script>
import NavTool from '@/components/NavTool.vue';
import CardServices from '@/services/CardServices.js';
import Logo from '../components/Logo.vue';
//import AddCardToDeck from '../components/AddCardToDeck.vue';



export default {
  name: 'CardView',

  components: {
  
    NavTool,
    Logo,
    //AddCardToDeck
},
    
    data () {
      return {
          newCard: {
            userId: "",
            frontQuestion: "", 
            backAnswer: "", 
            cardImg: "",
            tags: [],
          },
          tagsAsString: "",
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
      if(this.tagsAsString != ""){
        this.newCard.tags = this.tagsAsString.split(",");}
     
      CardServices.createNewCard(this.newCard)
        .then(response => {
          if(response.status === 201) {
            window.alert('Card Added!');
          }
        
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