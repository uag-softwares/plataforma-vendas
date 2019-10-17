Feature: Produto
  As a administrador do Chame Modas Web
  I want to cadastrar, alterar, remover e ver um produto
  So that eu possa expor e gerenciar os produtos

Scenario: Novo produto
  Given Eu estou na pagina de cadastro de novo produto
  When Eu preencho o campo codigoproduto com "argumento1" and campo preco com "argumento2" e seleciono a opcao de cadastro
  Then vejo que o produto com codigoproduto igual a "argumento1" foi salvo


