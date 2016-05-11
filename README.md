keybase-completion
==================

The [keybase command line tool](https://keybase.io/docs/command_line) lacks Tab completion by default (see [Issue #147](https://github.com/keybase/keybase-issues/issues/147) in the Keybase Bugtracker). This is an approach to satisfy the needs and lift the usabilty of keybase on the command line to a whole new level.

Installation
------------

#####Global

```sh
git clone git@github.com:dtiersch/keybase-completion.git
cd keybase-completion
sudo cp keybase /etc/bash_completion.d/keybase
sudo chmod a+r /etc/bash_completion.d/keybase
```

#####User Space
```sh
git clone git@github.com:dtiersch/keybase-completion.git
```
Then add the following line to your `.bashrc`:
```sh
test -r /path/to/repository/keybase && source $_
```

License
-------

MIT

**Free Software, Hell Yeah!**
