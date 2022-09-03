class Dialog():
    def dialogReturn(self, burden, type, local, ticket, events, medicineList, shoppingList):

        #Dialogs Sensors
        if type == 'smoke_detector' and burden == 1:
            return  'Foi detectado um incêndio acontecendo no '+ local + ', por favor se dirigir para fora da casa. O corpo de bombeiros ja foi acionado'
        if type == 'smartwach_fall_user' and burden == 1:
            return  'Foi detectado sua queda, por precaução a ambulância foi chamada'
        if type == 'smartwach_hight_heart_hate' and burden == 1:
            return  'Foi detectado que sua frequência cardíaca está alta, por precaução a ambulância foi chamada'
        if type == 'smartwach_low_beats' and burden == 1:
            return  'Foi detectado que sua frequência cardíaca está baixa, por precaução a ambulância foi chamada'
        if type == 'sensor_presence' and burden == 1:
            return  'luz ligada'

        #Dialogs for Sensors Users
        if type == 'user' and burden == 2 and ticket == 'incêndio':
            return  'Por favor se dirigir para fora da casa, o corpo de bombeiros ja foi acionado'
        if type == 'user' and burden == 2 and ticket == 'caí':
            return  'Ok, por precaução a ambulância foi chamada'
        if type == 'user' and burden == 2 and ticket == 'sentindo':
            return  'Ok, por precaução a ambulância foi chamada'
        if type == 'user' and burden == 2 and ticket == 'luz':
            return  'Ok, a luz foi ligada'

        #Dialogs to User (Openning)
        if type == 'user' and burden == 2 and ticket == 'dia':
            if local == 'quarto':
                return 'Bom dia, como vai nessa manhã, dormiu bem?'
            else:
                return  'Bom dia, como vai nesssa manhã'

        #Dialogs to User (Generic)
        if type == 'user' and burden == 2 and ticket == 'dor':
            return  'Gostaria de tomar um remédio'
        if type == 'user' and burden == 2 and ticket == 'sim':
            return  'Ok, realizado'
        if type == 'user' and burden == 2 and ticket == 'nao':
            return  'Ok'

        #Dialogs to User (addList)
        if type == 'user' and burden == 2 and ticket == 'acabou':
            return  'Gostaria de incluir esse item na lista de compras'

        if type == 'user' and burden == 2 and ticket == 'compras':
            provString = 'Você as seguintes produtos para comprar'
            for i in shoppingList:
                provString += (','+str(i))
            return  provString

        #Dialogs to User (Events)
        if type == 'user' and burden == 2 and ticket == 'evento':
            provString = 'Você tem o'
            for i in events:
                provString += (','+str(i))
            return  provString

        #Dialogs to User (Medicine)
        if type == 'user' and burden == 2 and ticket == 'remedio':
            provString = 'Você tem que tomar o remédio para'
            for i in medicineList:
                provString += (','+str(i))
            return  provString

        #Não entendeu entrada 
        return 'não compreendi, poderia falar novamente'
