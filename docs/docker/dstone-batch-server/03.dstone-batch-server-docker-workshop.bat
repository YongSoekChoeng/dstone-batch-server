setlocal

REM =========================================================
REM Docker Build 를 위한 기본 골격(workshop)을 생성.
REM Destination : C:/Temp/workshop 아래에 생성.
REM =========================================================


REM /workshop
REM   └─ /dstone-batch-server                      # <Batch Admin Application>
REM      ├─ conf/                                  #   설정 파일
REM      ├─ target/                                #   실행 파일
REM      ├─ 01.dstone-batch-server-docker.yml      #   개별 Docker Compose 빌드파일
REM      └─ 02.dstone-batch-server-docker-reg.sh   #   Docker Hub 등록 Shell

set FROM_ROOT=D:\AppHome\framework
set TO_ROOT=C:\Temp\workshop

mkdir %TO_ROOT%

REM 1. Batch Server Application
mkdir %TO_ROOT%\dstone-batch-server
mkdir %TO_ROOT%\dstone-batch-server\conf
mkdir %TO_ROOT%\dstone-batch-server\target
copy  %FROM_ROOT%\dstone-batch-server\conf\* %TO_ROOT%\dstone-batch-server\conf
copy  %FROM_ROOT%\dstone-batch-server\target\*.jar %TO_ROOT%\dstone-batch-server\target
copy  %FROM_ROOT%\dstone-batch-server\docs\docker\dstone-batch-server\env.properties %TO_ROOT%\dstone-batch-server
copy  %FROM_ROOT%\dstone-batch-server\docs\docker\dstone-batch-server\01.dstone-batch-server-docker.yml %TO_ROOT%\dstone-batch-server
copy  %FROM_ROOT%\dstone-batch-server\docs\docker\dstone-batch-server\02.dstone-batch-server-docker-reg.sh %TO_ROOT%\dstone-batch-server

endlocal
