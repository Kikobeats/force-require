'use strict'

forceRequire = require '..'
path         = require 'path'
should       = require 'should'
fs           = require 'fs-extra'
globalNpmPath = require 'global-modules'

deleteAssets = (cb) ->
  fs.removeSync path.resolve 'node_modules', 'jshint'
  fs.removeSync path.resolve globalNpmPath, 'force-require-test'
  cb?()

describe 'force-require ::', ->

  after deleteAssets
  before deleteAssets

  describe 'unit', ->

    it "require a dependency that exist locally", ->
      dep = forceRequire 'mocha'
      (typeof dep).should.be.equal 'function'

    it 'require a dependency that exist globally', ->
      dep = forceRequire 'jshint'
      (typeof dep.JSHINT).should.be.equal 'function'

    it "require a dependency that doesn't exist locally or globally", ->
      dep = forceRequire 'force-require-test'
      (typeof dep.hello).should.be.equal 'function'

    it 'async interface', (done) ->
      deleteAssets -> forceRequire 'mocha', done
