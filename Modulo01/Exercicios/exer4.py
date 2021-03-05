#!/usr/bin/env python
import string
import re
import nltk
from nltk import ngrams, tokenize
from nltk.corpus import stopwords, machado
from nltk.tokenize import RegexpTokenizer

def preprocess(sentence, lang='english'):
        sentence_raw = sentence.lower()
        tokenizer = RegexpTokenizer(r'\w+')
        sentence = "".join([i for i in sentence_raw if i not in string.punctuation])
        tokens = tokenizer.tokenize(sentence)
        filtered_words = [w for w in tokens if not w in stopwords.words(lang)]
        return " ".join(filtered_words)


def dists(words, text):
        fdist_words = nltk.FreqDist(text)
        data = []
        for w in words:
                data.append(fdist_words[w])
        return data


def grams(n, lista):
        if type(lista) == str:
                lista = lista.lower().split()
        ret = []
        for ng in ngrams(lista, n):
                ret.append(ng)
        return ret 


def mac2raw(f):
        return [w for w in machado.words(f)]


def raw2token(text_raw, lang='english'):
        text = preprocess(' '.join(text_raw), lang)
        return nltk.word_tokenize(text)


def machadao():
        print(' Exercicio 4:')
        print(' 1.', machado.readme())
        print(' 2. -\ ')
        print('    a. ', machado.categories())
        print('    b. ', machado.fileids())
        #print('    c. ', ' '.join(machado.words('romance/marm05.txt')))


#machadao()

palavras = ['olhos', 'estado']
mpbc_raw = mac2raw('romance/marm05.txt')
mpbc_tok = raw2token(mpbc_raw, 'portuguese')
mpbc_dist = nltk.FreqDist(mpbc_tok)
print('    d.  palavras: ', palavras, ' no memoria postumas e: ', dists(palavras, ' '.join(mpbc_tok)))

print('    e. ', len(mpbc_raw))

print('    f. ', len(mpbc_dist.keys()), mpbc_dist.N())

print('    g. ', mpbc_dist.keys())

#print('    h. ', end=' ')
#k = 0
#top_quinze = []
#for w in mpbc_dist:
#        print('[', w, mpbc_dist[w], '] ', end='')
#        k+=1
#        top_quinze.append(w)
#        if k > 15:
#                print('')
#                break

print('    h. ', mpbc_dist.most_common(15))

print('    i. ', mpbc_dist.tabulate(15))

print('    j. ', 'plotando..')
mpbc_dist.plot(15, cumulative=False)

bigramas = grams(2, mpbc_tok)
trigramas = grams(3, mpbc_tok)

#print('    bi. ', len(bigramas))
print('    l. ', len(trigramas))

ojos = [l for l in bigramas if 'olhos' in l]
print('    m. ', ojos[:15])

ojos.plot()

