<template>
  <div>
    <NavTool />
    <div class="loading" v-if="isLoading">Loading...</div>
    <div v-else>
      <div class="Cardbyid">
        <div id="showCard" class="showCard">
          <h1>CardView</h1>
          <div id="Question" class="question">
            <h1>{{ localCard.frontQuestion }}</h1>
            <img :src="localCard.imageUrl" alt="Card Image" />
          </div>
          <div id="Answer" class="answer">
            <h1>{{ localCard.backAnswer }}</h1>
          </div>
          <div id="Tags" class="tags">
            <h1>{{ localCard.tags }}</h1>
          </div>
          <p>********************************</p>
          <UpdateCard :card="localCard" @update-card="handleCardUpdate" />
        </div>
        <Logo/>
      </div>
    </div>
  </div>
</template>

<script>
import NavTool from '@/components/NavTool.vue';
import CardServices from '../services/CardServices';
import UpdateCard from '@/components/UpdateCard.vue';
import Logo from '../components/Logo.vue';

export default {
  name: 'CardbyId',
  components: {
    NavTool,
    UpdateCard,
    Logo
},
  data() {
    return {
      isLoading: true,
      localCard: {},
    };
  },
  methods: {
    handleError(error, verb) {
      if (error.response) {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} card. Response received was ${error.response.statusText}.`);
      } else if (error.request) {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} card. Server could not be reached.`);
      } else {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} card. Request could not be created.`);
      }
    },
    getCard(cardId) {
      CardServices.getCardById(cardId)
        .then(response => {
          this.localCard = response.data;
          this.isLoading = false;
        })
        .catch(error => {
          this.handleError(error, 'retrieving');
        });
    },
    handleCardUpdate(updatedCard) {
      this.localCard = updatedCard;
    },
  },
  created() {
    const cardId = parseInt(this.$route.params.id, 10);
    if (cardId !== 0) {
      this.getCard(cardId);
    } else {
      this.localCard = { ...this.card };
      this.isLoading = false;
    }
  },
};
</script>