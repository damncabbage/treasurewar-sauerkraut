module Strategy
  class PickUpNearby < Base
    def use?
      world.nearby_treasure.any?
    end
    def act
    end
  end
end
