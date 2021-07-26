class Wli
    attr_reader :names

    def initialize(names)
        @names = names
    end

    def likes
        case @names.length
        when 0
            return "no one likes this"
        when 1
            return "#{names[0]} likes this"
        when 2
            return "#{names[0]} and #{names[1]} like this"
        when 3
            return "#{names[0]}, #{names[1]} and #{names[2]} like this"
        when 4
            return "#{names[0]}, #{names[1]}, #{names[2]} and #{names[3]} like this"
        else
            return "#{names[0]}, #{names[1]} and #{names.length - 2} others like this"
        end    
    end
end