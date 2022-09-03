from processText.dialogs import Dialog


class DialogManager():
    def __init__(self):
        self.burden = 0
        self.type = 'user' 
        self.local = 'quarto'

    def dialogPolicy(self, textList, variable):
        try:
            for i in textList:
                if self.type == 'smoke_detector':
                    self.burden += 1
                elif self.type == 'user' and i == 'incêndio':
                    self.burden += 2
            return Dialog().dialogReturn(self.burden, self.type, self.local)       
        except:
            return variable[0]
    

