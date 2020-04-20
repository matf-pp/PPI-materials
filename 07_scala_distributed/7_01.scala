import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.rdd.RDD._

object ParniKvadrati {

  def main(args: Array[String]) = {

    println("Unesite broj n:")
    val n = Console.readInt()
    /**
     * Podesavamo konfiguraciju Spark okruzenja
     * tako sto dajemo ime aplikaciji
     * i dodeljujemo joj potencijalno 4 cvora
     * (u nasem slucaju procesorska jezgra)
     * */
    val konf = new SparkConf()
      .setAppName("ParniKvadrati")
      .setMaster("local[4]")

    /**
     * Ako Spark izbacuje gresku da je heap size manji od potrebnog,
     * otkomentarisati narednu liniju i proslediti odgovarajucu vrednost
     * */
    // konf.set("spark.testing.memory", "2147480000")

    /**
     * Pravimo objekat Spark konteksta
     * koji pokrece i upravlja Spark okruzenjem
     * */
    val sk = new SparkContext(konf)

    
    /**
     * Ukoliko zelimo da podesavamo parametre dinamicki 
     * (broj cvorova koji izvrsavaju nasu aplikaciju,
     * velicina hip memorije i sl.)
     * potrebno je da inicijalizujemo spark kontekst na sledeci nacin
     *
     * val sk = new SparkContext(new SparkConf());
     *
     * cime naznacavamo da ce se parametri konfiguracije
     * podesiti dinamicki (koriscenjem spark-submit skripte).
     * */
     
    val niz = (2 to n by 2).toArray

    /**
     * Pravimo niz tipa RDD[Integer] od niza tipa Array[Integer]
     * */
    val nizRDD = sk.parallelize(niz)

    /**
     * Pravimo niz kvadrata parnih brojeva (uzimamo prvih 10)
     * i rezultat pretvaramo u niz tipa Array[Integer]
     * */
    val nizKvadrata = nizRDD.map(x => x*x)
                         /* .take(10) */
                            .collect()

    /**
     * Zaustavljamo Spark okruzenje
     * */
    sk.stop()

    /**
     * Ispisujemo rezultujuci niz
     * */
    println("Niz kvadrata parnih brojeva: ")
    println(nizKvadrata.mkString(", "))
  }
}
