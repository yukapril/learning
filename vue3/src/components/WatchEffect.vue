<template>
  <h1>WatchEffect</h1>
  <p>{{ state.count }}</p>
  <button @click="onAddCountClick">+1</button>
</template>

<script>
import { reactive, watchEffect, watch } from 'vue'

export default {
  name: 'WatchEffect',
  setup () {
    const state = reactive({ count: 0 })

    const onAddCountClick = () => state.count++

    // watchEffect 相当于 React-hooks useEffect
    // 只不过 Vue 不需要手动指定依赖项
    watchEffect(() => {
      // 所关注的值，触发改变（re-render）的时候，都会进行回调
      // 如果不存在关注的值，则watchEffect不再执行！
      console.log('[watchEffect]', state.count)
    })

    // watchEffect 中必须关注 reactive/ref/computed等，否则后续不会再执行！
    watchEffect(() => {
      const rnd = Math.random() > 0.5
      console.log('[watchEffect] rnd', rnd)
      if (rnd) {
        console.log('[watchEffect] problem:', state.count)
      }
    })

    return { state, onAddCountClick }
  }
}
</script>
