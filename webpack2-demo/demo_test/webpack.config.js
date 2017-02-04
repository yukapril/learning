const path = require('path');
const webpack = require('webpack');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');

module.exports = {
    entry: {
        page1: './src/page1',
        page2: './src/page2',
        page3: './src/page3'
    },
    output: {
        path: path.resolve(__dirname, "dist"),
        filename: "[name].bundle.js"
    },
    module: {
        // 所有的规则放在rules下面
        rules: [{
            test: /\.js$/,
            exclude: path.resolve(__dirname, './src/components/'),
            // 应用的规则加载器使用use/loaders/loader均可
            // 接受参数为array或者string，其中string仍然使用!进行分割
            // 执行顺序同webpack1，从右到左（string形式），从下到上（array形式）
            use: [
                // strict规则加载器，第二个执行
                // 如果当前规则加载器不需要配置，可以直接使用字符串
                path.resolve(__dirname, './strict-loader'),
                // comment规则加载器，第一个执行
                // 如果当前规则加载器需要配置，则需要使用array形式，并将加载器写成对象传入
                {
                    loader: path.resolve(__dirname, './comment-loader'),
                    options: {
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
                    str: 'component',
                    ver: 'v1.0'
                }
            }]
        }]
    },
    plugins: [
        // 插件的顺序为从上至下，依次执行
        // 故：需要先压缩混淆，再加入注释banner部分，否则banner会被移除

        // 代码压缩插件
        // 经测试，此插件不支持ES6代码压缩，比如箭头函数，压缩时候会报错
        new UglifyJSPlugin({
            // 逻辑压缩，支持boolean，object
            // 可以通过配置对象控制那些内容进行压缩
            // 比如，把false转成!1；把多行var写成一行等
            compress: true,

            // 是否进行变量改名混淆，支持boolean，object
            // 比如代码如下
            // --> var $ = window.jQuery;
            // --> $(document).on()
            // 开启混淆后，最终代码可能变成
            // --> var p=window.jQuery;p(document).on()
            // 原本的$变成了p！
            // 有的时候，我们需要引入导出变量，可以这样配置防止改名
            //mangle: true,
            mangle: {
                except: ['$']
            },

            // 代码美化（格式化为换行效果）
            beautify: true
        }),

        // 通用代码独立文件插件
        new webpack.optimize.CommonsChunkPlugin({
            // chunk 代码块名字，此字段必输
            // 如果此名字与entry等字段不重复，则创建新的代码块
            // 如果相同，则将此代码块改名变成commons.js，此时就不会生成相应的原来的文件
            // 如name为page1，则最终仅仅会生成commons.js，不会生成page1.js
            name: 'common',

            //最终打包文件名字
            filename: 'commons.js',

            // 仅处理那些chunk文件，默认处理所有entry入口文件
            // 这里仅仅处理page1/page2，这两个文件公共部分打包到commons.js里面
            chunks: ['page1', 'page2'],

            // 公共模块最少被依赖次数
            // 首先，webpack处理模块部分以及第三方依赖库（如果有的话）会写入commons.js
            // 检查每个chunk相同的依赖，如果该依赖被超过2个chunk调用，则写入commons.js，否则写入到相应js文件中
            // 针对本例子：
            // log模块被page1/page2依赖（依赖次数为2），此值大于等于minChunks，属于公共依赖，写入commons.js
            // 如果将minChunks修改为3，则会把log模块分别写入page1和page2
            minChunks: 2
        }),

        // banner插件，为文件加入banner
        new webpack.BannerPlugin({
            banner: `/**
 * webpack test
 * 
 * author: yukaPriL
 */`,
            // 如果raw是true，则直接将banner内容放置在文件头部，否则将banner内容转成注释后在放入文件头部
            raw: true
        })
    ]
}