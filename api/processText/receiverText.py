from cgitb import text
from nltk.tokenize import word_tokenize
import re

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
        print(resultProProcess)
        for i in resultProProcess:
            if i == 'are':
                return 'passed'
        return variable[0]


