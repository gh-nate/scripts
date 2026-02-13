#!/usr/bin/env sh

# Copyright (c) 2025 gh-nate
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Performs git pull in git worktrees and package updates elsewhere.

set -e

in_git_repo=
if test -d .git; then
	in_git_repo=1
elif git rev-parse 2> /dev/null; then
	in_git_repo=1
fi

if test "$in_git_repo"; then
	git pull --prune
elif test -x /opt/homebrew/bin/brew; then
	brew update
	brew upgrade --ask
elif test -f /etc/debian_version; then
	sudo apt-get update
	apt list --upgradable
	sudo apt-get upgrade
	if command -v flatpak > /dev/null; then
		flatpak update
	fi
fi
