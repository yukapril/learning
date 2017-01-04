<template>
  <div id="app" >
    <div class="header">
      <img src="./assets/logo.png">
      <h1>{{ msg }}</h1>
    </div>
    <InputBox></InputBox>
  </div>
</template>

<script>
  import InputBox from './components/InputBox.vue';
  export default {
    name: 'app',
    data() {
      return {
        msg: 'Welcome to Your Vue.js App'
      }
    },
    components: {
      InputBox
    }
  }
</script>

<style>
    *{
      margin: 0;
      padding: 0;
    }
    html{
      font-size: 16px;
    }
    body,input {
        font: 300 1em/1.8 PingFang SC, Lantinghei SC, Microsoft Yahei, Hiragino Sans GB, Microsoft Sans Serif, WenQuanYi Micro Hei, sans;
    }
    #app{
      margin: 0 auto;
      width: 940px;
    }
    .header{
      text-align: center;
    }
    .block{
      margin: .5rem 0;
      padding: 1rem;
      border: 2px solid #ccc;
    }
</style>