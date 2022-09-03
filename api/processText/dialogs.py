class Dialog():
    def dialogReturn(self, burden, type, local):
        if type == 'smoke_detector' and burden == 1:
            return  'Foi detectado um incêndio acontecendo no '+ local + ', por favor se dirigir para fora da casa. O corpo de bombeiros ja foi acionado'
        if type == 'user' and burden == 2:
            return  'Por favor se dirigir para fora da casa, o corpo de bombeiros ja foi acionado'
        return 'não compreendi, poderia falar novamente'
