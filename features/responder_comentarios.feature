Feature: Responder comentarios
  As a administrador do Chame Modas Web
  I want to criar, alterar, remover e ver um comentario
  So that eu possa comentar nos produtos, reponder e gerenciar comentarios dos clientes

#  Scenario: Responder comentario de cliente
#    Given Eu sou um administrador de nome "nomeA" email "emailA@gmail.com" e senha "senhaA"
#    And Existe um produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
#    And Eu estou na pagina do projeto de codigo 123
#    And E o produto de codigo 123 tem um comentario de titulo "nomeC" e texto "textoC"
#    When Eu clico na opcao responder comentario
#    And Eu preencho o campo titulo "tituloR" e o campo texto com "textoR"
#    And Eu clico na opcao enviar resposta
#    Then Eu vejo que o comentario do cliente de nome "nomeC" e texto "textoC" foi respondido

#  Scenario: Remover comentario de cliente
#    Given Eu sou um administrador de nome "nomeA" email "emailA@gmail.com" e senha "senhaA"
#    And Eu estou na pagina de visualizacao do produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
#    And E o produto de codigo 123 tem um comentario de titulo "nomeC" e texto "textoC"
#    When Eu clico na opcao deletar comentario no comentario de titulo "nomeC" e texto "textoC"
#    Then Eu vejo que o comentario de titulo "nomeC" e texto 'textoC' foi deletado

  #Scenario: Alterar resposta do comentario de cliente
  #   Given Eu sou um administrador de nome "nomeA" email "emailA@gmail.com" e senha "senhaA"
  #   And Eu estou na pagina de visualizacao do produto de nome "nomeP" codigo 123 marca "marca" quantidade de estoque 5 e preco 10.0
  #   And E o produto de codigo 123 tem um comentario de titulo "nomeC" e texto "textoC"
  #   And O comentario do cliente de nome "tituloC" e texto "textoC" foi respondido com o comentario de titulo "tituloR" e texto "textoR"
  #   When Eu clico na opcao de alterar resposta
  #   And Eu preencho o campo titulo "novoTituloR" e o campo texto com "novoTextoR"
  #   And Eu clico na opcao enviar resposta
  #   Then Eu vejo que o titulo da resposta de titulo "tituloR" foi alterado para "novoTituloR" e o texto "textoC" para "novoTextoR"

  #Scenario: Remover resposta do comentario de cliente
  #   Given O comentario do cliente de nome "nomeC" e texto "textoC" existe
  #   And Eu estou na pagina de visualizacao do produto de nome "nomeP" e codigo 123
  #   And O comentario do cliente de nome "tituloC" e texto "textoC" foi respondido com o comentario de titulo "tituloR" e texto "textoR"
  #   When Eu clico na opcao de alterar resposta
  #   And Eu clico na opcao deletar resposta no comentario de titulo "tituloR" e texto "textoR"
  #   Then Eu vejo que a resposta de titulo "tituloR" e texto "textoR" foi deletada

  #Scenario: Responder comentario com texto vazio
  #   Given O comentario do cliente de nome "nomeC" e texto "textoC" existe
  #   And Eu estou na pagina de visualizacao do produto de nome "nomeP" e codigo 123
  #   When Eu clico na opcao responder comentario
  #   And Eu preencho o campo titulo "tituloR" e o campo texto com um texto vazio
  #   And Eu clico na opcao enviar resposta
  #   Then Eu vejo que a resposta de titulo "tituloR" e texto vazio nao foi enviada