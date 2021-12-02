<template>
  <h1>Lifecycles</h1>
  <p>{{ state.value }}</p>
  <p ref="textRef"></p>
  <button @click="onTestClick">click</button>
</template>

<script>
import {
  reactive,
  ref,
  watchEffect,
  onBeforeMount,
  onMounted,
  onBeforeUpdate,
  onUpdated
} from 'vue'

export default {
  name: 'Lifecycles',
  setup () {
    console.log('[lifecycles] setup')

    const state = reactive({ value: 0, list: [] })
    const textRef = ref(null)

    const onTestClick = () => {
      state.value++
    }

    watchEffect(() => {
      console.log('[lifecycles] 模拟mounted -- L1') // 这里会执行2次，第一次相当于 beforeMount，第二次是mounted
      // 所以这里要判断，如果是 beforeMount，是没有 textRef.value 值的
      if (textRef.value) textRef.value.textContent = '12345'
    })

    watchEffect(() => {
      // 比如发送请求
      console.log('[lifecycles] 模拟mounted -- L2') // 如果 state.list 后续不会有任何修改，这里可以模拟mounted
      setTimeout(() => {
        state.list = [1, 2, 3, 4, 5]
      })
    })

    watchEffect(() => {
      // 模拟updated
      console.log('[lifecycles] 模拟 updated')
    })

    onBeforeMount(() => {
      console.log('[lifecycles] beforeMount')
    })

    onMounted(() => {
      console.log('[lifecycles] mounted')
    })

    onBeforeUpdate(() => {
      console.log('[lifecycles] beforeUpdate')
    })

    onUpdated(() => {
      console.log('[lifecycles] updated')
    })

    return {
      state,
      textRef,
      onTestClick,
    }
  },
}
</script>
