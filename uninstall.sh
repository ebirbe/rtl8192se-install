#!/bin/bash
#
# Copyright (C) 2012 Erick Birbe <erickcion@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#

SRC_DEST="rtl8192se_linux_2.6.0019.1207.2010"
MODULE_NAME="r8192se_pci"

PWD=$( pwd )/
STATUS_SUCCESS=0
STATUS_ERROR=1

SRC_DEST="rtl8192se_linux_2.6.0019.1207.2010"
MODULE_NAME="r8192se_pci"

PWD=$( pwd )/
STATUS_SUCCESS=0
STATUS_ERROR=1

## Functions ##

# Writes a string to stderror as ERROR
write_error()
{
	echo "ERROR: $*" 1>&2
}

# Writes a string to stderror as WARNING
write_warning()
{
	echo "WARNING: $*" 1>&2
}

# Determines if the user is root
is_root()
{
	if [[ $EUID -ne 0 ]]; then
	   write_error "This script must be run as root"
	   return $STATUS_ERROR
	fi
}

# Check is root user
if ! is_root; then
	echo "Login as administrator user and try again."
	exit $STATUS_ERROR
fi

echo "Changing to directory \"$SRC_DEST\"..."
cd $SRC_DEST

echo "Removing the driver..."
make uninstall
if [ $? -ne 0 ]; then
	write_error "There was a problem uninstalling the modules."
	exit $STATUS_ERROR
fi

echo "Deactivating module..."
rmmod $MODULE_NAME
if [ $? -ne 0 ]; then
	write_warning "There was a problem deactivating the modules."
	#exit $STATUS_ERROR
fi

echo
echo "Unistall finished successfully!"
echo
