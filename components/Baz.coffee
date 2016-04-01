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
        triggering: false # triggering is false makes it not show up in `process` input
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
      console.log ' went into Baz'
      console.log input

      return unless input.has 'randomize'
      console.log 'has randomize!'
