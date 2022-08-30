
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
                                                                                 
Então('sou redirecionado para o dashboard') do                 #espero que na pagina de cadastro tenha
    expect(page).to have_css ".dashboard"                      #o elemento que gante que fui pra área logada
end            


#step2  
Quando('submeto o meu cadastro sem o nome') do
    find("#email").set "tatamanduca2@gmail.com"      
    find("#password").set "Fubazinho"

    click_button "Cadastrar"
end

#step3
Quando('submeto o meu cadastro sem o email') do
    find("#fullName").set "Tamires Manduca"
    find("#password").set "Fubazinho"

    click_button "Cadastrar"
end

#step4
Quando('submeto com email incorreto') do                                
    find("#fullName").set "Tamires Manduca"
    find("#email").set "tatamanduca2*gmail.com"
    find("#password").set "Fubazinho"

    click_button "Cadastrar"
end 

#step5
Quando('submeto o meu cadastro sem a senha') do                                
    find("#fullName").set "Tamires Manduca"
    find("#email").set "tatamanduca2@gmail.com"

    click_button "Cadastrar"
end                                                                            
                                                                                 
Então('vejo a mensagem de alerta: {string}') do |expect_alert|
    alert = find(".alert-dark")
    expect(alert.text).to eql expect_alert
end                                                                           
