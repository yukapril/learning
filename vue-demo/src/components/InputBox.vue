<template>
    <div class="block input-box">
        <input type="text" v-model="value">
        <p>{{value}}</p>
    </div>

</template>

<script>
    export default {
        name: 'InbutBox',
        data() {
            return {
                value: 'some text'
            }
        }
    }
</script>

<style>
  .input-box input{
    width: 20rem;
  }
  .input-box p {
    font-weight: 900;
  }
</style>