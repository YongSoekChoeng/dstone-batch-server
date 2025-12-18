setlocal

REM 1. 어플리케이션 루트 디렉토리(APP_ROOT) 조회
for %%i in ("%~dp0..") do set APP_ROOT=%%~fi
echo 'APP_ROOT:'%APP_ROOT%

REM 2. dstone-batch-server 용 모듈 취합
REM 2-1. skipper 모듈 취합
mkdir %APP_ROOT%\target
mkdir %APP_ROOT%\docs\docker\dstone-batch-server\target
cd %APP_ROOT%\modules\skipper\spring-cloud-skipper-server-2.11.5
zip -r -0 %APP_ROOT%\target\spring-cloud-skipper-server-2.11.5.jar META-INF\MANIFEST.MF .
copy %APP_ROOT%\target\spring-cloud-skipper-server-2.11.5.jar %APP_ROOT%\docs\docker\dstone-batch-server\target

REM 2-2. dataflow 모듈 취합
cd %APP_ROOT%\modules\dataflow\spring-cloud-dataflow-server-2.11.5
zip -r -0 %APP_ROOT%\target\spring-cloud-dataflow-server-2.11.5.jar META-INF\MANIFEST.MF .
copy %APP_ROOT%\target\spring-cloud-dataflow-server-2.11.5.jar %APP_ROOT%\docs\docker\dstone-batch-server\target

cd %APP_ROOT%\bin
endlocal
