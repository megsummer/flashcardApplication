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