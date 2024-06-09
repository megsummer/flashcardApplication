<template>
  <div>
    <button class="update" @click="toggleForm">Update Deck</button>
    <form v-if="formShowing" @submit.prevent="submitForm" class="deckForm">
      <div class="form-group">
        <label for="title">Deck Title:</label>
        <input id="title" type="text" class="form-control" v-model="editDeck.title" autocomplete="off" />
      </div>
      <div class="form-group">
        <label for="description">Deck Description:</label>
        <textarea id="description" class="form-control" v-model="editDeck.description"></textarea>
      </div>
      <div class="form-group">
        <label for="image">Deck Image:</label>
        <input id="image" type="text" class="form-control" v-model="editDeck.image" />
      </div>
      <button class="btn btn-submit">Submit</button>
      <button class="btn btn-cancel" @click="cancelForm" type="button">Cancel</button>
    </form>
    <div>Form should be showing: {{ formShowing }}</div>
  </div>
</template>

<script>
import DeckServices from '../services/DeckServices';

export default {
  props: {
    deck: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      formShowing: false,
      editDeck: {
        id: this.deck.id,
        title: this.deck.title,
        description: this.deck.description,
        image: this.deck.image,
      }
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
      if (!this.validateForm()) {
        return;
      }
      DeckServices.updateDeckById(this.editDeck)
        .then(response => {
          if (response.status === 200) {
            this.$store.commit(
              'SET_NOTIFICATION', {
                message: `Deck ${this.editDeck.id} was updated.`,
                type: 'success'
              }
            );
            this.$router.push({ name: 'DeckView', params: { id: this.editDeck.id } });
          }
        })
        .catch(error => {
          this.handleErrorResponse(error, 'updating');
        });
    },
    handleErrorResponse(error, verb) {
      if (error.response) {
        this.$store.commit('SET_NOTIFICATION',
          "Error " + verb + " deck. Response received was '" + error.response.statusText + "'.");
      } else if (error.request) {
        this.$store.commit('SET_NOTIFICATION', "Error " + verb + " deck. Server could not be reached.");
      } else {
        this.$store.commit('SET_NOTIFICATION', "Error " + verb + " deck. Request could not be created.");
      }
    },
    validateForm() {
      let msg = '';
      if (this.editDeck.title.length === 0) {
        msg += 'The deck must have a title. ';
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
.deckForm {
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