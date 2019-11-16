Feature: Receber pedido
  As a administrador da Chame Modas Web
  I want to receber, ver, aceitar e cancelar um pedido
  So that eu possa gerenciar a compra de produtos

  Scenario: Visualizar pedido especifico
    Given Eu estou logado como administrador
    And Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And O usuario de nome "njogomais" efetuou o pedido do produto de codigo 11
    And Eu estou na pagina dos pedidos
    When Eu clico na opcao visualizar pedido do usuario de nome "njogomais"
    Then Eu vejo que o pedido foi recebido com sucesso

  Scenario: Visualizar pagina de pedidos
    Given Eu estou logado como administrador
    And Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And O usuario de nome "njogomais" efetuou o pedido do produto de codigo 11
    When Eu entro na pagina dos pedidos
    Then Eu consigo visualizar todos os pedidos efetuados

  Scenario: Aceitar pedido de cliente
    Given Eu estou logado como administrador
    And Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And Eu estou na pagina do produto de codigo 11
    And O usuario de nome "njogomais" efetuou o pedido do produto de codigo 11
    And Eu estou na pagina dos pedidos
    When Eu clico na opcao visualizar pedido do usuario de nome "njogomais"
    And Eu clico na opcao aceitar pedido
    Then Eu vejo que o pedido foi aceito com sucesso

  Scenario: Recusar pedido de cliente
    Given Eu estou logado como administrador
    And Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And O usuario de nome "njogomais" efetuou o pedido do produto de codigo 11
    And Eu estou na pagina dos pedidos
    And Eu clico na opcao visualizar pedido do usuario de nome "njogomais"
    When Eu clico na opcao recusar pedido
    Then Eu vejo que o pedido foi cancelado com sucesso

  Scenario: Reabrir pedido cancelado de cliente
    Given Eu estou logado como administrador
    And Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And O usuario de nome "njogomais" efetuou o pedido do produto de codigo 11
    And Eu estou na pagina dos pedidos
    And Eu clico na opcao visualizar pedido do usuario de nome "njogomais"
    And Eu clico na opcao recusar pedido
    When Eu clico na opcao reabrir pedido
    Then Eu vejo que o pedido foi reaberto com sucesso