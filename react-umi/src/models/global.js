const delay = timeout => new Promise(resolve => setTimeout(resolve, timeout))

export default {
  namespace: 'global',
  state: {
    count: 10,
  },
  reducers: {
    increment (state, action) {
      return {
        ...state,
        count: state.count + action.payload,
      }
    },
    decrement (state, action) {
      return {
        ...state,
        count: state.count - action.payload,
      }
    },
  },
  effects: {
    *incrementAsync (action, { put }) {
      yield delay(1000)
      yield put({ type: 'increment', payload: action.payload })
    },
    decrementAsync: [
      function* (action, { put }) {
        yield delay(1000)
        yield put({ type: 'decrement', payload: action.payload })
      },
      { type: 'takeLatest' }
    ]
  },
}