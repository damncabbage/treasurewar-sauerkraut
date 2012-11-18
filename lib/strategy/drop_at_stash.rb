module Strategy
  class DropAtStash
    def use?
      world.you.carrying_treasure
    end
    def act
      # Standing on stash? Drop.
      # else, move towards stash.
    end
  end
end
