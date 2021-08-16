
## Quick start

### Start standalong cluster

```
docker-compuser up
```
this is start spark with standalone mode, one master with 2 works.
https://spark.apache.org/docs/latest/spark-standalone.html

### Access Web GUI
master Web GUI: http://127.0.0.1:8080/

### Submit a example job
```
$ docker exec -it  spark_spark_1  bash
$ ./bin/spark-submit --master spark://spark:7077 ./examples/src/main/python/pi.py
$ ./bin/spark-submit --master spark://spark:7077     ./examples/src/main/python/wordcount.py  /opt/bitnami/spark/README.md
```

### Customize wordcount.py

```
$ docker cp  wordcount.py  spark_spark_1:/
$ docker exec -it  spark_spark_1  bash
$ ./bin/spark-submit --master spark://spark:7077 /wordcount.py  /opt/bitnami/spark/README.md
````
check folder /opt/bitnami/spark/work/output/  of any work node 

## Reference
https://hub.docker.com/r/bitnami/spark
https://github.com/bitnami/bitnami-docker-spark/blob/master/docker-compose.yml


https://docs.bitnami.com/tutorials/work-with-non-root-containers/

