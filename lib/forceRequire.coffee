## -- Dependencies -------------------------------------------------------------

depHelper = require './dependencyHelper'

## -- Class -------------------------------------------------------------

class ForceRequire

  @start: (options) ->

    if typeof options  is 'string'
      aux = options
      options = {}
      options.name = aux

    process.chdir(options.scope) if options.scope

    try
      depHelper.requireDependency options.name

    catch e
      unless depHelper.existDependency(options.name)
        depHelper.installDependency(options)
        try
          depHelper.requireDependency options.name
        catch e
          false
      else
        false

## -- Exports -------------------------------------------------------------

exports = module.exports = ForceRequire
