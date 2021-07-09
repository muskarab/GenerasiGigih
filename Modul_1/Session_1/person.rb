class Person
    attr_accessor :hitpoint
    attr_reader :name, :attack_damage, :deflect
    
    def initialize(name, hitpoint, attack_damange, deflect)
        @name = name
        @hitpoint = hitpoint
        @attack_damange = attack_damange
        @deflect = deflect
    end

    def to_s
        "#{@name} has #{@hitpoint} hitpoint and #{@attack_damange} attack damage"
    end

    def attack(other_person)
        other_person.take_damage(@attack_damange)
        puts "#{@name} attacks #{other_person.name} with #{@attack_damange} damage"
    end

    def take_damage(damage)
        a = rand(10) * 10
        if a <= @deflect
            puts "#{@name} deflects the attack."
        else
            @hitpoint -= damage
        end
    end

    def die?
        if @hitpoint <= 0
            puts "#{@name} dies"
            true
        end
    end
end