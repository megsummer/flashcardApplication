<template>
  <div> 
      <NavTool />
  </div>
</template>

<script>
import NavTool from '../components/NavTool.vue';
import CardServices from '../services/CardServices.js';

export default {
  name: 'CardView',

  components: { 
    NavTool
   }
}
</script>

<style scoped>
.navbox {
display: flex;
flex-direction: row;
height: 150 px;
}
</style>