<template>
  <h1>Readonly</h1>
  <button @click="onClick">修改readonly</button>
  <p>看 console</p>
</template>

<script>
import { reactive, readonly } from 'vue'

export default {
  name: 'Readonly',
  setup () {
    const origin = reactive({ count: 0 })
    const copy = readonly(origin)

    const onClick = () => {
      origin.count++
      console.log('[readonly] origin:', origin.count)
      console.log('[readonly] copy:', copy.count)
      copy.count++ // 无法修改，会被warn警告，但不是报错
      console.log('[readonly] copy modify:', copy.count)
    }
    return { onClick }
  }
}
</script>
