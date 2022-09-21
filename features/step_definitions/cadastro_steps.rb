
Dado('que acesso a pagina de cadastro') do                     #acesso a página de cadastro                        
    @signup_page.visit_page
end                                                                            
                                                                                 
Quando('submeto o seguinte formnulário de cadastro:') do |table|  
    user = table.hashes.first
    MongoDB.new.remove_user(user[:email])

    @signup_page.create(user)
end                                                                                                                                                     
