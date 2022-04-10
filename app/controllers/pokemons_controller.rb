class PokemonsController < ApplicationController
  require 'csv'

  def index
    @pokemons = Pokemon.all
  end

  def create_all
    csv_path = Rails.root.join('db/fixtures/pokemon.csv')
    CSV.foreach(csv_path, headers: true) do |row|
      Pokemon.create(
        pokedex_id: row[0],
        identifier: row[1],
        species_id: row[2],
        height: row[3],
        weight: row[4],
        base_experience: row[5],
        order: row[6],
        default: row[7]
      )
    end
    redirect_to root_url, notice: 'All Pokemons was successfully created.'
  end

  def destroy_all
    Pokemon.destroy_all
    redirect_to root_url, notice: 'All Pokemons was successfully destroyed.'
  end
end
