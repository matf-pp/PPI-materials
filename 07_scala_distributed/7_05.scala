import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.rdd.RDD._
import java.io._

object UredjajiTransakcije {

  def main(args: Array[String]){

      val konf = new SparkConf()
        .setAppName("UredjajiTransakcije")
        .setMaster("local[4]")

      val sk = new SparkContext(konf)
      
      val transakcije = sk.textFile("uredjaji.txt")
                          /**
                           * Razdvajamo podatke o uredjajima
                           * i pravimo parove transakcija
                           * (marka, ostali_podaci)
                           * */
                          .map(linija => {
                              val niz = linija.split(" ")
                              (niz(0), niz.drop(1).mkString(" "))
                            })
                          /**
                          * Grupisemo ih po marki tako da za svaku marku
                          * cuvamo niz obavljenih transakcija
                          * (tj. niz koji sadrzi ostale podatke za svaku transakciju)
                          * */
                          .groupByKey()
                          /**
                           * Prolazimo kroz niz parova (marka, niz_transakcija)
                           * i u datoteku ime_marke.txt
                           * upisujemo podatke o transakcijama.
                           *
                           * Parametar t u foreach konstrukciji predstavlja jedan par
                           * (marka, niz_transakcija).
                           * */
                          .foreach(t => {
                              val dat = new PrintWriter(new File(t._1.toLowerCase() + ".txt" ))

                              dat.write("---" + t._1 + "---\n")

                              t._2.foreach(por => {
                                  dat.append(por + "\n")
                              })

                              dat.close()
                          })

      sk.stop()
   }
}
