def show_timing[T](proc: => T): T = {
    val start=System.nanoTime()
    val res = proc // call the code
    val end = System.nanoTime()
    println("Time elapsed: " + (end-start)/1000000000 + " secs")
    res
}
val database="parq"
import org.apache.spark.sql.SparkSession
val OPT_HIVE_WAREHOUSE = "spark.sql.warehouse.dir"
val OPT_HIVE_METASTORE = "hive.metastore.uris"
val conf = sc.getConf
//conf.set(OPT_HIVE_METASTORE, "thrift://bdax72bur09node04.us.oracle.com:9083").set(OPT_HIVE_WAREHOUSE, "/user/hive/warehouse/").set("spark.sql.adaptive.enabled","false")
//.set("spark.sql.autoBroadcastJoinThreshold","1572864")
// set("spark.sql.autoBroadcastJoinThreshold","2097152")
sc.stop()
val customSql = SparkSession.builder.config(conf).enableHiveSupport().getOrCreate()
customSql.sql("use parq").show()
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q11.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q12.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q13.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q19.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q1.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q21.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q22.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q24a.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q24b.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q27.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q30.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q93.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q94.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q95.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q96.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q98.sql").mkString).show()}
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q9.sql").mkString).show()}
sys.exit
