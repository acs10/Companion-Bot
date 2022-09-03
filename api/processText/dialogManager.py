from tkinter import Variable


class DialogManager():

    def dialogPolicy(self, textList, variable):
        print(textList)
        print(variable[0])
        try:
            for i in textList:
                if i == 'are':
                    return 'passed'
            return variable[0]
        except:
            return variable[0]

