## -- Dependencies -------------------------------------------------------------

forceRequire = require '../lib/forceRequire'
depHelper    = require '../lib/dependencyHelper'
should       = require 'should'

DEPENDENCY =
  NAME_ONE: 'force-require-test'
  NAME_TWO: 'async'
  NAME_THREE: 'force-require-test-without'
  VERSION : '2.0.0'
  REPOSITORY: 'caolan/async'


## -- Tests -------------------------------------------------------------

describe 'ForceRequire ::', ->

  before (done) ->
    depHelper.removeDependency DEPENDENCY.NAME_ONE
    depHelper.removeDependency DEPENDENCY.NAME_TWO
    depHelper.removeDependency DEPENDENCY.NAME_THREE
    done()

  it 'require a dependency that doesnt exist', (done) ->
    test = forceRequire.start DEPENDENCY.NAME_ONE
    status = depHelper.isVersion(DEPENDENCY.NAME_ONE, '2.0.0')
    status.should.eql true
    test.should.have.property 'hello'
    done()

  it 'require a dependency that exist', (done) ->
    test = forceRequire.start DEPENDENCY.NAME_ONE
    status = depHelper.isVersion(DEPENDENCY.NAME_ONE, '2.0.0')
    status.should.eql true
    test.should.have.property 'hello'
    done()

  # At this moment this feature is not support because when you require a module
  # is in dynamic memory. Need to empty and load the new version of the module...
  # memory...
  xit 'require a dependency that exist but the version is not the same', (done) ->
    test = forceRequire.start name: DEPENDENCY.NAME, version: '1.0.0'
    status = depHelper.isVersion(DEPENDENCY.NAME, '1.0.0')
    status.should.eql true
    test.should.have.property 'hello'
    done()

  it 'require a dependency fetching from github repository that doesnt exist', (done) ->
    test = forceRequire.start(name: DEPENDENCY.NAME_TWO, repository: DEPENDENCY.REPOSITORY)
    test.should.have.property 'each'
    done()

  it 'require a dependency fetching from github repository that exists', (done) ->
    test = forceRequire.start(name: DEPENDENCY.NAME_TWO, repository: DEPENDENCY.REPOSITORY)
    test.should.have.property 'each'
    done()

  it 'require a dependency that doesnt have endpoint and doesnt exist', (done) ->
    test = forceRequire.start(name: DEPENDENCY.NAME_THREE)
    status = depHelper.isVersion(DEPENDENCY.NAME_THREE, '1.0.0')
    test.should.eql false
    status.should.eql true
    done()

  it 'require a dependency that doesnt have endpoint and exists', (done) ->
    test = forceRequire.start(name: DEPENDENCY.NAME_THREE)
    status = depHelper.isVersion(DEPENDENCY.NAME_THREE, '1.0.0')
    test.should.eql false
    status.should.eql true
    done()
