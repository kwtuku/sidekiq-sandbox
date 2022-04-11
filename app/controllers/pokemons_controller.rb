class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def create_all
    csv_path = Rails.root.join('db/fixtures/pokemon.csv')
    Pokemons::CreateAllJob.perform_async(csv_path)
    redirect_to root_url, notice: 'All Pokemons was successfully created.'
  end

  def destroy_all
    Pokemons::DestroyAllJob.perform_async
    redirect_to root_url, notice: 'All Pokemons was successfully destroyed.'
  end
end
