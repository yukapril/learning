const path = require('path');

module.exports = {
    entry: {
        page1: './src/page1',
        page2: './src/page2'
    },
    output: {
        path: path.resolve(__dirname, "dist"),
        filename: "[name].bundle.js"
    },
    module: {
        rules: [{
            test: /\.js$/,
            exclude: path.resolve(__dirname, './src/components/'),
            use: [
                // strict规则加载器，第二个执行
                // 如果当前规则加载器不需要配置，可以直接使用字符串
                path.resolve(__dirname, './strict-loader'),
                // comment规则加载器，第一个执行
                // 如果当前规则加载器需要配置，则需要使用array形式，并将加载器写成对象传入
                {
                    loader: path.resolve(__dirname, './comment-loader'),
                    options: {
                        str: 'MAIN',
                        ver: 'v1.1'
                    }
                }
            ]
        }, {
            test: /\.js$/,
            include: path.resolve(__dirname, './src/components/'),
            use: [{
                loader: path.resolve(__dirname, './comment-loader'),
                options: {
                    str: 'COMPONENTS',
                    ver: 'v1.0'
                }
            }]
        }]
    }
}