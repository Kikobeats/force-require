## -- Dependencies -------------------------------------------------------------
forceRequire = require '../lib/forceRequire'
should       = require 'should'
dependency   = 'async'
version      = '0.5.0'
repository   = 'caolan/async'

## -- Tests -------------------------------------------------------------
describe 'ForceRequire ::', ->

  beforeEach (done) ->
    forceRequire._removeDependency dependency
    done()

  it 'resolved locally', (done) ->
    forceRequire.start(name: 'mocha')
    done()

  it 'resolved installing from npm', (done) ->
    forceRequire.start(name: dependency)
    done()

  xit 'resolved installing from npm and specific version', (done) ->
    forceRequire.start(name: dependency, version: version)
    pkg = require "#{dependency}/package.json"
    pkg.version.should.eql version
    done()

  it 'resolved installing from repository', (done) ->
    forceRequire.start(name: dependency, repository: repository, force: 'true')
    done()
