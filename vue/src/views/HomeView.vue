<template>
  <div class="home">
    <h1>Home</h1>
    <p>You are authenticated if you see this.</p>

    <router-link v-bind:to="{name: 'getAllDecks'}">AllDecks</router-link>
  </div>
</template>

<script>
export default {
};
</script>
