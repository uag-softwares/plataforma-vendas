Given("Eu sou um administrador de nome {string} email {string} e senha {string}") do |nomeA, emailA, senhaA|
  visit 'usuarios/sign_up'
  expect(page).to have_text("Sign up")
  fill_in 'usuario[email]', with: emailA
  fill_in 'usuario[password]', with: senhaA
  fill_in 'usuario[password_confirmation]', with: senhaA
  check('usuario[admin]')
  fill_in 'usuario[nome]', with: nomeA
  click_button 'SignUp'
end

And("Existe um produto de nome {string} codigo {string} marca {string} quantidade de estoque {int} e preco {float}") do |nomeP, codigoP, marcaP, qEstoqueP, precoP|
  visit '/produtos/new'
  expect(page).to have_text("New produto")
  fill_in 'produto[codigo]', with: codigoP
  fill_in 'produto[nome]', with: nomeP
  fill_in 'produto[marca]', with: marcaP
  fill_in 'produto[quantidade_estoque]', with: qEstoqueP
  fill_in 'produto[preco]', with: precoP
  click_button 'cadastrar'
  visit '/produtos'
  click_link 'Show'
  expect(page).to have_text("Produto")
end

And("Eu estou na pagina do projeto de codigo {string}") do |codigo|
  visit '/produtos'
  click_link
end

And("O comentario de titulo {string} e texto {string} existe") do |clienteNome , textoComentario|
  fill_in 'comentario[titulo]', with: clienteNome
  fill_in 'comentario[titulo]', with: textoComentario
  click_button 'comentar_id'
end

When("Eu clico na opcao responder comentario") do
  click_button 'Responder comentario'
end

And("Eu preencho o campo titulo {string} e o campo texto com {string}") do |nomeAdm, textoComentario|
  fill_in 'comentario[titulo]', with: nomeAdm
  fill_in 'comentario[texto]', with: textoComentario
end

And("Eu clico na opcao enviar resposta") do
  click_button 'Responder avaliacao'
end

Then("Eu vejo que o comentario do cliente de nome {string} e texto {string} foi respondido") do |clienteNome, textoComentario|
  expect(page).to have_text(clienteNome)
  expect(page).to have_text(textoComentario)
  expect(page).to have_text("Avaliacao respondida com sucesso")
end

When("Eu clico na opcao deletar comentario no comentario de titulo {string} e texto {string}") do |_tituloComentario, _textoComentario|
  click_on 'Destroy'
end

Then("Eu vejo que o comentario de titulo {string} e texto {string} foi deletado") do |tituloComentario, textoComentario|
  expect(page).not_to have_text(tituloComentario)
  expect(page).not_to have_text(textoComentario)

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

Then("Eu vejo que o titulo da resposta de titulo {string} foi alterado para {string} e o texto {string} para {string}") do |_tituloR, _textoR, novoTituloR, novoTextoR|
  expect(page).to have_text(novoTituloR)
  expect(page).to have_text(novoTextoR)
end

When("Eu clico na opcao deletar resposta no comentario de titulo {string} e texto {string}") do |_tituloComentario, _textoComentario|
  click_button 'deletar comentario'
end

Then("Eu vejo que a resposta de titulo {string} e texto {string} foi deletada") do |tituloR, textoR|
  expect(page).not_to have_text(tituloR)
  expect(page).not_to have_text(textoR)
end

And("Eu preencho o campo titulo {string} e o campo texto com um texto vazio") do |tituloR|
  fill_in 'comentario[titulo]', with: tituloR
  fill_in 'comentario[texto]', with: ""
end

Then("Eu vejo que a resposta de titulo {string} e texto vazio nao foi enviada") do |tituloR|
  expect(page).not_to have_text(tituloR)
end