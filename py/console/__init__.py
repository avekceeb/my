'''
Black        0;30     Dark Gray     1;30
Red          0;31     Light Red     1;31
Green        0;32     Light Green   1;32
Brown/Orange 0;33     Yellow        1;33
Blue         0;34     Light Blue    1;34
Purple       0;35     Light Purple  1;35
Cyan         0;36     Light Cyan    1;36
Light Gray   0;37     White         1;37
'''


def red(msg):
    print(f'\033[0;31m{msg}\033[0m')

def green(msg):
    print(f'\033[0;32m{msg}\033[0m')

def orange(msg):
    print(f'\033[0;33m{msg}\033[0m')

def blue(msg):
    print(f'\033[0;34m{msg}\033[0m')

def cyan(msg):
    print(f'\033[0;36m{msg}\033[0m')

def yellow(msg):
    print(f'\033[1;33m{msg}\033[0m')


if '__main__' == __name__:
    red('red')
    green('green')
    orange('orange')
    blue('blue')
    cyan('cyan')
    yellow('yellow')

