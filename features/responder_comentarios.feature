Feature: Responder comentarios
  As a administrador do Chame Modas Web
  I want to criar, alterar, remover e ver um comentario
  So that eu possa comentar nos produtos, reponder e gerenciar comentarios dos clientes

  Scenario: Responder comentario de cliente
    Given Eu sou um administrador de nome "nomeA" email "emailA" e senha "senhaA"
    And Eu estou na pagina de visualizacao do produto de nome "nomeP" codigo "codP" marca "marca" quantidade de estoque 5 e preco 10.0
    And O comentario do cliente de titulo "nomeC" e texto "textoC" existe
    #When Eu clico na opcao responder comentario
    #And Eu preencho o campo titulo "tituloR" e o campo texto com "textoR"
    #And Eu clico na opcao enviar resposta
    #Then Eu vejo que o comentario do cliente de nome "nomeC" e texto "textoC" foi respondido

  #Scenario: Deletar comentario de cliente
  #  Given Eu estou na pagina de visualizacao do produto de nome "produto nome" e codigo "codigo produto"
  #  And O comentario do cliente de nome "cliente nome" e texto "texto comentario" existe
  #  When Eu clico na opcao deletar comentario no comentario de titulo "cliente nome"
  #  Then Eu vejo que o comentario de titulo "titulo comentario" foi deletado