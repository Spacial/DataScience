#!/usr/bin/env python

### Exercitando 1
# montecastelo = 'Ainda que falasse as línguas dos homens e falasse a língua dos anjos, sem amor eu nada seria.'

# [print(x) for x in montecastelo]

# listacastelo = montecastelo.split()

# print(len(listacastelo))

# [print(x) for x in listacastelo]

# mundocastelo = montecastelo.replace('dos homens', 'dos mundos')

# print(montecastelo[21:30])

# print(montecastelo[:-15])

# with open('montecastelo.txt', 'w') as f:
#     f.write(montecastelo)

# f.close()
### Exercitando 2
import docx

romance = '../Dados/ROMANCE.docx'

doc = docx.Document(romance)

texto = [p.text for p in doc.paragraphs]

print('total de parágrafos:', len(texto))

print('total de parágrafos:', texto[0])

print('total de parágrafos:', texto[3:6])

[print('Sim, "Machado" está no texto.') for p in texto if p.find('Machado') >= 0]

corrido = ''
for p in texto:
    corrido += p

jb = corrido.replace('Batista', 'João Batista')
