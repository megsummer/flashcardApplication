<template>
  <div class="deckbyid"> 
    <NavTool />
    <h1>DeckByID</h1>
    <p>You are inside DeckbyID if you see this.</p>
    <p></p>
    <router-link class="nav-button" v-bind:to="{ name: 'studySession' }">Study Session</router-link>
    <router-link class="nav-button" v-bind:to="{ name: 'createCard' }">Create Cards</router-link>
  </div>
</template>

<script>

import NavTool from '@/components/NavTool.vue';


export default {
  name: 'DeckById',
  components: {
    NavTool
  }
}
</script>

