const path = require('path');

module.exports = {
    entry: {
        page1: './src/page1',
        page2: './src/page2'
    },
    output: {
        path: path.resolve(__dirname, "dist"),
        filename: "[name].bundle.js"
    }
}