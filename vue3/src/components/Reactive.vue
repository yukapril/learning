<template>
  <h1>Reactive</h1>
  <p>count:{{ state.count }}</p>
  <button @click="onAddCountClick">+1</button>
  <button @click="onTimeoutAddCountClick">+1(timeout)</button>
</template>

<script>
import { reactive } from 'vue'

export default {
  name: 'Reactive',
  setup () {
    const state = reactive({ count: 0 })

    const onAddCountClick = () => state.count++

    const onTimeoutAddCountClick = () => {
      setTimeout(() => state.count++, 1000)
    }

    return {
      // ...state <-- 错误，不能展开，否则会失去响应
      // count: state.count <-- 错误，同样不可以返回数值型，也会失去响应
      // 必须直接返回 state
      state,
      onAddCountClick,
      onTimeoutAddCountClick
    }
  }
}
</script>
