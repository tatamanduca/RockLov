require 'mongo'                                                           #para importar a biblioteca do mongo
   
# Mongo::Logger.logger = Logger.new("./Logs Mongo/mongo.log")

class MongoDB
#método    
    def remove_user(email)                                                #email = argumento 
        client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')  #guarda a conexão na variavel client
        users = client[:users]                                            #exclui este email do banco de dados antes de preencher o cadastro
        users.delete_many({email: email})  
    end
   
end