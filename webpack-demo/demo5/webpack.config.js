var path = require('path');

module.exports = {
    entry: './src/main.js',
    output: {
        path: './build',
        filename: 'app.js'
    },
    resolve: {
        extentions: ['js']
    },
    module: {
        loaders: [{
            test: /\.js$/,
            loader: [path.resolve(__dirname, './strict-loader'), path.resolve(__dirname, './comment-loader')].join('!'),
            //自有loader需要使用绝对路径，否则代码中的require部分后的代码，将无法找到！
        }]
    },
    commentLoader: {
        str: 'v1.0'
    }
}