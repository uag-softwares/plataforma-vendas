Feature: Responder comentarios
  As a administrador do Chame Modas Web
  I want to criar, alterar, remover e ver um comentario
  So that eu possa comentar nos produtos, reponder e gerenciar comentarios dos clientes

  Scenario: Responder comentario de cliente
    Given Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And O produto de codigo 1 tem um comentario do usuario de nome "njogomais" com titulo "titulo1" e texto "texto1"
    And Eu faco log in como adminstrador
    And Eu estou na pagina do produto de codigo 1
    When Eu clico na opcao responder o comentario de titulo "titulo1" do usuario de nome "njogomais"
    And Eu preencho o campo titulo "tituloR" e o campo texto com "textoR"
    And Eu clico na opcao enviar resposta
    And Eu estou na pagina do produto de codigo 1
    Then Eu vejo que o comentario resposta de titulo "tituloR" e texto "textoR" foi criado no produto de codigo 1

  Scenario: Remover comentario de cliente
    Given Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And O produto de codigo 1 tem um comentario do usuario de nome "njogomais" com titulo "titulo1" e texto "texto1"
    And Eu faco log in como adminstrador
    And Eu estou na pagina do produto de codigo 1
    When Eu clico na opcao deletar o comentario de titulo "titulo1" do usuario de nome "njogomais"
    Then Eu vejo que o comentario de titulo "titulo1" e texto 'texto1' foi deletado

  Scenario: Alterar resposta do comentario de cliente
    Given Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And O produto de codigo 1 tem um comentario do usuario de nome "njogomais" com titulo "titulo1" e texto "texto1"
    And Eu faco log in como adminstrador
    And Eu estou na pagina do produto de codigo 1
    When Eu clico na opcao de alterar resposta do comentario de titulo "titulo1" do usuario de nome "njogomais"
    And Eu preencho o campo titulo "novoTituloR" e o campo texto com "novoTextoR"
    And Eu clico na opcao enviar resposta
    And Eu estou na pagina do produto de codigo 1
    Then Eu vejo que o titulo da resposta de titulo "titulo1" foi alterado para "novoTituloR" e o texto "texto1" para "novoTextoR"

  Scenario: Remover resposta do comentario de cliente
    Given Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And O produto de codigo 1 tem um comentario do usuario de nome "njogomais" com titulo "titulo1" e texto "texto1"
    And Eu faco log in como adminstrador
    And Eu estou na pagina do produto de codigo 1
    When Eu clico na opcao deletar o comentario de titulo "titulo1" do usuario de nome "njogomais"
    Then Eu vejo que o comentario de titulo "titulo1" e texto "texto1" foi deletado

  Scenario: Responder comentario com texto vazio
    Given Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And O produto de codigo 1 tem um comentario do usuario de nome "njogomais" com titulo "titulo1" e texto "texto1"
    And Eu faco log in como adminstrador
    And Eu estou na pagina do produto de codigo 1
    When Eu clico na opcao responder o comentario de titulo "titulo1" do usuario de nome "njogomais"
    And Eu preencho o campo titulo "tituloR" e o campo texto com um texto vazio
    And Eu clico na opcao enviar resposta
    Then Eu vejo uma mensagem de erro