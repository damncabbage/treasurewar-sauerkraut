require_relative './base'

module Strategy
  class DropAtStash < Base
    def use?
      world.you.carrying_treasure
    end
    def act
      # Standing on stash? Drop.
      # else, move towards stash.
    end
  end
end
