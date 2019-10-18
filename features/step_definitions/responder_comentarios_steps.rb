Given("Eu estou na pagina de visualizacao do produto de nome {string} e codigo {string}") do |nomeProduto ,codigoProduto|
  visit 'produtos/novo'
  expect(page).to have_current_path('/produtos/novo')
  fill_in 'produto[codigo]', :with => codigoProduto
  click_button 'cadastrar'
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


And("Eu crio um comentario com titulo {string} e texto {string}") do |nomeAdm, textoComentario|
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