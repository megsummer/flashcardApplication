<template>
  <div class="home"> 
    <NavTool />
    <h1>Home</h1>
    <p>You are authenticated if you see this.</p>
    <Logo/>
    <p></p>

  </div>
</template>

<script>
import Logo from '../components/Logo.vue';
import NavTool from '@/components/NavTool.vue';

export default {
  name: 'HomeView',
  components: {
    NavTool,
    Logo
}
}
</script>

