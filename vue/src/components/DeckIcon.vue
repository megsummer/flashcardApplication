<template>
    <div id="deck" class="deck">
<p id="title" class="title">{{ deck.deckTitle }}</p>
<p id="description" class="description">{{ deck.deckDescription }}</p>
<img src=""/>
</div>

</template>

<script>
import DeckService from '../services/DeckServices';


export default {
  components: {
    

  },
  props: ['deck'],
  data() {
    return {
      

    };
  },
  methods: {

  },
 
  }


</script>
<style>
a{
    text-decoration: none;
}


.deck{
  background-color: #1616161e;
  color: black;
  text-align: center;
  text-transform: none;
  text-decoration: none;
  margin: 10px;
  padding: 35px;
  border-radius: 25px;
  width: 100px;
  height: 100px;
}
.title{


}
.description{

}
</style>