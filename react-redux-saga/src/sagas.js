import { put, all, takeEvery, takeLatest, delay } from "redux-saga/effects"

function* incrementAsync (action) {
  yield delay(1000)
  yield put({ type: "INCREMENT", payload: action.payload })
}
function* decrementAsync (action) {
  yield delay(1000)
  yield put({ type: "DECREMENT", payload: action.payload })
}

function* watchIncrementAsync () {
  yield takeEvery("INCREMENT_ASYNC", incrementAsync)
}
function* watchDecrementAsync () {
  yield takeLatest("DECREMENT_ASYNC", decrementAsync)
}

function* saga () {
  yield all([watchIncrementAsync(), watchDecrementAsync()])
}

export default saga
