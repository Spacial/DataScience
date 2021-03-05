#!/usr/bin/env python
import nltk
from nltk.corpus import reuters

files = reuters.fileids()
#print(files) 

doc16907 = reuters.words(['test/16097'])
#print(doc16907)
doc_20_palavras = doc16907[:20]
#print(doc_20_palavras)

topicos_reuters = reuters.categories()
print(topicos_reuters)

for palavra in reuters.words(categories= ['coffee', 'cocoa']):
    print(palavra + '  ', end='  ')


