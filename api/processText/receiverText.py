from cgitb import text
from nltk.tokenize import word_tokenize
from processText.dialogManager import DialogManager
import nltk
from nltk.probability import FreqDist

class ProcessText():
    def __init__(self, text):
        self.text = text

    def processReceiver(self):
        instance = self.text
        instanceSplitText = str(instance).split(',')
        instanceSplitid = instanceSplitText[1].split(')')  
        text = instanceSplitText[3].split(')])]')         
        return [{"id": int(instanceSplitid[0]),"body": self.tokenize(text)}]

    def preProcess(self, variable):
        newList = []
        lista = variable
        for x in lista:
            item = x
            for y in ['[', ']', ',', '.', '``', "''", "'"]:
                item = item.replace(y, "")
            newList.append(item)
        return newList

    def proProcessTokenList(self, openText):
        TokenList = []
        for i in openText:
            if i != "[" and i != "]" and i != "``" and i != "'" and i != "''" and i != "," and '"' and "'":
                TokenList.append(i)
        return TokenList
    
    def tokenize(self, variable):
        preClean = self.preProcess(variable)
        openText = word_tokenize(str(preClean))
        resultProProcess = self.proProcessTokenList(openText)
        clean = self.stopwords(resultProProcess) #Verificar usabilidade
        self.freqDisc(resultProProcess) 
        self.target(resultProProcess)
        return DialogManager().dialogPolicy(resultProProcess, variable)

    def stopwords(self, list):
        # baixa as stopwords
        nltk.download('stopwords')
        # para escolher as stopwords do português adicionamos a opçaõ de língua "portuguese"
        stopwords = nltk.corpus.stopwords.words('portuguese')
        new_list = []
        for i in list:
            if i in stopwords:
                pass
            else:
                new_list.append(i)
        return new_list

    def freqDisc(self, list):
        fd = FreqDist(list)
        print("frequencia de palavras:")
        print(fd.most_common(20))

    def target(self, list):
        print("marcador:")
        #        Marcação	    Significado	        Exemplos 
        #           ADJ	        adjetivo	        novo, bom, alto, especial, grande, local
        #           ADP	        adesão	            em, de, em, com, por, em, sob
        #           ADV	        advérbio	        realmente, já, ainda, cedo, agora
        #           CONJ	    conjunção	        e, ou, mas, se, enquanto, embora
        #           DET	        determinante,       artigo	o, um, alguns, a maioria, todos, não, que
        #           SUBSTANTIVO	substantivo	        ano, casa, custos, tempo, África
        #           NUM	        numeral	            vinte e quatro, quarto, 1991, 14:24
        #           PRT	        partícula	        em, em, fora, sobre por, que, para cima, com
        #           PRON	    pronome	            ele, deles, ela, é, meu, eu, nós
        #           VERBO	    verbo	            é, digamos, dito, dado, jogando, seria
        #           .	        sinais de pontuação	. , ; !
        #           X	        outro	            ersatz, espírito, não sei, gr8, universidade
        # print(nltk.pos_tag(list, tagset= 'universal'))
        #______________________________________________________________________________________________
        # default_tagger = nltk.DefaultTagger( 'NN' )
        # print(default_tagger.tag(list))
        #______________________________________________________________________________________________
        patterns = [
                    (r'.*ing$' , 'VBG' ),                 # gerúndios 
                    (r'.*ed$' , 'VBD' ),                  # passado simples 
                    (r'.*es$' , 'VBZ' ),                  # 3º singular presente 
                    (r'.*ould$' , 'MD' ),                 # modais 
                    (r'.*\'s$' , ' NN$' ),                 # substantivos possessivos 
                    (r'.*s$' ,'NNS' ),                   # substantivos no plural 
                    (r'^-?[0-9]+(\.[0-9]+)?$' , 'CD'),   # números cardinais 
                    (r'.*' , 'NN' )                       # substantivos (padrão) 
                   ]
        regexp_tagger = nltk.RegexpTagger(patterns)
        print(regexp_tagger.tag(list))

