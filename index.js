/**
 * Dependencies
 */
var CoffeeScript= require("coffee-script");

// Register CoffeeScript if exits
if(CoffeeScript.register) CoffeeScript.register();

var forceRequire = require('./lib/forceRequire');

/**
 * Exports
 */
module.exports = forceRequire.start;
