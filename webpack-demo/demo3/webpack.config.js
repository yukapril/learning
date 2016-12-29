var path = require('path');

var rootPath = path.resolve('../demo2/src/modules');
console.log('当前rootPath:',rootPath);

module.exports = {
    // 入口文件配置
    entry: './src/main.js',
    // 文件导出的配置
    output: {
        path: './build',
        filename: 'app.js'
    },
    resolve: {
        // 当require的模块找不到时，添加这些后缀再次查找
        extentions: ['js'],
        root: rootPath,
        alias: {
            'say': 'say/1.0/say'
        }
    }
}