<template>
  <div class="home-container">
    <NavTool class="home-nav-tool"/>
    <div class = "home-view">
      <h1 class="page-title">Home</h1>
      <p class="logged-in-title">Welcome, you are logged in!</p>
    </div>
    <Logo class="home-logo"/>
    <div class="about-us">
      <p id="kinsey-notes" class="dev-card">
        <a href="https://www.linkedin.com/in/kinsey-christensen/">Kinsey Christensen</a><br/>
        <img src="@/assets/kinsey.jpg" alt="image of Kinsey" class="dev-photo"/><br/>
        Junior Software Developer <br/> Accessibility Enthusiast | Story Devourer <br/>
         Cozy Gamer | Cat Mom | Auntie
      <br/><br/>
        www.linkedin.com/in/kinsey-christensen/
      </p> 
      
    
      <p class="victor-notes">notes about victor</p>
      
      <p id="nimo-notes" class= "dev-card">
        <a href="https://www.linkedin.com/in/nimensiojohnson/">Nimo Johnson</a><br/>
        <img src="@/assets/Nimo.jpg" alt="image of Nimo" class="dev-photo"/><br/>
        Top/down lover of the technological world from gamer to coder,
        " Junior Software Developer"
      <br/><br/>
      https://www.linkedin.com/in/nimensiojohnson/
      </p> 
    

      <p id ="megan-notes" class= "dev-card">
        <a href="https://www.linkedin.com/in/megantrigg1/">Megan Trigg</a><br/>
        <img src="@/assets/Megan.jpg" alt="image of Megan" class="dev-photo"/><br/>
        Junior Software Developer <br/> Experienced in Supply Chain Management <br>
        Bookworm | Yogi
      <br/><br/>
        www.linkedin.com/in/megantrigg1/

      </p> 
  
  
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
  grid-template-columns: 250px 1fr 1fr;
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
  justify-self: right;
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
  text-align: center;
  grid-template-columns: 1fr 1fr;
  grid-template-areas: 
    "kinsey victor"
    "nimo megan"
    ;
}

#kinsey-notes{
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

.dev-photo {
  max-width: 200px;
  max-height: 200px;
  border-radius: 10px;
}
a{
  font-size:x-large;
}

.dev-card{
  background-color: rgb(241, 237, 237);
  color: black;
  text-align: top;
  text-transform: none;
  text-decoration: none;
  margin: 10px;
  padding: 35px;
  border-radius: 20px;
  width: 300px;
  height: 300px;
  border: .2px solid black;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  transition: transform .2s, box-shadow .2s;
}

</style>

