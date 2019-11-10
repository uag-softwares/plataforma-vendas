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
