#language: pt

Funcionalidade: login
Sendo um usuário cadastrado
Quero acessar o sistema da Rocklov
Para que eu possa anunciar meus equipamentos musicais

    @login_sucesso
    Cenário: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais "tassio@io.com.br" e "abc123"
        Então sou redirecionado para o Dashboard

    
    Cenário: Tentativas de login

        Dado que acesso a página principal
        Quando submeto minhas credenciais "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
        |email_input        |senha_input|mensagem_output                 |
        |tassio@io.com.br   |def456     |Usuário e/ou senha inválidos.   |
        |tassio@gmail.com.br|abc123     |Usuário e/ou senha inválidos.   |
        |tassio*io.com.br   |abc123     |Oops. Informe um email válido!  |
        |                   |abc123     |Oops. Informe um email válido!  |
        |tassio@io.com.br   |           |Oops. Informe sua senha secreta!|