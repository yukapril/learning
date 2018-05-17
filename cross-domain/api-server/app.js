const Koa = require('koa')
const Router = require('koa-router')
const app = new Koa()
const router = new Router()

router.get('/getData', (ctx, next) => {
  ctx.set('Access-Control-Allow-Origin', 'http://127.0.0.1:3000')
  ctx.body = {code: 0, data: 'hello world!'}
  next()
})

router.options('/deleteData', (ctx, next) => {
  ctx.set('Access-Control-Allow-Origin', 'http://127.0.0.1:3000')
  ctx.set('Access-Control-Allow-Methods', 'GET, POST, HEAD, DELETE, OPTIONS')
  ctx.set('Access-Control-Allow-Headers', 'x-token,x-qwer')
  ctx.set('Access-Control-Request-Headers', 'x-qwer')
  // OPTIONS 方法不需要返回任何实体内容，而且应该与最终调用的方法返回的头信息保持一致
  next()
})

router.delete('/deleteData', (ctx, next) => {
  ctx.set('Access-Control-Allow-Origin', 'http://127.0.0.1:3000')
  ctx.set('Access-Control-Allow-Methods', 'GET, POST, HEAD, DELETE, OPTIONS')
  ctx.set('Access-Control-Allow-Headers', 'x-token')
  ctx.body = {code: 0, data: 'delete ok!'}
  next()
})

router.post('/login', (ctx, next) => {
  ctx.set('Access-Control-Allow-Origin', 'http://127.0.0.1:3000')
  ctx.set('Access-Control-Allow-Credentials', true)
  ctx.cookies.set('SESSION', '123456789')
  ctx.body = {code: 0, data: 'login ok!'}
  next()
})

router.post('/loginedData', (ctx, next) => {
  ctx.set('Access-Control-Allow-Origin', 'http://127.0.0.1:3000')
  ctx.set('Access-Control-Allow-Credentials', true)
  ctx.body = {code: 0, data: ctx.headers}
  next()
})

app.use(router.routes())
  .use(router.allowedMethods())

app.listen(3100)
console.log('api-server-1 run at http://127.0.0.1:3100')