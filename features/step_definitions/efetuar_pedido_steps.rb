Given('Existe um produto disponivel com o codigo {int} e preco {float}') do |codigo, preco|
  visit '/usuarios/sign_up'
  fill_in 'usuario[email]', with: 'adm@email.com'
  fill_in 'usuario[password]', with: '123456'
  fill_in 'usuario[password_confirmation]', with: '123456'
  check('usuario[admin]')
  fill_in 'usuario[nome]', with: 'administrador'
  click_button 'SignUp'
  visit '/produtos/new'
  expect(page).to have_text('New produto')
  fill_in 'produto[codigo]', with: codigo
  fill_in 'produto[preco]', with: preco
  fill_in 'produto[nome]', with: 'nomeproduto'
  fill_in 'produto[marca]', with: 'marcaproduto'
  fill_in 'produto[quantidade_estoque]', with: 15
  click_button 'cadastrar'
  expect(page).to have_text(codigo)
  click_link 'Log out'
end

Given('Eu estou logado como cliente') do
  visit '/usuarios/sign_up'
  fill_in 'usuario[email]', with: 'cliente@email.com'
  fill_in 'usuario[password]', with: '123456'
  fill_in 'usuario[password_confirmation]', with: '123456'
  fill_in 'usuario[nome]', with: 'cliente'
  click_button 'SignUp'
end

Given('Eu estou na pagina com todos os produtos disponiveis') do
  visit '/produtos'
end

When('Eu seleciono a opcao para ver o produto com o codigo {int}') do |codigo|
  click_link "s-#{codigo}"
end

Then('Eu vejo o produto com o codigo {int}') do |codigo|
  expect(page).to have_text(codigo)
end

And('Eu seleciono a opcao para adicionar o produto ao meu carrinho') do
  click_button 'adicionarAoCarrinho'
end

Then('eu vejo que o produto de codigo {int} foi adicionado ao meu carrinho') do |codigo|
  expect(page).to have_text(codigo)
end

And('Eu seleciono a opcao para editar a quantidade do produto') do
  click_link 'Edit'
end

And('Eu preencho o campo de quantidade com {int}') do |quantidade|
  fill_in 'item[quantidade]', with: quantidade
end

Then('Eu seleciono a opcao updade') do
  click_button 'update'
end

And('O produto com codigo {int} e preco {int} foi adicionado ao carrinho') do |codigo, _preco|
  visit '/produtos'
  click_link "s-#{codigo}"
  click_button 'adicionarAoCarrinho'
  expect(page).to have_text(codigo)
end

When('Eu seleciono a opcao de remover o produto de codigo {int} do carrinho') do |_codigo|
  click_link 'Destroy'
end

Then('Eu vejo que o produto de codigo {int} foi removido corretamente do carrinho') do |codigo|
  expect(page).not_to have_text(codigo)
end

When('Eu seleciono a opcao de finalizar o pedido') do
  click_button 'finalizarPedidoUser'
end

Then('Eu vejo que o pedido foi efetuado com sucesso') do
  expect(page).to have_text('efetuado')
end