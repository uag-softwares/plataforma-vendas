include Helper

And("Existe um produto de nome {string} codigo {int} marca {string} quantidade de estoque {int} e preco {float}") do |nome, codigo, marca, qEstoque, preco|
  visit '/produtos'
  a_pagina_deve_conter nome, codigo, preco, qEstoque, marca
end

And("Eu estou na pagina do produto de codigo {int}") do |codigo|
  visit '/produtos'
  click_link "s-#{codigo}"
end

And("O produto de codigo {int} tem um comentario do usuario de nome {string} com titulo {string} e texto {string}") do |codigo, nome, titulo, texto|
  visit '/produtos'
  click_link "s-#{codigo}"
  a_pagina_deve_conter titulo, texto, nome
end

And('Eu faco log in como adminstrador') do
  visit '/usuarios/sign_in'
  fill_in 'email', with: 'pao@example.com'
  fill_in 'password', with: 'popopo'
  click_button 'Log in'
end

And("O produto de codigo {int} tem um comentario de titulo {string} e texto {string}") do |codigo, titulo, texto|
  visit '/produtos'
  click_link "s-#{codigo}"
  a_pagina_deve_conter titulo, texto
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
  a_pagina_deve_conter "Sign up"
  fill_in 'usuario[nome]', with: nome
  fill_in 'usuario[email]', with: email
  fill_in 'usuario[password]', with: senha
  fill_in 'usuario[password_confirmation]', with: senha
  click_button 'SignUp'
  a_pagina_deve_conter "Log out"
end

Then("Eu vejo que o comentario resposta de titulo {string} e texto {string} foi criado no produto de codigo {int}") do |titulo, texto, codigo|
  a_pagina_deve_conter titulo, codigo, texto
end

When("Eu clico na opcao responder o comentario de titulo {string} do usuario de nome {string}") do |titulo, nome|
  click_link "reply-#{nome}-#{titulo}"
end

When("Eu clico na opcao deletar o comentario de titulo {string} do usuario de nome {string}") do |titulo, nome|
  click_link "destroy-#{nome}-#{titulo}"
end

When("Eu clico na opcao de alterar resposta do comentario de titulo {string} do usuario de nome {string}") do |titulo, nome|
  click_link "edit-#{nome}-#{titulo}"
end

Then("Eu vejo que o comentario de titulo {string} e texto {string} foi deletado") do |tituloComentario, textoComentario|
  expect(page).not_to have_text(tituloComentario)
  expect(page).not_to have_text(textoComentario)
  a_pagina_deve_conter 'Comentario was successfully destroyed'
end

Then("Eu vejo que o titulo da resposta de titulo {string} foi alterado para {string} e o texto {string} para {string}") do |titulo, novoTitulo, texto, novoTexto|
  expect(page).not_to have_text(titulo)
  expect(page).not_to have_text(texto)
  a_pagina_deve_conter novoTexto, novoTitulo
end

And("Eu preencho o campo titulo {string} e o campo texto com um texto vazio") do |tituloR|
  fill_in 'comentario[titulo]', with: tituloR
  fill_in 'comentario[texto]', with: ""
end
