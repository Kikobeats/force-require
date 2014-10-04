## -- Dependencies -------------------------------------------------------------

depHelper = require './dependencyHelper'

## -- Class -------------------------------------------------------------

class ForceRequire

  @start: (options) ->

    if typeof options  is 'string'
      aux = options
      options = {}
      options.name = aux

    depHelper.removeDependency options.name if options.force

    try
      dependency = depHelper.requireDependency options.name
    catch e
      depHelper.installDependency(options)
      dependency = depHelper.requireDependency options.name

## -- Exports -------------------------------------------------------------

exports = module.exports = ForceRequire
