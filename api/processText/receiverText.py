from cgitb import text
from nltk.tokenize import word_tokenize

class ProcessText():
    def __init__(self, text):
        self.text = text

    def processReceiver(self):
        instance = self.text
        print(self.tokenize())
        instanceSplitText = str(instance).split(',')
        instanceSplitid = instanceSplitText[1].split(')')  #String
        text = instanceSplitText[3].split(')])]')          #String
        return [{"id": int(instanceSplitid[0]),"body": text[0]}]

    def tokenize(self):
        return word_tokenize(str(self.text))