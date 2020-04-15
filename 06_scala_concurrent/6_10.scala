import java.io._
import java.util.Scanner
import scala.collection.mutable.ArrayBuffer

class BrojacPetocifrenih(dat : String) extends Thread {

  var rezultat : Int = 0
  // Citamo brojeve iz datoteke i povecavamo lokalni brojac
  // ukoliko je broj petocifren
  override def run() {
    val sc : Scanner = new Scanner(new File(dat))

    while(sc.hasNextInt()){
      val broj = sc.nextInt()
      if(broj >= 10000 && broj <= 99999)
        this.rezultat+=1
    }
  }

  def getRezultat: Int = rezultat
  def getDatoteka: String = dat
}

object BrojPetocifrenih {
  def main(args : Array[String]){

    val sc = new Scanner(System.in)

    val brojaci = ArrayBuffer[BrojacPetocifrenih]()
    var kraj = false
    var odg = ""
    var dat = ""

    while(!kraj) {
      println("Da li zelite da zadate ime datoteke koja ce biti obradjena (y/n)?")
      odg = sc.next()
      if(odg.toLowerCase() == "n")
        kraj = true
      else{
        println("Unesite ime datoteke: ")
        dat = sc.next()
        brojaci.append(new BrojacPetocifrenih(dat))
      }
    }

    //   Zapocinjemo izvrsavanje
    for(brojac <- brojaci)
      brojac.start()

    //   Pozivom metoda join cekamo sve brojace da zavrse sa izracunavanjem
    for(brojac <- brojaci)
      brojac.join()

    //   Citamo rezultate brojanja svake niti
    for(brojac <- brojaci)
      println(s"Datoteka ${brojac.getDatoteka} sadrzi ${brojac.getRezultat} petocifrenih brojeva.")
  }
}