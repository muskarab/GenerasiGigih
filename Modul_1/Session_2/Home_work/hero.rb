require_relative 'person'
class Hero < Person
    def initialize(name, hitpoint, attack_damage)
        super(name, hitpoint, attack_damage)
        @deflect_percentage = 80
        @heal_point = 20
    end

    def take_damage(damage)
        if rand(10) * 10 < @deflect_percentage
            puts "#{@name} deflects the attack"
        else
            super(damage)
        end
    end

    def heal(other_person)
        other_person.get_heal(@heal_point)
        puts "#{@name} heals #{other_person.name}, restoring #{@heal_point} hitpoints"
    end
end