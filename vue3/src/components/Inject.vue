<template>
  <h1>Inject</h1>
  <div>globalState: {{ $globalState }}</div>
  <div>injectState: {{ injectState }}</div>
</template>

<script>
import { inject, getCurrentInstance } from 'vue'

export default {
  name: 'Inject',
  setup () {
    // 全局挂载的属性 state
    const { ctx } = getCurrentInstance()
    ctx.$globalState.asd = 111

    // 获取 inject 属性
    const injectState = inject('injectState')
    injectState.a = 9
    injectState.c = 3

    return {
      injectState
    }
  }
}
</script>
