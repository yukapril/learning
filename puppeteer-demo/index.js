const puppeteer = require('puppeteer')
const iPhone6P = puppeteer.devices['iPhone 6 Plus']

const log = (...args) => {
    console.log('[PUPPETEER]', ...args)
  }

;(async () => {
  const browser = await puppeteer.launch({
    executablePath: 'Chromium/Chromium.app/Contents/MacOS/Chromium',
    headless: false,
    devtools: true,
  })

  const version = await browser.version()
  log('Chromium Version:', version)

  const page = await browser.newPage()
  page.on('request', request => {
    const url = request.url()
    if (url.indexOf('data') === -1) {
      log('request url:', url)
    }
  })

  page.on('requestfailed', req => {
    log('request failed url:', req.url())
  })

  await page.emulate(iPhone6P)
  await page.goto('https://baidu.com')

  const pages = await browser.pages()
  // 默认会打开一个空页面，可以关闭
  await pages[0].close()
  await pages[1].bringToFront()

  await page.click('.btns-btn')

})()
