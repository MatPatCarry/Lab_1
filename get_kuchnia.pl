
get_kuchnia(Result) :- nl,
                         write('Na jaka kuchnie masz ochote? Podaj index 1-4'),nl,
                         write('1.Polska'),nl,
                         write('2.Amerykanska'),nl,
                         write('3.Azjatycka'),nl,
                         write('4.Wloska'),nl,
                        get(Char),
                        getByIndex(['Polska','Amerykanska','Azjatycka','Wloska'],Result,X),
                        % getByIndex(['Polska','Amerykanska','Azjatycka','Wloska'],interpret(Char,Result),X),
                        write(X),
                        !.
                        
get_kuchnia(Result):- nl,
                         write('Na jaka kuchnie masz ochote? Podaj index 1-4'),nl,
                         write('1.Polska'),nl,
                         write('2.Amerykanska'),nl,
                         write('3.Azjatycka'),nl,
                         write('4.Wloska'),nl,
                         get_kuchnia(Result).



getByIndex([X], 0, X).
getByIndex([H|_], 0, H).
getByIndex([_|T], I, E) :- NewIndex is I-1, getByIndex(T, NewIndex, E).

%interpret(49,1). % Polska
%interpret(50,2). % Amerykanska
%interpret(51,3). % Azjatycka
%interpret(52,4). % Wloska
