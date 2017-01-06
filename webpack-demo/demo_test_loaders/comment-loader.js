const path = require('path');

module.exports = function (source) {
    console.log('====进入comment模块====');
    console.log(source);
    console.log('======================');

    //console.log(this.version);
    //console.log(this.context);//当前操作的文件的绝对路径（不含文件名）

    //console.log(this.loaders);//当前操作的文件，需要被那些loaders处理。返回array。形式如下：
    /**
    [{
        request: 'E:\\github\\learning\\webpack-demo\\demo_test_loaders\\strict-loader.js',
        path: 'E:\\github\\learning\\webpack-demo\\demo_test_loaders\\strict-loader.js',
        query: '',
        module: [Function]
    }, {
        request: 'E:\\github\\learning\\webpack-demo\\demo_test_loaders\\comment-loader.js',
        path: 'E:\\github\\learning\\webpack-demo\\demo_test_loaders\\comment-loader.js',
        query: '',
        module: [Function]
    }]
     */

    //console.log(this.loaderIndex);

    //console.log(this.resource);//当前操作的文件的绝对路径（含文件名）

    //console.log(this.resourcePath);//和resource相同

    //console.log(this.resourceQuery);

    //console.log(this.resolve);

    //console.log(this.dependency);

    //console.log(this.options);//完整的webpack.config.js配置文件，含有默认字段

    //console.log(this.value);

    //console.log(this.resourcePath);

    //console.log(this.target);

    //console.log(this.request);//整个插件部分处理路径。如：strict-loader.js!demo_test_loaders/comment-loader.js?a=1&b=2!./demo_test_loaders/src/main.js

    var param = this.options['commentLoader'] || {};
    var str = param.str || ''
    var file = path.parse(this.resourcePath);
    var ret = '\n//--------' + file.base + ' ' + str + '--------\n' + source + '\n//------------------------';

    //return ret;//同步模式，单参数返回（只能返回处理后的代码）

    //this.callback(null, ret, null); //同步模式，多参数返回，第一个参数不详，第二个为处理后的代码，第三个参数为map

    var cb = this.async();//异步模式，调用async函数

    setTimeout(() => {
        cb(null, ret, null);
    }, 2000);

};


