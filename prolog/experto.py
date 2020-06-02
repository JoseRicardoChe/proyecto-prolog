from pyswip import Prolog
prolog = Prolog()
prolog.consult("transp.pl")

f = open ('transp.pl','r')
mensaje = f.read()
print(mensaje)
f.close()