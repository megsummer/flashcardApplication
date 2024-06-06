<template>
  <div class="home"> 
    <NavTool />
    <h1>Home</h1>
    <p>You are authenticated if you see this.</p>

    <router-link v-bind:to="{name: 'getAllDecks'}">AllDecks</router-link>
    <p></p>

    <router-link v-bind:to="{name: 'search-cards'}">Temp Link to Search Cards</router-link>"
  </div>
</template>

<script>

import NavTool from '@/components/NavTool.vue';

export default {
  name: 'HomeView',
  components: {
    NavTool
  }
}
</script>

