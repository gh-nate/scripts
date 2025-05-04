#!/usr/bin/env lua

--[[ Copyright (c) 2025 gh-nate

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
SOFTWARE. ]]

-- Example usage: sed -n 10,15p $inputfile | at_line_offset 300 $outputfile

local offset <const> = tonumber(arg[1])

local dstname <const> = arg[2]
local dstfile <const> = io.open(dstname)

local tmpname <const> = dstname .. ".bak"
io.output(tmpname)

local format <const> = "L"
local linenumber = 1
for line1 in dstfile:lines(format) do
  if linenumber == offset then
    for line2 in io.input():lines(format) do
      io.write(line2)
    end
  end
  io.write(line1)
  linenumber = linenumber + 1
end

io.output():close()

os.rename(tmpname, dstname)
