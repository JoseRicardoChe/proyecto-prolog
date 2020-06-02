transport :- hypothesize(Vehicle),
    write('creo que el vehiculo es: '),
    write(Vehicle),
    nl,
    undo.

    /*hypotheses*/
    hypothesize(avion)  :- avion, !.
    hypothesize(avioneta)  :- avioneta, !.
    hypothesize(jet)  :- jet, !.
    hypothesize(carro)  :- carro, !.
    hypothesize(autobus)    :- autobus, !.
    hypothesize(tren)   :- tren, !.
    hypothesize(yate)  :- yate, !.
    hypothesize(velero)  :- velero, !.
    hypothesize(navio)   :- navio, !.
    hypothesize(unknown).

    /*Vehicle identification rules*/
    avion :- aire,verify(tiene_turbinas).
    avioneta :- aire,verify(tiene_helices).
    jet :- aire,verify(tiene_turbinas),verify(es_muy_veloz).
    carro :- tierra,verify(tiene_ruedas),verify(es_compacto).
    autobus   :- tierra,verify(tiene_ruedas),verify(lleva_pasajeros).
    tren  :- tierra,verify(lleva_pasajeros).
    yate :- mar,verify(tiene_motor).
    velero :- mar,verify(tiene_velas).
    navio  :- mar,verify(tiene_velas),verify(es_grande).

/*Classification rules*/
aire    :- verify(tiene_alas), !.
tierra    :- verify(tiene_ruedas), !.
tierra    :- verify(tiene_rieles),(tiene_vagones).
mar    :- verify(tiene_timon), !.
mar    :- verify(tiene_motor).

/*how to ask questions*/
ask(Question) :-
write('El vehiculo tiene el atributo: '),
write(Question),write('? '),read(Response),nl,
((Response == yes ; Response == y)
->
    asserta(yes(Question))).

    
:- dynamic(yes/1).

/*How to vwrify something*/
verify(S) :-
(yes(S)
->
true ;
ask(S)).
/*undo all yes nassertionso*/
undo:- retract(yes(_)),fail.
undo:- retract(no(_)),fail.
undo.