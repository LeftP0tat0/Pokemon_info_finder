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

end


