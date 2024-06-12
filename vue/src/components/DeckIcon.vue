<template>
  <div id="deck" class="deck">
    <p id="title" class="title">{{ deck.deckTitle }}</p>
  
    
  <div v-if="hasImage" id="image">
    <img :src="deck.coverImg" alt="Deck Image" /> </div>
    <div v-else>
      <p id="description" class="description">{{ deck.deckDescription }}</p>
    </div>
  </div>
</template>

<script>
export default {
  props: ['deck'],

  data () {
    return {
      hasImage: false

    };
  },

  methods: {
    setHasImage(){
        if(this.deck.coverImg != null && this.deck.coverImg.length != 0){
          this.hasImage = true;}
          else {
            this.hasImage = false;
          }
        }
  },
  created(){
      this.setHasImage();
    }
}
</script>

<style>
.deck {
  background-color: rgb(241, 237, 237);
  color: black;
  text-align: top;
  text-transform: none;
  text-decoration: none;
  margin: 10px;
  padding: 15px;
  border-radius: 20px;
  width: 200px;
  height: 200px;
  border: .2px solid black;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  transition: transform .2s, box-shadow .2s;
}
.deck:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}
.deck img {
  max-width: 100px;
  max-height: 100px;
  border-radius: 10px;
}

.title {

}

.description {

}
</style>