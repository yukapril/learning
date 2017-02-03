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
            exclude: path.resolve(__dirname, './src/components/'),
            loader: [path.resolve(__dirname, './strict-loader'), path.resolve(__dirname, './comment-loader')].join('!')
            // 自有loader需要使用绝对路径，否则代码中的require部分后的代码，将无法找到插件！
            
            // 首先判断是否符合 test 正则
            // 之后判断是否存在include，存在则进行二次匹配，不存在则直接跳出loaders
            // 最后判断是否存在exclude，存在则进行排除跳出loaders，否则进行loader处理
        }, {
            test: /\.js$/,
            include: path.resolve(__dirname, './src/components/'),
            loader: [path.resolve(__dirname, './comment-loader')].join('!')
        }]
    },
    commentLoader: {
        str: 'v1.0'
    }
}
