class Dialog():
    def dialogReturn(self, burden, type, local, ticket):

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

        return 'não compreendi, poderia falar novamente'
