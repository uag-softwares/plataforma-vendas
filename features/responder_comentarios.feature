Feature: Responder comentarios
  As a administrador do Chame Modas Web
  I want to criar, alterar, remover e ver um comentario
  So that eu possa comentar nos produtos, reponder e gerenciar comentarios dos clientes

  Scenario: Responder comentario de cliente
    Given Eu estou na pagina de visualizacao do produto de nome "produto nome" e codigo "codigo produto"
    And O comentario do cliente de nome "cliente nome" e texto "texto comentario" existe
    When Eu clico na opcao responder comentario
    And Eu crio um comentario com titulo "titulo resposta comentario" e texto "resposta comentario"
    And Eu clico na opcao enviar resposta
    Then Eu vejo que o comentario do cliente de nome "cliente nome" e texto "texto comentario" foi respondido

  #Scenario: Deletar comentario de cliente
  #  Given O comentario do cliente de nome "cliente nome" e texto "texto comentario" existe
  #  And Eu estou na pagina de visualizacao de um produto
  #  When Eu clico na opcao deletar comentario no comentario de titulo "titulo comentario"
  #  Then Eu vejo que o comentario de titulo "titulo comentario" foi deletado