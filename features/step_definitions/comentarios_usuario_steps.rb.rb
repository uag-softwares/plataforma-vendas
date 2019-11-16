And('Eu estou logado como usuario de email {string}') do |email|
  visit '/usuarios/sign_in'
  fill_in 'email', with: email
  fill_in 'password', with: 'popopo'
  click_button 'Log in'
  visit '/usuarios/sign_up'
  expect(page).to have_text('welcome')
end

And("Eu clico na opcao criar comentario") do
  click_on 'criarComentario'
end

And("Eu clico na opcao enviar comentario") do
  click_button 'comentar'
end

Then("Eu vejo que o comentario de titulo {string} e texto {string} foi criado no produto de codigo {int}") do |titulo, texto, codigo|
  expect(page).to have_text(titulo)
  expect(page).to have_text(codigo)
  expect(page).to have_text(texto)
end

Then("Eu vejo que o titulo do comentario de titulo {string} foi alterado para {string} e o texto {string} para {string}") do |titulo, novoTitulo, texto, novoTexto|
  expect(page).not_to have_text(titulo)
  expect(page).not_to have_text(texto)
  expect(page).to have_text(novoTexto)
  expect(page).to have_text(novoTitulo)
end


And("O comentario resposta de titulo {string} e texto {string} existe no comentario de titulo {string} e texto {string}") do |tituloR, textoR, tituloC, textoC|
  expect(page).to have_text(tituloR)
  expect(page).to have_text(textoR)
  expect(page).to have_text(tituloC)
  expect(page).to have_text(textoC)
end