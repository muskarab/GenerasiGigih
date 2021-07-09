require_relative 'hero'
require_relative 'ally'
require_relative 'mongol'

jin = Hero.new("Jin Sakai", 100, 50)
yuna = Ally.new("Yuna", 90, 45)
sensei_ishikawa = Ally.new("Sensei Ishikawa", 80, 60)
mongol_archer = MongolArcher.new("Mongol Archer", 80, 50)
mongol_spearman = MongolSpearman.new("Mongol Spearman", 120, 60)
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman", 100, 50)

allies = [yuna, sensei_ishikawa]
jin_and_ally = [jin] + allies 
villains = [mongol_archer, mongol_spearman, mongol_swordsman]
i = 1
until (jin.die? || villains.empty? ) do
    puts "========== Turn #{i} ==========" 
    puts "\n"

    puts jin
    allies.each do |ally|
        puts ally
    end
    villains.each do |villain|
        puts villain
    end
    puts "\n"
    
    puts "As Jin Sakai, what do you want to do this turn?"
    puts "1) Attack an Enemy"
    puts "2) Heal an Ally"    
    option = gets.chomp().to_i 
    puts "\n"
    case option
    when 1
        puts "Which enemy you want to attack?"
        villains.each_with_index do |villain, index|
            puts "#{index+1}) #{villain.name}"
        end
        option = gets.chomp().to_i - 1
        puts "\n"
        jin.attack(villains[option])
        villains.each do |villain|
            villains.delete(villain) if villain.die? || villain.flee?
        end
        
    when 2
        if allies.empty?
            puts "all allies are dead"
        else
            puts "Which ally you want to heal?"
            allies.each_with_index do |ally, index|
            puts "#{index+1}) #{ally.name}"
            end
            option = gets.chomp().to_i - 1
            puts "\n"
            jin.heal(allies[option])
        end  
    else 
        puts "Jin doesn't attack or heal his Allies this turn"
    end

    allies.each do |ally|
        ally.attack(villains[rand(villains.size)]) if !villains.empty?
        villains.each do |villain|
            if villain.die? || villain.flee?
                villains.delete(villain) 
            end
        end
    end

    villains.each do |villain|
        villain.attack(jin_and_ally[rand(jin_and_ally.size)])
        jin_and_ally.each do |ally|
            if ally.die?
                jin_and_ally.delete(ally)
                allies.delete(ally)
            end
        end
    end

    if villains.empty?
        puts "Jin won"
    else
        puts "Mongol won"
    end

    puts "\n"
    i += 1
end