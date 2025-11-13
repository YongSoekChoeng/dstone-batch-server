echo "Admin URL : http://localhost:9393/dashboard"
java -jar ./dataflow/spring-cloud-dataflow-server-2.11.5.jar --./dataflow/spring.config.location=./dataflow/dataflow-server.yml --spring.cloud.skipper.client.serverUri=http://localhost:7577/api
