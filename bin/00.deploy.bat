cd ../modules/skipper/spring-cloud-skipper-server-2.11.5
zip -r -0 ../../../target/spring-cloud-skipper-server-2.11.5.jar META-INF/MANIFEST.MF .

cd ../../../
copy .\target\spring-cloud-skipper-server-2.11.5.jar .\docs\docker\dstone-batch-server\target

cd ./modules/dataflow/spring-cloud-dataflow-server-2.11.5
zip -r -0 ../../../target/spring-cloud-dataflow-server-2.11.5.jar META-INF/MANIFEST.MF .

cd ../../../
copy .\target\spring-cloud-dataflow-server-2.11.5.jar .\docs\docker\dstone-batch-server\target

cd bin
