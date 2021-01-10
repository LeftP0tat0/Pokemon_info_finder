class PokemonInfoFinder::Pokemon
    attr_accessor :name, :type_1, :type_2, :extra_info

    @@all = []
    @@all_names = []

    def initialize (name, type_1, type_2 = nil)
        @name = name
        @type_1 = type_1
        @type_2 = type_2
        @@all << self
        @@all_names << @name.downcase
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        @@all.each do |n|
            if n.name.downcase == name.downcase
                return n 
            end
        end
    end

    def self.find_by_type(type)
        pokemon_by_type = []
        @@all.each do |n|
            if n.type_1.downcase == type.downcase
                pokemon_by_type << n.name 
            elsif
                n.type_2.downcase == type.downcase
                pokemon_by_type << n.name
            end
        end
        pokemon_by_type
    end

    def self.all_names
        @@all_names
    end
end