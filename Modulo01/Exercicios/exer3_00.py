#!/usr/bin/env python
import string
import nltk

from nltk import ngrams, tokenize
from nltk.corpus import stopwords, webtext
from nltk.tokenize import RegexpTokenizer
from nltk.corpus import stopwords
import re

def preprocess(sentence):
        sentence_raw = sentence.lower()
        tokenizer = RegexpTokenizer(r'\w+')
        sentence = "".join([i for i in sentence_raw if i not in string.punctuation])
        tokens = tokenizer.tokenize(sentence)
        filtered_words = [w for w in tokens if not w in stopwords.words('english')]
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


files = ['singles.txt', 'pirates.txt']
words = ['the', 'that']

s_raw = [w for w in webtext.words(files[0])]

s_str = preprocess(' '.join(s_raw))

#print(.split())


#print('pirates -> Freq de the:', fdist_p['the'])

#p_clean = "".join([i.lower() for i in p_raw if i not in string.punctuation])

#stopw = stopwords.words()

s = nltk.word_tokenize(s_str)

#filtered_words = filter(lambda token: token not in stopwords.words('english'), s_raw)

#filtrado = [p.lower() for p in s if (not p in stopw) and (len(p) > 1)]
#for p in filtrado:
#        print(p)

#print(filtrado)


