import java.util.concurrent._
import java.util.Scanner

// Pravljenje niti
//
// Da bismo napravili nit potrebno je da definisemo klasu koja nasledjuje klasu Thread
// i implementiramo metod run cije izvrsavanje pocinje kada nad instancom nase klase
// pozovemo metod start.
//
// Drugi nacin je da nasa klasa implementira interfejs Runnable i implementira metod run.
// Medjutim, da bismo naglasili da zelimo da se metod run nase instance izvrsava kao posebna nit
// potrebno je da napravimo instancu tipa Thread kojoj u konstruktoru treba da prosledimo
// instancu nase klase (koja implementira metod run.

class Konobar(ime : String, brStolova : Int) extends Thread {
  override def run(){
    for(i <- 0 until brStolova){
      //  Klasa ThreadLocalRandom predstavlja generator slucajnih brojeva
      //  jedinstven na nivou jedne niti.
      //  Metod current() vraca objekat ove klase za trenutnu nit.
      Thread.sleep(ThreadLocalRandom.current().nextInt(1,10)*1000)
      println("Konobar " + ime + " je usluzio " + i + ". sto.")
    }
    println("Konobar " + ime + " je zavrsio sa posluzivanjem.")
  }
}

object Restoran {
  def main(args : Array[String]) {
    val sc : Scanner = new Scanner(System.in)

    println("Unesite broj neusluzenih stolova u restoranu: ")
    val brojStolova = sc.nextInt()

    val korak = Math.ceil(brojStolova/5.0).toInt

    //   Pravimo instance niti
    val stefan = new Konobar("Stefan", korak)
    val nikola = new Konobar("Nikola", korak)
    val filip = new Konobar("Filip", korak)
    val nebojsa = new Konobar("Nebojsa", korak)
    val djordje = new Konobar("Djordje", brojStolova - 4*korak)

    //   Ukoliko nasa klasa implementira interfejs Runnable
    //   val stefan = new Thread(new Konobar("Stefan", 10))

    //   Metod start zapocinje izvrsavanje metoda run
    stefan.start()
    nikola.start()
    filip.start()
    nebojsa.start()
    djordje.start()
    // Nevalidno, tj ne radi kako ocekujemo: stefan.run()
  }
}