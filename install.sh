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

source $(dirname $0)/common.sh

check_is_root
check_apps

echo "Applying patches..."
quilt pop -a
quilt push -a
if [ $? -ne 0 ]; then
	write_warning "There was a problem applying the patch."
fi

echo "Changing to directory \"$SRC_DEST\"..."
cd $SRC_DEST

echo "Compiling modules..."
make
if [ $? -ne 0 ]; then
	write_error "There was a problem compiling the package."
	exit $STATUS_ERROR
fi

echo "Installing new modules..."
make install
if [ $? -ne 0 ]; then
	write_error "There was a problem installing the modules."
	exit $STATUS_ERROR
fi

echo "Activating module..."
modprobe $MODULE_NAME
if [ $? -ne 0 ]; then
	write_error "There was a problem activating the modules."
	exit $STATUS_ERROR
fi

echo
echo "Your driver is now installed."
echo "Enjoy it!"
echo
