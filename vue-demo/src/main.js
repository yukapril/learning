import Vue from 'vue';
import Vuex from 'vuex';
import App from './App.vue';

Vue.use(Vuex);

const store = new Vuex.Store({
  state: {
    total: 0
  },
  mutations: {
    increment: (state, obj) => state.total += obj.num,
    decrement: (state, obj) => state.total -= obj.num
  }
});

new Vue({
  el: '#app',
  store,
  render: h => h(App)
});
