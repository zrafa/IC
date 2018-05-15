#!/usr/bin/env python
from pandocfilters import toJSONFilter
import re

"""
Pandoc filter that causes everything between
'<!-- BEGIN COMMENT -->' and '<!-- END COMMENT -->'
to be ignored.  The comment lines must appear on
lines by themselves, with blank lines surrounding
them.
"""

incomment = False


def comment(k, v, fmt, meta):
    global incomment
    if k == 'Para':
        fmt, s = v
        if fmt == "html":
            if re.search("\*\*Ejemplo\*\*", s):
                incomment = True
                return ['\\begin{example}']
            elif re.search("\*\*/Ejemplo\*\*", s):
                incomment = False
                return ['\\end{example}']
    if incomment:
        return [v] 

if __name__ == "__main__":
    toJSONFilter(comment)
