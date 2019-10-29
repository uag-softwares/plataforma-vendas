Feature: Responder comentarios
  As a administrador do Chame Modas Web
  I want to criar, alterar, remover e ver um comentario
  So that eu possa comentar nos produtos, reponder e gerenciar comentarios dos clientes

  Scenario: Responder comentario de cliente
    Given Eu estou logado como um administrador de nome "nomeA" email "emailA@gmail.com" e senha "senhaA"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faço log out
    And Existe um usuario de nome "joao" email "paozin@gmail.com" e senha "jojojo"
    And O produto de codigo 123 tem um comentario do usuario de nome "joao" com titulo "nomeC" e texto "textoC"
    And Eu estou na pagina do produto de codigo 123
    And Eu faço log out
    And Eu faço log in com o usuario de email "emailA@gmail.com" e senha "senhaA"
    And Eu estou na pagina do produto de codigo 123
    When Eu clico na opcao responder o comentario de titulo "nomeC" do usuario de nome "joao"
    And Eu preencho o campo titulo "tituloR" e o campo texto com "textoR"
    And Eu clico na opcao enviar resposta
    And Eu estou na pagina do produto de codigo 123
    Then Eu vejo que o comentario resposta de titulo "tituloR" e texto "textoR" foi criado no produto de codigo 123

  Scenario: Remover comentario de cliente
    Given Eu estou logado como um administrador de nome "nomeA" email "emailA@gmail.com" e senha "senhaA"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faço log out
    And Existe um usuario de nome "joao" email "paozin@gmail.com" e senha "jojojo"
    And O produto de codigo 123 tem um comentario do usuario de nome "joao" com titulo "nomeC" e texto "textoC"
    And Eu estou na pagina do produto de codigo 123
    And Eu faço log out
    And Eu faço log in com o usuario de email "emailA@gmail.com" e senha "senhaA"
    And Eu estou na pagina do produto de codigo 123
    When Eu clico na opcao deletar o comentario de titulo "nomeC" do usuario de nome "joao"
    Then Eu vejo que o comentario de titulo "nomeC" e texto 'textoC' foi deletado

  Scenario: Alterar resposta do comentario de cliente
    Given Eu estou logado como um administrador de nome "nomeA" email "emailA@gmail.com" e senha "senhaA"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faço log out
    And Existe um usuario de nome "joao" email "paozin@gmail.com" e senha "jojojo"
    And O produto de codigo 123 tem um comentario do usuario de nome "joao" com titulo "nomeC" e texto "textoC"
    And Eu estou na pagina do produto de codigo 123
    And Eu faço log out
    And Eu faço log in com o usuario de email "emailA@gmail.com" e senha "senhaA"
    And Eu estou na pagina do produto de codigo 123
    And Eu clico na opcao responder o comentario de titulo "nomeC" do usuario de nome "joao"
    And Eu preencho o campo titulo "tituloR" e o campo texto com "textoR"
    And Eu clico na opcao enviar resposta
    And Eu estou na pagina do produto de codigo 123
    When Eu clico na opcao de alterar resposta do comentario de titulo "tituloR" do usuario de nome "nomeA"
    And Eu preencho o campo titulo "novoTituloR" e o campo texto com "novoTextoR"
    And Eu clico na opcao enviar resposta
    And Eu estou na pagina do produto de codigo 123
    Then Eu vejo que o titulo da resposta de titulo "tituloR" foi alterado para "novoTituloR" e o texto "textoC" para "novoTextoR"

  Scenario: Remover resposta do comentario de cliente
    Given Eu estou logado como um administrador de nome "nomeA" email "emailA@gmail.com" e senha "senhaA"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faço log out
    And Existe um usuario de nome "joao" email "paozin@gmail.com" e senha "jojojo"
    And O produto de codigo 123 tem um comentario do usuario de nome "joao" com titulo "nomeC" e texto "textoC"
    And Eu estou na pagina do produto de codigo 123
    And Eu faço log out
    And Eu faço log in com o usuario de email "emailA@gmail.com" e senha "senhaA"
    And Eu estou na pagina do produto de codigo 123
    And Eu clico na opcao responder o comentario de titulo "nomeC" do usuario de nome "joao"
    And Eu preencho o campo titulo "tituloR" e o campo texto com "textoR"
    And Eu clico na opcao enviar resposta
    And Eu estou na pagina do produto de codigo 123
    When Eu clico na opcao deletar o comentario de titulo "tituloR" do usuario de nome "nomeA"
    And Eu estou na pagina do produto de codigo 123
    Then Eu vejo que a resposta de titulo "tituloR" e texto "textoR" foi deletada

  Scenario: Responder comentario com texto vazio
    Given Eu estou logado como um administrador de nome "nomeA" email "emailA@gmail.com" e senha "senhaA"
    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
    And Eu faço log out
    And Existe um usuario de nome "joao" email "paozin@gmail.com" e senha "jojojo"
    And O produto de codigo 123 tem um comentario do usuario de nome "joao" com titulo "nomeC" e texto "textoC"
    And Eu estou na pagina do produto de codigo 123
    And Eu faço log out
    And Eu faço log in com o usuario de email "emailA@gmail.com" e senha "senhaA"
    And Eu estou na pagina do produto de codigo 123
    When Eu clico na opcao responder o comentario de titulo "nomeC" do usuario de nome "joao"
    And Eu preencho o campo titulo "tituloR" e o campo texto com um texto vazio
    And Eu clico na opcao enviar resposta
    And Eu estou na pagina do produto de codigo 123
    Then Eu vejo que a resposta de titulo "tituloR" e texto vazio nao foi enviada
