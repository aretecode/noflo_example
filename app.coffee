noflo = require 'noflo'
noflo.loadFile 'graphs/Qux.fbp', process.cwd(), (err, network) ->
  console.log 'went into app'
  console.log err, network
  network
