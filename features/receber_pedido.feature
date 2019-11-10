Feature: Receber pedido
  As a administrador da Chame Modas Web
  I want to receber, ver, aceitar e cancelar um pedido
  So that eu possa gerenciar a compra de produtos

  Scenario: Visualizar pedido de cliente
    Given Eu estou logado como um administrador de nome "nomeA" email "emailA@gmail.com" e senha "senhaA"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faco log out
    And Existe um usuario de nome "user" email "paozin@gmail.com" e senha "senhaU"
    And Eu estou na pagina do produto de codigo 123
    And O usuario de nome "user" efetuou o pedido de codigo "codigoP" da compra do produto de codigo 123
    And O pagamento do pedido de codigo "codigoP" nao foi efetuado com sucesso pelo usuario de nome "user"
    And O pedido de codigo "codigoP" foi enviado para analise
    And Eu faco log out
    And Eu faco log in como um administrador de email "emailA@gmail.com" e senha "senhaA"
    When Eu eu entro na pagina de pedidos
    Then Eu vejo que o pedido de codigo "codigoP" foi recebido com sucesso

  Scenario: Visualizar pagina de pedidos
    Given Eu estou logado como um administrador de nome "nomeA" email "emailA@gmail.com" e senha "senhaA"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faco log out
    And Existe um usuario de nome "user" email "paozin@gmail.com" e senha "senhaU"
    And Eu estou na pagina do produto de codigo 123
    And O usuario de nome "user" efetuou o pedido de codigo "codigoP" da compra do produto de codigo 123
    And O pagamento do pedido de codigo "codigoP" nao foi efetuado com sucesso pelo usuario de nome "user"
    And O pedido de codigo "codigoP" foi enviado para analise
    And Eu faco log out
    And Eu faco log in como um administrador de email "emailA@gmail.com" e senha "senhaA"
    When Eu eu entro na pagina de pedidos
    Then Eu consigo visualizar todos os pedidos efetuados

  Scenario: Aceitar pedido de cliente
    Given Eu estou logado como um administrador de nome "nomeA" email "emailA@gmail.com" e senha "senhaA"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faco log out
    And Existe um usuario de nome "user" email "user@gmail.com" e senha "senhaU"
    And Eu estou na pagina do produto de codigo 123
    And O usuario de nome "user" efetuou o pedido de codigo "codigoP" da compra do produto de codigo 123
    And O pagamento do pedido de codigo "codigoP" foi efetuado com sucesso pelo usuario de nome "user"
    And O pedido de codigo "codigoP" foi enviado para analise
    And Eu faco log out
    And Eu faco log in como um administrador de email "emailA@gmail.com" e senha "senhaA"
    And Eu estou na pagina dos pedidos
    When Eu clico na opcao visualizar pedido de codigo "codigoP" do usuario de nome "user"
    And Eu estou na pagina do pedido de codigo "codigoP"
    And Eu clico na opcao aceitar pedido
    Then Eu vejo que o pedido de codigo "codigoP" do usuario de nome "user" foi aceito com sucesso

  Scenario: Recusar pedido de cliente
    Given Eu estou logado como um administrador de nome "nomeA" email "emailA@gmail.com" e senha "senhaA"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faco log out
    And Existe um usuario de nome "user" email "user@gmail.com" e senha "senhaU"
    And Eu estou na pagina do produto de codigo 123
    And O usuario de nome "user" efetuou o pedido de codigo "codigoP" da compra do produto de codigo 123
    And O pagamento do pedido de codigo "codigoP" nao foi efetuado com sucesso pelo usuario de nome "user"
    And O pedido de codigo "codigoP" foi enviado para analise
    And Eu faco log out
    And Eu faco log in como um administrador de email "emailA@gmail.com" e senha "senhaA"
    And Eu estou na pagina dos pedidos
    When Eu clico na opcao visualizar pedido de codigo "codigoP" do usuario de nome "user"
    And Eu estou na pagina do pedido de codigo "codigoP"
    And Eu clico na opcao recusar pedido
    Then Eu vejo que o pedido de codigo "codigoP" do usuario de nome "user" foi recusado com sucesso

  Scenario: Cancelar pedido de produto fora de estoque
    Given Eu estou logado como um administrador de nome "nomeA" email "emailA@gmail.com" e senha "senhaA"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faco log out
    And Existe um usuario de nome "user" email "paozin@gmail.com" e senha "senhaU"
    And Eu estou na pagina do produto de codigo 123
    And O usuario de nome "user" efetuou o pedido de codigo "codigoP" da compra do produto de codigo 123
    And O pagamento do pedido de codigo "codigoP" nao foi efetuado com sucesso pelo usuario de nome "user"
    And O pedido de codigo "codigoP" foi enviado para analise
    And Eu faco log out
    And Eu faco log in como um administrador de email "emailA@gmail.com" e senha "senhaA"
    And Eu estou na pagina dos pedidos
    When Eu clico na opcao visualizar pedido de codigo "codigoP" do usuario de nome "user"
    And Eu estou na pagina do pedido de codigo "codigoP"
    And O produto de codigo 123 esta fora de estoque
    And Eu clico na opcao recusar pedido
    Then Eu vejo que o pedido de codigo "codigoP" do usuario de nome "user" foi recusado com sucesso