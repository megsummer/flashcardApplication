<template>
    
    <div id="card" class="card">
        <img src=""/>
        <p>{{ card.frontQuestion }}</p>

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

        };
    },
    methods:{

    },
}

</script>

<style>

a{
    text-decoration: none;
}


.card{
  background-color: #1616161e;
  color: black;
  text-align: top;
  text-transform: none;
  text-decoration: none;
  margin: 10px;
  padding: 35px;
  border-radius: 25px;
  width: 100px;
  height: 100px;
}


</style>
