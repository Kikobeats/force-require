'use strict'

{ requireLocally, requireGlobally, install } = require './helper'

module.exports = (dependency, opts) ->
  try
    requireLocally dependency
  catch e
    try
      requireGlobally dependency
    catch e
      install(dependency).requireGlobally(dependency)
