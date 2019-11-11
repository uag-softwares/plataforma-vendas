Feature: Efetuar pedido
  As a usuario da Chame Modas Web
  I want to ver produtos, efetuar, cancelar e ver meus pedidos
  So that eu possa efetuar ou cancelar a compra de um produto

  Scenario: Vizualizar um produto
    Given Existe um produto disponivel com o codigo 123 e preco 10.0
    And Eu estou logado como cliente
    And Eu estou na pagina com todos os produtos disponiveis
    When Eu seleciono a opcao para ver o produto com o codigo 123
    Then Eu vejo o produto com o codigo 123

  Scenario: Adicionar um produto ao carrinho
    Given Existe um produto disponivel com o codigo 123 e preco 10.0
    And Eu estou logado como cliente
    And Eu estou na pagina com todos os produtos disponiveis
    When Eu seleciono a opcao para ver o produto com o codigo 123
    And Eu seleciono a opcao para adicionar o produto ao meu carrinho
    Then eu vejo que o produto de codigo 123 foi adicionado ao meu carrinho

  Scenario: Editar quantidade de um produto no carrinho
    Given Existe um produto disponivel com o codigo 123 e preco 10.0
    And Eu estou logado como cliente
    And Eu estou na pagina com todos os produtos disponiveis
    When Eu seleciono a opcao para ver o produto com o codigo 123
    And Eu seleciono a opcao para adicionar o produto ao meu carrinho
    And Eu seleciono a opcao para editar a quantidade do produto
    And Eu preencho o campo de quantidade com 123
    Then Eu seleciono a opcao updade

  Scenario: Retirar produto do carrinho
    Given Existe um produto disponivel com o codigo 123 e preco 10.0
    And Eu estou logado como cliente
    And O produto com codigo 123 e preco 10 foi adicionado ao carrinho
    When Eu seleciono a opcao de remover o produto de codigo 123 do carrinho
    Then Eu vejo que o produto de codigo 123 foi removido corretamente do carrinho

  Scenario: Finalizar pedido no carrinho
    Given Existe um produto disponivel com o codigo 123 e preco 10.0
    And Eu estou logado como cliente
    And O produto com codigo 123 e preco 10 foi adicionado ao carrinho
    When Eu seleciono a opcao de finalizar o pedido
    Then Eu vejo que o pedido foi efetuado com sucesso



