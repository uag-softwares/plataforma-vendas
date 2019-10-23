Given("Eu sou um administrador de nome {string} email {string} e senha {string}") do |nomeA, emailA, senhaA|
  visit '/usuarios/sign_up'
  expect(page).to have_text("Sign up")
  fill_in 'usuario[email]', :with => emailA
  fill_in 'usuario[password]', :with => senhaA
  fill_in 'usuario[password_confirmation]', :with => senhaA
  check('usuario[admin]')
  fill_in 'usuario[nome]', :with => nomeA
  click_button 'SignUp'
end

And("Eu estou na pagina de visualizacao do produto de nome {string} codigo {string} marca {string} quantidade de estoque {int} e preco {float}") do |nomeP, codigoP, marcaP, qEstoqueP, precoP|
  visit '/produtos/new'
  expect(page).to have_text("New produto")
  fill_in 'produto[codigo]', :with => codigoP
  fill_in 'produto[nome]', :with => nomeP
  fill_in 'produto[marca]', :with => marcaP
  fill_in 'produto[quantidade_estoque]', :with => qEstoqueP
  fill_in 'produto[preco]', :with => precoP
  click_button 'cadastrar'
  visit '/produtos'
  click_link 'Show'
  expect(page).to have_text("Produto")
end

And("O comentario do cliente de titulo {string} e texto {string} existe") do |clienteNome , textoComentario|
  click_button'comentar'
end