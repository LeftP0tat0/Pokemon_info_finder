# frozen_string_literal: true

require_relative "pokemon_info_finder/version"
require_relative "pokemon_info_finder/cli"
require_relative "pokemon_info_finder/pokemon"
require_relative "pokemon_info_finder/scraper"

require "pry"
require "nokogiri"
require "open-uri"

module PokemonInfoFinder
  class Error < StandardError; end
  # Your code goes here...
end
