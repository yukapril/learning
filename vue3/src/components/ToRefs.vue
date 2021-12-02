<template>
  <h1>ToRefs</h1>
  <p>v1:{{ v1 }}</p>
  <p>v2:{{ v2 }}</p>
</template>

<script>
import { reactive, toRef, toRefs } from 'vue'

export default {
  name: 'Ref',
  setup () {
    const state1 = reactive({ v1: 1 })
    const state2 = reactive({ v2: 2 })

    setTimeout(() => {
      state1.v1++
      state2.v2++
    }, 3000)

    return {
      ...toRefs(state1),
      v2: toRef(state2, 'v2')
    }
  }
}
</script>
