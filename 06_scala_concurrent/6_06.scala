import java.util.concurrent._
import java.util.Scanner
import java.io.File
import scala.collection.mutable.ArrayBuffer

class Brojac(poc : Int, kraj : Int,
            linije : ArrayBuffer[String],
            mapaKaraktera : ConcurrentHashMap[Char, Int])
  extends Thread {

  override def run() {
    for(i <- poc until kraj){
      //  Racunamo broj svakog karaktera u liniji
      val a = linije(i).count(_=='a')
      val c = linije(i).count(_=='c')
      val g = linije(i).count(_=='g')
      val t = linije(i).count(_=='t')

      //  Synchronized kljucna rec obelezava kriticnu sekciju
      //  i garantuje se da u svakom trenutku tacno jedna nit moze izvsavati naredbe iz bloka.
      //  Synchronized se moze koristiti na vise nacina:
      //
      //  Metodi klase
      //
      //  def f() = synchronized { teloFunkcije }
      //
      //  Na ovaj nacin smo naglasili da je metod f jedne instance nase klase kriticna sekcija
      //  i u svakom trenutku tacno jedna nit moze izvrsavati ovaj metod te instance.
      //
      //  Blok instance
      //
      //  instanca.synchronized { blok }
      //
      //  Na ovaj nacin smo naglasili da za datu instancu u svakom trenutku
      //  tacno jedna nit moze izvrsavati naredbe bloka
      //  Ovakvo ponasanje mozemo posmatrati i iz drugacijeg ugla.
      //  Instanca predstavlja monitor objekat.
      //  U trenutku kada nit pozeli da izvrsava blok kriticne sekcije,
      //  ona zakljuca instancu, izvrsi kriticnu sekciju i otkljuca instancu.
      //
      //  Treba teziti ka tome da kriticna sekcija bude sto manja
      //  kako bismo sto vise iskoristili prednosti konkurentnog izvrsavanja
      //
      //  TODO: Zakomentarisati synchronized blok i videti sta se desava prilikom pokretanja programa
      //  sa razlicitim brojem niti.
      //  Moguci scenario je da jedna nit procita vrednost iz mape, druga nit nakon toga azurira mapu,
      //  a prva nit i dalje drzi vrednost koju je procitala pre azuriranja tako da kada ona azurira mapu
      //  rezultat azuriranja nece biti ispravan.
      //
      mapaKaraktera.synchronized {
        mapaKaraktera.replace('a', mapaKaraktera.get('a')+a)
        mapaKaraktera.replace('c', mapaKaraktera.get('c')+c)
        mapaKaraktera.replace('g', mapaKaraktera.get('g')+g)
        mapaKaraktera.replace('t', mapaKaraktera.get('t')+t)
      }
    }
  }
}

object BrojKarakteraDNK {
  def main(args : Array[String]) {
    val sc1 : Scanner = new Scanner(new File("bio_podaci.txt"))
    val sc2 : Scanner = new Scanner(System.in)

    println("Unesite broj niti: ")
    println("Broj procesora na racunaru koji su na raspolaganju je : " + Runtime.getRuntime.availableProcessors())

    val brojNiti = sc2.nextInt()

    val brojaci = new Array[Brojac](brojNiti)
    //  Klasa ArrayBuffer predstavlja niz promenljive duzine
    //  Neki od korisnih metoda su:
    //  - append(e) - dodaje element na kraj niza
    //  - isEmpty() - vraca true ukolik je niz prazan, false inace
    //  - insert(i, e) - dodaje element na datu poziciju
    //  ...
    val linije = new ArrayBuffer[String]()

    while(sc1.hasNextLine)
      linije.append(sc1.nextLine())

    val brojLinija = linije.length
    println(brojLinija)

    //  Klasa ConcurrentHashMap predstavlja implementaciju mape cije su operacije bezbedne u kontekstu konkurentnog izvrsavanja.
    //  To znaci da u svakom trenutku tacno jedna nit moze izvrsavati operacije nad mapom.
    //  Medjutim, operacije citanja (get) su neblokirajuce, tako da se mogu preklopiti sa drugim operacijama (npr. azuriranja)
    //  i u takvim slucajevima se ne garantuje azurnost rezultata.
    //
    //  Konstruktor prima tri argumenta:
    //   - inicijalni kapacitet mape
    //   - faktor povecavanja mape
    //   - broj niti koji se pretpostavlja da ce konkurentno pristupati objektu mape
    //
    //  Neki od korisnih metoda klase ConcurrentHashMap su:
    //   - get(kljuc) - vraca element sa zadatim kljucem, odnosno null ukoliko takav ne postoji
    //   - put(kljuc, vrednost) - dodaje element sa zadatim parametrima
    //   - remove(kljuc) - uklanja element sa zadatim kljucem
    //   - replace(kljuc, vrednost) - postavlja vrednost elementu sa zadatim kljucem
    //   - size() - vraca velicinu mape
    //   - isEmpty() - vraca true ukoliko je mapa prazna, false inace
    //   ...
    //
    val mapaKaraktera = new ConcurrentHashMap[Char, Int](4,4,brojNiti)
    mapaKaraktera.put('a', 0)
    mapaKaraktera.put('c', 0)
    mapaKaraktera.put('g', 0)
    mapaKaraktera.put('t', 0)

    val korak = Math.ceil(brojLinija.toDouble/brojNiti.toDouble).toInt

    for(i <- 0 until brojNiti)
      brojaci(i) = new Brojac(i*korak, Math.min((i+1)*korak, brojLinija), linije, mapaKaraktera)

    for(b <- brojaci)
      b.start()

    for(b <- brojaci)
      b.join()

    println("Rezultati konkurentnog izvrsavanja")
    println("A: " + mapaKaraktera.get('a'))
    println("C: " + mapaKaraktera.get('c'))
    println("G: " + mapaKaraktera.get('g'))
    println("T: " + mapaKaraktera.get('t'))

    println("Pravi rezultati \nA: 1761 \nC: 1577 \nG: 1589 \nT: 1913")
  }
}