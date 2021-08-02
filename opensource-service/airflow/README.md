https://airflow.apache.org/docs/apache-airflow/stable/start/docker.html


mkdir ./dags ./logs ./plugins
echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env

docker-compose up airflow-init

docker-compose up


increase docker-desktop memory limit while have some issue ^^

Web GUI 
 127.0.0.1:8080   
 airflow /  airflow


 Creat & Update DAG
   1. add dag python file to ./dags
   2. run command  "docker exec CONATINER_ID_OF_WORKEr  airflow dags list"; then login web to check