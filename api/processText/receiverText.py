from cgitb import text

class ProcessText():
    def __init__(self, text):
        self.text = text

    def processReceiver(self) -> list:
        instance = self.text
        instanceSplitText = str(instance).split(',')
        instanceSplitid = instanceSplitText[1].split(')')  #String
        text = instanceSplitText[3].split(')])]')          #String
        return [{"id": int(instanceSplitid[0]),"body": text[0]}]
