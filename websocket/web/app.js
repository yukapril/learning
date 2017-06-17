const koa = require('koa');
const serve = require('koa-static');
const app = new koa();

app.use(serve(__dirname + '/static'));

app.listen(3000);

console.log('web on port 3000');