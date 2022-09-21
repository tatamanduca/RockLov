
Dado('que acesso a página principal') do
  @login_page.visit_page
end
  
Quando('submeto minhas credenciais {string} e {string}') do |email, password|
  @login_page.with(email, password)
end
