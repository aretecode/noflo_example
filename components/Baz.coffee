noflo = require 'noflo'

exports.getComponent = ->
  new noflo.Component
    inPorts:
      letters:
        datatype: 'string'
        required: true
      randomize:
        datatype: 'boolean'
        required: false
        control: true
      reverse:
        datatype: 'boolean'
        required: false
        control: true
        triggering: false # because we don't care if this is passed in or not
    outPorts:
      out:
        datatype: 'string'
      error:
        datatype: 'object'
    process: (input, output) ->
      return unless input.has 'letters', 'randomize'
      # provide some defaults to the rest
      reverse = input.getData 'reverse'
      reverse ?= false

      # getting the data
      [letters, randomize] = input.getData 'letters', 'randomize'

      if randomize is 'true' or randomize is true
        letters = letters.split('').sort(-> return 0.5 - Math.random()).join('')
      if reverse is 'true' or reverse is true
        letters = letters.split('').reverse().join('')

      output.sendDone
        out: letters
