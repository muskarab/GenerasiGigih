require_relative 'person'

class Hero < Person
    def initialize(name, hitpoint, attack_demage)
        super(name, hitpoint, attack_demage)
        @deflect_percentage = 0.8
        @heal_point = 20
    end

    def take_damage(damage)
        if rand <= @deflect_percentage
            puts "#{@name} deflect the attack"
        else
            super(damage)
        end
    end

    def heal(other_hero)
        other_hero.take_heal(@heal_point)
        puts "#{@name} heals #{other_hero.name}, restoring #{@heal_point} hitpoints"
    end
end