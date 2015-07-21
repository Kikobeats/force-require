'use strict'

path          = require 'path'
terminal      = require 'oh-my-terminal'
globalNpmPath = require 'global-modules'

module.exports =

  requireLocally: (dependency) ->
    require dependency

  requireGlobally: (dependency) ->
    require "#{globalNpmPath}/#{dependency}"

  install: (dependency) ->
    originalPath = process.cwd()
    process.chdir globalNpmPath
    terminal.exec "npm install #{dependency}"
    process.chdir originalPath
    this
