<template>
  <h1>Watch</h1>
  <p>{{ state.count }}</p>
  <button @click="onAddCountClick">+1</button>
</template>

<script>
import { reactive, watch } from 'vue'

export default {
  name: 'Watch',
  setup () {
    const state = reactive({ count: 0 })

    const onAddCountClick = () => state.count++

    // watch 要求指定观察的对象，和Vue2.x的$watch基本相同
    // Vue2.x 写法
    // vm.$watch('a.b.c', function (newVal, oldVal) {
    //   do something...
    // })
    watch(
        () => state.count,
        (newVal, oldVal) => {
          console.log('[watch]', newVal, oldVal)
        }
    )

    return { state, onAddCountClick }
  }
}
</script>
