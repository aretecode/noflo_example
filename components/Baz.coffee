noflo = require 'noflo'

exports.getComponent = ->
  new noflo.Component
    inPorts:
      letters:
        datatype: 'string'
        required: true
      randomize:
        datatype: 'all' # boolean
        required: false
        control: true
      reverse:
        datatype: 'all' # boolean
        required: false
        control: true
    outPorts:
      request:
        datatype: 'int'
      error:
        datatype: 'object'
    process: (input, output) ->
      return unless input.has 'letters', 'randomize'
      # provide some defaults to the rest
      reverse = input.getData 'reverse'
      reverse ?= false

      # getting the data
      [letters, randomize] = input.getData 'letters', 'randomize'
      console.log letters, randomize, reverse
