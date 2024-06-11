<template>

<div class="loading" v-if="sessionOver">Session is Over...
Your final score is {{ this.$store.state.scoreCard }} correct.</div>
    <div v-else>
<div  v-if="!isFlipped" id="front">
        
        <h1>{{ currentCard.frontQuestion }}</h1>
<div  v-if="hasImage" id="image">
        <img :src="currentCard.cardImg" alt="Card Image" /></div>

        <div v-else>No image</div>
        <button v-on:click="flip()">Flip!</button>
        </div>
    
 <div v-else id="back">
<h1>{{ currentCard.backAnswer }}</h1>
    

        <button v-on:click="right()">Right!</button>
        
        <button v-on:click="wrong()">Wrong!</button>
       
    </div>
</div>
   
</template>
<script>


export default{
    components: {

    },
    props: ['cards'],
    data(){
        return {
          hasImage: false,
          isFlipped: false,
          currentCard: {},
          cardIndex: 0,
          sessionOver: false,

        };
    },
    methods:{
 
        setHasImage(){
        if(this.currentCard.cardImg != null){
          this.hasImage = true;}
          else {
            this.hasImage = false;
          }
        },
        flip(){
            this.isFlipped = true;

        },
        right(){
            this.$store.commit('ADD_SCORE');
            this.cardIndex ++;
            if(this.cardIndex == this.cards.length - 1){
                this.$store.commit('END_SESSION');
                this.sessionOver = true;
                this.cardIndex = 0;
            }else{
            this.currentCard = this.cards[this.cardIndex];
            this.isFlipped = false;}
        },
        wrong(){
          this.cardIndex ++;
          this.currentCard = this.cards[this.cardIndex];
          this.isFlipped = false;
        }
      

    },
    created(){
        this.setHasImage();
      this.isFlipped = false;
      this.currentCard = this.cards[this.cardIndex];
      this.sessionOver = false;
    }
}

</script>

<style>




.card{
  background-color: rgb(241, 237, 237);
  color: black;
  text-align: top;
  text-transform: none;
  text-decoration: none;
  margin: 10px;
  padding: 35px;
  border-radius: 20px;
  width: 500px;
  height: 500px;
  border: .2px solid black;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  transition: transform .2s, box-shadow .2s;
}

.card img {
  max-width: 100%;
  max-height: 100%;
  border-radius: 10px;
}


</style>
