# rtl8192se-install

An automatic installer for Wireless PCI device "Realtek RTL8191SE 
Wireless LAN Controller" or any other that uses the Realtek "r8192se" 
module for the 2.6 Linux Kernel.

# Driver License

The firmware and modules provided by Realtek have the license in their 
respective source folders.

# rtl8192se-install License

Copyright (C) 2012 Erick Birbe <erickcion@gmail.com>

This program is free software; you can redistribute it and/or modify it 
under the terms of the GNU General Public License as published by the 
Free Software Foundation; either version 2 of the License, or (at your 
option) any later version.

This program is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU 
General Public License for more details.

You should have received a copy of the GNU General Public License along 
with this program; if not, write to the Free Software Foundation, Inc., 
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# Requirements:

The following applications are required before run the install script:

* linux-headers-\[version\] (Where \[version\] is your specific kernel 
 version and architecture, example: linux-headers-2.6.32-5-amd64)
* make

You can install the required applications with the next command as root
(only in debian based systems):

 ```bash
 apt-get install make linux-header-$(uname -r)
 ```
