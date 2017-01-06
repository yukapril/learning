Page({
    data: {
        title: 'Github weapp资源',
        status: '读取中...',
        dataList: []
    },
    onLoad: function () {
        var that = this
        wx.request({
            url: 'https://api.github.com/search/repositories?q=weapp&sort=stars',
            header: {
                'content-type': 'application/json'
            },
            success: (res) => {
                that.setData({ status: '读取成功' })
                that.setData({ dataList: res.data.items })
            },
            fail: () => {
                that.setData({ status: '读取失败' })
            }
        })
    },
    viewDetail: function (event) {
        var pid = event.target.dataset.pid
        wx.navigateTo({
            url: '../detail/detail?pid=' + pid
        });
    }
})