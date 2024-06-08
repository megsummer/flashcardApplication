<template>
    
 

     this button is supposed to toggle the update form from showing, but for some reason it is not.
     will fix up later.  
<button id="update" class = "update" v-on:click="toggleForm()">Update Card</button>

<form id="updateForm" class = "form" v-if="formShowing">
 <div>
 <label for="card-frontQuestion">Front Question:</label>
         <input type="text" id="card-frontQuestion" v-model="newCard.frontQuestion" />
       </div>
       <div class="card-form">
         <label for="card-backAnswer">Back Answer:</label>
         <input type="text" id="card-backAnswer" v-model="newCard.backAnswer"/>
       </div>
       <div class="card-form">
         <label for="card-img">Card Image:</label>
         <input type="text" id="card-img" v-model="newCard.cardImg" />
       </div>
       <div class="card-form">
         <label for="card-tags">Tags:</label>
         <input type="text" id="card-tags" v-model="newCard.tags" />
         <input type="submit" value="Save Card"/>
       </div>
</form>


    form should be showing: {{ formShowing }}

   
</template>
<script>
import CardServices from '../services/CardServices';

export default{
    components: {

    },
    props: ['card'],
    data(){
        return {
            formShowing: false,

        };
    },
    methods:{
        toggleForm(){
            if(this.formShowing){
                this.formShowing = false;
            }else {
                this.formShowing = true;
            }
        },


    },
}

</script>