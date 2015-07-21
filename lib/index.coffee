'use strict'

helper = require './helper'

module.exports = (dependency, opts) ->
  try
    helper.requireLocally dependency
  catch e
    try
      helper.requireGlobally dependency
    catch e
      helper.installGlobally(dependency).requireGlobally(dependency)
