import lineReader from 'line-reader'
// import fs from 'fs'

const configPath = '/home/eduardo/.config/i3/newConfig'

const mods = {
  Mod4: 'Super',
  Mod1: 'Alt',
}

const lines = []
const bindings = []

const printLines = () => {
  lines.forEach((line, index) => {
    // if line is a binding
    let binding = ''
    let description = ''

    if (line.includes('bindsym')) {
      // get binding
      const words = line.trim().split(' ')
      binding = words[1]
      // get description
      for (let i = index; i > 0; i--) {
        let checkLine = lines[i]
        checkLine = checkLine.trim()

        if (checkLine[0] === '#') {
          description = checkLine
          break
        }
      }
      if (!description.includes('[MODE]'))
        bindings.push({ binding, description })
    }
  })

  console.log(bindings)
}

lineReader.eachLine(configPath, (line, last) => {
  lines.push(line)

  if (last) {
    printLines()
  }
})
