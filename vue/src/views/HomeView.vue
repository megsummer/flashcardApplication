<template>
  <div class="home-container">
    <NavTool class="home-nav-tool"/>
    <div class = "home-view">
      <h1 class="page-title">Home</h1>
      <p class="logged-in-title">Welcome, you are logged in!</p>
    </div>
    <Logo class="home-logo"/>
    <div class="about-us">
      <p class="kinsey-notes">notes about kinsey</p> 
      
    
      <p class="victor-notes">notes about victor</p>
      
      <p class="nimo-notes">notes about nimo</p> 

      <p class="megan-notes">notes about megan</p> 
  
  
    </div>
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



<style scoped>

.home-container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-areas: 
    "nav home logo"
    "nav aboutUs aboutUs"
    ". aboutUs aboutUs"
    ;
  gap: 15px;
}


.home-nav-tool {
  grid-area: nav;
  margin-right: 20px;
}

.home-logo {
  grid-area: logo;
  justify-content: center;
}

.home-view {
  grid-area: home;
  justify-content: center;
  text-align: center;
}

.about-us{
  grid-area: aboutUs;
  display:grid;
  flex-direction:column;
  justify-content: left;
  text-align: center;
  grid-template-columns: 1fr 1fr;
  grid-template-areas: 
    "kinsey victor"
    "nimo megan"
    ;
}

.kinsey-notes{
  grid-area: kinsey;
}

.victor-notes{
  grid-area: victor;
}

.nimo-notes{
  grid-area: nimo;
}

.megan-notes{
  grid-area: megan;
}


</style>

