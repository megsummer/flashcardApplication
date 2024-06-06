<template>
  <div id="deck" class="deck">
    <p id="title" class="title">{{ deck.deckTitle }}</p>
    <p id="description" class="description">{{ deck.deckDescription }}</p>
    <img :src="deck.imageUrl" alt="Deck Image" />
  </div>
</template>

<script>
export default {
  props: ['deck']
};
</script>

<style>
.deck {
  background-color: #1616161e;
  color: black;
  text-align: center;
  margin: 10px;
  padding: 35px;
  border-radius: 25px;
  width: 100px;
  height: 100px;
}

.title {

}

.description {

}
</style>