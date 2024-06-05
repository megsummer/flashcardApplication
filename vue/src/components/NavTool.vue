<template>
    <div class="nav-tool">
      <router-link to="" class="nav-button my-decks">My Decks</router-link>
      <router-link to="" class="nav-button new-deck">Start a New Deck</router-link>
      <router-link to="" class="nav-button search-cards">Search For Cards</router-link>
      <router-link to="" class="nav-button admin-decks">Admin Decks</router-link>

      
      <router-link to="TempCard" class="nav-button cardview">card</router-link>
    </div>
  </template>
  
  <script>
export default {
  name: 'NavTool'
}
</script>