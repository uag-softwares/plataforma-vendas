Given(/^Eu estou na pagina de cadastro de novo produto$/) do
  visit 'produtos/novo'
  expect(page).to have_current_path('/produtos/novo')
end

When('Eu preencho o campo codigoproduto com {string} and campo preco com {string} e seleciono a opcao de cadastro') do |arg1, arg2|
  fill_in 'produto[codigoproduto]', :with => arg1
  fill_in 'produto[preco]', :with => arg2
  click_button 'cadastrar'
end

Then('vejo que o produto com codigoproduto igual a {string} foi salvo') do |arg|
  expect(page).to have_content(arg)
  expect(page).to have_current_path('produtos/'+Produto.last.id.to_s)
end

