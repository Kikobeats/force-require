'use strict'

forceRequire = require '../lib'
should       = require 'should'
fs           = require 'fs-extra'
path         = require 'path'
deleteAssets = ->
  fs.removeSync path.resolve 'node_modules', 'jshint'
  fs.removeSync path.resolve 'node_modules', 'force-require-test'

describe 'ForceRequire ::', ->

  after deleteAssets
  before deleteAssets

  it "require a dependency that exist locally", ->
    dep = forceRequire 'mocha'
    (typeof dep).should.be.equal 'function'

  it 'require a dependency that exist globally', ->
    dep = forceRequire 'jshint'
    (typeof dep.JSHINT).should.be.equal 'function'

  it "require a dependency that doesn't exist locally or globally", ->
    dep = forceRequire 'force-require-test'
    (typeof dep.hello).should.be.equal 'function'
