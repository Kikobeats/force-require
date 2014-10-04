## -- Dependencies --------------------------------------------------------

sh   = require 'execSync'
fs   = require 'fs-extra'
path = require 'path'

SCOPE =
  INSTALL    : 'npm install'
  NO_MESSAGE : '>/dev/null 2>&1'

## -- Exports -------------------------------------------------------------

module.exports =

  requireDependency: (name) ->
    require "#{name}"

  removeDependency: (name) ->
    fs.removeSync(path.resolve 'node_modules', name)

  installDependency: (options) ->
    if options.repository
      dependency = "git://github.com/#{options.repository}"
    else
      dependency = options.name
      dependency += "@#{options.version}" if options.version

    sh.run("#{SCOPE.INSTALL} #{dependency} #{SCOPE.NO_MESSAGE}")
