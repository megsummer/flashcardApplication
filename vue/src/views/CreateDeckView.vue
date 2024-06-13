<template>
  <div class = "deckById-container"> 
      <NavTool class="deck-nav-tool"/>
<div class ="create-deck-first-row">
  <div class="top-deck-container">
        <h2>Create New Deck</h2>
        <h3>Please Complete All Required Fields</h3>
        </div>

        <div class="deck-logo-container">
        <Logo/>
      </div>
</div>
    
<div class = "create-deck-main-container">
  <div class="create-deck">

    <div v-if="!addImage">
    <button class = "image-button" v-on:click="addImage = true">Add Image</button>
  </div>
   
    <div class="uploadImage" v-if="addImage"> 
      <button v-on:click="upload">Upload Image</button><br>
      <button v-on:click="addImage = false">Cancel</button>
    </div>

<div v-else>
  <form v-on:submit.prevent="createDeck">
      <div class="deck-form">
        <label for="deck-title">Deck Title:</label>
        <textarea id="deck-title" v-model="newDeck.deckTitle"></textarea>
      </div>

      <div class="deck-form">
        <label for="deck-description">Description:</label>
        <textarea id="deck-description" v-model="newDeck.deckDescription"></textarea> 
      </div>

      <div class="deck-form">
        <label for="deck-img">Image URL:</label>
        <input type="text" id="imgurl" v-model="newDeck.coverImg" />
      </div>
      <br>
      <button class="btn btn-submit">Save Deck</button>

      <p class="alert" v-if="errorMessage != ''">{{errorMessage}}</p>
      
      
      
    </form>
  </div>
  </div>

   </div>
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
      errorMessage: "",
      addImage: false,
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
    validateForm() {
        this.errorMessage = "";
        let isValid = true;
        if (this.newDeck.deckTitle.length == 0) {
          this.errorMessage += 'The new deck must have a title. ';
          isValid = false;
        }
        if (this.newDeck.deckDescription.length == 0) {
          this.errorMessage += 'The new deck must have a description.  ';
          isValid = false;
        
        }
        return isValid;
      
        
      
      },
      upload() {
        this.myWidget.open();
        this.addImage = false;
      },


    createDeck() {
      if(this.validateForm()){
      DeckServices.createNewDeck(this.newDeck)
        .then(response => {
          if(response.status === 201) {
           
            this.$router.push({ name: 'myDecks'});
                     
            }
          }).catch(error => {
            this.handleError(error, 'adding');
          });
        }return false;
    },
   


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
          this.newDeck.coverImg = result.info.url;
        }
      }
    );
  }

};
</script>

<style>


.form {
  text-align: center;
  margin-bottom: 20px;
  
}


.deck-form {
  gap: 10px;
  margin-left: 15px;
  margin-bottom: .5%;
}

.deck-form label{
display: flex;
gap: 10px;

}

.deck-form textarea {
  text-align: center;
  height: 60px;
  width: 300px;
}

.submit-button {
  color: black;
  text-align: center;
  margin: 10px;
  padding: 5px;
  border-radius: 10px;
 
  
}

.image-button{
  margin-left: 30px;
}
.alert{
  color:#F24E29
}

.submit-button:hover {
  background-color: #ffc107;
}


.deck-nav-tool{
  grid-area: nav;
  margin-right: 20px;
}

button {
  background-color: #ffd966;
  color: black;
  text-align: center;
  padding: 10px;
  border-radius: 30px;
  cursor: pointer;
  margin-bottom: 10px;
  margin-left: 20px;
}

button:hover {
  background-color: #ffc107;
}
.create-deck-main-container{
  grid-area: main;
  padding: 10px;
  /* justify-content: left; */
  margin-left: 300px;
  
}

form {
  /* text-align: center; */
  margin-bottom: 20px;
}

#search-bar {
  margin-top: 50px;
  padding: 10px;
  margin-right: 5px;
  border-radius: 20px;
  border: 1px solid black;

}

.top-deck-container {
  text-align: center;
  margin: auto;
}

.deck-logo-container {
  display: flex;
  justify-content: center;
}

.create-deck-first-row {
  grid-area: first-row;
  display: flex;
  justify-content: right;
  
}
.deckById-container {
  display: grid;
  grid-template-columns: 250px 1fr;
  grid-template-areas: 
    "nav first-row"
    "nav main";
  gap: 15px;
}



</style>