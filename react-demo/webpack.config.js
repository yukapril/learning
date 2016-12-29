var webpack = require('webpack');
var ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
    entry: {//入口文件
        index: './src/js/index.jsx',
        demo_state:'./src/js/demo-state.jsx',
        demo_realdom:'./src/js/demo-realdom.jsx'
    },
    output: {
        path: './build/js/',
        filename: '[name].js'//打包到哪里
    },
    module: {
        loaders: [
            {
                test: /\.jsx$/,//正则匹配哪些文件
                loader: 'babel',//用那个预处理器
                query: {
                    presets: ['es2015', 'react']
                },
                exclude: /node_modules/ //排除那些文件
            },
            {
                test: /\.less$/,
                loader: ExtractTextPlugin.extract("style", "css!less")
            },
        ]
    },
    resolve: {
        // 自动寻找的文件扩展名
        extensions: ['', '.js', '.jsx', '.less']
    },
    plugins: [
        new webpack.NoErrorsPlugin(),
        new webpack.optimize.UglifyJsPlugin({
            compress: {
                warnings: true
            }
        }),
        new ExtractTextPlugin('../css/' + 'style.css')
    ],
    stats: {
        colors: true
    },
};
