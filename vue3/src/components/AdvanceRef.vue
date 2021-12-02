<template>
  <h1>AdvanceRef</h1>
  <p>{{ count }}</p>
  <p>{{ refRenderVal }}</p>
  <button @click="onAddCountClick">+1</button>
  <button @click="onRefLogClick">ref log</button>
  <button @click="onArrLogClick">array ref log</button>
  <button @click="onRefWatchClick">ref watch</button>
</template>

<script>
import { ref, reactive, computed, watch, watchEffect } from 'vue'

export default {
  name: 'AdvanceRef',
  setup () {
    const count = ref(0)
    const refRenderVal = ref({ a: 1, b: 2 })

    const onAddCountClick = () => count.value++

    const onRefLogClick = () => {
      const count1 = reactive({ count })
      const count2 = reactive([count])
      const count3 = computed(() => count)
      console.log('[advanceRef] 0:', count.value)
      console.log('[advanceRef] 1:', count1.count) // 对象形式reactive，不用写也不能写 count1.count.value，因为会自动拆包
      console.log('[advanceRef] 2:', count2[0].value) // 非对象形式的reactive，必须手动拆包
      console.log('[advanceRef] 3:', count3.value.value) // computed 需要手动拆包，第一层是computed，第二层是ref
    }

    const onArrLogClick = () => {
      const arr = ref([1, 2, 3])
      const arr1 = reactive({ arr })
      const arr2 = computed(() => arr)
      console.log('[advanceRef] arr0:', arr.value[0]) // 需要手动拆包
      console.log('[advanceRef] arr1:', arr1.arr[0]) // 不能拆包
      console.log('[advanceRef] arr2:', arr2.value.value[0]) // 需要手动拆包，第一层是computed，第二层是ref
    }

    const onRefWatchClick = () => {
      refRenderVal.value.a = 3
      refRenderVal.value.c = 3
    }

    watchEffect(() => {
      // 改变 ref，需要注意写.value
      console.log('[advanceRef] watchEffect', refRenderVal.value.a)
    })

    watch(
        () => refRenderVal.value.a,
        (newVal, oldVal) => {
          // 改变 ref，并不会触发 watch
          console.log('[advanceRef] watch', newVal, oldVal)
        }
    )

    return { count, refRenderVal, onAddCountClick, onRefLogClick, onArrLogClick, onRefWatchClick }
  },
}
</script>
