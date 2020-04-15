import java.util.concurrent.atomic._
import java.util.concurrent._
import java.util.Scanner
import java.io.File

class Sluzbenica(kamata : Int,
                 kapital : AtomicLong,
                 redKlijenata : ConcurrentLinkedQueue[Klijent],
                 zaduzeniKlijenti : ConcurrentLinkedQueue[Klijent])
  extends Thread {

  override def run() {
    while(true){
      //    Dohvatamo sledeceg klijenta iz reda
      var k : Klijent = redKlijenata.poll()
      //    Ukoliko takav ne postoji zavrsavamo
      if(k == null)
        return

      println("Klijent " + k.getIme() + " razgovara sa sluzbenicom.")
      Thread.sleep(ThreadLocalRandom.current().nextInt(1,10)*1000)
      //    Iako je kapital objekat AtomicLong i garantuje se atomicnost operacija azuriranja
      //    mogu nastati problemi prilikom konkurentnog pristupanja i azuriranja,
      //    i zbog toga je potrebno operacije sa ovim objektom obmotati synchronized blokom.
      //    Problem moze nastati u delu koda (******).
      //    Pretpostavimo da dve niti izvrsavaju ovaj deo koda konkurentno.
      //    Prva nit procita vrednost kapitala, nakon toga druga nit procita vrednost kapitala
      //    pre nego sto je prva nit izmenila vrednot, odmah posle prva nit promeni vrednost kapitala
      //    i postavi novu vrednot (staraVrednost - prvaPozajmica)/
      //    U ovom trenutku druga nit ima vrednost kapitala koja nije ispravna sa kojom dalje operise.
      //    Druga nit promeni vrednost kapitala i postavi novu vrednost (staraVrednost - drugaPozajmica)
      //    sto nije realna vrednost (staraVrednost - prvaPozajmica - drugaPozajmica)
      kapital.synchronized {
        if(k.getPozajmica > kapital.get())
          println("Klijent " + k.getIme() + " ne moze dobiti kredit.")
        else{
          k.setDug(k.getPozajmica*((100+kamata.toFloat)/100))
          //      ******
          val novKapital = kapital.get() - k.getPozajmica
          kapital.set(novKapital)
          //      ******
          println("Klijent " + k.getIme + " je dobio kredit u iznosu od "
            + k.getPozajmica + "e odnosno sa kamatom " + k.getDug + "e.")
          zaduzeniKlijenti.add(k)
        }
      }
    }
  }
}

class Klijent(ime : String, pozajmica : Int) {
  var dug : Float = 0

  def getIme : String = ime
  def getPozajmica : Int = pozajmica
  def getDug : Float = dug

  def setDug(d : Float) : Unit = {
    dug = d
  }
}

object Banka {
  def main(args : Array[String]) {
    //  Klasa AtomicLong predstavlja enkapsulaciju long integer vrednosti
    //  nad kojom se operacije azuriranja izvrsavaju atomicno.
    //
    //  Neki od korisnih metoda ove klase su:
    //   - get() - vraca trenutnu vrednost
    //   - set(v) - postavlja vrednost v
    //   - getAndAdd(v) - atomicki dodaje vrednost v i vraca prethodnu vrednost
    //   - addAndGet(v) - atomicki dodaje vrednost v i vraca novu vrednost
    //   - getAndIncrement() - atomicki inkrementira vrednost i vraca prethodnu vrednost
    //   - incrementAndGet() - atomicki inkrementira i vraca novu vrednost
    //   - getAndDecrement() - atomicki dekrementira vrednost i vraca prethodnu vrednost
    //   - decrementAndGet() - atomicki dekrementira i vraca novu vrednost
    //   - compareAndSet(ocekivanaVrednost, novaVrednost) - postavlja novu vrednost
    //   ukoliko je stara jednaka ocekivanoj
    //
    //   U paketu java.util.concurrent.atomic postoje i druge korisne klase kao sto su
    //   AtomicBoolean, AtomicIntegerArray, AtomicInteger itd.
    val sc1 : Scanner = new Scanner(System.in)

    println("Unesite pocetni kapital banke: ")
    val kapital = new AtomicLong(sc1.nextLong())
    val sacuvanKapital : Float = kapital.get()

    println("Unesite kamatnu stopu: ")
    val kamata = sc1.nextInt()

    println("Unesite broj sluzbenica u ekspozituri: ")
    val sluzbenice = new Array[Sluzbenica](sc1.nextInt())

    val sc2 : Scanner = new Scanner(new File("red_klijenata.txt"))

    //   Klasa ConcurrentLinkedQueue predstavlja implementaciju reda
    //  cije su operacije bezbedne u kontekstu konkurentnog izvrsavanja.
    //
    //   Neki od korisnih metoda su:
    //  - add(e) - dodaje element u red
    //  - poll() - skida element sa pocetka reda i vraca ga kao rezultat
    //  - peek() - vraca elelent sa pocetka reda (ne skida ga)
    //  - remove(e) - ukljanja element e iz reda
    //  - isEmpty() - vraca true ukoliko je red prazan
    //  ...
    //
    val redKlijenata = new ConcurrentLinkedQueue[Klijent]()
    val zaduzeniKlijenti  = new ConcurrentLinkedQueue[Klijent]()

    while(sc2.hasNextLine)
      redKlijenata.add(new Klijent(sc2.next(), sc2.nextInt()))

    // .indices() vraca Range svih indeksa niza
    for(i <- sluzbenice.indices)
      sluzbenice(i) = new Sluzbenica(kamata, kapital, redKlijenata, zaduzeniKlijenti)

    for(s <- sluzbenice)
      s.start()

    for(s <- sluzbenice)
      s.join()

    //  Iteriramo kroz red zaduzenih klijenata i racunamo ukupno zaduzenje
    var ukupnoZaduzenje : Float = 0
    val iterator = zaduzeniKlijenti.iterator()
    while(iterator.hasNext)
      ukupnoZaduzenje += iterator.next().getDug

    println(s"Banka je zaradila ${ukupnoZaduzenje-sacuvanKapital}e.")
  }
}