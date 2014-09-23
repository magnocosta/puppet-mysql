puppet-mysql
============

Um simples módulo Puppet para a instalação e configuração do serviço de banco de dados Mysql.

####O que ele faz?
  * Instala o seviço Mysql;
  * Remove o usuário anonimo;
  * Adiciona uma configuração para permitir acessos remoto a base de dados;
  
####Como Utilizar
  Para utilizar esse módulo basta criar o projeto Vagrant na estrutura abaixo:
  
  <pre>
    --root
      |-- manifests
      |-- modules
      |-- vagranfile
  </pre>
  
  No diretório root do projeto Vagrant, utilize o comando abaixo para baixar e adicionar o módulo a sua pasta de módulos.
    
    git clone --recursive https://github.com/magnocosta/puppet-mysql.git modules/mysql
    
  Adicione a linha abaixo no seu Vagrantfile, para dizer ao Puppet que a pasta modules possui módulos de extensão para seu projetos.
    
    puppet.module_path = "modules"
    
  Feito isso basta usar o módulo nos seu arquivo de provisionamento com a linha abaixo:
  
    include mysql::server
    
  E pronto, seu serviço Mysql será instalado no proximo provisionamento.  \o/ \o/
