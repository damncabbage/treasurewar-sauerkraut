require_relative './base'

module Strategy
  class PickUpNearby < Base
    def use?
      world.nearby_treasure.any?
    end
    def act
      if world.position == world.nearby_treasure.first
         decide 'pick up'
      else
         decide 'move', {dir: world.you.position.direction_from(world.nearby_treasure.first) }
      end
    end

    protected
  end
end
