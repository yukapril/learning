module.exports = function (config) {
    config.set({
        basePath: '',//根目录，会影响下面的files,exclude等
        frameworks: ['jasmine'],//用什么框架测试，karma支持多种测试框架
        files: ["src/js/*.js", "tests/*.js"],//引用文件，要引入源文件和测试文件
        exclude: [],//排除哪些文件
        reporters: ['progress', 'coverage'],//报告内容
        preprocessors: {//预处理
            'src/js/*.js': 'coverage' //测试覆盖率要分析的源文件位置
        },
        coverageReporter: { //覆盖率配置
            type: 'html',   //保存类型
            dir: 'coverage/' //存在哪里
        },
        port: 9876,
        colors: true,
        logLevel: config.LOG_INFO,
        autoWatch: true, //自动监听文件变化，自动执行测试
        browsers: [],//自动启动浏览器
        singleRun: false
    });
};