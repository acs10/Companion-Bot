from cgitb import text
from nltk.tokenize import word_tokenize

class ProcessText():
    def __init__(self, text):
        self.text = text

    def processReceiver(self):
        instance = self.text
        instanceSplitText = str(instance).split(',')
        instanceSplitid = instanceSplitText[1].split(')')  #String
        text = instanceSplitText[3].split(')])]')          #String
        # print(self.tokenize(text))
        # return [{"id": int(instanceSplitid[0]),"body": text[0]}]
        return [{"id": int(instanceSplitid[0]),"body": self.tokenize(text)}]

    def tokenize(self, variable):
        openText = word_tokenize(str(variable))
        for i in openText:
            if i == 'are':
                return 'passed'
        return variable[0]