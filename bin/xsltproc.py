#!/usr/bin/python3
import sys
from os import path
from lxml import etree
from getopt import getopt


def usage():
    sys.stderr.write('Usage: %s [-p Parameter=Value ... ] <xslt-file> <xml-file>\n' % sys.argv[0])
    sys.exit(1)


if len(sys.argv) < 3:
    usage()

params, args = getopt(sys.argv[1:], 'p:P:')

if len(args) < 2:
    usage()

xsl = args[0]
xml = args[1]

for f in [xsl, xml]:
    if not path.exists(f):
        sys.stderr.write('%s does not exists!\n' % f)
        usage()

param_dict = {}

for key, value in params:
    try:
        a = value.split('=')
        param_dict[a[0]] = "'%s'" % a[1]
    except Exception:
        continue

xml_tree = etree.parse(xml)
xslt_tree = etree.parse(xsl)
transform = etree.XSLT(xslt_tree)
print(str(transform(xml_tree, **param_dict)))
sys.exit(0)
