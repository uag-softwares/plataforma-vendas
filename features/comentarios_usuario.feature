Feature: Enviar comentario
  As a usuario do Chame Modas Web
  I want to criar, alterar, remover e ver um comentario
  So that eu possa comentar nos produtos e responder outros comentarios

  Scenario: Comentar em um produto
    Given Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And Eu estou logado como usuario de email "njogomais@example.com"
    And Eu estou na pagina do produto de codigo 1
    When Eu clico na opcao criar comentario
    And Eu preencho o campo titulo "tituloR" e o campo texto com "textoR"
    And Eu clico na opcao enviar comentario
    And Eu estou na pagina do produto de codigo 1
    Then Eu vejo que o comentario de titulo "tituloR" e texto "textoR" foi criado no produto de codigo 1

  Scenario: Responder comentario
    Given Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And O produto de codigo 1 tem um comentario do usuario de nome "njogomais" com titulo "titulo1" e texto "texto1"
    And Eu estou logado como usuario de email "pao@example.com"
    And Eu estou na pagina do produto de codigo 1
    When Eu clico na opcao responder o comentario de titulo "titulo1" do usuario de nome "njogomais"
    And Eu preencho o campo titulo "tituloR" e o campo texto com "textoR"
    And Eu clico na opcao enviar comentario
    And Eu estou na pagina do produto de codigo 1
    Then Eu vejo que o comentario resposta de titulo "tituloR" e texto "textoR" foi criado no produto de codigo 1

  Scenario: Deletar comentario
    Given Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And O produto de codigo 1 tem um comentario do usuario de nome "njogomais" com titulo "titulo1" e texto "texto1"
    And Eu estou logado como usuario de email "njogomais@example.com"
    And Eu estou na pagina do produto de codigo 1
    When Eu clico na opcao deletar o comentario de titulo "titulo1" do usuario de nome "njogomais"
    Then Eu vejo que o comentario de titulo "titulo1" e texto "texto1" foi deletado

  Scenario: Alterar titulo e texto de comentario
    Given Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And O produto de codigo 1 tem um comentario do usuario de nome "njogomais" com titulo "titulo1" e texto "texto1"
    And Eu estou logado como usuario de email "njogomais@example.com"
    And Eu estou na pagina do produto de codigo 1
    When Eu clico na opcao de alterar resposta do comentario de titulo "titulo1" do usuario de nome "njogomais"
    And Eu preencho o campo titulo "novoTituloR" e o campo texto com "novoTextoR"
    And Eu clico na opcao enviar comentario
    Then Eu vejo que o titulo do comentario de titulo "titulo1" foi alterado para "novoTituloR" e o texto "texto1" para "novoTextoR"

  Scenario: Deletar resposta de comentario
    Given Existe um produto de nome "MyString" codigo 1 marca "MyString" quantidade de estoque 11 e preco 9.99
    And O produto de codigo 1 tem um comentario do usuario de nome "njogomais" com titulo "titulo1" e texto "texto1"
    And Eu estou logado como usuario de email "pao@example.com"
    And Eu estou na pagina do produto de codigo 1
    And O comentario resposta de titulo "titulo2" e texto "texto2" existe no comentario de titulo "titulo1" e texto "texto1"
    When Eu clico na opcao deletar o comentario de titulo "titulo2" do usuario de nome "pao"
    Then Eu vejo que o comentario de titulo "titulo2" e texto "texto2" foi deletado

