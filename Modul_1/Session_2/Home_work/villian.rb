require_relative 'person'
class Villian < Person
    def initialize(name, hitpoint, attack_damage)
        super(name, hitpoint, attack_damage)
        @flee_persentage = 20
        @flee = false
    end

    def flee
        @flee = true
        puts "#{@name} has fled the battlefield with #{@hitpoint} hitpoint left"
    end

    def take_damage(damage)
        super(damage)
        if @hitpoint <= 50 && @hitpoint > 0
            flee if rand(10) * 10 < @flee_persentage
        end
    end

    def flee?
        @flee
    end
end