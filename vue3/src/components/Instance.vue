<template>
  <h1>Instance</h1>
  <p>version:{{ version }}</p>
</template>

<script>
import { version, getCurrentInstance } from 'vue'

export default {
  name: 'Instance',
  setup () {
    const ctx = getCurrentInstance()
    console.log('[instance] this:', ctx)

    return {
      version
    }
  },
}
</script>
