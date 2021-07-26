class Martabak
    attr_reader :topping
    def initialize(topping)
        @topping = topping
    end

    def taste
        "martabak #@topping is delicious"
    end
end