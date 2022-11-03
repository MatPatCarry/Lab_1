get_slodkie(Result) :- get(Char),              % read a character
                     get0(_),                % consume the Return after it
                     interpret(Char,Result),
                     !.                      % cut -- see text

get_slone(Result) :- nl,
                     write('Czy masz ochotę na słone danie? (T/N)'),
                     get_slone(Result).

interpret(84,tak).  % ASCII 89  = 'T'
interpret(116,tak). % ASCII 121 = 't'
interpret(78,no).   % ASCII 78  = 'N'
interpret(110,no).  % ASCII 110 = 'n'
