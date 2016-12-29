# karma demo

## 必要的准备工作

* 确认安装好nodeJS，建议v4版本，目前发现v6版本会报错
* 全局安装karma需要的资源，测试发现非全局安装貌似也不行
    * npm install -g karma
    * npm install -g karma-cli
    * npm install -g karma-jasmine
    * npm install -g jasmine-core
    * npm install -g karma-coverage

以上：

`karma-cli` 据说是不安装就没办法全局使用`karma`命令

`karma-coverage`是测试覆盖率

我不喜欢装那么多东西，所以开启测试之后我都是自己启动浏览器访问，如果需要自动启动浏览器还需要一个插件
`npm install karma-chrome-launcher --save-dev`，这个貌似可以不用全局安装。

## 使用

### 1. 初始化
初始化一个名字叫`karma.config.js`的配置文件，会要求选择输入一些数据。
```
karma init karma.config.js
```
如果不愿意这么麻烦，也可以直接用现成的配置文件。详细说明见文件注释。

需要注意一点，如果源文件是`mock.js`，那么测试文件必须叫做`mockTest.js`。否则会找不到文件。

### 2. 运行
命令行里输入
```
karma start karma.config.js
```
这样启动karma。

因为没有安装浏览器插件，所以需要手动打开浏览器地址：
```
http://localhost:9876/
```
这里能看到测试进度，因为测试代码很少，所以很快就结束了。

右上角的debug，打开之启动调试工具（比如按`F12`），可以看到日志。

回到项目目录，能看到一个`coverage`目录，打开能看到对应的浏览器，以及访问`index.html`查看覆盖率。