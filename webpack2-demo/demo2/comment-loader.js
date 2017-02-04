const path = require('path');
module.exports = function (source) {
    var str = this.query.str || '';
    var ver = this.query.ver || '';
    var file = path.parse(this.resourcePath);
    var ret = '//--------' + file.base + ' ' + str + ' ' + ver + '--------\n' + source + '\n//------------------------';
    this.callback(null, ret, null);
};
