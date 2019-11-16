Given('Eu estou logado como administrador') do
  visit '/usuarios/sign_in'
  fill_in 'email', with: 'pao@example.com'
  fill_in 'password', with: 'popopo'
  click_button 'Log in'
end

Given('Eu estou na pagina de cadastro de produto') do
  visit '/produtos/new'
  expect(page).to have_text('New produto')
end

Given('Existe um produto com o codigo {int} e preco {float}') do |_codigo, _preco|
  visit '/produtos'
  expect(page).to have_text(_codigo)
  expect(page).to have_text(_preco)
end

Given('Eu estou na pagina com todos os produtos ja cadastrados') do
  visit '/produtos'
end

When('Eu preencho os campos do codigo com {int} e preco com {float}') do |codigo, preco|
  fill_in 'produto[codigo]', with: codigo
  fill_in 'produto[preco]', with: preco
  fill_in 'produto[nome]', with: 'nomeproduto'
  fill_in 'produto[marca]', with: 'marcaproduto'
  fill_in 'produto[quantidade_estoque]', with: 15
end

When('Eu clico para salvar o produto') do
  click_button 'cadastrar'
end

When('Eu preencho os campos do codigo com {int} e nao preencho o campo preco') do |codigo|
  fill_in 'produto[codigo]', with: codigo
end

When('Eu clico para alterar o produto com o codigo {int}') do |codigo|
  click_link "e-#{codigo}"
end

When('Eu altero os campos de quantidade em estoque para {int} e preco para {float}') do |qtd_estoque, preco|
  fill_in 'produto[quantidade_estoque]', with: qtd_estoque
  fill_in 'produto[preco]', with: preco
end

When('Eu clico para salvar as alteracoes') do
  click_button 'cadastrar'
end

When('Eu seleciono a opcao para ver o produto com codigo {int}') do |codigo|
  click_link "s-#{codigo}"
end

When('Eu seleciono a opcao de deletar o produto com codigo {int}') do |codigo|
  click_link "d-#{codigo}"
end

Then('Eu vejo que os campos de quantidade em estoque e preco para foram atualizados para {int} e {float}') do |qtd_estoque, preco|
  expect(page).to have_text(qtd_estoque)
  expect(page).to have_text(preco)
end

Then('Eu vejo que o produto com o codigo {int} foi salvo') do |codigo|
  expect(page).to have_text(codigo)
  expect(page).to have_text('Produto was successfully created')
end

Then('Eu vejo o produto de codigo {int}') do |codigo|
  expect(page).to have_text(codigo)
end

Then('Vejo que o produto com codigo {int} foi corretamente deletado') do |_codigo|
  expect(page).to have_text('Produto was successfully destroyed')
end

Then('Eu vejo uma mensagem de erro') do
  assert_selector('div#error_explanation')
end
