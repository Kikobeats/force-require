# Force Require

[![Build Status](http://img.shields.io/travis/Kikobeats/forcerequire/master.svg?style=flat)](https://travis-ci.org/Kikobeats/forcerequire)
[![Dependency status](http://img.shields.io/david/Kikobeats/forcerequire.svg?style=flat)](https://david-dm.org/Kikobeats/forcerequire)
[![Dev Dependencies Status](http://img.shields.io/david/dev/Kikobeats/forcerequire.svg?style=flat)](https://david-dm.org/Kikobeats/forcerequire#info=devDependencies)
[![NPM Status](http://img.shields.io/npm/dm/forcerequire.svg?style=flat)](https://www.npmjs.org/package/forcerequire)
[![Gittip](http://img.shields.io/gittip/Kikobeats.svg?style=flat)](https://www.gittip.com/Kikobeats/)

> Ensure that dependency is resolved

## Install

```bash
npm install force-require --save
```

## Usage

First load the library:

```coffee
forceRequire = require 'force-require'
```
Now you can use like `require` command.

## API

### forceRequire(\<Object>)

Object parameter can be:

* **name**: the name of the dependency to resolve.
* **version**: the version of the dependency to resolve.
* **repository**: You can resolve the dependency using Github repository instead of NPM package.
* **force**: Ensure that the version of the dependency is the correct. If is not present, is possible that resolve the dependency but maybe is not the same version.

## Examples

```coffee
lodash = forceRequire name:'async'
lodash = forceRequire name:'async', version: '0.5.0'
lodash = forceRequire name:'async', version: '0.5.0', force: 'true'
lodash = forceRequire repository: 'caolan/async', force: 'true', 
```

## License

MIT © [Kiko Beats](http://www.kikobeats.com)


