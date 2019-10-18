Given('Eu estou na pagina de cadastro de produto') do
  visit '/produtos/novo'
end

Given('Eu estou na pagina com todos os produtos ja cadastrados') do
  visit '/produtos'
end

Given('Existe um produto com o codigo {string}') do |codigo|
  visit '/produtos/novo'
  fill_in 'produto[codigo]', with: codigo
  click_button 'cadastrar'
  expect(page).to have_text(codigo)
end

When('Eu preencho os campos do codigo com {string} e preco com {string}') do |codigo, preco|
  fill_in 'produto[codigo]', with: codigo
  fill_in 'produto[preco]', with: preco
end

When('Eu clico para alterar o produto com o codigo {string}') do |codigo|
  click_link "alterar-#{codigo}"
end

When('Eu seleciono a opcao para ver o produto com codigo {string}') do |codigo|
  click_link "ver-#{codigo}"
end

When('Eu altero os campos de quantidade em estoque para {string} e preco para {string}') do |qtd_estoque, preco|
  fill_in 'produto[quantidade_estoque]', with: qtd_estoque
  fill_in 'produto[preco]', with: preco
end

When('Eu clico para salvar as alteracoes') do
  click_button 'alterar'
end

When('Eu clico para salvar o produto') do
  click_button 'cadastrar'
end

Then('Eu vejo que os campos de quantidade em estoque e preco para foram atualizados para {string} e {string}') do |qtd_estoque, preco|
  expect(page).to have_text(qtd_estoque)
  expect(page).to have_text(preco)
end

Then('Eu vejo que o produto com o codigo {string} foi salvo') do |codigo|
  expect(page).to have_text(codigo)
end

Then('Eu vejo o produto de codigo {string}') do |codigo|
  expect(page).to have_text(codigo)
end
