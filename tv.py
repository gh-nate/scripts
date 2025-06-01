#!/usr/bin/env python3

"""Copyright (c) 2025 gh-nate

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE."""

# This script serves as a command that sets up a tmux session with vim at a
# specified directory. It also switches between created tmux sessions when
# inside a tmux session.

from pathlib import Path

import argparse
import os
import subprocess

p = argparse.ArgumentParser()
p.add_argument(
    "start_directory", type=Path, help="basename will be used as session name"
)
args = p.parse_args()

args.start_directory = args.start_directory.absolute()
session_name = args.start_directory.name

common = [
    "-c",
    str(args.start_directory),
    "-s",
    session_name,
    os.getenv("EDITOR", "vim"),
    "+se nu",
]
f = "tmux"

if os.getenv("TMUX"):
    subprocess.run([f, "new-session", "-d", *common], capture_output=True)
    os.execlp(f, f, "switch-client", "-t", session_name)
os.execlp(f, f, "new-session", "-A", *common)
