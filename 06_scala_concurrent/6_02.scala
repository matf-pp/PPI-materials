object Uvod {
 		def main(args: Array[String]) {

      println("------- Promenljive -------")

//    Promenljive mozemo deklarisati kao konstantne 
//    ili promenljive cija se vrednost moze menjati.
//    Kljucna rec val deklarise konstantu a var promenljivu.
//    
//    kljucnaRec imePromenljive : tipPromenljive = vrednost

      val c : Int = 42
      var x : Int = 6
    
      x += 6

//    Sledeca naredba prijavljuje gresku.
//    `c += 4` 
 		 
      println("Konstanta: " + c)
      println("Promenljiva: " + x)
   
      if(x > 6)
        println("Promenljiva x je veca od 6.")
      else if(x == 6)
        println("Promenljiva x je jednaka 6.")
      else
        println("Promenljiva x je manja od 6.")
    
      println("------- Niske -------")
 		    
      val crtani : String = "Maza i Lunja"
      println("Duzina niske: '" + crtani + "' je " + crtani.length())
      
//    Viselinijske niske pisemo izmedju trostrukih navodnika:
 		  println(""" Likovi:
                  -Alisa
                  -Vendi
                  -Bambi
                  -Had
              """)

//    Interpolacija niski:
//    Scala nam dozvoljava da ugnjezdavamo vrednosti promenljivih u niske
// 		dodavanjem karaktera s na pocetak niske (npr: s"Moja niska") omogucavamo
// 		ugnjezdavanje vrednosti promenljivih u nisku dodavajuci karakter $ pre imena promenljive
// 		(npr s"Kolicina: $kol grama")
 		  
      var trajanje : Int = 76	
      println(s"Crtani film: '$crtani' - $trajanje minuta.")
 		
      println("------- Petlje -------")
 		 
 		  var sat = 0
 		  while(trajanje >= 60){
 		    sat += 1
 		    trajanje -= 60
 		  }
 		   
 		  println(s"'$crtani' traju $sat sat i $trajanje minuta.")
 		  
// 		For petljom mozemo iterirati kroz kolekcije koristeci sintaksu
// 		  
//    for(element <- kolekcija)
// 		    
// 		1 to 5 - pravi kolekciju brojeva [1,5] 
 		  
 		  println("FOR - 1 to 5 ")
 		  for(i <- 1 to 5)
 		    println(i)
 		
// 		1 until 5 - pravi kolekciju brojeva [1,5)  
 		    
 		  println("FOR - 1 until 5 ")
 		  for(i <- 1 until 5)
 		    println(i)
 		    
//    Range(pocetak, kraj, korak) - pravi kolekciju [pocetak, kraj) sa zadatik korakom.
// 		Korak moze biti i negativan npr. Range(10,0,-2)
 		    
 		  println("FOR - Range(0,6,2) ")
 		  for(i <- Range(0,6,2))
 		    println(i)
 		    
 		    
 	    println("------- Nizovi -------")
// 		Pravimo ih na sledeci nacin:
// 		  var niz : Array[tip] = new Array[tip](brojElemenata)
 		  var crtaci : Array[String] = new Array[String](5)
 		  crtaci(0) = "Petar Pan"
 		  crtaci(1) = "Mulan"
 		  crtaci(2) = "Aladdin"
 		  crtaci(3) = "Herkules"
 		  crtaci(4) = "Pocahontas"
 		   
 	    println("Crtaci: ")
 		  for(crtac <- crtaci)
 		    println(crtac)
 		  
 		  println("------- Funkcije -------")   
 		  ispisiSortirano(crtaci)
 	}
	
// 	  def imeFunkcije([listaArgumenata]) : povratnaVrednost = {
//          teloFunkcije 		
//    }
 		
//  Povratna vrednost Unit je ekvivalentna void vrednosti
 		def ispisiSortirano(crtaci : Array[String]) : Unit = {
 		  println("Sortirani crtaci:")
 		  for(crt <- crtaci.sortWith(poredi))
 		     println(crt)
 		     
//   Anonimne funkcije
// 		  
//	  ( listaArgumenata ) => { teloFunkcije }
 		  
 		  println("Sortirani crtaci koristeci anonimnu funkciju:")
 		  for(crt <- crtaci.sortWith((c1 , c2) => { if(c1.compareTo(c2) < 0) false else true} ))
 		     println(crt)
 		  
 		}
 		
 		def poredi(c1 : String, c2 : String) : Boolean = {
 		  if(c1.compareTo(c2) < 0)
 		    return true
 		  else
 		    return false
 		}
 	}

