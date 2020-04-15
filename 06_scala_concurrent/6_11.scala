import java.util.concurrent.atomic._
import java.util.concurrent._
import java.util.Scanner
import java.io.File

class Berac(drvoredi : ConcurrentLinkedQueue[(String, Int)],
            skladiste : AtomicIntegerArray) extends Thread {

  override def run() {

    while(true) {
      //  Dohvatamo dvored za berbu iz reda
      val drvored = drvoredi.poll()
      //  Ukoliko nema vise drvoreda za berbu zavrsavamo
      if(drvored == null)
        return
      println("Berac bere drvo " + drvored._1 )
      Thread.sleep(ThreadLocalRandom.current().nextInt(1,10)*1000)
      //  Dodajemo kilograme voca koje smo obrali u skladiste
      for(_ <- 0 until drvored._2){
        val obrano = ThreadLocalRandom.current().nextInt(30, 50)
        if(drvored._1 == "tresnje")
          skladiste.getAndAdd(0, obrano)
        else if(drvored._1 == "kruske")
          skladiste.getAndAdd(1, obrano)
        else if(drvored._1 == "kajsije")
          skladiste.getAndAdd(2, obrano)
        else if(drvored._1 == "sljive")
          skladiste.getAndAdd(3, obrano)
      }
    }
  }
}

object Berba {
  def main(args : Array[String]) {
    val sc1 : Scanner = new Scanner(new File("drvoredi.txt"))
    val sc2 : Scanner = new Scanner(System.in)

    //  Pravimo skladiste voca koje imamo u vocnjaku
    //  i postavljamo inicijalne kolicine voca.
    //  Klasa AtomicIntegerArray sadzi niz integer vrednosti
    //  nad kojima se operacije izvrsavaju atomicno.
    //  Slicno kao kod klasa AtomicInteger, AtomicLong i dr.
    val skladiste = new AtomicIntegerArray(4)
    skladiste.set(0,0)
    skladiste.set(1,0)
    skladiste.set(2,0)
    skladiste.set(3,0)
    //  Pravimo red drvoreda za berbu
    //  Svaki drvored je jedan par (voce, brojStabala).
    val drvoredi = new ConcurrentLinkedQueue[(String, Int)]()
    while(sc1.hasNextLine)
      drvoredi.add((sc1.next(), sc1.nextInt()))

    println("Unesite broj beraca: ")
    val brojBeraca = sc2.nextInt()

    val beraci = new Array[Berac](brojBeraca)
    for(i <- 0 until brojBeraca)
      beraci(i) = new Berac(drvoredi, skladiste)

    for(b <- beraci)
      b.start()

    for(b <- beraci)
      b.join()

    println("Tresanja je obrano: " + skladiste.get(0) + " kilograma.")
    println("Krusaka je obrano: " + skladiste.get(1) + " kilograma.")
    println("Kajsija je obrano: " + skladiste.get(2) + " kilograma.")
    println("Sljiva je obrano: " + skladiste.get(3) + " kilograma.")
  }
}