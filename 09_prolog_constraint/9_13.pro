/*
Primer magicne sekvence za N=5:
[2,1,2,0,0]

Izvrsavanje programa za gornji primer (1 sa desne strane kad je uslov S[J]#=I ispunjen, 0 kad nije):
sum([(S[J]#=I) : J in 1..N])#=S[I+1])
I=0
   S[1]==0 0 
   S[2]==0 0
   S[3]==0 0
   S[4]==0 1
   S[5]==0 1
   ------
   ukupno 2       
   S[1]==2 tacno! (imamo dve nule)  
I=1
   S[1]==1 0
   S[2]==1 1
   S[3]==1 0
   S[4]==1 0
   S[5]==1 0
   ------
   ukupno 1  
   S[2]==1 tacno! (imamo jednu jedinicu)
I=2
   S[1]==2 1
   S[2]==2 0
   S[3]==2 1
   S[4]==2 0
   S[5]==2 0
   ------
   ukupno 1  
   S[3]==2 tacno! (imamo dve dvojke)
I=3
   S[1]==3 0
   S[2]==3 0
   S[3]==3 0
   S[4]==3 0
   S[5]==3 0
   ------
   ukupno 0  
   S[4]==0 tacno! (imamo 0 trojki)

I=4
   S[1]==4 0
   S[2]==4 0
   S[3]==4 0
   S[4]==4 0
   S[5]==4 0
   ------
   ukupno 0  
   S[5]==0 tacno! (imamo 0 cetvorki)

*/

/*

Zadavanje listi u obliku: [T : E1 in D1, . . ., En in Dn, LocalVars, Goal]
- za svaku kombinacija vrednosti E1,...,En, ako predikat Goal uspe, T se
dodaje u listu
- LocalVars i Goal su opcioni argumenti

*/
magicna(N):- length(S,N),
		S :: 0..N-1,
/* dodajemo ogranicenja:
element na poziciji S[I+1] treba da bude jednak broju elemenata liste koji su jednaki sa I, taj broj dobijamo sumiranjem liste ciji su elementi poredjenja na jednakost elementa liste sa trazenim brojem I  
*/		
		foreach(I in 0..N-1,
		sum([(S[J] #= I) : J in 1..N]) #= S[I+1]),
		labeling(S),
		writeln(S), fail. % da bismo dobili sve, a ne samo jednu magicnu sekvencu dodajemo fail predikat na kraj
