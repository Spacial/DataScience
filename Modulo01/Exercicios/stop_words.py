#!/usr/bin/env python
import nltk

from nltk import ngrams
from nltk.corpus import stopwords
from nltk import tokenize

stopwords_pt = stopwords.words('portuguese')

print('Stopwords em portugues:', len(stopwords_pt))

#for p in stopwords_pt:
#        print(p)

texto = 'Tem um armario no meio da sala, mas deveria ser um sofa.' 

texto_limpo = []

#for p in texto:
#        if p not in stopwords_pt:
#                texto_limpo.append(p)

print('texto limpoo:', texto_limpo)

tokens = tokenize.word_tokenize(texto)
print('apos tokenizar:', tokens)

for p in tokens:
        if p not in stopwords_pt:
                texto_limpo.append(p)

for p in texto_limpo:
        print(p)

filtrado = [p for p in tokens if not p in stopwords_pt]
for p in filtrado:
        print(p)

minha_stop = [',', '.']

filtrado2 = [p for p in tokens if (not p in stopwords_pt) and (p not in minha_stop) ]
for p in filtrado2:
        print(p)


