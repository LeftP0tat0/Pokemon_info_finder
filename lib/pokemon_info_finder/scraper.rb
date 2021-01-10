class PokemonInfoFinder::Scraper

    @pokemon_types = ["Normal","Fire","Fighting","Water","Flying","Grass","Poison","Electric","Ground","Psychic","Rock","Ice","Bug","Dragon","Ghost","Dark","Steel","Fairy"]
    @pokemon_data_list = []

    def self.scrape_pokemon_name
        doc = Nokogiri::HTML(open("https://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_Kanto_Pok%C3%A9dex_number"))
        tables = doc.css("body div#mw-content-text table")
        
        
        #scrape pokemon site for pokemon and types
        tables.search('tr').each do |tr|
            tr.search("td").each do |td|
                data = td.search('a').text
                if data.length > 0 && data.length < 15
                    @pokemon_data_list << data
                end
            end
        end

        name = ""
        type_1 = ""
        type_2 = ""

        #look at each word
        @pokemon_data_list.each do |p|
            #if word is not a type it is a name
            unless @pokemon_types.include? (p)
                PokemonInfoFinder::Pokemon.new(name, type_1, type_2) unless name == ""
                name = p
                type_1 = ""
                type_2 = ""
            else
                #if word is a type it is the first type 
                if type_1 == ""
                type_1 = p
                #if word is a type and first type is full it is a second type
                else 
                    type_2 = p
                end
            end
        end

    end

    def self.scrape_pokemon_data(name)
        pokemon_data = []

        doc = Nokogiri::HTML(open("https://bulbapedia.bulbagarden.net/wiki/#{name.name.capitalize}_(Pok%C3%A9mon)"))
        tables = doc.css("body div#mw-content-text")

        tables.search('tr td tr big big a span').each do |tr|
            pokemon_data << tr.text
        end

        the_x_pokemon = []
        tables.search('tr td tr td tr td a span').each do |tr|
            the_x_pokemon << tr.text
        end
        pokemon_data << the_x_pokemon[0]
        pokemon_data
    end

end


