Vue.component('show-name', {
  template: `
    <div class="show-name">
      <h2>Components Demo</h2>
      <p>Hi, {{text}}!</p>
      <solt>Welcome!</solt>
    </div>
  `,
  props: {
    name: {
      type: String,
      default: ''
    }
  },
  data() {
    return {}
  },
  computed: {
    text() {
      return this.name.toUpperCase()
    }
  }
})