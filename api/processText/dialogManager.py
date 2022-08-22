class DialogManager():

    def dialogPolicy(self, textList):
        print(textList)
        for i in textList:
            if i == 'are':
                return 'passed'