module.exports = {
    shouldUseLocalResponse: function (a, b, c) {
        console.log('shouldUseLocalResponse', a, b, c);
        return false
    },

    dealLocalResponse: function (a, b, c) {
        //console.log('dealLocalResponse', a, b, c);
    },

    replaceRequestProtocol: function (a, b, c) {
        //console.log('replaceRequestProtocol', a, b, c);
    },


    //在向服务器发出请求前，AnyProxy会调用这个接口，可以在此时修改发送请求的参数
    replaceRequestOption: function (a, b, c) {
        //console.log('replaceRequestOption', a, b, c);
    },

    replaceRequestData: function (a, b, c) {
        //console.log('replaceRequestData', a, b, c);
    },

    replaceResponseStatusCode: function (a, b, c) {
        //console.log('replaceResponseStatusCode', a, b, c);
    },


    replaceResponseHeader: function (a, b, c) {
        //console.log('replaceResponseHeader', a, b, c);
    },

    replaceServerResDataAsync: function (a, b, c) {
        //console.log('replaceServerResDataAsync', a, b, c);

    },

    pauseBeforeSendingResponse: function (a, b, c) {
        //console.log('pauseBeforeSendingResponse', a, b, c);

    }

};