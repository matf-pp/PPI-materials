import java.util.concurrent._
import java.util.Scanner
import java.io.File
import scala.collection.mutable.HashMap
import scala.collection.mutable.ArrayBuffer

class Kladionicar(ime : String,
                  novac : Int,
                  tiket : HashMap[String, Char],
                  utakmice : HashMap[String, (Float, Float, Float, Char)])
  extends Thread {

  var zarada : Float = 0

  override def run(){
    //  Cekamo da se odigraju sve utakmice
    //  Funkcije wait(), notify() i notifyAll()
    //  moraju biti zakljucane unutar bloka synchronized
    utakmice.synchronized {
      utakmice.wait()
    }

    var pogodjeno = 0
    var ukupnaKvota : Float = 0
    //  Racunamo ukupnu zaradu
    for(t <- tiket)
      if(t._2 == utakmice(t._1)._4){
        println(ime + " je pogodio utakmicu " + t._1 + " - " + utakmice(t._1)._4)
        pogodjeno += 1
        if(utakmice(t._1)._4 == '1')
          ukupnaKvota += utakmice(t._1)._1
        else if(utakmice(t._1)._4 == 'x')
          ukupnaKvota += utakmice(t._1)._2
        else if(utakmice(t._1)._4 == '2')
          ukupnaKvota += utakmice(t._1)._3
      }
    if(pogodjeno != 0)
      zarada = ukupnaKvota * novac/pogodjeno
  }

  def getIme : String = ime
  def getZarada : Float = zarada
}

object Kladionica {
  def main(args : Array[String]) {
           val sc1 : Scanner = new Scanner(new File("utakmice.txt"))
           val sc2 : Scanner = new Scanner(new File("kladionicari.txt"))
    //  Klasa HashMap iz paketa scala.collection.mutable
    //  predstavlja implementaciju mape koja se moze azurirati (eng. mutable)
    //
    //  Neke od korisnih funkcija su:
    //  -put(k,v) - dodaje vrednost u mapu sa zadatim kljucem
    //  -size - vraca velicinu mape
    //  -contains(k) - vraca true ukoliko postoji element sa zadatim kljucem, false inace
    //  ...
    //
    //  Takodje mozemo iterirati kroz elemente mape for petljom
    //
    //  Klasa Tuple4 je jedna u nizu klasa koje implementiraju torke (Tuple1, Tuple2, Tuple3,...)
    //  koje se mogu azurirati.
    //  Elementima torke pristupamo na sledeci nacin - torka._1, torka._2, torka._3, torka._4

    val utakmice = new HashMap[String, (Float, Float, Float, Char)]()

    //  Rezultate utakmica postavljamo da budu karakter '-'
    //  kako bismo naglasili da se utakmice jos nisu odigrale
    while(sc1.hasNextLine){
      utakmice.put(sc1.nextLine(),(sc1.nextFloat(), sc1.nextFloat(), sc1.nextFloat(), '-'))
      sc1.nextLine()
    }
    val kladionicari = new ArrayBuffer[Kladionicar]()

    while(sc2.hasNextLine) {
      val ime = sc2.next()
      val novac = sc2.nextInt()
      val tiket = new HashMap[String, Char]()
      for(i <- 0 until 5){
        sc2.nextLine()
        tiket.put(sc2.nextLine(), sc2.next()(0))
      }
      kladionicari.append(new Kladionicar(ime, novac, tiket, utakmice))
    }

    for(k <- kladionicari)
      k.start()

    println("Cekamo da se utakmice odigraju.")
    Thread.sleep(5000)

    //  Racunamo rezultate utakmica
    val res = Array('1','x', '2')
    for(u <- utakmice)
      utakmice(u._1) = (u._2._1,
        u._2._2,
        u._2._3,
        res(ThreadLocalRandom.current().nextInt(0, 3))
      )

    //  Ulazimo u kriticnu sekciju
    //  i obavestavamo niti koje cekaju
    utakmice.synchronized {
      utakmice.notifyAll()
    }

    for(k <- kladionicari)
      k.join()

    var isplata : Float = 0
    for(k <- kladionicari){
      isplata += k.getZarada
      println(k.getIme + " ceka na isplatu " + k.getZarada + " dinara.")
    }
    println("Ukupno kladionica treba da isplati " + isplata + " dinara.")
  }
}