const path = require('path');
const webpack = require('webpack');

module.exports = {
    entry: {
        page1: './src/page1',
        page2: './src/page2'
    },
    output: {
        path: path.resolve(__dirname, "dist"),
        filename: "[name].bundle.js"
    },
    plugins: [
        // 通用代码独立文件插件
        new webpack.optimize.CommonsChunkPlugin({
            name: 'common',
            filename: 'commons.js',
            chunks: ['page1', 'page2'],
            minChunks: 2
        })
    ]
}