class PokemonInfoFinder::Pokemon
    attr_accessor :name, :type_1, :type_2, :extra_info

    @@all = []

    def initialize (name, type_1, type_2 = nil)
        @name = name
        @type_1 = type_1
        @type_2 = type_2
        @@all << self
    end

    def self.all
        @@all
    end
end