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
conf.set(OPT_HIVE_METASTORE, "thrift://pmmigraun1.bmbdcsad1.bmbdcs.oraclevcn.com:9083").set(OPT_HIVE_WAREHOUSE, "/user/hive/warehouse/").set("spark.sql.adaptive.enabled","false")
//.set("spark.sql.autoBroadcastJoinThreshold","1572864")
// set("spark.sql.autoBroadcastJoinThreshold","2097152")
sc.stop()
val customSql = SparkSession.builder.config(conf).enableHiveSupport().getOrCreate()
customSql.sql("use parq").show()
 show_timing{customSql.sql(scala.io.Source.fromFile("./queries/q11.sql").mkString).show()}
sys.exit
