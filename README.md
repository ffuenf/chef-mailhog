chef-netdata
============
[![GitHub tag](http://img.shields.io/github/tag/ffuenf/chef-mailhog.svg)][tag]
[![Build Status](http://img.shields.io/travis/ffuenf/chef-mailhog.svg)][travis]

[tag]: https://github.com/ffuenf/chef-mailhog/tags
[travis]: https://travis-ci.org/ffuenf/chef-mailhog

This cookbook installs [MailHog](https://github.com/mailhog/MailHog).

Usage
-----

Include the mailhog recipe to install MailHog on your system:
```chef
include_recipe "mailhog"
```

Platform
--------

The following platforms are supported and tested:

* Debian 8.x
* Ubuntu 14.04.x

Other Debian family distributions are assumed to work.

Development
-----------
1. Fork the repository from GitHub.
2. Clone your fork to your local machine:

        $ git clone git@github.com:USER/chef-mailhog.git

3. Create a git branch

        $ git checkout -b my_bug_fix

4. **Write tests**
5. Make your changes/patches/fixes, committing appropriately
6. Run the tests: `rake style`, `rake spec`, `rake integration:vagrant`
7. Push your changes to GitHub
8. Open a Pull Request

Testing
-------

The following Rake tasks are provided for automated testing of the cookbook:

```
$ rake -T
rake spec                 # Run ChefSpec examples
rake style                # Run all style checks
rake style:chef           # Lint Chef cookbooks
rake style:ruby           # Run Ruby style checks
rake travis               # Run all tests on Travis
```
See TESTING.md for detailed information.

License
-------

Copyright (c) 2015 Sergey Storchay, http://r8.com.ua
Copyright (c) 2016 Achim Rosenhagen, http://www.ffuenf.de

Licensed under MIT:
http://raw.github.com/r8/chef-mailhog/master/LICENSE
