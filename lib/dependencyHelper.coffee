## -- Dependencies --------------------------------------------------------

sh   = require 'execSync'
fs   = require 'fs-extra'
path = require 'path'

SCOPE =
  INSTALL    : 'npm install'
  PRODUCTION : '--production'
  NO_MESSAGE : '>/dev/null 2>&1'

## -- Exports -------------------------------------------------------------

module.exports =

  requireDependency: (name) ->
    require "#{name}"

  existDependency: (name) ->
    fs.existsSync(path.resolve 'node_modules', name)

  isVersion: (name, version) ->
    pkg = require(path.resolve('node_modules', name, 'package.json'))
    pkg.version is version

  removeDependency: (name) ->
    fs.removeSync(path.resolve 'node_modules', name)

  installDependency: (options) ->
    if options.repository
      dependency = "git://github.com/#{options.repository}"
    else
      dependency = options.name
      dependency += "@#{options.version}" if options.version

    if options.production
      sh.run("#{SCOPE.INSTALL} #{dependency} #{SCOPE.NO_MESSAGE} #{SCOPE.PRODUCTION}")
    else
      sh.run("#{SCOPE.INSTALL} #{dependency} #{SCOPE.NO_MESSAGE}")
