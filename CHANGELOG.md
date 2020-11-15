Changelog
=========

All notable (non-packaging) changes to this project will be documented
in this file.

The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this
project adheres to
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).


[UNRELEASED]
------------

### New Features

* Adds right-click menu.
* Notifications now show the date in time of the event.
* Notification if the state of a single RAID set changed, not just if
  the overall state changed.

### Visible Improvements

* Use line breaks instead of semicolons as delimiter for readablity.
* Notifications don't vanish by itself anymore.

### Bug Fixes

* Fixes false negative issue when multiple disks failed in a RAID.
* Don't display HTML tags in tool tips.

### Other Changes

* Uses
  [`Desktop::Notify`](https://metacpan.org/release/Desktop-Notify)
  ([libdesktop-notify-perl](https://packages.debian.org/libdesktop-notify-perl))
  for notifications now. (Should also fix [Debian bug report
  #886419](https://bugs.debian.org/886419).)
* Improved documentation.
* Start keeping a [upstream change log](CHANGELOG.md) besides just a
  [Debian packaging changelog](debian/changelog) which contained both,
  upstream and packaging changes.


[1.1.0] - 2017-09-08
--------------------

### New Features

* Recognizes "check" state.
* Emphasizes bad states in notification.
* Drop never used icon directory locations from being searched.

### Bug Fixes

* Fixes resync/verify messages to show more than a percent sign.
* Fixes Gtk/Glib loop which periodically runs `&check_mdstat()`;

### Other Changes

* Adds a test suite and the infrastructure for it.
* Factor out dynamic population of `@icon_dirs`.
* Include searched icon directories in error message.


[1.0.1] - 2017-03-07
--------------------

### Bug Fixes

* Fixes dist name for `File::ShareDir`. Thanks Damyan Ivanov! ([Debian
  bug report #856925](https://bugs.debian.org/856925))


[1.0.0] - 2017-03-01
--------------------

* Initial release.


[UNRELEASED]:  https://github.com/xtaran/systray-mdstat/compare/1.1.0...HEAD
[1.1.0]: https://github.com/xtaran/systray-mdstat/compare/1.0.1...1.1.0
[1.0.1]: https://github.com/xtaran/systray-mdstat/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/xtaran/systray-mdstat/releases/tag/1.0.0
