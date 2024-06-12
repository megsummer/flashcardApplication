<template>
   <!-- <div class="viewCardActions"> </div>-->
   <div>
  
      <NavTool />
  </div>

  <div id="create-card">
    <h2>
      Create New Card
     
    </h2>
    <div v-if="!addImage">
    
    <button v-on:click="addImage = true">Add Image</button></div>
   
    <div class="uploadImage" v-if="addImage"> 
      
      <button v-on:click="upload">Upload Image</button><br>
      <button v-on:click="addImage = false">Cancel</button>
    </div>
<div v-else>
      <form v-on:submit.prevent="createCard">
        <div class="card-form">
          <label for="card-frontQuestion">Front Question:</label>
          <textarea id="card-frontQuestion" v-model="newCard.frontQuestion"></textarea> 
        </div>
        <div class="card-form">
          <label for="card-backAnswer">Back Answer:</label>
          <textarea id="card-backAnswer" v-model="newCard.backAnswer"></textarea>
        </div>
  
        <div class="card-form">
          <label for="card-tags">Tags: Please separate tags with a comma.  Example: biology, science, cells</label>
          
          <textarea id="card-tags" v-model="tagsAsString"></textarea>
          <div class="card-form">
          <label for="card-img">Card Image URL:</label>
          <input type="text" id="card-img" v-model="newCard.cardImg" />
        </div> 

          <label for="deck-to-add">Add this card to a deck:</label>
            <select name="deckToAddTo" id="deck-to-add"  v-model="deckToAddTo.deckId">
              <option v-bind:value="0">Please Select a Deck</option>
                <option v-for="deck in decks" v-bind:key="deck.deckId" v-bind:value="deck.deckId">{{ deck.deckTitle }}</option>
            </select>

           

          <input type="submit" value="Save Card"/>

          <p class="alert" v-if="errorMessage != ''">{{errorMessage}}</p>
        </div>
        </form></div>
      
<div class="card-form">
 
</div>

    
      <Logo/>
  </div>
</template>

<script>
import NavTool from '@/components/NavTool.vue';
import CardServices from '@/services/CardServices.js';
import Logo from '../components/Logo.vue';
import DeckServices from '../services/DeckServices';




export default {
  name: 'CardView',

  components: {

    NavTool,
    Logo,
  
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
          deckToAddTo: {},
          decks: [],
          isLoading: false,
          errorMessage: "",
          addImage: false,
          
    };
  },
    
    methods: {

      upload() {
        this.myWidget.open();
        this.addImage = false;
      },
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

    
    validateForm() {
        this.errorMessage = "";
        let isValid = true;
        if (this.newCard.frontQuestion.length == 0) {
          this.errorMessage += 'The new card must have a front question. ';
          isValid = false;
        }
        if (this.newCard.backAnswer.length == 0) {
          this.errorMessage += 'The new card must have a back answer.  ';
          isValid = false;
        }
        if(this.deckToAddTo.deckId == 0 || this.deckToAddTo.deckId == null){
          this.errorMessage += 'The new card must be assigned to a deck. ';
          isValid = false;
        }
        return isValid;
      
        
      
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
      addCardToDeck(){
        if(this.deckToAddTo.id != 0){
          CardServices.addCardToDeck(this.newCard, this.deckToAddTo.deckId)
            .then(response=> {
             if(response.status === 200) {
              this.$store.commit(
              'SET_NOTIFICATION', {
               message: `Card was added to deck.`,
                type: 'success'
              }
              ) }}
            ).catch(error => {
            this.handleError(error, 'updating');
           });
          } this.resetForm();
      },

      createCard() {
      this.isLoading = true;
      if(this.tagsAsString != ""){
        this.newCard.tags = this.tagsAsString.split(",");}

        if (!this.validateForm()) {
          this.isLoading = false;
         return;
        }

      CardServices.createNewCard(this.newCard)
        .then(response => {
          if(response.status === 201) {
            this.newCard.cardId = response.data;
            window.alert('Card Added!');
           this.addCardToDeck();
          

          }
        
          }).catch(error => {
            this.handleError(error, 'adding');
          });
        },
    },
    
    created() { 
      this.retrieveDecks();
      
  
  },
  mounted() {
       this.myWidget = window.cloudinary.createUploadWidget(
      {
        // Insert your cloud name and presets here, 
        // see the documentation
        cloudName: 'dvxtx3qq6', 
        uploadPreset: 'fqofg0ln'
      }, 
      (error, result) => { 
        if (!error && result && result.event === "success") { 
          console.log('Done! Here is the image info: ', result.info); 
          console.log("Image URL: " + result.info.url);
          this.newCard.cardImg = result.info.url;
        }
      }
    );

  }


}
 
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

.alert{
  color:crimson
}
</style>