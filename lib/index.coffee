helper = require './helper'

module.exports = (name) ->
  try
    helper.requireLocally name
  catch e
    try
      helper.requireGlobally name
    catch e
      helper.install name
      helper.requireLocally name
