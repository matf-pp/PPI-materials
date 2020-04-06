//  Klase se u Scali konstruisu na sledeci nacin:
//
//  class ImeKlase {
//  teloKlase
//  }
//    ili
//  class ImeKlase (argumentiKonstruktora) {
//  teloKlase
//  }

class Film {
  var naslov : String = ""
  var trajanje : Int = 0
  var godina : Int = 0

  // Konstruktor
  def this(nas : String, traj : Int, god : Int) = {
    this()
    this.naslov = nas
    this.trajanje = traj
    this.godina = god
  }

  // Metodi klase

  def getNaslov() : String = {
    // Poslednja naredba u metodu je njena povratna vrednost,
    // tako da ne mora da se koristi `return` kljucna rec
    return this.naslov
    // Slicno, blok ne mora da postoji ako funkcija
    // ima samo jednu naredbu
  }

  // Konvencija je da ukoliko je metod cist (nema sporednih efekata)
  // i ako nema argumenata, da se onda ne pisu zagrade. IntelliJ daje
  // upozorenje kada se ova konvencija ne prati
  def getTrajanje() : Int = this.trajanje

  def getGodina : Int = this.godina

  override def toString : String = {
    "Film " + this.naslov + ", traje " + this.trajanje + " minuta, napravljen je " + this.godina + " godine"
  }
}

// Nasledjivanje
class CrtaniFilm extends Film {
  var animator : String = ""

  def this(nas : String, traj : Int, god : Int, anim : String) = {
    this()
    this.naslov = nas
    this.trajanje = traj
    this.godina = god
    this.animator = anim
  }

  def getAnimator : String = this.animator

  override def toString : String =  "Crtani " + super.toString() + ", animator je " + this.animator
}

// U Scali mozemo definisati takozvane 'singleton' objekte kljucnom reci object.
// Garantuje se da ce postojati tacno jedan 'singleton' objekat na nivou naseg programa
// i on se najcesce koristi za implementaciju main metoda
object Program {
  def main(args: Array[String]) {

    val assassinsCreed = new Film("Assassin's Creed", 115, 2016)
    val tarzan = new CrtaniFilm("Tarzan", 88 , 1999, "Walt Disney")

    println(assassinsCreed)
    println(tarzan)

    //  Scala nudi brojne korisne kontejnerske i nizovske klase
    //  kao sto su Array, ArrayBuffer, Map, HashMap, Queue, Tuple1, Tuple2, i druge
    //  sa kojima cemo se susretati u narednim primerima
    //  gde ce biti vise objasnjene
  }
}