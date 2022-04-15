#clase para administrar los usuarios de un sistema
class Usuario:

    def __init__(self,nom,pwd):
        self.nombre = nom
        self._password = pwd

    def iniciarSession(self):
        if(self.nombre == 'admin' and self._password == '12345'):
            print("Bienvenido " + self.nombre)
        else:
            print("Datos de acceso incorrectos")


####usando mi clase de usuario
usuario1 = Usuario('admin','admin')
usuario1.iniciarSession()

usuario2 =Usuario('admin','12345')
usuario2.iniciarSession()