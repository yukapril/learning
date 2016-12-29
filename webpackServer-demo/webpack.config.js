var path = require('path');
var webpack = require('webpack');


module.exports = {
    //插件项
    plugins: [
        new webpack.optimize.CommonsChunkPlugin('common.js'),
        new webpack.NoErrorsPlugin(),
        new webpack.optimize.UglifyJsPlugin({
            compress: {warnings: true}
        })
    ],
    //页面入口文件配置
    entry: {
        index: './src/js/index.js',
        about: './src/js/about.js'
    },
    //入口文件输出配置
    output: {
        path: 'dist/js',
        filename: '[name].js'
    },
    module: {
        //加载器配置
        loaders: [
            {
                test: path.join(__dirname, './src/js'),
                loader: 'babel-loader',
                query: {
                    presets: ['es2015']
                }
            }
        ]
    },
    //其它解决方案配置
    resolve: {},
    stats: {
        colors: true
    }
};