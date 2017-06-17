const server = require('http').createServer();
const io = require('socket.io')(server);

io.on('connection', (socket) => {
    console.log('a user connected');

    socket.on('disconnect', () => {
        console.log('a user go out');
    });

    socket.on('message', (req) => {
        let msg = '';
        switch (req) {
            case 'time':
            case '时间':
            case '日期':
                msg = '现在是：' + new Date();
                break;
            case 'random':
                msg = Math.random();
                break;
            case 'test':
            case '测试':
                msg = '测试成功';
                break;
            default:
                msg = 'unknown';
        }
        io.emit('message', msg);
    });
});

io.listen(3001);

console.log('ws on port 3001');