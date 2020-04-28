import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.rdd.RDD._

object ProsecnaTemperatura {

   def main(args: Array[String]){

      val konf = new SparkConf()
        .setAppName("ProsecnaTemperatura")
        .setMaster("local[4]")

      val sk = new SparkContext(konf)

      val tempRDD = sk.textFile("temperatureBoston.txt")
                      /**
                       * Pravimo torke (kljuc, vrednost) takve da je
                       * kljuc = godina
                       * vrednost = (mesec, dan, temperatura)
                       * */
                      .map(linija => {
                        val niz = linija.split(" ")
                        (niz(3),(niz(1), niz(2), niz(4).toFloat))
                      })
                      /**
                       * Grupisemo torke po njihovom kljucu i za svaki kljuc racunamo
                       * sumu svih temperatura i broj temperatura koje smo sabrali.
                       *
                       * Funkcija aggregateByKey(pocetnaVrednostAkumulatora)(f1, f2)
                       * obradjuje niz parova (kljuc, vrednost)
                       * grupise ih po kljucu, akumulira vrednosti
                       * (inicijalna vrednost akumulatora
                       * se prosledjuje kao parametar)
                       * i kao rezultat vraca niz parova (k, akumuliranaVrednost).
                       *
                       * Funkcija f1(akumulator, vrednost) se primenjuje
                       * nad svim vrednostima koje se nalaze u jednom cvoru
                       * i rezultat se smesta u akumulator tog cvora
                       * Funkcija f2(akumulator1, akumulator2) se primenjuje
                       * nad svim izracunatim akumulatorima pojedinacnih cvorova
                       * i rezultat se smesta u globalni akumumulator.
                       *
                       * U nasem slucaju, akumulator ce da sadrzi dve vrednosti
                       * (sumaTemp, brojTemp) sa nulom kao pocetnom vrednoscu.
                       * Funkcija f1(akumulator, vrednost)
                       * sabira vrednost (temperaturu)
                       * sa sumaTemp iz akumulatora, a brojTemp povecava za 1.
                       * Funkcija f2(akumulator1, akumulator2)
                       * sabira obe vrednosti ova dva akumulatora.
                       *
                       * Kao rezultat primene ove funkcije dobicemo niz parova
                       * (kljuc, (sumaTemp, brojTemp))
                       * gde nam je kljuc godina
                       * u kojoj zelimo da izracunamo prosecnu temperaturu.
                       * */
                      .aggregateByKey((0.0, 0))((ak, vr) => (ak._1 + vr._3 , ak._2 + 1 ),
                                              (a1 ,a2) => (a1._1 + a2._1, a1._2 + a2._2))
                      /**
                       * Pravimo niz parova (kljuc, prosecnaTemperatura)
                       * */
                      .map( st => (st._1, st._2._1/st._2._2))
                      .sortByKey()
                      .collect()
                      .foreach( st => println("Godine "
                                              + st._1
                                              + " prosecna temperatura je iznosila "
                                              + "%.2f".format(((st._2-32)/1.8))
                                              + " celzijusa. "))

      sk.stop()
  }
}
