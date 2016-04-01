noflo = require 'noflo'

# is really a NameValidator
exports.getComponent = ->
  new noflo.Component
    inPorts:
      name:
        datatype: 'string'
        required: true
    outPorts:
      letters:
        datatype: 'string'
      amount: # could use another component to also count
        datatype: 'int'
      error:
        datatype: 'object'
    process: (input, output) ->
      return unless input.has 'name'
      name = input.getData 'name'
      return unless input.ip.type is 'data'

      errors = []

      # can use classes that extend Error
      unless typeof name is 'string'
        errors.push noflo.helpers.CustomError 'Name is not a string',
          kind: 'type_erorr'
          data: name

      # or normal Errors
      unless /[a-zA-Z]/.test name
        errors.push new Error '`#{name}` contains more than just letters'

      return output.sendDone errors if errors.length > 0

      console.log ' did not have errors '

      output.send
        letters: new noflo.IP 'openBracket', name

      # split the letters, then go through each one and send them out
      letters = name.split ""
      for letter in letters
        output.send
          letters: letter

      output.send
        amount: letters.length

      output.send
        letters: new noflo.IP 'closeBracket', name

      output.done()
