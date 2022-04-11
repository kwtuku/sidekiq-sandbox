module Pokemons
  class DestroyAllJob
    include Sidekiq::Job

    def perform
      Pokemon.destroy_all
    end
  end
end
