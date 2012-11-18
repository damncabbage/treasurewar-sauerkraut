module Strategy
  class KillNearby < Base
    def use?
      world.nearby_players.any?
    end
  end
end
