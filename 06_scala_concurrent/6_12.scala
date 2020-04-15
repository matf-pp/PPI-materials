import java.util.concurrent._
import java.util.Scanner
import java.io.File

class Ucesnik(ime : String,
              cena : Int,
              dobitnici : Array[String])
  extends Thread {

  override def run() {
    //  Cekamo dok se ne zavrsi izvlacenje.
    //
    //  Metod wait() suspenduje nit, oslobadja kriticnu sekciju obmotanu synchronized blokom
    //  i dozvoljava drugim nitima koje su zakljucale isti objekat da udju u kriticnu sekciju
    //  sve dok neka druga nit ne pozove nad istim objektom metod notifyAll()
    //  cime se obavestavaju sve niti koje cekaju sa metodom wait()
    //  da mogu nastaviti sa radom
    //
    dobitnici.synchronized {
      dobitnici.wait()
    }
    for(d <- dobitnici)
      if(d == ime){
        println("Cestitamo " + ime +
          "!!! Osvojili ste popust od 20% na cenu karte. Vasa karta sada kosta " + cena*0.8 + "e.")
        return
      }
    println("Nazalost " + ime +
      " niste osvojili popust, vise srece drugi put. Vasa karta kosta " + cena + "e.")

  }

  def getIme: String = ime
}

object TuristickaAgencija {
  def main(args : Array[String]) {
    val sc : Scanner = new Scanner(new File("ucesnici.txt"))

    val dobitnici = new Array[String](5)
    val n = sc.nextInt()
    sc.nextLine()
    val ucesnici = new Array[Ucesnik](n)
    for(i <- 0 until n){
      ucesnici(i) = new Ucesnik(sc.nextLine(), sc.nextInt(), dobitnici)
      sc.nextLine()
    }

    for(u <- ucesnici)
      u.start()

    println("Izvlacenje je u toku.")
    Thread.sleep(5000)
    //   Ulazimo u kriticnu sekciju, i racunamo dobitnike nagradnih popusta
    dobitnici.synchronized {
      val izvuceniIndeksi = ThreadLocalRandom.current().ints(0, n).distinct().limit(5).toArray
      for(j <- 0 until izvuceniIndeksi.length)
        dobitnici(j) = ucesnici(izvuceniIndeksi(j)).getIme

      //   Kada su izracunati dobitnici, obavestavamo niti koje cekaju
      //   i izlazimo iz kriticne sekcije
      dobitnici.notifyAll()
    }

  }
}