class PokemonInfoFinder::Scraper

def scrape_pokemon_name
    doc = Nokogiri::HTML(open("https://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_Kanto_Pok%C3%A9dex_number"))
    binding.pry
end


