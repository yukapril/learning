var path = require('path');
var gulp = require('gulp');
var less = require('gulp-less')
var minifyCSS = require('gulp-csso')
var LessAutoprefix = require('less-plugin-autoprefix')
var htmlmin = require('gulp-htmlmin')
var babel = require('gulp-babel');
var uglify = require('gulp-uglify')
var pump = require('pump')
var rimraf = require('rimraf')

// 拷贝 lib 库
gulp.task('copy', function() {
  return gulp.src('./src/static/lib/**/*')
    .pipe(gulp.dest('./dist/static/lib'))
});

// 处理 js
gulp.task('dev-js', () => {
  return gulp.src(['!./src/static/lib/*', './src/static/**/**/*.js'])
    .pipe(babel({
      presets: ['es2015']
    }))
    .pipe(gulp.dest('./dist/static'));
});
gulp.task('prod-js', function(cb) {
  pump([
      gulp.src(['!./src/static/lib/*', './src/static/**/**/*.js']),
      babel({
        presets: ['es2015']
      }),
      uglify(),
      gulp.dest('./dist/static')
    ],
    cb
  );
});

// 处理 less 样式
gulp.task('dev-css', function() {
  return gulp.src(['!./src/static/css/config.less', '!./src/static/lib/*', './src/static/**/**/*.less'])
    .pipe(less({
      paths: [path.join(__dirname, './src/static/css')],
      // options: https://github.com/ai/browserslist
      plugins: [new LessAutoprefix({ browsers: ['Firefox > 1', 'Chrome > 1'] })]
    }))
    .pipe(gulp.dest('./dist/static'));
});
gulp.task('prod-css', function() {
  return gulp.src(['!./src/static/css/config.less', '!./src/static/lib/*', './src/static/**/**/*.less'])
    .pipe(less({
      paths: [path.join(__dirname, './src/static/css')],
      // options: https://github.com/ai/browserslist
      plugins: [new LessAutoprefix({ browsers: ['Firefox > 1', 'Chrome > 1'] })]
    }))
    .pipe(minifyCSS())
    .pipe(gulp.dest('./dist/static'));
});

// 处理 html 压缩
gulp.task('dev-html', function() {
  return gulp.src('./src/views/**/*.html')
    .pipe(gulp.dest('./dist/views'))
});
gulp.task('prod-html', function() {
  return gulp.src('./src/views/**/*.html')
    // options: https://github.com/kangax/html-minifier
    .pipe(htmlmin({
      collapseWhitespace: true
    }))
    .pipe(gulp.dest('./dist/views'))
});


// 清理 dist 目录
gulp.task('clean', function(cb) {
  rimraf('./dist', cb)
});


gulp.task('prod', ['copy', 'prod-html', 'prod-css', 'prod-js'])
gulp.task('dev', ['copy', 'dev-html', 'dev-css', 'dev-js'])

gulp.task('watch', function() {
  gulp.watch('./src/**/*', ['dev']);
});