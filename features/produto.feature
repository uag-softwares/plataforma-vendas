Feature: Produto
  As a administrador do Chame Modas Web
  I want to cadastrar, alterar, remover e ver um produto
  So that eu possa expor e gerenciar os produtos

Scenario: Novo produto
  Given Eu estou na pagina de cadastro de novo produto
  When Eu preencho o campo codigoproduto com "argumento1" and campo preco com "argumento2" e seleciono a opcao de cadastro
  Then vejo que o produto com codigoproduto igual a "argumento1" foi salvo

Scenario: Alterar produto
  Given Eu estou na pagina com todos os produtos ja cadastrados
  And Eu seleciono a opcao de alterar o produto com o codigo "argumento1"
  When Eu altero o campo qtd_estoque "argumento2" and campo preco com "argumento3" e seleciono alterar
  Then  Eu vejo que o produto foi atualizado para a qtd_estoque "argumento2" e preco "argumento3"

Scenario: Vizualizar produto
  Given Eu estou na pagina com todos os produtos ja cadastrados
  When Eu seleciono a opcao de ver o produto com codigo "argumento"
  Then Eu vejo que estou na pagina do produto de codigo "argumento"
