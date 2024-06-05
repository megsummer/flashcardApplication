<template>
    <div class="nav-tool">
      <router-link to="" class="nav-button my-decks">My Decks</router-link>
      <router-link to="" class="nav-button new-deck">Start a New Deck</router-link>
      <router-link to="" class="nav-button search-cards">Search For Cards</router-link>
      <router-link to="" class="nav-button admin-decks">Admin Decks</router-link>


    </div>
  </template>
  
  <script>
export default {
  name: 'NavTool'
}
</script>

<style scoped>
.nav-tool {
  display: flex;
  flex-direction: column;
  width: 200px;
}

.nav-button{
  background-color: #ffd966;
  color: black;
  text-align: center;
  margin: 10px;
  padding: 35px;
  border-radius: 25px;


}
.nav-button:hover{
  background-color: #ffc107;
  
}
</style>