import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.rdd.RDD._
import scala.compat._

object RandomZaposleni {

  def main(args: Array[String]){

      val konf = new SparkConf()
        .setAppName("RandomZaposleni")
        .setMaster("local[4]")

      val sk = new SparkContext(konf)

      /**
       * Pronalazimo liniju koja sadrzi radnika programera,
       * razdvajamo podatke o jednom radniku
       * i cuvamo njegovo ime, prezime i email nalog.
       * Nakon toga nasumicno biramo 3 programera.
       *
       * Funkcija takeSample kao argumente prihvata:
       * - indikator da li zelimo izbora sa vracanjem
       * - broj uzoraka
       * - pocetnu vrednost (seed) za slucajni generator
       * */
      val triProgramera = sk.textFile("zaposleni.txt")
                            /**
                             * Pronalazimo liniju koja sadrzi radnika programera,
                             * */
                            .filter(_.contains("IT_PROG"))
                            /**
                            * Razdvajamo podatke o jednom radniku
                            * i cuvamo njegovo ime, prezime i email nalog.
                            * */
                            .map(linija => {
                                val niz = linija.split(" ")
                                (niz(0), niz(1), niz(3))
                              })
                            /**
                            * Nasumicno biramo 3 programera.
                            * Prvi parametar (false) oznacava
                            * izbor bez vracanja a poslednji parametar
                            * predstavlja pocetnu vrednost (seed)
                            * generatora slucajnih brojeva.
                            * */
                            .takeSample(false, 3, Platform.currentTime)

      println("Tri zaposlena radnika u IT sektoru su: ")
      triProgramera.foreach(prog => {
        println("Ime i prezime: " + prog._1 + " " + prog._2 + "\n  Email: " + prog._3.toLowerCase()+"@firma.com")
      })

      sk.stop()
   }
}
