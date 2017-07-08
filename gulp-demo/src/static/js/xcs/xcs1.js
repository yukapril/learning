((win) => {
  const Utils = window.Utils
  const Vue = window.Vue

  new Vue({
    el: '#app',
    data() {
      return {
        title: 'DEMO',
        memo: 'hello world!',
        calculate: Utils.add(5, 3),
        name: 'test'
      }
    }
  })


})(window)