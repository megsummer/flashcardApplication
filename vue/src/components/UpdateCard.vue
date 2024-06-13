<template>
  
     <div v-if="formShowing">
      <form @submit.prevent="submitForm" class="cardForm">
        <div class="form-group">
          <div v-if="!addImage">
    
    <button v-on:click="addImage = true">Add Image</button></div>
   
    <div class="uploadImage" v-if="addImage"> 
      
      <button v-on:click="upload">Upload Image</button><br>
      <button v-on:click="addImage = false">Cancel</button>
    </div>
<div v-else>
          <div>
          <label for="title">Front Question:</label>
          <input id="title" type="text" class="form-control" v-model="editCard.frontQuestion" autocomplete="off" />
        </div>
        <div class="form-group">
          <label for="tag">Back Answer:</label>
          <input id="tag" type="text" class="form-control" v-model="editCard.backAnswer" />
          <label for="status">Card Image:</label>
          <input id="status" type="text" class="form-control" v-model="editCard.coverImg" />
        </div>
        <div class="form-group">
          <label for="description">Tags:</label>
          <input id="description" type="text" class="form-control" v-model="tagsAsString" />
        </div>
        <label for="deck-to-add">Add this card to a deck:</label>
            <select name="deckToAddTo" id="deck-to-add"  v-model="deckToAddTo.id">
              <option v-bind:value="0">Please Select a Deck</option>
                <option v-for="deck in decks" v-bind:key="deck.deckId" v-bind:value="deck.deckId">{{ deck.deckTitle }}</option>
            </select>
            <br>
        <button class="btn btn-submit">Submit</button>
        <button class="btn btn-cancel" @click="toggleForm" type="button">Cancel</button>
</div>   <p class="alert" v-if="errorMessage != ''">{{errorMessage}}</p>
</div>
      </form></div>
      <div v-if="!formShowing">
       <button class="update" @click="toggleForm">Update Card</button></div>
    
  </template>
  
  <script>
  import CardServices from '../services/CardServices';
  import DeckServices from '../services/DeckServices';
  
  export default {
    props: {
      card: {
        type: Object,
        required: true
      }
    },
  
    data() {
      return {
        formShowing: false,
        editCard: {
        cardId: this.card.cardId,
        frontQuestion: this.card.frontQuestion,
        backAnswer: this.card.backAnswer,
        cardImg: this.card.cardImg,
        tags: this.card.tags,
        
        },
        tagsAsString: "",
        deckToAddTo: {id:0,},
        addImage: false,
        errorMessage:"",
      };
    },

    methods: {
      upload() {
        this.myWidget.open();
        this.addImage = false;
      },

      toggleForm() {
        this.formShowing = !this.formShowing;
      },


      submitForm() {

       

        if(this.tagsAsString != ""){
        this.editCard.tags = this.tagsAsString.split(",");}

       if (!this.validateForm()) {
         return false;
        }
       
          CardServices.updateCardById(this.editCard, this.deckToAddTo.id)
          .then((response) => {
              
              if (response.status === 200) {
                 this.$store.commit(
                     'SET_NOTIFICATION', {
                         message: `Card was updated.`,
                         type: 'success'
                     }
                   );
                   this.$router.push({ name: 'deckById', params: {id: this.deckToAddTo.id} });
                  }
                 
                })
            .catch(error => {
          
              this.handleErrorResponse(error, 'updating');
            });
            
      },


      handleErrorResponse(error, verb) {
        if (error.response) {
          this.$store.commit('SET_NOTIFICATION',
            "Error " + verb + " card. Response received was '" + error.response.statusText + "'.");
        } else if (error.request) {
          this.$store.commit('SET_NOTIFICATION', "Error " + verb + " card. Server could not be reached.");
        } else {
          this.$store.commit('SET_NOTIFICATION', "Error " + verb + " card. Request could not be created.");
        }
      },
      validateForm() {
        this.errorMessage = "";
        let isValid = true;
        if (this.editCard.frontQuestion.length == 0) {
          this.errorMessage += 'The card must have a front question. ';
          isValid = false;
        }
        if (this.editCard.backAnswer.length == 0) {
          this.errorMessage += 'The card must have a back answer.  ';
          isValid = false;
        }
        if(this.deckToAddTo.id == 0 || this.deckToAddTo.id == null){
          this.errorMessage += 'The card must be assigned to a deck. ';
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
        this.handleErrorResponse(error, 'retrieving');
      } finally {
        this.isLoading = false;
      }
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
  
  <style scoped>
  .cardForm {
    padding: 10px;
    margin-bottom: 10px;
  }
  
  .form-group {
    margin-bottom: 10px;
    margin-top: 10px;
  }
  
  label {
    display: inline-block;
    margin-bottom: 0.5rem;
  }
  
  .form-control {
    display: block;
    width: 80%;
    height: 30px;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
  }
  
  textarea.form-control {
    height: 75px;
    font-family: Arial, Helvetica, sans-serif;
  }
  
  select.form-control {
    width: 20%;
    display: inline-block;
    margin: 10px 20px 10px 10px;
  }
  </style>