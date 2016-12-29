console.log('当前dirname:', __dirname);

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
        alias: {
            'say': './modules/say/1.0/say',
            'take': './modules/take/1.2/take',
            'watch': './modules/watch/2.0/watch'
        }
    }
}