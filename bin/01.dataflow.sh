#! /bin/sh

echo "Admin URL : http://localhost:9393/dashboard"

# env.properties 파일을 한 줄씩 읽어서 환경변수로 세팅
while IFS='=' read -r key value; do
  # 주석(#)으로 시작하는 줄이거나 빈 줄이면 건너뜀
  [[ "$key" =~ ^#.*$ ]] || [[ -z "$key" ]] && continue  
  # 환경변수 등록 (export)
  export "$key=$value"
  echo "Setting $key=$value"
done < ../conf/env-dev.properties

echo "환경변수 세팅 완료!"

# Stream 을 사용할 경우
#java -jar ../target/spring-cloud-dataflow-server-2.11.5.jar --spring.config.location=../conf/dataflow-server.yml --spring.cloud.skipper.client.serverUri=http://localhost:7577/api

# Stream 을 사용하지 않고 Spring Batch만 사용할 경우
java -jar ../target/spring-cloud-dataflow-server-2.11.5.jar --spring.config.location=../conf/dataflow-server.yml

