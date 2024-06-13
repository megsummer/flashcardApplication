<template>
    
    <div id="card" class="card">
      
    <p>{{ card.backAnswer }}</p>
    </div>
   
</template>
<script>
import CardServices from '../services/CardServices';

export default{
    components: {

    },
    props: ['card'],
    data(){
        return {
          hasImage: false

        };
    },
    methods:{
 
      

}}

</script>

<style>

a{
    text-decoration: none;
}


.card{
  background-color: rgb(241, 237, 237);
  color: black;
  text-align: top;
  text-transform: none;
  text-decoration: none;
  margin: 10px;
  padding: 35px;
  border-radius: 20px;
  width: 125px;
  height: 125px;
  border: .2px solid black;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  transition: transform .2s, box-shadow .2s;
}
.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}
.card img {
  max-width: 100px;
  max-height: 100px;
  border-radius: 10px;
  border: .2px solid black;
}



</style>
