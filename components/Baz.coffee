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
        triggering: false # triggering is false makes it not work...
        control: true
      randomize:
        datatype: 'all' # boolean
        required: false
        triggering: false
        control: true
      reverse:
        datatype: 'all' # boolean
        required: false
        triggering: false
        control: true
      type: # first, middle, last, or do some other optional
        datatype: 'string'
        required: false #true
        triggering: false
        control: true
    outPorts:
      request:
        datatype: 'int'
      error:
        datatype: 'object'
    process: (input, output) ->
      console.log ' IN BAZ'

      return unless input.has 'letters'
      console.log input.getData 'type'
      console.log input.getData 'randomize'
      [letters, randomize, reverse, type] = input.getData 'letters', 'randomize', 'reverse', 'type'
      console.log letters, randomize, reverse, type
