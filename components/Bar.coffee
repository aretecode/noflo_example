noflo = require 'noflo'

exports.getComponent = ->
  new noflo.Component
    inPorts:
      letters:
        datatype: 'all'
        required: true
      amount:
        datatype: 'int'
    outPorts:
      out:
        datatype: 'all'
      error:
        datatype: 'object'
    process: (input, output) ->
      return unless input.has 'letters', 'amount'
      [letters, amount] = input.getData 'letters', 'amount'

      output.send
        out: letters

      output.sendDone
        out: letters

  # if we wanted, we could put the letters back together manually and guess what name it was,
  # learning from what words and names other people had previously put in
  ###
  c.inPorts.letters.on 'ip', (ip) ->
    console.log 'went into name'
    console.log ip

    if ip.type is 'data'
      letters.push ip.data
    if ip.type is 'closeBracket'
      # then we should trigger process?
      console.log ' closing or triggering'
  ###
