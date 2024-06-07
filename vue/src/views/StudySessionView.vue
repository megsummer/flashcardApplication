<template>
  <div class="study"> 
    <NavTool />
    <h1>Flash Study Time</h1>
    <p>You are inside Study Session if you see this.</p>
    <p></p>
  </div>
</template>

<script>

import NavTool from '@/components/NavTool.vue';

export default {
  name: 'StudySession',
  components: {
    NavTool
  }
}
</script>

