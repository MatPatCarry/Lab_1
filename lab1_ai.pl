mother(ilona, piotrek).
mother(ela, maciej).
mother(teresa, ilona).
mother(teresa, zbyszek).
father(maciej, piotrek).
father(andrzej, maciej).
father(mieczyslaw, ilona).
woman(ilona).
woman(ela).
woman(teresa).
man(piotrek).
man(maciej).
man(andrzej).
man(zbyszek).
man(mieczyslaw).
parent(Parent, Child):- mother(Parent, Child);father(Parent, Child),Parent\==Child.
child(Child, Parent):- mother(Parent, Child);father(Parent, Child),Parent\==Child.
grandfather(Granddad, Grandchild) :- father(Granddad, Parent),parent(Parent, Grandchild),Granddad\==Parent,Parent\==Grandchild,Granddad\==Grandchild.
grandmother(Grandmum, Grandchild) :- mother(Grandmum, Parent),parent(Parent, Grandchild),Grandmum\==Parent,Parent\==Grandchild,Grandmum\==Grandchild.
son(Son, Parent) :- child(Son, Parent),man(Son),Son\==Parent.
doughter(Doughter, Parent) :- child(Doughter, Parent),woman(Doughter),Doughter\==Parent.
brother(Brother, Sibling) :- child(Brother, Parent),child(Sibling, Parent),man(Brother),Brother\==Sibling,Brother\==Parent,Sibling\==Parent.
sister(Sister, Sibling) :- child(Sister, Parent),child(Sibling, Parent),woman(Sister),Sister\==Sibling,Sister\==Parent,Sibling\==Parent.
unclem(Uncle, Nephew) :- mother(Mother, Nephew),brother(Uncle, Mother),Uncle\==Nephew,Uncle\==Mother,Nephew\==Uncle.
unclef(Uncle, Nephew) :- father(Father, Nephew),brother(Uncle, Father),Uncle\==Nephew,Uncle\==Father,Nephew\==Uncle.
aunt(X,Y) :- mother(Z,Y),sister(X,Z),X\==Y,X\==Z,Y\==Z.
aunt(X,Y) :- father(Z,Y),sister(X,Z),X\==Y,X\==Z,Y\==Z.
descendant(X,Y) :- parent(Y,X).
descendant(X,Y) :- parent(Z,X),descendant(Z,Y).
ancestor(X,Y) :- child(Y,X).
ancestor(X,Y) :- child(Z,X),ancestor(Z,Y).
wife(X,Y) :- women(X),child(Z,X),child(Z,Y),X\==Y,X\==Z,Y=\=Z.
husband(X,Y) :- women(X),child(Z,X),child(Z,Y),X\==Y,X\==Z,Y\==Z.
cousin(X,Y) :- man(X),child(X,Z),unclem(Z,Y),X\==Y,X\==Z,Y\==Z.
cousin(X,Y) :- man(X),child(X,Z),aunt(Z,Y),X\==Y,X\==Z,Y=\=Z.
cousin(X,Y) :- man(X),child(X,Z),unclef(Z,Y),X\==Y,X\==Z,Y\==Z.
wypisz([]).
wypisz([G|O]) :- print(G),nl,wypisz(O).
wypisz_k([]).
wypisz_k([G|O]) :- wypisz_k(O),nl,print(G).
lista_dzieci(R, Dzieci) :- findall(Dziecko, parent(R, Dziecko), Dzieci).
zlicz([], 0).
zlicz([G|O], Liczba) :- zlicz(O, Liczba1),Liczba is Liczba1+1.
liczba_dzieci(R, Liczba_Dzieci) :- lista_dzieci(R, Dzieci),zlicz(Dzieci, Liczba_Dzieci).


