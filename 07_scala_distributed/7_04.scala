import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.rdd.RDD._

object BrojPojavljivanjaReci {

   def main(args: Array[String]){

      val konf = new SparkConf()
        .setAppName("BrojPojavljivanjaReci")
        .setMaster("local[4]")

      val sk = new SparkContext(konf)

      val knjigaRDD = sk.textFile("knjiga.txt")

      /**
       * Ucitavamo linije i razlazemo ih separatorom " " tako da dobjemo niz reci
       */
      val reciBr = knjigaRDD.flatMap(_.split(" "))
                            /**
                            * Od svake reci pravimo par (rec, 1).
                            */
                            .map(rec => (rec , 1))
                            /**
                            * Sabiramo sve vrednosti drugog elementa para
                            * grupisane po prvom elementu para
                            * koji nam predstavlja kljuc.
                            */
                            .reduceByKey((_+_))
                            /**
                            * Sortiramo reci leksikografski.
                            */
                            .sortByKey()
                            /**
                            * Cuvamo ih u datotekama koje se nalaze u direktorijumu
                            * BrojPojavljivanjaReci
                            */
                            .saveAsTextFile("BrojPojavljivanjaReci")

      sk.stop()
  }
}
