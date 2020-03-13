-- Ovako pisemo jednolinijske komentare

{-
    Ovako pisemo
    viselinijske
    komentare
-}

{-
  Pretpostavljamo da smo instalirali Glasgow Haskell Compiler - ghc 
  (uz njega dolazi i interpreter - ghci)

  Pokrenimo interpreter (ghci):

  GHCi, version 8.0.1: http://www.haskell.org/ghc/  :? for help
  Prelude>

  Sa interpreterom mozemo direktno komunicirati, npr:
  Prelude> print "Zdravo! :)"
  "Zdravo! :)"

  Specijalne komande za interpreter pocinju sa `:`

  Interpretatoru dodajemo mogucnost izvrsavanja funkcija iz izvorne
  datoteke ime_programa.hs komandom `:load` ili krace `:l`:

  :load ime_programa.hs

  Nakon toga mozemo pokrenuti sve funkcije koje su u toj datoteci 
  definisane, npr.

  Prelude> main
  "Zdravo! :)"

  Ukoliko promenimo sadrzaj izvornih fajlova, mozemo naterati 
  interpreter da ih ponovo ucita komandom `:r`

  Iz interpretera se izlazi komandom `:quit` ili krace `:q` 
  Prelude> :quit 

  Haskell programe takodje mozemo kompajlirati uz pomoc ghc-a:

  ghc ime_programa.hs

  I onda ih normalno pokrenuti:

  ./ime_programa
-}

main = print "Zdravo! :)"
