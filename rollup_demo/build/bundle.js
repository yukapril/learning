
/**
 * This is a banner!
 * makes any better!
 */
(function (global, factory) {
    typeof exports === 'object' && typeof module !== 'undefined' ? factory() :
    typeof define === 'function' && define.amd ? define(factory) :
    (factory());
}(this, (function () { 'use strict';

var Dom = {
    query: function query(el) {
        return document.querySelector(el);
    },
    queryAll: function queryAll(el) {
        return document.querySelectorAll(el);
    }
};

var app = Dom.query('#app');
app.innerHTML = 'hello world!';

})));
