path     = require 'path'
terminal = require 'oh-my-terminal'

module.exports =

  requireLocally: (name, cb) ->
    require "#{name}"

  requireGlobally: (name, cb) ->
    terminal.exec "npm link #{name}"
    @requireLocally name

  install: ->
    terminal.exec "npm install #{name}"
