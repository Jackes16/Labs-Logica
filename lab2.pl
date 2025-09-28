%lab2
%deportes
usa_balon(futbol).
usa_balon(baloncesto).
usa_balon(voleibol).
usa_balon(beisbol).
usa_balon(handball).

se_juega_equipo(futbol).
se_juega_equipo(baloncesto).
se_juega_equipo(voleibol).
se_juega_equipo(beisbol).
se_juega_equipo(handball).

individual(tenis).
individual(natacion).
individual(atletismo).
individual(ajedrez).
individual(boxeo).

en_exterior(futbol).
en_exterior(beisbol).
en_exterior(atletismo).
en_exterior(natacion).
en_exterior(tenis).

en_interior(baloncesto).
en_interior(voleibol).
en_interior(ajedrez).
en_interior(handball).
en_interior(boxeo).

contacto(boxeo).
contacto(futbol).
contacto(handball).
sin_contacto(baloncesto).
sin_contacto(voleibol).
sin_contacto(tenis).
sin_contacto(natacion).
sin_contacto(atletismo).
sin_contacto(ajedrez).
sin_contacto(beisbol).

%Clases
es_de_equipo(X) :- se_juega_equipo(X).
es_individual(X) :- individual(X).
es_con_balon(X) :- usa_balon(X).
es_de_contacto(X) :- contacto(X).
es_sin_contacto(X) :- sin_contacto(X).
es_en_interior(X) :- en_interior(X).
es_en_exterior(X) :- en_exterior(X).
%preguntas
preguntar(Pregunta, Respuesta) :-
    write(Pregunta), write(' (si/no): '), nl,
    read(Respuesta).


identificar_deporte(Deporte) :-
    preguntar('¿Se juega en equipo?', Equipo),
    (Equipo == si ->
        preguntar('¿Se usa un balón?', Balon),
        (Balon == si ->
            preguntar('¿Se juega en interior?', Interior),
            (Interior == si ->
                preguntar('¿Hay contacto físico?', Contacto),
                (Contacto == si -> Deporte = handball ; Deporte = baloncesto)
            ;
                preguntar('¿Se juega con los pies?', Pies),
                (Pies == si -> Deporte = futbol ; Deporte = beisbol)
            )
        ;
            Deporte = voleibol)
    ;
        preguntar('¿Se practica en interior?', InteriorInd),
        (InteriorInd == si ->
            preguntar('¿Es un deporte de combate?', Combate),
            (Combate == si -> Deporte = boxeo ; Deporte = ajedrez)
        ;
            preguntar('¿Se practica en agua?', Agua),
            (Agua == si -> Deporte = natacion ;
                preguntar('¿Se juega con raqueta?', Raqueta),
                (Raqueta == si -> Deporte = tenis ; Deporte = atletismo))
        )
    ),
    write('Creo que el deporte es: '), write(Deporte), nl.

posibles_deportes(Lista) :-
    findall(D, (es_de_equipo(D); es_individual(D)), Lista).
