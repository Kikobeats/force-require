# Force Require

![Last version](https://img.shields.io/github/tag/Kikobeats/parse-json.svg?style=flat-square)
[![Build Status](http://img.shields.io/travis/Kikobeats/force-require/master.svg?style=flat-square)](https://travis-ci.org/Kikobeats/force-require)
[![Dependency status](http://img.shields.io/david/Kikobeats/force-require.svg?style=flat-square)](https://david-dm.org/Kikobeats/force-require)
[![Dev Dependencies Status](http://img.shields.io/david/dev/Kikobeats/force-require.svg?style=flat-square)](https://david-dm.org/Kikobeats/force-require#info=devDependencies)
[![NPM Status](http://img.shields.io/npm/dm/force-require.svg?style=flat-square)](https://www.npmjs.org/package/force-require)
[![Donate](https://img.shields.io/badge/donate-paypal-blue.svg?style=flat-square)](https://paypal.me/kikobeats)

> Ensure that a NPM dependency is resolved.

## Install

```bash
npm install force-require --save
```

## Usage

First load the library:

```js
var forceRequire = require('force-require');
```
Now you can use like `require` command.

## API

### force-require(&lt;String&gt;, [cb])

Try to load a dependency based in the name. If `cb` is provided then the call will be resolved follow async interface.

Internally the library follow the next algorithm:

1) Try to require the dependency locally. This means that exists in the current `process.cwd()/node_modules` folder
as direct dependency or a dependency of another dependency.

2) If not possible to resolve locally, then try to resolve globally in your system. Try to require the dependency globally
using the module [global-modules](https://github.com/jonschlinkert/global-modules).

3) At this poin of the algorithm, the dependency was not found. Let's install as global module and later require it.

## License

MIT © [Kiko Beats](http://kikobeats.com)
