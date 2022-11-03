kuchnia(1, polska).
kuchnia(2, amerykanska).
kuchnia(3, azjatycka).
kuchnia(4, wloska).

kuchnia_polska(1, schabowy).
kuchnia_polska(2, pierogi).


kuchnia_amerykanska(1, hamburger).
kuchnia_amerykanska(2, hotDog).

kuchnia_azjatycka(1, ramen).
kuchnia_azjatycka(2, padthai).

kuchnia_wloska(1, pizza).
kuchnia_wloska(2, pasta).

slodki_obiad(1, nalesniki).
slodki_obiad(2, pierogi).


deser(1, lody).
deser(2, ciasto).

get_obiad_deser(Result) :- get(Char),              % read a character
                            get0(_),                % consume the Return after it
                            interpret1(Char,Result),
                            !.                      % cut -- see text

get_obiad_deser(Result) :- nl,
                            write('Wybierz obiad lub deser (O/D) : '),
                            nl,
                            get_obiad_deser(Result).

%------------------------------------------------------------------------                            

get_slone(Result) :- get(Char),              % read a character
                     get0(_),                % consume the Return after it
                     interpret2(Char,Result),
                     !.                      % cut -- see text

get_slone(Result) :- nl,
                     write('Odpowiedz, czy chcesz slone danie (T/N)'),
                     nl,
                     get_slone(Result).

%------------------------------------------------------------------------


write_kuchnia_list :-
    kuchnia(N, Name),
    write(N), write('. '), write(Name), nl,
    fail.
write_kuchnia_list.

read_kuchnia(KName) :-
    repeat,
    write('Wybierz rodzaj kuchni:'), nl,
    write_kuchnia_list,
    read(KNumber),
    (   kuchnia(KNumber, KName)
    ->  write('Wybrales kuchnie: '), write(KName), nl, !
    ;   write('Niepoprawny wybor, sproboj ponownie...'), nl, fail
    ).

%------------------------------------------------------------------------


write_slodki_obiad_list :-
    slodki_obiad(N, Name),
    write(N), write('. '), write(Name), nl,
    fail.
write_slodki_obiad_list.

read_slodki_obiad(KName) :-
    repeat,
    write('Wybierz danie na slodko z listy'), nl,
    write_slodki_obiad_list,
    read(KNumber),
    (   slodki_obiad(KNumber, KName)
    ->  write('Wybrales danie na sodko: '), write(KName), nl, !
    ;   write('Niepoprawny wybor, sproboj ponownie...'), nl, fail
    ).
%------------------------------------------------------------------------

write_deser_list :-
    deser(N, Name),
    write(N), write('. '), write(Name), nl,
    fail.
write_deser_list.

read_deser(KName) :-
    repeat,
    write('Wybierz danie na slodko z listy'), nl,
    write_deser_list,
    read(KNumber),
    (   deser(KNumber, KName)
    ->  write('Wybrales danie na sodko: '), write(KName), nl, !
    ;   write('Niepoprawny wybor, sproboj ponownie...'), nl, fail
    ).

%------------------------------------------------------------------------
write_polska_list :-
    kuchnia_polska(N, Name),
    write(N), write('. '), write(Name), nl,
    fail.
write_polska_list.

read_polska(KName) :-
    repeat,
    write('Wybierz danie z listy'), nl,
    write_polska_list,
    read(KNumber),
    (   kuchnia_polska(KNumber, KName)
    ->  write('Wybrales danie: '), write(KName), nl, !
    ;   write('Niepoprawny wybor, sproboj ponownie...'), nl, fail
    ).

%------------------------------------------------------------------------

write_amerykanska_list :-
    kuchnia_amerykanska(N, Name),
    write(N), write('. '), write(Name), nl,
    fail.
write_amerykanska_list.

read_amerykanska(KName) :-
    repeat,
    write('Wybierz danie z listy'), nl,
    write_amerykanska_list,
    read(KNumber),
    (   kuchnia_amerykanska(KNumber, KName)
    ->  write('Wybrales danie: '), write(KName), nl, !
    ;   write('Niepoprawny wybor, sproboj ponownie...'), nl, fail
    ).

%------------------------------------------------------------------------

write_azjatycka_list :-
    kuchnia_azjatycka(N, Name),
    write(N), write('. '), write(Name), nl,
    fail.
write_azjatycka_list.

read_azjatycka(KName) :-
    repeat,
    write('Wybierz danie z listy'), nl,
    write_azjatycka_list,
    read(KNumber),
    (   kuchnia_azjatycka(KNumber, KName)
    ->  write('Wybrales danie: '), write(KName), nl, !
    ;   write('Niepoprawny wybor, sproboj ponownie...'), nl, fail
    ).

%------------------------------------------------------------------------
write_wloska_list :-
    kuchnia_wloska(N, Name),
    write(N), write('. '), write(Name), nl,
    fail.
write_wloska_list.

read_wloska(KName) :-
    repeat,
    write('Wybierz danie z listy'), nl,
    write_wloska_list,
    read(KNumber),
    (   kuchnia_wloska(KNumber, KName)
    ->  write('Wybrales danie: '), write(KName), nl, !
    ;   write('Niepoprawny wybor, sproboj ponownie...'), nl, fail
    ).

%------------------------------------------------------------------------

wybrano_obiad_deser(obiad) :- write('Czy masz ochote na slone? (T/N)'),
                              nl, 
                              get_slone(Resp2),
                              wybrano_slodkie_slone(Resp2).
                                

wybrano_obiad_deser(deser) :- write('Wybierz deser: '), 
                              nl,
                              read_deser(D).

%------------------------------------------------------------------------

wybrano_slodkie_slone(tak) :- read_kuchnia(Kuchnia),
                              wybrano_kuchnia(Kuchnia).

wybrano_slodkie_slone(nie) :- read_slodki_obiad(Slodki_Obiad).

%------------------------------------------------------------------------

wybrano_kuchnia(polska) :-read_polska(Kuchnia).
wybrano_kuchnia(amerykanska) :-read_amerykanska(Kuchnia).
wybrano_kuchnia(azjatycka) :-read_azjatycka(Kuchnia).
wybrano_kuchnia(wloska) :-read_wloska(Kuchnia).

interpret1(68,deser).  % ASCII 89  = 'D'
interpret1(100,deser). % ASCII 100 = 'd'
interpret1(79,obiad).   % ASCII 78  = 'O'
interpret1(111,obiad).  % ASCII 110 = 'o'

interpret2(84,tak).  % ASCII 89  = 'T'
interpret2(116,tak). % ASCII 121 = 't'
interpret2(78,nie).   % ASCII 78  = 'N'
interpret2(110,nie).  % ASCII 110 = 'n'





start :- 
    write('Ten program pomaga Ci zamowic jedzenie na ktore masz ochote.'),nl,
    write('Na pytania o wybor to lub to odpowiadaj pierwsza litera wybranej opcji.'),nl,
    write('Czasem bedziesz poproszony o wskazanie elementu z listy, podaj jego index (numerowane od 1)'),nl,nl,
    write('Wolisz obiad czy deser? (O/D)'),
    nl,
    get_obiad_deser(Result1),
    wybrano_obiad_deser(Result1).
    
