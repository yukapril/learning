import { createApp, reactive } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

const app = createApp(App)
app.use(router).use(store).mount('#app')
app.config.globalProperties.$toast = msg => console.log(msg)
app.config.globalProperties.$globalState = reactive({ foo: 1, bar: 2 })

app.config.errorHandler = (err, vm, info) => {
  console.log('[ERR]:', err, vm, info)
}
app.config.warnHandler = function (msg, vm, trace) {
  console.log('[WARN]:', msg, vm, trace)
}

