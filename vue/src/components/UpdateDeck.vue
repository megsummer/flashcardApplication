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