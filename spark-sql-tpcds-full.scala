def show_timing[T](proc: => T): T = {
    val start=System.nanoTime()
    val res = proc // call the code
    val end = System.nanoTime()
    println("Time elapsed: " + (end-start)/1000000000 + " secs")
    res
}
import org.apache.spark.sql.SparkSession
val database = "parq"
val OPT_HIVE_WAREHOUSE = "spark.sql.warehouse.dir"
val OPT_HIVE_METASTORE = "hive.metastore.uris"
val conf = sc.getConf
//conf.set(OPT_HIVE_METASTORE, "thrift://bdax72bur09node04.us.oracle.com:9083").set(OPT_HIVE_WAREHOUSE, "/user/hive/warehouse/").set("spark.sql.adaptive.enabled","false")
//.set("spark.sql.autoBroadcastJoinThreshold","1572864")
// set("spark.sql.autoBroadcastJoinThreshold","2097152")
sc.stop()
val customSql = SparkSession.builder.config(conf).enableHiveSupport().getOrCreate()
customSql.sql("use "+ database).show()
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q11.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q12.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q13.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q19.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q1.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q21.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q22.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q24a.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q24b.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q27.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q28.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q30.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q31.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q34.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q36.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q39a.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q39b.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q3.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q41.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q42.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q43.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q44.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q45.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q46.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q48.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q50.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q51.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q52.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q53.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q55.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q59.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q61.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q62.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q63.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q65.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q67.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q68.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q6.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q70.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q73.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q74.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q79.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q7.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q82.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q84.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q85.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q86.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q88.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q89_l.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q89.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q8.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q90.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q92.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q93.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q94.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q95.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q96.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q98.sql").mkString).show()}
val resultsDFfromFile = show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q9.sql").mkString).show()}
sys.exit
