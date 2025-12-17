echo "Admin URL : http://localhost:9393/dashboard"

REM Stream 을 사용할 경우
REM java -jar ./target/spring-cloud-dataflow-server-2.11.5.jar --spring.config.location=./conf/dataflow-server.yml --spring.cloud.skipper.client.serverUri=http://localhost:7577/api

REM Stream 을 사용하지 않고 Spring Batch만 사용할 경우
java -jar ./target/spring-cloud-dataflow-server-2.11.5.jar --spring.config.location=./conf/dataflow-server.yml
