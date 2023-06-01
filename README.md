<img src="https://github.com/ThermoHolic-Sprint2/Site-ThermoHolic/assets/126488672/dd8c01bf-567d-4898-a53f-4e0a2b709d90" >


_Web Data Visualization = Visualização de Dados na Web_

# ThermoHolic - Repositório web-data-viz
Este repositório faz parte do projeto ThermoHolic, uma aplicação voltada para o monitoramento de temperatura na produção de cervejas artesanais. O repositório web-data-viz contém o código fonte em JavaScript e HTML responsável por fornecer a visualização dos dados coletados na forma de uma dashboard interativa. O banco de dados utilizado é o MySQL, gerenciado pelo MySql Workbench.

## Visão Geral
O ThermoHolic é um sistema que permite aos usuários monitorar e controlar a temperatura durante o processo de produção de cervejas artesanais. Através da coleta de dados provenientes de sensores conectados ao Arduino, os dados são armazenados no banco de dados MySQL e exibidos na forma de uma dashboard amigável ao usuário.

Este repositório é responsável por fornecer o front-end da aplicação, onde os dados coletados são visualizados e interagidos. O código fonte em JavaScript e HTML é responsável por buscar os dados no banco de dados e exibi-los de forma gráfica e intuitiva.

## Funcionalidades Principais
- Visualização de Dados: A aplicação web oferece uma dashboard interativa que exibe os dados de temperatura coletados ao longo do tempo, permitindo aos usuários analisar tendências e identificar variações.
- Gráficos Interativos: Os dados são apresentados em gráficos interativos, com opções de zoom, seleção de intervalos e exibição de detalhes adicionais, proporcionando uma experiência visual rica.
- Atualização em Tempo Real: Os dados são atualizados automaticamente na dashboard conforme novas leituras de temperatura são registradas no banco de dados, mantendo os usuários sempre atualizados.

## Tecnologias Utilizadas
- Linguagens de Programação: JavaScript, HTML, CSS
- Banco de Dados: MySQL

## Configuração e Uso
- Clone este repositório em sua máquina local.
- Certifique-se de ter o ambiente de desenvolvimento JavaScript configurado corretamente.
- Instale as dependências necessárias utilizando o gerenciador de pacotes de sua preferência (por exemplo, npm ou yarn).
- Configure as informações de conexão com o banco de dados no arquivo de configuração config.js.
- Execute o arquivo index.html em um servidor web local para iniciar a aplicação.
- Acesse a aplicação através do navegador e interaja com a dashboard para visualizar os dados de temperatura.

Antes de enviar um pull request, certifique-se de seguir as boas práticas de desenvolvimento e testes.

Licença
Este projeto é licenciado sob a SPTech School. Leia o arquivo LICENSE para obter mais informações sobre os termos de uso.
npm i
``` 
_O comando acima irá instalar as bibliotecas necessárias para o funcionamento do projeto. As bibliotecas a serem instaladas estão listadas no arquivo **package.json** então é muito importante que este não seja alterado. Será criada uma nova pasta/diretório chamado **node_modules** quando o comando for finalizado, que é onde as bibliotecas estão localizadas. Não altere a pasta/diretório._

```
npm start
``` 

_O comando acima irá iniciar seu projeto e efetuar os comandos de acordo com a sua parametrização feita nos passos anteriores._


