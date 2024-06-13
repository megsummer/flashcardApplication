<template>
  <div class="CardById-container">
    <NavTool class="nav-tool"/>
    <div class="first-row">
    <div class="search-container">
      <h1>Tags:{{localCard.tags}}</h1>
      </div>
      <div class="logo-container">
        <Logo />
      </div>
    </div>




    <div class="loading" v-if="isLoading">Loading...</div>
    <div v-else class="grid-container">
      
      <CardIcon :card="localCard"/>
      <BackCardIcon :card="localCard"/>
  
          <UpdateCard class="updatecard" :card="localCard" @update-card="handleCardUpdate" />
          
        </div>
      </div>


</template>

<script>
import NavTool from '../components/NavTool.vue';
import CardServices from '../services/CardServices';
import UpdateCard from '../components/UpdateCard.vue';
import Logo from '../components/Logo.vue';
import CardIcon from '../components/CardIcon.vue';
import BackCardIcon from '../components/BackCardIcon.vue';

export default {
  name: 'CardById',
  components: {
    NavTool,
    UpdateCard,
    Logo, 
    CardIcon,
    BackCardIcon,
},
  data() {
    return {
      isLoading: true,
      localCard: {},
      hasImage: false,
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
    setHasImage(){
        if(this.card.cardImg != null && this.card.cardImg.length != 0){
          this.hasImage = true;}
          else {
            this.hasImage = false;
          }
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
<style scoped>
.loading {
  text-align: center;
  font-size: 2em;
  margin-top: 20px;
}

form {
  text-align: center;
  margin-bottom: 20px;
}

#search-bar {
  margin-top: 50px;
  padding: 10px;
  margin-right: 5px;
  border-radius: 20px;
  border: 1px solid black;

}

button {
  background-color: #ffd966;
  color: black;
  text-align: center;
  margin: 10px;
  padding: 10px;
  border-radius: 25px;
  cursor: pointer;
}

button:hover {
  background-color: #ffc107;
}

.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 60px;
  grid-area: main;
}


p {
  text-align: center;
  color: black;
}



.nav-tool {
  grid-area: nav;
  margin-right: 20px;
}

.search-container {
  text-align: center;
  margin: auto;
}

.logo-container {
  display: flex;
  justify-content: center;
}

.first-row {
  grid-area: first-row;
  display: flex;
  justify-content: right;
  
}

.CardById-container {
  display: grid;
  grid-template-columns: 250px 1fr;
  grid-template-areas: 
    "nav first-row"
    "nav main";
    column-gap: 100px;
}
.updatecard{
  display: flex;

}
</style>