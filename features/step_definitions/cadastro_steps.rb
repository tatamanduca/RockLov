
#step1
Dado('que acesso a pagina de cadastro') do                     #acesso a página de cadastro                        
    visit "http://rocklov-web:3000/signup"
end                                                                            
                                                                                 
Quando('submeto o seguinte formnulário de cadastro:') do |table|  
    
    user = table.hashes.first

    MongoDB.new.remove_user(user[:email])

    find("#fullName").set user[:nome]
    find("#email").set user[:email]                       
    find("#password").set user[:senha]

    click_button "Cadastrar"
end                                                                            
                                                                                 
Então('sou redirecionado para o Dashboard') do                 #espero que na pagina de cadastro tenha
    expect(page).to have_css ".dashboard"                      #o elemento que gante que fui pra área logada
end                                                                                      
                                                                                 
Então('vejo a mensagem de alerta: {string}') do |expect_alert|
    alert = find(".alert-dark")
    expect(alert.text).to eql expect_alert
end                                                                           
