const { spawn } = require('child_process')

const removeLineBreak = (string) => string.replace(/(\r\n|\n|\r)/gm, ' ')

const spawnChild = async (command, options) => {
  const child = spawn(command, [...options])

  let data = ''
  for await (const chunk of child.stdout) {
    // console.log('stdout chunk: ' + chunk)
    data += chunk
  }
  let error = ''
  for await (const chunk of child.stderr) {
    // console.error('stderr chunk: ' + chunk)
    error += chunk
  }
  const exitCode = await new Promise((resolve, reject) => {
    child.on('close', resolve)
  })

  if (exitCode) {
    throw new Error(`subprocess error exit ${exitCode}, ${error}`)
  }
  return removeLineBreak(data)
}

module.exports = spawnChild
