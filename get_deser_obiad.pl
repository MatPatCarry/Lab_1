get_obiad_deser(Result) :- get(Char),              % read a character
                            get0(_),                % consume the Return after it
                            interpret(Char,Result),
                            !.                      % cut -- see text

get_obiad_deser(Result) :- nl,
                         write('Chcesz zamówić obiad czy deser?'),
                         get_obiad_deser(Result).

interpret(68,deser).  % ASCII 89  = 'D'
interpret(100,deser). % ASCII 100 = 'd'
interpret(79,obiad).   % ASCII 78  = 'O'
interpret(111,obiad).  % ASCII 110 = 'o'



