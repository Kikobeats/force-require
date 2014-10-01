## -- Dependencies -------------------------------------------------------------
sh   = require 'execSync'
path = require 'path'
fs   = require 'fs-extra'

SCOPE =
  INSTALL    : 'npm install'
  NO_MESSAGE : '>/dev/null 2>&1'

## -- Class -------------------------------------------------------------
class ForceRequire

  @_requireDependency: (name) ->
    require "#{name}"

  @_removeDependency: (name) ->
    fs.removeSync(path.resolve 'node_modules', name)

  @_installDependency: (options) ->
    if options.repository
      dependency = "git://github.com/#{options.repository}"
    else
      dependency = options.name
      dependency += "@#{options.version}" if options.version

    sh.run("#{SCOPE.INSTALL} #{dependency} #{SCOPE.NO_MESSAGE}")

  @start: (options) ->
    @_removeDependency options.name if options.force

    try
      dependency = @_requireDependency options.name
    catch e
      @_installDependency(options)
      dependency = @_requireDependency options.name

## -- Exports -------------------------------------------------------------
exports = module.exports = ForceRequire
