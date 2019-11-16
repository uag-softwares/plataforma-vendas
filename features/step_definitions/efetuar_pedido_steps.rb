Given('Eu estou logado como cliente') do
  visit '/usuarios/sign_in'
  fill_in 'email', with: 'njogomais@example.com'
  fill_in 'password', with: 'popopo'
  click_button 'Log in'
end

Then('Eu vejo o produto com o codigo {int}') do |codigo|
  expect(page).to have_text(codigo)
end

And('Eu seleciono a opcao para adicionar o produto ao meu carrinho') do
  click_button 'adicionarAoCarrinho'
end

Then('Eu vejo que o produto de codigo {int} foi adicionado ao meu carrinho') do |codigo|
  expect(page).to have_text(codigo)
end

And('Eu seleciono a opcao para editar a quantidade do produto') do
  click_link 'Edit'
end

And('Eu preencho o campo de quantidade com {int}') do |quantidade|
  fill_in 'item[quantidade]', with: quantidade
end

Then('Eu seleciono a opcao update') do
  click_button 'update'
end

And('O produto com codigo {int} e preco {float} foi adicionado ao carrinho') do |codigo, _preco|
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