module.exports = ->
  @initConfig
    # BDD tests on Node.js
    mochaTest:
      nodejs:
        src: ['spec/First.coffee']
        options:
          reporter: 'spec'
          timeout: 10000
          require: 'coffee-script/register'

  # Grunt plugins used for testing
  @loadNpmTasks 'grunt-mocha-test'
  @loadNpmTasks 'grunt-coffeelint'

  # Our local tasks
  @registerTask 'test', ['mochaTest']
  @registerTask 'default', ['test']
