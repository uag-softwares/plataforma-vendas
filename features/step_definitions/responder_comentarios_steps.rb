Given("Eu estou logado como um administrador de nome {string} email {string} e senha {string}") do |nomeA, emailA, senhaA|
  visit 'usuarios/sign_up'
  expect(page).to have_text("Sign up")
  fill_in 'usuario[email]', with: emailA
  fill_in 'usuario[password]', with: senhaA
  fill_in 'usuario[password_confirmation]', with: senhaA
  check('usuario[admin]')
  fill_in 'usuario[nome]', with: nomeA
  click_button 'SignUp'
end

And("Existe um produto de nome {string} codigo {int} marca {string} quantidade de estoque {int} e preco {float}") do |nomeP, codigoP, marcaP, qEstoqueP, precoP|
  visit '/produtos/new'
  expect(page).to have_text("New produto")
  fill_in 'produto[codigo]', with: codigoP
  fill_in 'produto[nome]', with: nomeP
  fill_in 'produto[marca]', with: marcaP
  fill_in 'produto[quantidade_estoque]', with: qEstoqueP
  fill_in 'produto[preco]', with: precoP
  click_button 'cadastrar'
  expect(page).to have_text("Produto")
end

And("Eu estou na pagina do produto de codigo {int}") do |codigo|
  visit '/produtos'
  click_link "s-#{codigo}"
end

And("Eu faço log out") do
  click_link 'Log out'
end

And("O produto de codigo {int} tem um comentario do usuario de nome {string} com titulo {string} e texto {string}") do |codigo, nome, titulo, texto|
  visit '/produtos'
  click_link "s-#{codigo}"
  click_link 'create-comentario'
  fill_in 'comentario[titulo]', with: titulo
  fill_in 'comentario[texto]', with: texto
  click_button 'comentar'
  visit '/produtos'
  click_link "s-#{codigo}"
  expect(page).to have_text(titulo)
  expect(page).to have_text(texto)
  expect(page).to have_text(nome)
end

And("Eu faço log in com o usuario de email {string} e senha {string}") do |email, senha|
  click_link 'Log in'
  fill_in 'usuario[email]', with: email
  fill_in 'usuario[password]', with: senha
  click_button 'Log in'
end

And("O produto de codigo {int} tem um comentario de titulo {string} e texto {string}") do |codigo, titulo, texto|
  visit '/produtos'
  click_link "s-#{codigo}"
  click_link 'create-comentario'
  fill_in 'comentario[titulo]', with: titulo
  fill_in 'comentario[texto]', with: texto
  click_button 'comentar'
  visit '/produtos'
  click_link "s-#{codigo}"
  expect(page).to have_text(titulo)
  expect(page).to have_text(texto)
end

And("Eu preencho o campo titulo {string} e o campo texto com {string}") do |titulo, texto|
  fill_in 'comentario[titulo]', with: titulo
  fill_in 'comentario[texto]', with: texto
end

And("Eu clico na opcao enviar resposta") do
  click_button 'comentar'
end

And("Existe um usuario de nome {string} email {string} e senha {string}") do |nome, email, senha|
  visit '/usuarios/sign_up'
  expect(page).to have_text("Sign up")
  fill_in 'usuario[nome]', with: nome
  fill_in 'usuario[email]', with: email
  fill_in 'usuario[password]', with: senha
  fill_in 'usuario[password_confirmation]', with: senha
  click_button 'SignUp'
  expect(page).to have_text("Log out")
end

Then("Eu vejo que o comentario resposta de titulo {string} e texto {string} foi criado no produto de codigo {int}") do |titulo, texto, codigo|
  expect(page).to have_text(titulo)
  expect(page).to have_text(codigo)
  expect(page).to have_text(texto)
end

When("Eu clico na opcao responder o comentario de titulo {string} do usuario de nome {string}") do | titulo, nome|
  click_link "reply-#{nome}-#{titulo}"
end

When("Eu clico na opcao deletar o comentario de titulo {string} do usuario de nome {string}") do | titulo, nome|
  click_link "destroy-#{nome}-#{titulo}"
end

When("Eu clico na opcao de alterar resposta do comentario de titulo {string} do usuario de nome {string}") do | titulo, nome|
  click_link "edit-#{nome}-#{titulo}"
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
