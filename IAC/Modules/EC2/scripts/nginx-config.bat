@echo off

REM Defina as variáveis de instalação
set NGINX_INSTALL_DIR=C:\nginx
set nginxPath=%NGINX_INSTALL_DIR%\nginx

REM Baixe o arquivo compactado do Nginx
curl -o nginx.zip http://nginx.org/download/nginx-1.24.0.zip

REM Descompacte o arquivo
powershell -Command "Expand-Archive -Path .\nginx.zip -DestinationPath %NGINX_INSTALL_DIR%"

pause

REM Renomeie a pasta descompactada
echo Renomeie a pasta descompactada
rename %NGINX_INSTALL_DIR%\nginx-1.24.0 nginx
echo Fim Renomeie a pasta descompactada

echo Cria arquivo nginx.conf
echo worker_processes  1; > "%nginxPath%\conf\nginx.conf"
echo error_log  C:/nginx/nginx/logs/error.log; >> "%nginxPath%\conf\nginx.conf"
echo events { worker_connections  1024; } >> "%nginxPath%\conf\nginx.conf"
echo http { >> "%nginxPath%\conf\nginx.conf"
echo     include       mime.types; >> "%nginxPath%\conf\nginx.conf"
echo     default_type  application/octet-stream; >> "%nginxPath%\conf\nginx.conf"
echo     sendfile        on; >> "%nginxPath%\conf\nginx.conf"
echo     keepalive_timeout  65; >> "%nginxPath%\conf\nginx.conf"
echo     server { >> "%nginxPath%\conf\nginx.conf"
echo         listen       80; >> "%nginxPath%\conf\nginx.conf"
echo         server_name  localhost; >> "%nginxPath%\conf\nginx.conf"
echo         location / { >> "%nginxPath%\conf\nginx.conf"
echo             root   html; >> "%nginxPath%\conf\nginx.conf"
echo             index  index.html index.htm; >> "%nginxPath%\conf\nginx.conf"
echo         } >> "%nginxPath%\conf\nginx.conf"
echo         error_page   500 502 503 504  /50x.html; >> "%nginxPath%\conf\nginx.conf"
echo         location = /50x.html { >> "%nginxPath%\conf\nginx.conf"
echo             root   html; >> "%nginxPath%\conf\nginx.conf"
echo         } >> "%nginxPath%\conf\nginx.conf"
echo     } >> "%nginxPath%\conf\nginx.conf"
echo } >> "%nginxPath%\conf\nginx.conf"
echo Fim Cria arquivo nginx.conf


REM Configura a página Hello World
echo Configurando a página Hello World...
echo ^<html^> > "%nginxPath%\html\index.html"
echo    ^<head^> >> "%nginxPath%\html\index.html"
echo       ^<title^>Hello World^</title^> >> "%nginxPath%\html\index.html"
echo    ^</head^> >> "%nginxPath%\html\index.html"
echo    ^<body^> >> "%nginxPath%\html\index.html"
echo       ^<h1^>Hello, World!^</h1^> >> "%nginxPath%\html\index.html"
echo    ^</body^> >> "%nginxPath%\html\index.html"
echo ^</html^> >> "%nginxPath%\html\index.html"


REM Alterando diretótio atual
echo Mudando diretório atual
cd %nginxPath%
echo Fim Mudando diretório atual

REM Inicie o servidor Nginx
echo Inicia o server
%nginxPath%\nginx.exe
@REM echo Fim Inicia o server

@REM REM Exiba a mensagem de conclusão
@REM echo Nginx instalado e configurado com sucesso!

@REM REM Limpeza: exclua o arquivo zip baixado
@REM @REM del nginx.zip
