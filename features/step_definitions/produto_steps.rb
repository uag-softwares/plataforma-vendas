
Given('Eu estou logado como administrador') do
  visit 'usuarios/sign_up'
  fill_in 'usuario[email]', with: 'adm@email.com'
  fill_in 'usuario[password]', with: '123456'
  fill_in 'usuario[password_confirmation]', with: '123456'
  check('usuario[admin]')
  fill_in 'usuario[nome]', with: 'administrador'
  click_button 'SignUp'
end

Given('Eu estou na pagina de cadastro de produto') do
  visit '/produtos/new'
  expect(page).to have_text('New produto')
end

Given('Existe um produto com o codigo {string} e preco {float}') do |codigo, preco|
  visit '/produtos/new'
  expect(page).to have_text('New produto')
  fill_in 'produto[codigo]', with: codigo
  fill_in 'produto[preco]', with: preco
  click_button 'cadastrar'
  expect(page).to have_text(codigo.to_i)
end

Given('Eu estou na pagina com todos os produtos ja cadastrados') do
  visit '/produtos'
end

When('Eu preencho os campos do codigo com {string} e preco com {float}') do |codigo, preco|
  fill_in 'produto[codigo]', with: codigo
  fill_in 'produto[preco]', with: preco
  fill_in 'produto[nome]', with: 'nomeproduto'
  fill_in 'produto[marca]', with: 'marcaproduto'
  fill_in 'produto[quantidade_estoque]', with: 15
end

When('Eu clico para salvar o produto')do
  click_button 'cadastrar'
end
# When('Eu preencho os campos do codigo com {string} e não preencho o campo preco') do |codigo|
#   fill_in 'produto[codigo]', with: codigo
#
# end
#

#
When('Eu clico para alterar o produto com o codigo {string}') do |codigo|
  click_link 'Edit'
end

When('Eu altero os campos de quantidade em estoque para {int} e preco para {float}') do |qtd_estoque, preco|
  fill_in 'produto[quantidade_estoque]', with: qtd_estoque
  fill_in 'produto[preco]', with: preco
end

When('Eu clico para salvar as alteracoes') do
  click_button 'cadastrar'
end

When('Eu seleciono a opcao para ver o produto com codigo {string}') do |codigo|
  click_link 'Show'
end


#
# When('Eu clico para salvar o produto') do
#   click_button 'cadastrar'
# end
#
# When('Eu seleciono a opcao de deletar o produto com codigo {string}') do
#   click_button 'deletar'
# end
#
Then('Eu vejo que os campos de quantidade em estoque e preco para foram atualizados para {int} e {float}') do |qtd_estoque, preco|
  expect(page).to have_text(qtd_estoque)
  expect(page).to have_text(preco)
end

Then('Eu vejo que o produto com o codigo {string} foi salvo') do |codigo|
  expect(page).to have_text(codigo.to_i)
end

Then('Eu vejo o produto de codigo {string}') do |codigo|
  expect(page).to have_text(codigo.to_i)
end
#
# Then('Vejo que o produto com codigo {string} foi corretamente deletado') do |codigo|
#   expect(page).not_to have_text(codigo)
# end
#


# Then('Eu vejo que o produto com o codigo {string} não foi salvo') do |codigo|
#   expect(page).not_to have_text(codigo)
# end
#


