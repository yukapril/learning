const Koa = require('koa')
const serve = require('koa-static')
const app = new Koa()

app.use(serve(__dirname + '/app'))

app.listen(3000)
console.log('static-server run at http://127.0.0.1:3000')