
class EquiposPage
    include Capybara::DSL
    
    def create(equipo)
        #checkpoint com timeout explícito
        page.has_css?("#equipoForm")

        upload(equipo[:thumb]) if equipo[:thumb].length > 0 #length é um método que consegue obter a quantidade de itens num array ou a quantidade de letras numa string.
                                                            #> 0 quer dizer que foi preenchido
        find("input[placeholder='Descreva o seu equipamento']").set equipo[:nome]
        select_cat(equipo[:categoria]) if equipo[:categoria].length > 0
        find("input[placeholder='Valor cobrado por dia']").set equipo[:preco]

        click_button "Cadastrar"
    end

    def select_cat(cat)
        find("#category").find('option', text: cat).select_option
    end

    def upload(file_name)
        thumb = Dir.pwd + "/features/support/fixtures/images/" + file_name
        find("#thumbnail input[type=file]", visible: false).set thumb
    end
end