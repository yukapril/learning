var app = getApp()
Page({
    data: {
        motto: 'WeApp demo',
        userInfo: {},
        refresh: ''
    },
    onLoad: function () {
        var that = this
        app.getUserInfo((userInfo) => {
            //更新数据
            that.setData({
                userInfo: userInfo
            })
        })
    },
    onPullDownRefresh: function () {
        var that = this
        that.setData({ refresh: '下拉刷新中...' })
        setTimeout(() => {
            that.setData({ refresh: '下拉刷新结束' })
            wx.stopPullDownRefresh()
        }, 3000)

    }
})