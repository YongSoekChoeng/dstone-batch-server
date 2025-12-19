echo "Admin URL : http://localhost:9393/dashboard"

:: env.properties 파일을 한 줄씩 읽어서 환경변수로 세팅
for /f "usebackq eol=# tokens=1,2 delims==" %%a in ("../conf/env.properties") do (
    set "%%a=%%b"
    echo Setting %%a=%%b
)
echo 환경변수 세팅 완료!

REM Stream 을 사용할 경우
REM java -jar ../target/spring-cloud-dataflow-server-2.11.5.jar --spring.config.location=../conf/dataflow-server.yml --spring.cloud.skipper.client.serverUri=http://localhost:7577/api

REM Stream 을 사용하지 않고 Spring Batch만 사용할 경우
java -jar ../target/spring-cloud-dataflow-server-2.11.5.jar --spring.config.location=../conf/dataflow-server.yml
