keybase-completion
==================

[![Build Status](https://travis-ci.org/dtiersch/keybase-completion.svg?branch=master)](https://travis-ci.org/dtiersch/keybase-completion)

The [keybase command line tool](https://keybase.io/docs/command_line) lacks Tab completion by default (see [Issue #147](https://github.com/keybase/keybase-issues/issues/147) in the Keybase Bugtracker). This is an approach to satisfy the needs and lift the usabilty of keybase on the command line to a whole new level.

Installation
------------

#####Global

```sh
git clone git@github.com:dtiersch/keybase-completion.git
cd keybase-completion
sudo cp keybase.sh /etc/bash_completion.d/keybase
sudo chmod a+r /etc/bash_completion.d/keybase
```

#####User Space
```sh
git clone git@github.com:dtiersch/keybase-completion.git
```
Then add the following line to your `.bashrc`:
```sh
test -r /path/to/repository/keybase.sh && source $_
```

Version
-------

1.1.1

Integrity / GPG
---------------

You can check the integrity of Releases on 2 different ways. For one every git tag is GPG signed. Check that with
```
git tag -v version_1.1
```
The whole directory (in the `master` branch) is signed as well, you can check that with keybase
```
keybase dir verify
```

License
-------

MIT

**Free Software, Hell Yeah!**
