resource "aws_instance" "ubuntu_instance_1" {
    ami           = var.instance_ubuntu.instance_ami
    instance_type = var.instance_ubuntu.instance_type
    key_name      = var.instance_ubuntu.key_pair_name

    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id] 

    root_block_device {
        volume_size           = var.volume_settings.volume_size
        volume_type           = var.volume_settings.volume_type
        delete_on_termination = true
        encrypted             = true
    }

    user_data = "${file("${path.module}/${var.instance_ubuntu.script_file_path}/${var.instance_ubuntu.script_file_name}")}"
   

    tags = {
        Name = format("%s-ubuntu-1", var.project_name)
    }
}

resource "aws_instance" "ubuntu_instance_2" {
    ami           = var.instance_ubuntu.instance_ami
    instance_type = var.instance_ubuntu.instance_type 
    key_name      = var.instance_ubuntu.key_pair_name

    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id] 

    root_block_device {
        volume_size           = var.volume_settings.volume_size
        volume_type           = var.volume_settings.volume_type
        delete_on_termination = true
        encrypted             = true
    }

    user_data = "${path.module}/${var.instance_ubuntu.script_file_path}/${var.instance_ubuntu.script_file_name}"

    tags = {
        Name = format("%s-ubuntu-2", var.project_name)
    }
}

resource "aws_instance" "windows_instance_1" {
    ami           = var.instance_windows.instance_ami
    instance_type = var.instance_windows.instance_type
    key_name      = var.instance_windows.key_pair_name

    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id] 

    root_block_device {
        volume_size           = var.volume_settings.volume_size
        volume_type           = var.volume_settings.volume_type
        delete_on_termination = true
        encrypted             = true
    }

    user_data =<<-EOF
    <script>
        REM Defina as variáveis de instalação
        set NGINX_INSTALL_DIR=C:\nginx
        set nginxPath=%NGINX_INSTALL_DIR%\nginx

        REM Baixe o arquivo compactado do Nginx
    bitsadmin /transfer DownloadNginx /download /priority normal http://nginx.org/download/nginx-1.24.0.zip c:\\nginx.zip

        REM Descompacte o arquivo
        powershell -Command "Expand-Archive -Path .\nginx.zip -DestinationPath %NGINX_INSTALL_DIR%"

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
    </script>
    EOF
    
    tags = {
        Name = format("%s-windows-1", var.project_name)
    }
}

resource "aws_instance" "windows_instance_2" {
    ami           = var.instance_windows.instance_ami
    instance_type = var.instance_windows.instance_type
    key_name      = var.instance_windows.key_pair_name

    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id] 

    root_block_device {
        volume_size           = var.volume_settings.volume_size
        volume_type           = var.volume_settings.volume_type
        delete_on_termination = true
        encrypted             = true
    }

    user_data =<<-EOF
    <script>
        REM Defina as variáveis de instalação
        set NGINX_INSTALL_DIR=C:\nginx
        set nginxPath=%NGINX_INSTALL_DIR%\nginx

        REM Baixe o arquivo compactado do Nginx
    bitsadmin /transfer DownloadNginx /download /priority normal http://nginx.org/download/nginx-1.24.0.zip c:\\nginx.zip

        REM Descompacte o arquivo
        powershell -Command "Expand-Archive -Path .\nginx.zip -DestinationPath %NGINX_INSTALL_DIR%"

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
    </script>
    EOF
    tags = {
        Name = format("%s-windows-2", var.project_name)
    }
}
