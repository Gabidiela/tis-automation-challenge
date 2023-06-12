```bash
 ________  ______   ______                                                                       
|        \|      \ /      \                                                                      
 \$$$$$$$$ \$$$$$$|  $$$$$$\                                                                     
   | $$     | $$  | $$___\$$                                                                     
   | $$     | $$   \$$    \                                                                      
   | $$     | $$   _\$$$$$$\                                                                     
   | $$    _| $$_ |  \__| $$                                                                     
   | $$   |   $$ \ \$$    $$                                                                     
    \$$    \$$$$$$  \$$$$$$                                                                      
                                                                                                 
                                                                                                 
                                                                                                 
  ______               __                                         __      __                     
 /      \             |  \                                       |  \    |  \                    
|  $$$$$$\ __    __  _| $$_     ______   ______ ____    ______  _| $$_    \$$  ______   _______  
| $$__| $$|  \  |  \|   $$ \   /      \ |      \    \  |      \|   $$ \  |  \ /      \ |       \ 
| $$    $$| $$  | $$ \$$$$$$  |  $$$$$$\| $$$$$$\$$$$\  \$$$$$$\\$$$$$$  | $$|  $$$$$$\| $$$$$$$\
| $$$$$$$$| $$  | $$  | $$ __ | $$  | $$| $$ | $$ | $$ /      $$ | $$ __ | $$| $$  | $$| $$  | $$
| $$  | $$| $$__/ $$  | $$|  \| $$__/ $$| $$ | $$ | $$|  $$$$$$$ | $$|  \| $$| $$__/ $$| $$  | $$
| $$  | $$ \$$    $$   \$$  $$ \$$    $$| $$ | $$ | $$ \$$    $$  \$$  $$| $$ \$$    $$| $$  | $$
 \$$   \$$  \$$$$$$     \$$$$   \$$$$$$  \$$  \$$  \$$  \$$$$$$$   \$$$$  \$$  \$$$$$$  \$$   \$$
                                                                                                 
                                                                                                 
```                                                                                                 
---
# Desafio 💻
Crie um pipeline de integração contínua utilizando tecnologias como Azure DevOps, TravisCI, Github Actions ou algum outro de sua preferência. O seu pipeline deve:
- Provisionar uma estrutura com IaC utilizando [Terraform](https://www.terraform.io/) ou outra ferramenta, podendo utilizar um provedor de nuvem pública ou ser executado localmente.
  - 2 hosts Windows
  - 2 hosts Linux
- Utilizar [Ansible](https://docs.ansible.com/) ou outra ferramenta para configurar:
  - Nos hosts Linux, provisionar um Apache ou um NGINX com um Hello World.
  - Nos hosts Windows: Instale o MSI do Apache, e provisione o mesmo Hello World utilizado no Linux.
  <small>dica: Crie um arquivo ‘index.html’ no repositório, e copie ele para os diretórios necessários.</small>
- Desenvolver uma API, na linguagem deseja, que retorne uma mensagem de "Hello World!" tanto em uma requisição GET como POST.

**IMPORTANTE**: Inclua no README do projeto melhorias que seriam necessárias caso você tivesse mais tempo para entregar e desafios encontrados durante a execução.

---
# Documentação 📝
- [ ] O código foi entregue com um arquivo de README claro de como se guiar?
- [ ] O código possui comentários pertinentes?
- [ ] O código está em algum controle de versão?
- [ ] Os commits são pequenos e consistentes?
- [ ] As mensagens de commit são claras?

---
# Observações 👀
- Você pode utilizar VMs ou K8s, tendo preferência para utilização de K8s.
- **Novamente**: Não se preocupe com linguagem de programação, pode utilizar a que se sentir mais confortável. 
- Não se preocupe com ferramentas de IaC, pode utilizar também a que se sentir mais confortável.

---
📅 O prazo para realização é de 1 semana, podendo realizar o último commit no repositório até dia que recebeu o teste (+7 Dias). 📅
# Considerações do Projeto 📝
O projeto está constituido por uma pasta contendo o IAC do projeto, uma pasta contendo a API e por fim, uma pasta contendo o pipeline de CI.
<hr>

## Desafios Enfrentados e possiveis melhorias
A criação deste projeto representou um desafio significativo devido à falta de tempo para desenvolver a solução e à curva de aprendizado de algumas ferramentas.

Acredito que os principais desafios estiveram relacionados ao provisionamento dos hosts Windows, pois todo o processo de criação e configuração das máquinas revelou-se demorado e apresentou uma série de obstáculos.

Sobre melhorias, acredito que algumas variáveis poderiam ser melhor refinadas dentro do IAC, bem como passar algumas informações para serem executadas dentro do pipeline.
<hr>

## Entendendo a Estrutura do IAC
O IAC é composto pela seguinte estrutura:
``` 
.
└── IAC/
    ├── modules.tf
    ├── provider.tf
    ├── terraform.tfvars
    ├── variables.tf
    └── Modules/
        ├── instance.tf
        ├── sg.tf
        ├── variables.tf
        └── scripts/
            └── ansible-config.sh
``` 
Abaixo temos uma explicação simplificada da função de cada arquivo/diretório.
- O arquivo _modules.tf_ é responsável por especificar ao modulo quais variáveis ele deverá usar.
- O arquivo _provider.tf_ é responsável por especificar o provider que estamos usando, bem como informações sobre o bucket e o arquivo de estado do terraform.
- Os arquivos _terraform.tfvars_ e o _variables.tf_ armazenam as variáveis que utilizamos em todo projeto e elas precisar ter os valores passados de forma hardcoded.

- A pasta _Modules/EC2_ contem toda a estrutura responsável pela criação e configuração das instancias.
- O arquivo _instance.tf_ é responsável por especificar todas as configurações de criação das instancias,
- O arquivo _sg.tf_ é responsável por criar o Security Group que será usado pelas instancias criadas.
- O arquivo _variables.tf_ armazema os blocos de variáveis usadas no modulo.
- Por fim, a pasta _scripts_ possui o script utilizado para realizar a configuração das instancias após a sua criação.
<hr>


## Como Executar o projeto?
Para executar o projeto é necessário ter algumas ferramentas instaladas, bem como algumas configurações a disposição. 
As ferramentas necessárias são:
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli);
- [CLI da AWS](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/getting-started-install.html);
- [Azure DevOps](https://learn.microsoft.com/pt-br/azure/devops/user-guide/sign-up-invite-teammates?view=azure-devops);
- [PHP](https://www.php.net/docs.php);
- [Composer](https://getcomposer.org/download/);
- [Laravel](https://laravel.com/docs/10.x/installation).

<hr>

Para executar o pipeline em sua conta do AzureDevops é necessário criar um grupo de variáveis contendo: 
- a _vmImage_ que deseja usar que em nosso caso é o ubuntu-latest, 
- o _terraformVersion_ com a versão do terraform que deseja utilizar, 
- a _serviceConnection_ que é o nome da sua conexão com a aws (se não tiver uma serviceconnection configurada no seu azure devops, sugiro dar uma olhada na documentação > [Gerenciar conexões de serviço - AzureDevOps](https://learn.microsoft.com/pt-br/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml)), 
- o _bucketName_ que é o nome do bucket na aws que será usado para armazenar o estado do terraform e por fim 
- a _bucketKey_ que é o caminho relativo para acesso ao arquivo de estado.

E para executar a API construida em Laravel é necessário criar um arquivo .env (utilize o arquivo .env-example como exemplo). Rode o comando:
``` 
 composer install  
```
Em seguida, rode o comando abaixo para gerar a key usada no projeto:
```
 php artisan key:generate
```
Por fim, execute este comando para rodar o projeto:
```
 php artisan serve
```
<hr>



