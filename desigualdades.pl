
persona(liliana, mujer(24, universitario, 2),argentina).
persona(juan, varon(38, secundario),argentina).

persona(laura, trans, argentina).
persona(pedro, trans, argentina).


esCisgenero(Nombre):-
    persona(Nombre, _, _),
    not(persona(Nombre, trans, _)).

esperanzaDeVida(Nombre, Anios):-
    esCisgenero(Nombre),
    persona(Nombre, mujer(_, _, _), argentina),
    Anios is 80.

esperanzaDeVida(Nombre, Anios):-
    esCisgenero(Nombre),
    persona(Nombre, varon(_, _), argentina),
    Anios is 72.

esperanzaDeVida(Nombre, Anios):-
    persona(Nombre, trans, argentina),
    Anios is 35.

consigueTrabajo(Nombre):-
    persona(Nombre, mujer(Anios, Nivel, Hijes), _),
    esSuperior(Nivel, secundario),
    Anios<35,
    Hijes=0.

consigueTrabajo(Nombre):-
    persona(Nombre, varon(Anios, Nivel), _),
    esSuperior(Nivel, primario),
    Anios<45.

esSuperior(universitario, secundario).
esSuperior(universitario, primario).
esSuperior(secundario, primario).

salarioEsperado(Nombre, Salario):-
    consigueTrabajo(Nombre),
    esCisgenero(Nombre),
    Salario is Bonus1+Bonus2+Bonus3.

salarioEsperado(Nombre, Salario):-
    consigueTrabajo(Nombre),
    esCisgenero(Nombre),
    Salario is Bonus1+Bonus2.

salarioEsperado(Nombre, Salario):-
    consigueTrabajo(Nombre),
    esCisgenero(Nombre),
    Salario is Bonus1+Bonus3.

bonusGenero(Nombre,Bonus1 ):-
    persona(Nombre, varon(_, _), _),
    Bonus1 is 35000. 
    
bonusGenero(Nombre, Bonus1):-
    persona(Nombre, mujer(_, _, _), _),
    Bonus1 is 35000*0.73.

bonusEdad(Nombre, Bonus2):-
    persona(Nombre, varon(Anios, _), _),
    Anios > 40
    Bonus2 is 35000*0.1 . 

bonusEdad(Nombre, Bonus2):-
    persona(Nombre, mujer(Anios,_, _), _),
    Anios > 40,
    Bonus2 is  (35000*0.73)*0.1. 

bonusEstudio(Nombre, Bonus3):-
    persona(Nombre, varon(_, universitario), _), 
    Bonus3 is 35000*0.2.    

bonusEstudio(Nombre,Bonus3):-
    persona(Nombre, mujer(_,universitario, _), _),
    Bonus3 is (35000*0.73)*0.2 .


        




