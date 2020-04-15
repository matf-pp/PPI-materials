import java.util.Scanner

class Sabirac(poc : Int,
              kraj : Int ,
              vektor1 : Array[Float],
              vektor2 : Array[Float])
  extends Thread {
  // Svaka nit racuna zbir svog dela vektora [poc, kraj)
  // i rezultat smesta u prvi vektor.
  override def run() {
    for(i <- poc until kraj)
      vektor1(i) += vektor2(i)
  }
}

object ZbirVektora {
  def main(args : Array[String]){

    val sc = new Scanner(System.in)

    println("Unesite dimenziju vektora: ")
    val n = sc.nextInt()

    val vektor1 : Array[Float] = new Array(n)
    val vektor2 : Array[Float] = new Array(n)

    println("Unesite elemente prvog vektora: ")
    for(i <- 0 until n)
      vektor1(i) = sc.nextFloat()

    println("Unesite elemente drugog vektora: ")
    for(i <- 0 until n)
      vektor2(i) = sc.nextFloat()

    println("Unesite broj niti: ")
    val brojNiti = sc.nextInt()

    val niti = new Array[Sabirac](brojNiti)

    val korak = Math.ceil(n/brojNiti.toDouble).toInt

    //  Pravimo niti i zadajemo im indekse - granice
    for(i <- 0 until brojNiti)
      niti(i) = new Sabirac(i*korak, Math.min((i+1)*korak,n),vektor1,vektor2)

    //  Pokrecemo racunanje
    for(i <- 0 until brojNiti)
      niti(i).start()

    //  Cekamo da niti zavrse sa racunanjem
    for(i <- 0 until brojNiti)
      niti(i).join()

    //  Kada sve niti zavrse sa racunanjem ispisujemo rezultat
    print("Zbir vektora je: \n[")
    for(i <- 0 until n-1)
      print(vektor1(i) + ", ")
    println(vektor1(n-1) + "]")
  }
}