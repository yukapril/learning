var _ = {};

_.add = function (a, b) {
    if (typeof a == 'number' || typeof b == 'number') {
         return a + b;
    } else {
       return 0;
    }
};

_.isArray = function(arr){
    return Object.prototype.toString.call(arr) === "[object Array]"; 
};
