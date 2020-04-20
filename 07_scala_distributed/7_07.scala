import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.rdd.RDD._

object UspesnaPreuzimanja {

  def main(args: Array[String]){

      val konf = new SparkConf()
        .setAppName("UspesnaPreuzimanja")
        .setMaster("local[4]")

      val sk = new SparkContext(konf)
  
      /**
       * Ucitavamo podatke i smestamo ih u kes memoriju radi brzeg pristupanja.
       * */
      val preuzimanja = sk.textFile("mavenLog.txt")
                          .cache()
      /**
       * Racunamo broj zapocetih preuzimanja.
       * */
      val zapoceta = preuzimanja.filter(_.contains("Downloading:"))
                                .count()
      /**
       * Racunamo broj zavrsenih preuzimanja.
       * */
      val zavrsena = preuzimanja.filter(_.contains("Downloaded:"))
                                .count()

      sk.stop()

      println("%.2f".format(zavrsena*100.0/zapoceta) + " procenata zapocetih preuzimanja je zavrseno.")
   }
}
