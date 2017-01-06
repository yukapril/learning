module.exports = function (source) {
    console.log('====进入strict模块====');
    console.log( source);
    console.log('======================');
    return '\'use strict\'\n' + source;
};