from sys import argv
from . import guess_language
with open(argv[1], 'r') as f:
    guess_language(f.read())


