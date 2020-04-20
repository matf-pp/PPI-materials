import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.rdd.RDD._

object LogPoruke {

  def main(args: Array[String]){

      val konf = new SparkConf()
        .setAppName("LogPoruke")
        .setMaster("local[4]")

      val sk = new SparkContext(konf)

      val poruke = sk.textFile("log.txt")
                      /**
                       * Filtriramo podatke tako da nam ostanu
                       * samo linije koje predstavljaju
                       * upozorenja, informacije ili greske i odnose se na javu.
                       * */
                     .filter(linija =>
                                (linija.contains("[warn]")
                                 || linija.contains("[info]")
                                 || linija.contains("[error]"))
                                && (linija.contains("java")))
                      /**
                       * Pravimo parove (tip_poruke, poruka).
                       * */
                     .map(linija => {
                          val niz = linija.split(" ")
                          (niz(0), niz.drop(1).mkString(" "))
                     })
                     /**
                      * Grupisemo poruke po njihovom tipu (kljuc).
                      * tako da dobijemo niz parova (tip_poruke, niz_poruka).
                      * */
                     .groupByKey()
                     /**
                      * Za svaki tip racunamo broj poruka tog tipa
                      * tako sto od parova (tip_poruke, niz_poruka)
                      * pravimo par (tip_poruke, broj_poruka)
                      * */
                     .map( por => (por._1, por._2.size))
                     .collect()

      println("Informacije o log porukama koje se odnose na Javu: ")

      poruke.foreach( por => println(" " + por._1 + ": " + por._2 ))

      sk.stop()
    }
}
