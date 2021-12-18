

def guess_language(text):
    fra_low = 'èéêëìíîïàáâçòóôùû'
    fra_upp = fra_low.upper()
    lang = {'eng':0, 'rus':0, 'fra':0}
    letters_used = 0
    if not text or len(text) < 3:
        print('unknown')
        return
    for c in text:
        i = ord(c)
        if 0x0400 <= i <= 0x04FF:
            lang['rus'] += 1
            letters_used += 1
        elif 0x0041 <= i <= 0x005A or 0x0061 <= i <= 0x007A:
            lang['eng'] += 1
            letters_used += 1
        elif c in fra_low or c in fra_upp:
            lang['fra'] += 1
            letters_used += 1
    if letters_used < 3:
        print('unknown')
    elif lang['rus'] / letters_used >= 0.5: 
        print('rus')
    elif (lang['eng'] > 0) and (lang['fra'] / lang['eng'] < 0.002):
        print('eng')
    elif lang['fra'] / lang['eng'] > 0.025:
        print('fra')
    else:
        print('unknown')
    print(f'total:{letters_used} eng:{lang["eng"]} fra:{lang["fra"]}')


