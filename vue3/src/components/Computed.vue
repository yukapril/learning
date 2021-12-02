<template>
  <h1>Computed</h1>
  <p>
    <span>{{ state.price }} x {{ state.input }} = {{ state.sum }}</span>
    <button @click="onAddCountClick">+1</button>
  </p>
  <p>
    <span>{{ state2.price }} x {{ state2.input }} = {{ state2.sum }}</span>
    <button @click="onAddCount2Click">+1</button>
  </p>
  <p>total:{{ total }}</p>
</template>

<script>
import { reactive, computed } from 'vue'

export default {
  name: 'Computed',
  setup () {
    const state = reactive({
      price: 9,
      input: 1,
      sum: computed(() => state.input * state.price)
    })
    const state2 = reactive({
      price: 8,
      input: 1,
      sum: computed(() => state2.input * state2.price)
    })

    const total = computed(() => state.sum + state2.sum)

    const onAddCountClick = () => state.input++
    const onAddCount2Click = () => state2.input++

    return { state, state2, total, onAddCountClick, onAddCount2Click }
  }
}
</script>
