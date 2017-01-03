var path = require('path');
var webpack = require('webpack');
var ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
    entry: [path.resolve(__dirname, './src/index.js')],
    output: {
        path: path.resolve(__dirname, './build/static/js'),
        filename: 'bundle.js'
    },
    module: {
        loaders: [{
            test: /\.js?$/,
            exclude: /(node_modules)/,
            loader: 'babel',
            query: {
                presets: ['es2015', 'react']
            },
        }, {
            test: /\.css$/,
            loader: ExtractTextPlugin.extract('style', 'css')
        }]
    },
    plugins: [
        new webpack.optimize.DedupePlugin(),
        new webpack.optimize.UglifyJsPlugin({
            compress: {
                screw_ie8: true,
                warnings: false
            },
            mangle: {
                screw_ie8: true
            },
            output: {
                comments: false,
                screw_ie8: true
            }
        }),
        new ExtractTextPlugin('[name].css'),
    ]
};