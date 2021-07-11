class Game 
    def initialize(playable_character)
        @nonplayable_character = { heroes: [], villains: []}
        @playable_character = playable_character
       
    end
    def add_hero(person)
        @nonplayable_character[:heroes] << person
    end
    def add_villain(person)
        @nonplayable_character[:villains] << person
    end
    def start
        
        until (@playable_character.die? || @nonplayable_character[:villains].empty? ) do
            print_characters_stats
            play_characters_turn
        end
    end
    def print_characters_stats
        @playable_character.print_stats
        @nonplayable_character.each_value do |people|
            people.each do |person|
                person.print_stats
            end
        end
        puts "\n"
    end
    def play_characters_turn
        @playable_character.play_turn(@nonplayable_character[:heroes], @nonplayable_character[:villains])
        @nonplayable_character.each do |group, people|
            people.each do |person|
                if group ==:heroes
                    targets = @nonplayable_character[:villains]
                    unless targets.empty?
                        target = targets[rand(targets.size)]
                        person.attack(target)
                        if target.removed?
                            targets.delete(target)
                        end
                    end
                elsif group == :villains
                    targets = @nonplayable_character[:heroes].dup
                    targets << @playable_character
                    unless targets.empty?
                        target = targets[rand(targets.size)]
                        person.attack(target)
                        if target.removed?
                            @nonplayable_character[:heroes].delete(target) 
                        end
                    end
                end
            end
            puts "\n"
        end
    end
    
end