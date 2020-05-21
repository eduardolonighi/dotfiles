// minimize window with id passed to node : node maximize.js id

const fs = require('fs')

const spawnChild = require('./spawnChild.js')

var myArgs = process.argv.slice(2)
// console.log('myArgs: ', myArgs)

const id = myArgs[0]

// console.log(id)

const maximize = async () => {
  spawnChild('i3-msg', [`[id=${id}]`, 'focus'])

  const rawdata = fs.readFileSync('minimized.json', 'utf8')
  const parsedData = rawdata ? JSON.parse(rawdata) : []

  const minimized = [...parsedData]

  let leftovers = minimized.filter((item) => item.id === id)

  // console.log(leftovers)

  fs.writeFileSync('minimized.json', JSON.stringify(leftovers))
}

maximize()
