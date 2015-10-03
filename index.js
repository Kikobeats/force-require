'use strict';

var wrapSync      = require('wrap-sync');
var terminal      = require('oh-my-terminal');
var globalNpmPath = require('global-modules');

var requireLocally = function(dependency) {
  return require(dependency);
};

var requireGlobally = function(dependency) {
  return require(globalNpmPath + '/' + dependency);
};

var install = function(dependency) {
  var originalPath;
  originalPath = process.cwd();
  process.chdir(globalNpmPath);
  terminal.exec('npm install ' + dependency);
  return process.chdir(originalPath);
};

var requireSync = function(dependency) {
  try {
    return requireLocally(dependency);
  } catch (err) {
    try {
      return requireGlobally(dependency);
    } catch (err) {
      install(dependency);
      return requireGlobally(dependency);
    }
  }
};

var requireAsync = wrapSync(requireSync);

module.exports = function(dependency, cb) {
  if (!cb) return requireSync(dependency);
  return requireAsync(dependency, cb);
};
