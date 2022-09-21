#language: pt

Funcionalidade: Cadastro

    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no Rocklov
    Para que eu possa disponibiliza-los para locação

    @cadastro_sucesso
    Cenário: Fazer cadastro

        Dado que acesso a pagina de cadastro
        Quando submeto o seguinte formnulário de cadastro:
        | nome            | email                  | senha     |
        | Tamires Manduca | tatamanduca2@gmail.com | Fubazinho |
        Então sou redirecionado para o Dashboard

    Cenário: Tentativa de cadastro

        Dado que acesso a pagina de cadastro
        Quando submeto o seguinte formnulário de cadastro:
            | nome       | email       | senha       |
            |<nome_input>|<email_input>|<senha_input>|
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
        |    nome_input    |     email_input        |  senha_input  |         mensagem_output           |
        |                  | tatamanduca2@gmail.com |   Fubazinho   |  Oops. Informe seu nome completo! |
        | Tamires Manduca  |                        |   Fubazinho   |  Oops. Informe um email válido!   |
        | Tamires Manduca  | tatamanduca2*gmail.com |   Fubazinho   |  Oops. Informe um email válido!   |
        | Tamires Manduca  | tatamanduca2@gmail.com |               |  Oops. Informe sua senha secreta! |