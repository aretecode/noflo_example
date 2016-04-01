noflo = require 'noflo'

noflo.loadFile 'graphs/Normal.fbp', process.cwd(), (err, network) ->
  network

noflo.loadFile 'graphs/Reversed.fbp', process.cwd(), (err, network) ->
  network

noflo.loadFile 'graphs/Random.fbp', process.cwd(), (err, network) ->
  network

noflo.loadFile 'graphs/RandomReverse.fbp', process.cwd(), (err, network) ->
  network

noflo.loadFile 'graphs/ReversedFail.fbp', process.cwd(), (err, network) ->
  network
