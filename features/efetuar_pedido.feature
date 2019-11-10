Feature: Efetuar pedido
  As a usuario da Chame Modas Web
  I want to efetuar, cancelar e ver meus pedidos
  So that eu possa efetuar ou cancelar a compra de um produto

  Scenario: Vizualizar produto
    Given Existe um produto com o codigo 123 e preco 10.0
    And Eu estou na pagina com todos os produtos ja cadastrados
    When Eu seleciono a opcao para ver o produto com codigo 123
    Then Eu vejo o produto de codigo 123
