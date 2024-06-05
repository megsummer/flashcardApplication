<template>
  <div> 
      <NavTool />

      hello
  </div>
</template>

<script>
import NavTool from '@/components/NavTool.vue';
import CardServices from '@/services/CardServices.js';

export default {
  name: 'CardView',

  components: { 
    NavTool
   }
}
</script>