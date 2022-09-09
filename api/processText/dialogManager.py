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
        self.hoursEvents = ['Oito horas']

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
                elif self.type == 'user' and i == 'incêndio' or i == 'fogo' or i == 'incêndios' or i == 'queimando':
                    self.burden += 2
                    self.ticket = 'incêndio'
                elif self.type == 'user' and i == 'caí' or i == 'queda' or i == 'machuquei' or i == 'machucado':
                    self.burden += 2     
                    self.ticket = 'caí'             
                elif self.type == 'user' and i == 'sentindo' or i == 'passando' or i == 'padecendo' or i == 'sofrendo': 
                    self.burden += 2
                    self.ticket = 'sentindo'     
                elif self.type == 'user' and i == 'luz' or i == 'iluminação' or i == 'claridade' or i == 'luminosidade':
                    self.burden += 2
                    self.ticket = 'luz' 

                #Callback Dialogs to User (Openning)
                elif self.type == 'user' and i == 'dia' or i == 'manhã':
                    self.burden += 2
                    self.ticket = 'dia'  

                elif self.type == 'user' and i == 'tarde':
                    self.burden += 2
                    self.ticket = 'tarde'  

                #Callback Dialogs to User (Closure)
                elif self.type == 'user' and i == 'noite' or i == 'anoitecer':
                    self.burden += 2
                    self.ticket = 'noite'  
                
                #Callback Dialogs to User (Generic)
                elif self.type == 'user' and i == 'dor' or i == 'sofrimento' or i == 'sofrendo' or i == 'agoniado' or i == 'agoniada' or i == 'agonia' or i == 'mal':
                    self.burden += 2
                    self.ticket = 'dor'  

                elif self.type == 'user' and i == 'sim' or i == 'concerteza' or i == 'certamente' or i == 'yes' or i == 'ok':
                    self.burden += 2
                    self.ticket = 'sim'  

                elif self.type == 'user' and i == 'não' or i == 'negativo' or i == 'not':
                    self.burden += 2
                    self.ticket = 'nao'  

                #Callback Dialogs to User (addList)
                elif self.type == 'user' and i == 'acabou' or i == 'sem':
                    self.burden += 2
                    self.ticket = 'acabou'  

                elif self.type == 'user' and i == 'compras' or i == 'comprar' or i == 'compra':
                    self.burden += 2
                    self.ticket = 'compras' 

                #Callback Dialogs to User (Events)
                elif self.type == 'user' and i == 'agendado' or i == 'evento' or i == 'agenda':
                    self.burden += 2
                    self.ticket = 'evento'  

                elif self.type == 'user' and i == 'horas' or i == 'hora':
                    self.burden += 2
                    self.ticket = 'horas'  

                #Callback Dialogs to User (Events)
                elif self.type == 'user' and i == 'remédio' or i == 'remédios' or i == 'remedios':
                    self.burden += 2
                    self.ticket = 'remedio'  

                #Free Dialogs
                elif self.type == 'user' and i == 'meu' or i == 'seu' or i == 'nome':
                    if i == 'seu':
                        self.burden += 3
                    if i == 'meu': 
                        self.burden += 4
                    self.ticket = 'nome'
                
                #TODO Tem que fazer com User pois encadea vários dialogos
            return Dialog().dialogReturn(self.burden, self.type, self.local, self.ticket, self.events, self.hoursEvents, self.medicineList, self.shoppingList)       
        except:
            return variable[0]
    

