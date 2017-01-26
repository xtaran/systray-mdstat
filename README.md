systray-mdstat
==============

`systray-mdstat` is a small system tray icon indicating the state of
local software (md) RAIDs by checking `/proc/mdstat` periodically.

It works at least on Linux and should work with any
freedesktop.org-compliant status area (aka system tray).

Use Case
--------

The use cases for this utility is probably rather restricted:

* Desktop or laptop with Linux and software RAID (i.e. at least two
  permanent disks)

* Not wanting to have any remote monitoring like e.g. Icinga or Xymon
  (e.g. for privacy reasons or due to lacking an according server).


Requirements
------------

* Perl ≥ 5.10
* a bunch of Perl modules:
  * Gtk3
  * Glib::Object::Introspection
  * List::Util


Author, Copyright and License
-----------------------------

Copyright © 2017 by Axel Beckert <abe@deuxchevaux.org>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU Library General Public
License along with this library. If not, see
[GNU's website](https://www.gnu.org/licenses/).

### Note

The initial code is very loosely based on the outer framework of the
far more complex
[fdpowermon](https://anonscm.debian.org/git/users/wouter/fdpowermon.git)
by Wouter Verhelst and the tiny
[mdstat check from Debian's hobbit-plugins package](https://anonscm.debian.org/cgit/collab-maint/hobbit-plugins.git/tree/src/usr/lib/xymon/client/ext/mdstat)
written by Christoph Berg under the MIT license. (Both, Christoph and
Wouter stated that the amount of code I copied is too small to make
their copyright apply, hence I'm not bound to the licenses they used
for their code.)
