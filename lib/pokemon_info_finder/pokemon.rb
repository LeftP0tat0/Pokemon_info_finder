class PokemonInfoFinder::Pokemon
    attr_accessor :name, :type_1, :type_2, :extra_info

    @@all = []
    @@all_names = []

    #initializes the pokemon 
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

    #finds pokemon by name
    def self.find_by_name(name)
        @@all.each do |n|
            if n.name.downcase == name.downcase
                return n 
            end
        end
    end

    #finds pokemon by type
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

    #talks to the scraper to grab extra information on the pokemon
    def self.get_extra_info(name)
        pokemon_name = self.find_by_name(name)
        extra_info = PokemonInfoFinder::Scraper.scrape_pokemon_data(pokemon_name)

        #extra info returns an array with information 0 is the pokemon #, 1 is the x pokemon, 2 is the first type and 3 is the second type
        extra_info << pokemon_name.type_1
        extra_info << pokemon_name.type_2
        extra_info
    end
end