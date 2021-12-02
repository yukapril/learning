<template>
  <h1>Ref</h1>
  <p>{{ count }}</p>
  <button @click="onAddCountClick">+1</button>
</template>

<script>
import { ref } from 'vue'

export default {
  name: 'Ref',
  setup () {
    const count = ref(0)

    const onAddCountClick = () => count.value++

    return { count, onAddCountClick }
  }
}
</script>
