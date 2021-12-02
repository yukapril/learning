<template>
  <h1>Event</h1>
  <p>看 console</p>
  <button @click="onEventTest1Click">click</button>
  <button @click="onEventTest2Click($event,123)">click with params</button>
</template>

<script>
export default {
  name: 'Event',
  setup () {
    const onEventTest1Click = (e) => {
      console.log('Event1', e)
    }
    const onEventTest2Click = (e, val) => {
      console.log('Event2', e, val)
    }

    return { onEventTest1Click, onEventTest2Click }
  },
}
</script>
