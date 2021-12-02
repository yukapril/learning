<template>
  <h1>TemplateRef</h1>
  <div ref="divRef"></div>
</template>

<script>
import { ref, onMounted } from 'vue'

export default {
  name: 'TemplateRef',
  setup () {
    const divRef = ref(null)

    onMounted(() => {
      console.log('[templateRef]', divRef.value) // 获取 dom 元素
      divRef.value.textContent = 'asdf'
    })

    return {
      divRef // 注意需要返回 ref 引用
    }
  }
}
</script>
