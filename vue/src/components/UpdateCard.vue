<template>
    <div>
      <button class="update" @click="toggleForm">Update Card</button>
      <form v-if="formShowing" @submit.prevent="submitForm" class="cardForm">
        <div class="form-group">
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
        <button class="btn btn-submit">Submit</button>
        <button class="btn btn-cancel" @click="cancelForm" type="button">Cancel</button>
      </form>
      <div>Form should be showing: {{ formShowing }}</div>
    </div>
  </template>
  
  <script>
  import CardServices from '../services/CardServices';
  
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
      };
    },
    methods: {
      toggleForm() {
        this.formShowing = !this.formShowing;
        if (this.formShowing) {
          this.$store.commit('SET_NOTIFICATION', 'Update form is now visible.');
        } else {
          this.$store.commit('SET_NOTIFICATION', 'Update form is now hidden.');
        }
      },
      submitForm() {
        if(this.tagsAsString != ""){
        this.editCard.tags = this.tagsAsString.split(",");}

        console.log(this.editCard);

       if (!this.validateForm()) {
         return;
        }
        //if (this.editCard.cardId === 0) {
         // CardServices.addCard(this.editCard)
           // .then(response => {
             // if (response.status === 201) {
               // this.$store.commit(
                 //   'SET_NOTIFICATION',
                   //  {
                     //   message: 'A new card was added.',
                       // type: 'success'
                   // }
              //  );
            //    this.$router.push({ name: 'CardView', params: { id: this.editCard.cardId  } });
        //      }
          //  })
           // .catch(error => {
            //  this.handleErrorResponse(error, 'adding');
           // });
        //} else {
          CardServices
          .updateCardById(this.card.cardId, this.editCard)
          .then(response => {
              if (response.status === 200) {
                this.$store.commit(
                    'SET_NOTIFICATION', {
                        message: `Card was updated.`,
                        type: 'success'
                    }
                  );

               // this.$router.push({ name: 'cardById', params: {id: } });
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
        let msg = '';
        if (this.editCard.frontQuestion.length === 0) {
          msg += 'The new card must have a front question. ';
        }
        if (this.editCard.backAnswer.length === 0) {
          msg += 'The new card must have a back answer.';
        }
        if (msg.length > 0) {
          this.$store.commit('SET_NOTIFICATION', msg);
          return false;
        }
        return true;
      },
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