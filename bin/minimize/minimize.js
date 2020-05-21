// main.js
const spawnChild = require('./spawnChild.js')

const fs = require('fs')

const getWindowInfo = async () => {
  const windowInfo = {}

  windowInfo.id = await spawnChild('xdotool', ['getactivewindow'])

  windowInfo.title = await spawnChild('xdotool', [
    'getwindowname',
    windowInfo.id,
  ])

  // console.log(windowInfo)
  return windowInfo
}

const minimizeWindow = async () => {
  const rawdata = fs.readFileSync('minimized.json', 'utf8')
  const parsedData = rawdata ? JSON.parse(rawdata) : []

  let minimized = [...parsedData]

  const windowInfo = await getWindowInfo()

  minimized.push(windowInfo)
  minimized = JSON.stringify(minimized)

  fs.writeFileSync('minimized.json', minimized)

  await spawnChild('i3-msg', ['move scratchpad'])
}

minimizeWindow()
