'use strict';

var terminal      = require('oh-my-terminal');
var globalNpmPath = require('global-modules');

var requireLocally = function(dependency) {
  return require(dependency);
};

var requireGlobally = function(dependency) {
  return require(globalNpmPath + '/' + dependency);
};

var install = function(dependency, cb) {
  var originalPath;
  originalPath = process.cwd();
  process.chdir(globalNpmPath);
  terminal.exec('npm install ' + dependency, function() {
    process.chdir(originalPath);
    return cb.apply(arguments);
  });
};

var installSync = function(dependency) {
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
      installSync(dependency);
      return requireGlobally(dependency);
    }
  }
};

var requireAsync = function(dependency, cb) {
  var dep;

  try {
    dep = requireLocally(dependency);
    return cb(null, dep);
  } catch (err) {
    try {
      dep = requireGlobally(dependency);
      return cb(null, dep);
    } catch (err) {
      install(dependency, function(err) {
        return cb(err, requireGlobally(dependency));
      });
    }
  }
};

module.exports = function(dependency, cb) {
  if (!cb) return requireSync(dependency);
  return requireAsync(dependency, cb);
};
