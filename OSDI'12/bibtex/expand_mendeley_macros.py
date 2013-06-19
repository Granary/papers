#!/usr/bin/env python

import json
import re
import sys

if len(sys.argv) != 4:
    print 'Usage: %s macro_file bib_file output_file' % (sys.argv[0])
    sys.exit(-1)

def load_macros(macro_file):
    macros = json.loads(open(macro_file).read())
    result = {}
    for macro in macros:
        result[macro.encode('ascii')] = macros[macro].encode('ascii')
    return result
    
def substitute_macros(bib_file, macros):
    '''Replaces {X} with {macros[X]}'''
    text = open(bib_file).read()
    for macro in macros:
        text = text.replace('{%s}' % (macro), '{%s}' % (macros[macro]))

    assert(re.match('\\{\\@.*\\}', text) == None)
    return text

macros = load_macros(sys.argv[1])
output = substitute_macros(sys.argv[2], macros)
open(sys.argv[3], 'w').write(output)
