'use strict'

path          = require 'path'
terminal      = require 'oh-my-terminal'
globalNpmPath = require 'global-modules'

requireLocally = (dependency) ->
  require dependency

requireGlobally = (dependency) ->
  require "#{globalNpmPath}/#{dependency}"

install = (dependency) ->
  originalPath = process.cwd()
  process.chdir globalNpmPath
  terminal.exec "npm install #{dependency}"
  process.chdir originalPath

module.exports = (dependency, opts) ->
  try
    requireLocally dependency
  catch e
    try
      requireGlobally dependency
    catch e
      install dependency
      requireGlobally dependency
