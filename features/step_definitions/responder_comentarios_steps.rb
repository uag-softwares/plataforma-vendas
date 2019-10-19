Given("Eu estou na pagina de visualizacao do produto de nome {string} e codigo {string}") do |nomeProduto ,codigoProduto|
  visit '/produtos/novo'
  expect(page).to have_current_path('/produtos/novo')
  fill_in 'produto[codigo]', :with => codigoProduto
  click_button 'cadastrar'
  visit '/produtos/'+codigoProduto.to_s
  expect(page).to have_text(nomeProduto)
end

And("O comentario do cliente de nome {string} e texto {string} existe") do |clienteNome , textoComentario|
  click_button 'Comentar'
  fill_in 'comentario[titulo]', :with => clienteNome
  fill_in 'comentario[texto]', :with => textoComentario
  click_button 'Enviar avaliacao'
  expect(page).to have_text(clienteNome)
  expect(page).to have_text(textoComentario)
end

When("Eu clico na opcao responder comentario") do
  click_button 'Responder comentario'
end

And("Eu preencho o campo titulo {string} e o campo texto com {string}") do |nomeAdm, textoComentario|
  fill_in 'comentario[titulo]', :with => nomeAdm
  fill_in 'comentario[texto]', :with => textoComentario
end

And("Eu clico na opcao enviar resposta") do
  click_button 'Responder avaliacao'
end

Then("Eu vejo que o comentario do cliente de nome {string} e texto {string} foi respondido") do |clienteNome, textoComentario|
  expect(page).to have_text(clienteNome)
  expect(page).to have_text(textoComentario)
  expect(page).to have_text("Avaliacao respondida com sucesso")
end

When("Eu clico na opcao deletar comentario no comentario de titulo {string} e texto {string}") do |tituloComentario, textoComentario|
  click_button 'deletar comentario'
end

Then("Eu vejo que o comentario de titulo {string} foi deletado") do |tituloComentario|
  expect(page).not_to have_text(tituloComentario)
end

And("O comentario do cliente de nome {string} e texto {string} foi respondido com o comentario de titulo {string} e texto {string}") do |nomeC, textoC, nomeR, textoR|
  expect(page).to have_text(nomeC)
  expect(page).to have_text(textoC)
  expect(page).to have_text(nomeR)
  expect(page).to have_text(textoR)
end

When("Eu clico na opcao de alterar resposta") do
  click_button 'alterar resposta'
end

Then("Eu vejo que o titulo da resposta de titulo {string} foi alterado para {string} e o texto {string} para {string}") do |tituloR, textoR, novoTituloR, novoTextoR|
  expect(page).to have_text(novoTituloR)
  expect(page).to have_text(novoTextoR)
end

When("Eu clico na opcao deletar resposta no comentario de titulo {string} e texto {string}") do |tituloComentario, textoComentario|
  click_button 'deletar comentario'
end

Then("Eu vejo que a resposta de titulo {string} e texto {string} foi deletada") do |tituloR, textoR|
  expect(page).not_to have_text(tituloR)
  expect(page).not_to have_text(textoR)
end

And("Eu preencho o campo titulo {string} e o campo texto com um texto vazio") do |tituloR|
  fill_in 'comentario[titulo]', :with => tituloR
  fill_in 'comentario[texto]', :with => ""
end

Then("Eu vejo que a resposta de titulo {string} e texto vazio nao foi enviada") do |tituloR|
  expect(page).not_to have_text(tituloR)
end