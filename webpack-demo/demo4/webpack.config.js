module.exports = {
    // 入口文件配置
    entry: './src/main.js',
    // 文件导出的配置
    output: {
        path: './build',
        filename: 'app.js'
    },
    module: {
        loaders: [{
            test: /\.js$/,
            loader: 'babel-loader'
        }]
    },
    babel: {
        presets: ['es2015']
    }
}