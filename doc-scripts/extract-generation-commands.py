#!/usr/bin/env python3

import re
import sys


usage=f"""
{sys.argv[0]} <README.md>
"""

if len(sys.argv) < 2:
    raise ValueError("Missing file argument" + usage)
readme_file=sys.argv[1]

def line_is_divider(line):
    return line == "```\n"

inside_generation_block=False

with open(readme_file, 'r') as f:
    while line := f.readline():
        if inside_generation_block:
            if line_is_divider(line):
                inside_generation_block = False
                continue
        else:
            matches = re.match(r'^<!-- gallery:([ \w\-]+) -->\n$', line)
            if matches is not None:
                print()
                print(f"echo Generating gallery \"{matches[1]}\"")
                line = f.readline()
                if not line_is_divider(line):
                    raise ValueError("Expected block begin here")
                line = f.readline()
                inside_generation_block = True
        if inside_generation_block:
            print(line, end="")
