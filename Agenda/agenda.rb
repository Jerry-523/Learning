#Adicionar, editar e Remover Contacto;
#Contacto terao as seguintes informacoes: nome e telefone;
#Poderemos ver todos os contatos registrados ou somente um contato;

@agenda = [{nome: "Jerry", telefone: "5555555"},
           {nome: "Borges", telefone: "6666666"},
           {nome: "Jader", telefone: "3333333"}            
]

def todos_contatos
    @agenda.each do |contato|
        puts "#{contato[:nome]} - #{contato[:telefone]}"
        
    end
    puts "------------------------------------------------------"
end 

def adicionar_contato
    print "Nome: "
    nome = gets.chomp
    print "Telefone: " 
    telefone = gets.chomp

    @agenda << {nome: nome, telefone: telefone}
end

def procurar_contato
    print "Procurar: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase == (nome.downcase)
            puts "#{contato[:nome]} - #{contato[:telefone]}"
        end
        puts "------------------------------------------------------"
    end
end

def editar_contato
    print "Qual contato deseja alterar: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase == (nome.downcase)
            print "Editar nome(caso queira manter o mesmo nome, aperte [Enter].): "
            nome_salvo = contato[:nome]

            contato[:nome] = gets.chomp
            contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]

            print "Editar telefone(caso queira manter o mesmo numero, aperte [Enter].): "
            telefone_salvo = contato[:telefone]

            contato[:telefone] = gets.chomp
            contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]

end

def remover_contato

end

loop do

puts "1. Contactos\n2. Adicionar Contacto\n3. Procurar\n4. Editar Contato\n5. Remover Contato\n0. Sair\n"
    codigo = gets.chomp.to_i

    case 
    when codigo == 0
        puts "Ate mais"
        break
    when codigo == 1
        todos_contatos
    when codigo == 2
        adicionar_contato
    when codigo == 3
        procurar_contato
    when codigo == 4
        editar_contato
    when codigo == 5
        remover_contato
    end
end
