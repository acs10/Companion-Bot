from processText.dialogs import Dialog

class DialogManager():
    def __init__(self):
        self.burden = 0
        self.type = 'user' 
        self.local = 'quarto'
        self.ticket = ''

        self.medicineList = ['Diabétes, Jardiance,  1 comprimido de 25mg ']
        self.shoppingList = ['ovos','leite','pilhas para o controle','pão']
        
        self.events = ['aniversário da sua filha']
        self.hoursEvents = []

    def dialogPolicy(self, textList, variable):
        print(textList)
        try:
            for i in textList:
                #Callbacks Dialogs Sensors
                if self.type == 'smoke_detector':
                    self.burden += 1
                if self.type == 'smartwach_fall_user':
                    self.burden += 1
                if self.type == 'smartwach_hight_heart_hate':
                    self.burden += 1
                if self.type == 'smartwach_low_beats':
                    self.burden += 1
                if self.type == 'sensor_presence':
                    self.burden += 1

                #Callbacks Dialogs for Sensors Users
                elif self.type == 'user' and i == 'incêndio':
                    self.burden += 2
                    self.ticket = 'incêndio'
                elif self.type == 'user' and i == 'caí':
                    self.burden += 2     
                    self.ticket = 'caí'             
                elif self.type == 'user' and i == 'sentindo': 
                    self.burden += 2
                    self.ticket = 'sentindo'     
                elif self.type == 'user' and i == 'luz':
                    self.burden += 2
                    self.ticket = 'luz' 

                #Callback Dialogs to User (Openning)
                elif self.type == 'user' and i == 'dia':
                    self.burden += 2
                    self.ticket = 'dia'  
                
                #Callback Dialogs to User (Generic)
                elif self.type == 'user' and i == 'dor':
                    self.burden += 2
                    self.ticket = 'dor'  

                elif self.type == 'user' and i == 'sim':
                    self.burden += 2
                    self.ticket = 'sim'  

                elif self.type == 'user' and i == 'não':
                    self.burden += 2
                    self.ticket = 'nao'  

                #Callback Dialogs to User (addList)
                elif self.type == 'user' and i == 'acabou':
                    self.burden += 2
                    self.ticket = 'acabou'  

                elif self.type == 'user' and i == 'compras' :
                    self.burden += 2
                    self.ticket = 'compras' 

                #Callback Dialogs to User (Events)
                elif self.type == 'user' and i == 'agendado' or i == 'evento':
                    self.burden += 2
                    self.ticket = 'evento'  

                #Callback Dialogs to User (Events)
                elif self.type == 'user' and i == 'remédio':
                    self.burden += 2
                    self.ticket = 'remedio'  

                #TODO Tem que fazer com User pois encadea vários dialogos
            return Dialog().dialogReturn(self.burden, self.type, self.local, self.ticket, self.events, self.medicineList, self.shoppingList)       
        except:
            return variable[0]
    

