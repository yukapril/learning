<template>
  <h1>Is</h1>
  <button @click="baseTest">base</button>
  <button @click="refTest">ref</button>
  <button @click="computedTest">computed</button>
  <button @click="reactiveTest">reactive</button>
  <button @click="readonlyTest">readonly</button>
</template>

<script>
import {
  ref,
  reactive,
  computed,
  readonly,
  isRef,
  isProxy,
  isReactive,
  isReadonly,
} from 'vue'

export default {
  name: 'Ref',
  setup () {
    const refType = ref(0)
    const computedType = computed(() => true)
    const reactiveType = reactive({ foo: 'bar' })
    const readonlyType = readonly({})

    const baseTest = () => {
      console.log('[is]:', 'ref isRef', isRef(refType)) // true
      console.log('[is]:', 'computed isRef', isRef(computedType)) // true
      console.log('[is]:', 'reactive isRef', isRef(reactiveType)) // false
      console.log('[is]:', 'readonly isRef', isRef(readonlyType)) // false
      console.log('[is]: ----')
      console.log('[is]:', 'ref isProxy', isProxy(refType)) // false
      console.log('[is]:', 'computed isProxy', isProxy(computedType)) // true(changed)
      console.log('[is]:', 'reactive isProxy', isProxy(reactiveType)) // true
      console.log('[is]:', 'readonly isProxy', isProxy(readonlyType)) // true
      console.log('[is]: ----')
      console.log('[is]:', 'ref isReactive', isReactive(refType)) // false
      console.log('[is]:', 'computed isReactive', isReactive(computedType)) // false
      console.log('[is]:', 'reactive isReactive', isReactive(reactiveType)) // true
      console.log('[is]:', 'readonly isReactive', isReactive(readonlyType)) // false
      console.log('[is]: ----')
      console.log('[is]:', 'ref isReadonly', isReadonly(refType)) // false
      console.log('[is]:', 'computed isReadonly', isReadonly(computedType)) // true(changed)
      console.log('[is]:', 'reactive isReadonly', isReadonly(reactiveType)) // false
      console.log('[is]:', 'readonly isReadonly', isReadonly(readonlyType)) // true
    }

    const refTest = () => {
      const refComputedType = ref(computedType)
      const refReactiveType = ref(reactiveType)
      const refReadonlyType = ref(readonlyType)

      console.log('[is]:', 'refComputedType isRef', isRef(refComputedType)) // true
      console.log('[is]:', 'refReactiveType isRef', isRef(refReactiveType)) // true
      console.log('[is]:', 'refReadonlyType isRef', isRef(refReadonlyType)) // true
      console.log('[is]: ----')
      console.log('[is]:', 'refComputedType isProxy', isProxy(refComputedType)) // true(changed)
      console.log('[is]:', 'refReactiveType isProxy', isProxy(refReactiveType)) // false
      console.log('[is]:', 'refReadonlyType isProxy', isProxy(refReadonlyType)) // false
      console.log('[is]: ----')
      console.log('[is]:', 'refComputedType isReactive', isReactive(refComputedType)) // false
      console.log('[is]:', 'refReactiveType isReactive', isReactive(refReactiveType)) // false
      console.log('[is]:', 'refReadonlyType isReactive', isReactive(refReadonlyType)) // false
      console.log('[is]: ----')
      console.log('[is]:', 'refComputedType isReadonly', isReadonly(refComputedType)) // true(changed)
      console.log('[is]:', 'refReactiveType isReadonly', isReadonly(refReactiveType)) // false
      console.log('[is]:', 'refReadonlyType isReadonly', isReadonly(refReadonlyType)) // false
    }

    const computedTest = () => {
      const computedRefType = computed(() => refType)
      const computedReactiveType = computed(() => reactiveType)
      const computedReadonlyType = computed(() => readonlyType)

      console.log('[is]:', 'computedRefType isRef', isRef(computedRefType)) // true
      console.log('[is]:', 'computedReactiveType isRef', isRef(computedReactiveType)) // true
      console.log('[is]:', 'computedReadonlyType isRef', isRef(computedReadonlyType)) // true
      console.log('[is]: ----')
      console.log('[is]:', 'computedRefType isProxy', isProxy(computedRefType)) // true(changed)
      console.log('[is]:', 'computedReactiveType isProxy', isProxy(computedReactiveType)) // true(changed)
      console.log('[is]:', 'computedReadonlyType isProxy', isProxy(computedReadonlyType)) // true(changed)
      console.log('[is]: ----')
      console.log('[is]:', 'computedRefType isReactive', isReactive(computedRefType)) // false
      console.log('[is]:', 'computedReactiveType isReactive', isReactive(computedReactiveType)) // false
      console.log('[is]:', 'computedReadonlyType isReactive', isReactive(computedReadonlyType)) // false
      console.log('[is]: ----')
      console.log('[is]:', 'computedRefType isReadonly', isReadonly(computedRefType)) // true(changed)
      console.log('[is]:', 'computedReactiveType isReadonly', isReadonly(computedReactiveType)) // true(changed)
      console.log('[is]:', 'computedReadonlyType isReadonly', isReadonly(computedReadonlyType)) // true(changed)
    }

    const reactiveTest = () => {
      const reactiveRefType = reactive({ foo: refType })
      const reactiveComputedType = reactive({ foo: computedType })
      const reactiveReadonlyType = reactive({ foo: readonlyType })

      console.log('[is]:', 'reactiveRefType isRef', isRef(reactiveRefType)) // false
      console.log('[is]:', 'reactiveComputedType isRef', isRef(reactiveComputedType)) // false
      console.log('[is]:', 'reactiveReadonlyType isRef', isRef(reactiveReadonlyType)) // false
      console.log('[is]: ----')
      console.log('[is]:', 'reactiveRefType isProxy', isProxy(reactiveRefType)) // true
      console.log('[is]:', 'reactiveComputedType isProxy', isProxy(reactiveComputedType)) // true
      console.log('[is]:', 'reactiveReadonlyType isProxy', isProxy(reactiveReadonlyType)) // true
      console.log('[is]: ----')
      console.log('[is]:', 'reactiveRefType isReactive', isReactive(reactiveRefType)) // true
      console.log('[is]:', 'reactiveComputedType isReactive', isReactive(reactiveComputedType)) // true
      console.log('[is]:', 'reactiveReadonlyType isReactive', isReactive(reactiveReadonlyType)) // true
      console.log('[is]: ----')
      console.log('[is]:', 'reactiveRefType isReadonly', isReadonly(reactiveRefType)) // false
      console.log('[is]:', 'reactiveComputedType isReadonly', isReadonly(reactiveComputedType)) // false
      console.log('[is]:', 'reactiveReadonlyType isReadonly', isReadonly(reactiveReadonlyType)) // false
    }

    const readonlyTest = () => {
      const readonlyRefType = readonly(refType)
      const readonlyComputedType = readonly(computedType)
      const readonlyReactiveType = readonly(reactiveType)

      console.log('[is]:', 'readonlyRefType isRef', isRef(readonlyRefType)) // true
      console.log('[is]:', 'readonlyComputedType isRef', isRef(readonlyComputedType)) // true
      console.log('[is]:', 'readonlyReactiveType isRef', isRef(readonlyReactiveType)) // false
      console.log('[is]: ----')
      console.log('[is]:', 'readonlyRefType isProxy', isProxy(readonlyRefType)) // true
      console.log('[is]:', 'readonlyComputedType isProxy', isProxy(readonlyComputedType)) // true
      console.log('[is]:', 'readonlyReactiveType isProxy', isProxy(readonlyReactiveType)) // true
      console.log('[is]: ----')
      console.log('[is]:', 'readonlyRefType isReactive', isReactive(readonlyRefType)) // false
      console.log('[is]:', 'readonlyComputedType isReactive', isReactive(readonlyComputedType)) // false
      console.log('[is]:', 'readonlyReactiveType isReactive', isReactive(readonlyReactiveType)) // true
      console.log('[is]: ----')
      console.log('[is]:', 'readonlyRefType isReadonly', isReadonly(readonlyRefType)) // true
      console.log('[is]:', 'readonlyComputedType isReadonly', isReadonly(readonlyComputedType)) // true
      console.log('[is]:', 'readonlyReactiveType isReadonly', isReadonly(readonlyReactiveType)) // true
    }

    return {
      baseTest,
      refTest,
      computedTest,
      reactiveTest,
      readonlyTest
    }
  },
}
</script>
