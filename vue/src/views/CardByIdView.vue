<template>
  <div class="Cardbyid"> 
    <NavTool />
    <h1>CardByID</h1>
    <p>You are inside CardByID if you see this.</p>
    <p></p>
    <router-link class="nav-button" v-bind:to="{ name: 'cardById' }">Admin Decks</router-link>
  </div>
</template>

<script>

import NavTool from '@/components/NavTool.vue';

export default {
  name: 'CardbyId',
  components: {
    NavTool
  }
}
</script>