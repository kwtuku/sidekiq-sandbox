module Pokemons
  class CreateAllJob
    include Sidekiq::Job

    def perform(csv_path)
      require 'csv'

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
    end
  end
end
