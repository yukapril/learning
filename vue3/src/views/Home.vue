<template>
  <div class="home">
    <Reactive/>
    <Computed/>
    <Ref/>
    <Readonly/>
    <Event/>
    <Watch/>
    <WatchEffect/>
    <TemplateRef/>
    <ToRefs/>
    <Lifecycles/>
    <Instance/>
    <Inject/>
    <AdvanceRef/>
    <Is/>
  </div>
</template>

<script>
import { reactive, provide } from 'vue'
import Reactive from '../components/Reactive'
import Computed from '../components/Computed'
import Ref from '../components/Ref'
import Readonly from '../components/Readonly'
import Event from '../components/Event'
import Watch from '../components/Watch'
import WatchEffect from '../components/WatchEffect'
import TemplateRef from '../components/TemplateRef'
import ToRefs from '../components/ToRefs'
import Lifecycles from '../components/Lifecycles'
import Instance from '../components/Instance'
import Inject from '../components/Inject'
import AdvanceRef from '../components/AdvanceRef'
import Is from '../components/Is'

export default {
  name: 'Home',
  components: {
    Reactive,
    Computed,
    Ref,
    Readonly,
    Event,
    Watch,
    WatchEffect,
    TemplateRef,
    ToRefs,
    Lifecycles,
    Instance,
    Inject,
    AdvanceRef,
    Is
  },
  setup () {
    const injectState = reactive({ a: 1, b: 2 })
    provide('injectState', injectState)
  }
}
</script>
