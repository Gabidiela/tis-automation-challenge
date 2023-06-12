#!/bin/bash
sudo apt-get update 

# Instalação do ansible
sudo apt-get install -y ansible

sudo systemctl enable ansible

# Criação do diretório para o playbook do Ansible
mkdir -p ansible_playbook

# Cria o arquivo de playbook
cat <<EOF > ansible_playbook/playbook.yml
---
- name: Provisionar servidor Apache
  hosts: web_servers
  become: yes
  
  tasks:
    - name: Instalar o Apache
      apt:
        name: apache2
        state: present

    - name: Copiar arquivo index.html
      copy:
        content: "<html><body><h1>Hello, World!</h1></body></html>"
        dest: /var/www/html/index.html
EOF

# Cria o arquivo de inventário
cat <<EOF > ansible_playbook/inventory.ini
[web_servers]
localhost ansible_connection=local
EOF

echo "Playbook e inventário criados com sucesso!"

sudo ansible-playbook -i ansible_playbook/inventory.ini ansible_playbook/playbook.yml

echo "Para acessar o Hello World, digite localhost:80 no navegador."