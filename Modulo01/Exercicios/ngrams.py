#!/usr/bin/env python
import nltk

from nltk import ngrams
#from nltk.corpus import webtext

#print(webtext.fileids())

texto = '''Lily Ebert, de 97 anos, é uma das últimas sobreviventes do Holocausto do Reino Unido. E mais de 75 anos após vencer os horrores nazistas, ela superou outra ameaça: a covid-19.

"Eu estive em Auschwitz, passei pela pior situação que um ser humano pode viver. E graças a Deus eu sobrevivi", contou ao repórter Guy Lynn, da BBC, em sua casa no norte de Londres.

"Então eu deveria sobreviver a isso (covid-19) também. E então eu sobrevivi."

Inferno em Auschwitz

Lily tinha apenas 21 anos quando foi salva por tropas americanas em 1945, no fim da Segunda Guerra Mundial. Ela e duas irmãs estavam em uma Marcha da Morte, uma transferência forçada de prisioneiros para outro campo de concentração. Muitos não chegavam vivos ao fim do trajeto.


Um ano antes, ela tinha sido deportada de Bonyhád, sua cidade natal na Hungria, e levada a Auschwitz, campo de concentração na Polônia onde cerca de 1 milhão de judeus e milhares de outras pessoas foram assassinadas pelos nazistas.

"Aquilo não era um lugar, era o inferno", relembra Lily hoje.

Segundo relato dela à fundação britânica para o Dia em Memória das Vítimas do Holocausto, ao descer do trem, a família - ela, a mãe, um irmão e três irmãs - tiveram o destino selado por um homem com um bastão na mão: o médico Josef Mengele, que ficaria conhecido como "Anjo da Morte" por causa de seus cruéis experimentos em prisioneiros.

Após a derrota na guerra, Mengele adotou nomes falsos e passou por diferentes países até se estabelecer no Brasil, onde viveu até sua morte no Guarujá (SP), em 1985.

Fazendo um movimento seco com o bastão, o médico decidiu o futuro da família: Lily e duas irmãs, Renee e Piri, foram para a direita. A mãe, Nina, o irmão, Bela e a outra irmã, Berta, para a esquerda.

As jovens foram levadas para tomar um banho, ter o cabelo cortado e tiradas de si qualquer coisa que carregassem. Já as pessoas mandadas para a esquerda eram enviadas para a câmara de gás e o crematório.

Ao verem uma fumaça, Lily e as irmãs perguntaram aos outros prisioneiros se era uma fábrica. Foi quando souberam que nunca mais veriam o restante da família de novo.

Elas foram transferidas para uma fábrica de munições nos arredores de Leipzig, na Alemanha, quatro meses depois.

Após a libertação, em 1945, as irmãs foram viver na Suíça. Em 1967, Lily se mudou com o marido e três filhos para Londres, onde vive até hoje.

Lily conseguiu esconder dos nazistas um pequeno pingente de ouro durante todo o tempo em que esteve presa. Uma lembrança da família que ela usa todos os dias até hoje.

Encontro emocionante

Em meados de 2020, imagens de Lily viralizaram em todo o mundo.

Um bisneto dela viu uma nota bancária alemã dada a Lily por um dos soldados americanos que a salvaram 75 anos atrás. Nela, estava o nome dele em hebraico, além dos dizeres "começo de uma nova vida", e "boa sorte e felicidades".

O adolescente então rastreou a família do militar pelas redes sociais para que Lily finalmente pudesse agradecê-la.

"Eu postei na internet de manhã e fiquei sem checar meu celular por horas. E de repente eu entrei no Twitter e tinha milhares de notificações", conta Dov Forman, de 17 anos.

"Estava sendo compartilhado e curtido, e só aumentava. Até que chegou a 1 milhão de visualizações. E de repente alguém tuitou para mim: 'Este pode ser o soldado'."

Já em meio meio da pandemia de coronavírus, Lily teve um encontro virtual com familiares de Hayman Shulman, de Nova Jersey, que morreu em 2013.

A eles, contou: "Eu olhava para aquela nota toda hora, de verdade. Era muito especial".

Nova superação

Em 17 de dezembro de 2020, Lily tomou a primeira dose da vacina contra o novo coronavírus. Mas pouco tempo depois, começou a se sentir doente - o imunizante só atinge sua eficácia máxima cerca de duas semanas após a segunda dose.

Foram dias difíceis - ela teve de ser tratada com oxigênio em casa.

"Foi muito preocupante para a família toda. Houve alguns dias muito sombrios e difíceis, mas minha bisavó nunca parou de sorrir, nunca desistiu", conta o bisneto.

Agora curada, ela deixa uma mensagem para pessoas que estão lutando contra a covid-19:

"Tente, antes de mais nada, em todas as situações, ser positivo. Isso faz você melhorar, de verdade."

E após sobreviver ao Holocausto e agora, aos 97 anos, à covid-19, Lily Ebert garante que não poderia estar mais otimista com relação ao futuro.

'''

#for ng in ngrams(texto.split(), 2):
#    print(ng)

#palavra_alvo = 'guerra'
bigramas = []
trigramas = []

for ng in ngrams(texto.lower().split(), 2):
        bigramas.append(ng)

for ng in ngrams(texto.lower().split(), 3):
        trigramas.append(ng)

#print('Lista Filtrada')
#print(n_gramas_filtrados)

fdist_bi = nltk.FreqDist(bigramas)
fdist_tri = nltk.FreqDist(trigramas)

print('Bigramas mais frequentes:', fdist_bi.most_common(20))
print('Trigramas mais frequentes:', fdist_tri.most_common(20))


