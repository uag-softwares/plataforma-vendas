include Helper

And('Eu estou logado como usuario de email {string}') do |email|
  visit '/usuarios/sign_in'
  fill_in 'email', with: email
  fill_in 'password', with: 'popopo'
  click_button 'Log in'
  visit '/usuarios/sign_up'
  a_pagina_deve_conter 'welcome'
end

And("Eu clico na opcao criar comentario") do
  click_link 'criarComentario'
end

And("Eu clico na opcao enviar comentario") do
  click_button 'comentar'
end

Then("Eu vejo que o comentario de titulo {string} e texto {string} foi criado no produto de codigo {int}") do |titulo, texto, codigo|
  a_pagina_deve_conter titulo, codigo, texto
end

Then("Eu vejo que o titulo do comentario de titulo {string} foi alterado para {string} e o texto {string} para {string}") do |titulo, novoTitulo, texto, novoTexto|
  expect(page).not_to have_text(titulo)
  expect(page).not_to have_text(texto)
  a_pagina_deve_conter novoTexto, novoTitulo
end


And("O comentario resposta de titulo {string} e texto {string} existe no comentario de titulo {string} e texto {string}") do |tituloResposta, textoResposta, titulo, texto|
  a_pagina_deve_conter tituloResposta, textoResposta, titulo, texto
end