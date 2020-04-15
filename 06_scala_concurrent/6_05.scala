import java.util.Scanner
import java.io.PrintWriter
import java.io.File
import scala.Array._

class Mnozilac(vrsta1 : Array[Int],
               matrica2 : Array[Array[Int]],
               rezultat : Array[Int])
  extends Thread {

  var k : Int = matrica2.length*matrica2(1).length / vrsta1.length
  var m : Int = vrsta1.length

  override def run() {
    for(i <- 0 until k)
      rezultat(i) = skProizvod(i)
  }

  def skProizvod(j : Int) : Int = {
    var res = 0
    for(i <- 0 until m)
      res += vrsta1(i)*matrica2(i)(j)
    res
  }
}

object MnozenjeMatrica {
  def main(args : Array[String]) {

    val sc1 : Scanner = new Scanner(new File("matrica1.txt"))
    val sc2 : Scanner = new Scanner(new File("matrica2.txt"))
    val pw : PrintWriter = new PrintWriter(new File("matrica3.txt"))

    // Ucitavamo dimenzije matrica
    val n = sc1.nextInt()
    val m1 = sc1.nextInt()
    val m2 = sc2.nextInt()
    val k = sc2.nextInt()

    if(m1 != m2){
      println("Greska! Dimenzije matrica se moraju poklapati!")
      return
    }

    // Funkcija ofDim[Tip](n,m) pravi visedimenzioni niz dimenzija mxn
    val matrica1 = ofDim[Int](n,m1)
    val matrica2 = ofDim[Int](m2,k)
    val rezultat = ofDim[Int](n,k)

    // Ucitavamo elemente prve matrice
    for(i <- 0 until n)
      for(j <- 0 until m1)
        matrica1(i)(j) = sc1.nextInt()

    // Ucitavamo elemente druge matrice
    for(i <- 0 until m2)
      for(j <- 0 until k)
        matrica2(i)(j) = sc2.nextInt()

    val mnozioci = new Array[Mnozilac](n)

    // Pravimo niz niti koje ce da racunaju i-tu vrstu rezultata mnozenja matrica
    for(i <- 0 until n)
      mnozioci(i) = new Mnozilac(matrica1(i), matrica2, rezultat(i))

    // Zapocinjemo izvrsavanje niti
    for(i <- 0 until n)
      mnozioci(i).start()

    // Cekamo da niti zavrse sa izracunavanjem
    for(i <- 0 until n)
      mnozioci(i).join()

    // Upisujemo rezultujucu matricu u datoteku
    pw.append(s"$n $k \n")
    for(i <- 0 until n){
      for(j <- 0 until k)
        pw.append(s"${rezultat(i)(j)} ")
      pw.append("\n")
    }

    pw.close()
  }
}