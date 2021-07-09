require_relative 'person'

jin = Jin.new("Jin Sakai", 100, 50, 80)
puts jin

mogol_archer = MongolArcher.new("Mongol Archer", 80, 40, 0)
puts mogol_archer

mogol_spearman = MongolSpearman.new("Mongol Spearman", 120, 60, 0)
puts mogol_spearman

mogol_swordsman = MongolSwordsman.new("Mongol Swordsman", 100, 50, 0)
puts mogol_swordsman

puts "\n"

loop do
    jin.attack(mogol_swordsman)
    jin.attack(mogol_archer)
    jin.attack(mogol_spearman)
    
    puts jin
    puts "\n"
    break if jin.die?

    mogol_archer.attack(jin)
    puts mogol_archer
    puts "\n"
    break if mogol_archer.die?

    mogol_spearman.attack(jin)
    puts mogol_spearman
    puts "\n"
    break if mogol_spearman.die?

    mogol_swordsman.attack(jin)
    puts mogol_swordsman
    puts "\n"
    break if mogol_swordsman.die?
end