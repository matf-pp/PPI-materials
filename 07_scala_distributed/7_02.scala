import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.rdd.RDD._


object BrojPetocifrenih {

  def main(args: Array[String]){

      val konf = new SparkConf()
        .setAppName("BrojPetocifrenih")
        .setMaster("local[4]")

      val sk = new SparkContext(konf)

      /**
       * Otvaramo datoteku i njen sadrzaj cuvamo
       * u nizu tipa RDD[String].
       * Elementi niza su pojedinacne linije iz datoteke.
       * */
      val datRDD = sk.textFile("brojevi.txt")

      /**
       * Filtriramo niz tako da nam ostanu samo petocifreni brojevi
       * i prebrojavamo ih.
       * */
      val brojPetocifrenihBrojeva = datRDD.filter(_.length() == 5)
                                          .count()

      sk.stop()

      println("Petocifrenih brojeva ima: ")
      println(brojPetocifrenihBrojeva)
  }
}
