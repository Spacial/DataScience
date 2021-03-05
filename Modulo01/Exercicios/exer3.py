#!/usr/bin/env python
import string
import re
import nltk
from nltk import ngrams, tokenize
from nltk.corpus import stopwords, webtext
from nltk.tokenize import RegexpTokenizer


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


def web2raw(f):
        return [w for w in webtext.words(f)]


def raw2token(text_raw):
        text = preprocess(' '.join(text_raw))
        return nltk.word_tokenize(text)


files = ['singles.txt', 'pirates.txt']
words = ['the', 'that']


for f in files:
        text_raw = web2raw(f)
        print(' word: ', words, ' in file: ', f, ' has ->', dists(words, text_raw))

for f in files:
        text_raw = web2raw(f)
        toktext = raw2token(text_raw)
        bigramas = grams(2, toktext)
        print(bigramas[:15])
        qgramas = grams(4, toktext)
        lifeg = [l for l in qgramas if 'life' in l]
        print(lifeg[:20])


## falta o grafico