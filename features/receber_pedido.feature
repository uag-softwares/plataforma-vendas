Feature: Receber pedido
  As a administrador da Chame Modas Web
  I want to receber, ver, aceitar e cancelar um pedido
  So that eu possa gerenciar a compra de produtos

  Scenario: Visualizar pedido especifico
    Given Eu estou logado como um administrador de nome "nomeA" email "admin@gmail.com" e senha "senhaA"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faco log out
    And Existe um usuario de nome "user" email "user@gmail.com" e senha "senhaU"
    And Eu estou na pagina do produto de codigo 123
    And O usuario de nome "user" efetuou o pedido do produto de codigo 123
    And Eu faco log out
    And Eu faco log in com o usuario de email "admin@gmail.com" e senha "senhaA"
    And Eu estou na pagina dos pedidos
    When Eu clico na opcao visualizar pedido do usuario de nome "user"
    Then Eu vejo que o pedido foi recebido com sucesso

  Scenario: Visualizar pagina de pedidos
    Given Eu estou logado como um administrador de nome "nomeA" email "admin@gmail.com" e senha "senhaAdm"
    And Existe um produto de nome "nomePro" codigo 123 marca "marcaPro" quantidade de estoque 5 e preco 10.0
    And Eu faco log out
    And Existe um usuario de nome "user" email "user@gmail.com" e senha "senhaU"
    And Eu estou na pagina do produto de codigo 123
    And O usuario de nome "user" efetuou o pedido do produto de codigo 123
    And Eu faco log out
    And Eu faco log in com o usuario de email "admin@gmail.com" e senha "senhaAdm"
    When Eu entro na pagina dos pedidos
    Then Eu consigo visualizar todos os pedidos efetuados

  Scenario: Aceitar pedido de cliente
    Given Eu estou logado como um administrador de nome "nomeA" email "admin@gmail.com" e senha "senhaAdm"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faco log out
    And Existe um usuario de nome "user" email "user@gmail.com" e senha "senhaU"
    And Eu estou na pagina do produto de codigo 123
    And O usuario de nome "user" efetuou o pedido do produto de codigo 123
    And Eu faco log out
    And Eu faco log in com o usuario de email "admin@gmail.com" e senha "senhaAdm"
    And Eu estou na pagina dos pedidos
    When Eu clico na opcao visualizar pedido do usuario de nome "user"
    And Eu clico na opcao aceitar pedido
    Then Eu vejo que o pedido foi aceito com sucesso

  Scenario: Recusar pedido de cliente
    Given Eu estou logado como um administrador de nome "nomeA" email "admin@gmail.com" e senha "senhaAdm"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faco log out
    And Existe um usuario de nome "user" email "user@gmail.com" e senha "senhaU"
    And Eu estou na pagina do produto de codigo 123
    And O usuario de nome "user" efetuou o pedido do produto de codigo 123
    And Eu faco log out
    And Eu faco log in com o usuario de email "admin@gmail.com" e senha "senhaAdm"
    And Eu estou na pagina dos pedidos
    And Eu clico na opcao visualizar pedido do usuario de nome "user"
    When Eu clico na opcao recusar pedido
    Then Eu vejo que o pedido foi cancelado com sucesso

  Scenario: Reabrir pedido cancelado de cliente
    Given Eu estou logado como um administrador de nome "nomeA" email "admin@gmail.com" e senha "senhaAdm"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faco log out
    And Existe um usuario de nome "user" email "user@gmail.com" e senha "senhaU"
    And Eu estou na pagina do produto de codigo 123
    And O usuario de nome "user" efetuou o pedido do produto de codigo 123
    And Eu faco log out
    And Eu faco log in com o usuario de email "admin@gmail.com" e senha "senhaAdm"
    And Eu estou na pagina dos pedidos
    And Eu clico na opcao visualizar pedido do usuario de nome "user"
    And Eu clico na opcao recusar pedido
    When Eu clico na opcao reabrir pedido
    Then Eu vejo que o pedido foi reaberto com sucesso