class Person
    attr_accessor :hitpoint
    attr_reader :name, :attack_damage
    
    def initialize(name, hitpoint, attack_damange)
        @name = name
        @hitpoint = hitpoint
        @attack_damange = attack_damange
    end

    def to_s
        "#{@name} has #{@hitpoint} hitpoint and #{@attack_damange} attack damage"
    end

    def attack(other_person)
        other_person.take_damage(@attack_damange)
        puts "#{@name} attacks #{other_person.name} with #{@attack_damange} damage"
    end

    def take_damage(damage)
        a = rand(10)
        if a <= 8
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